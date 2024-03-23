module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output logic match;
output logic [4:0] match_index;
output logic valid;

// << parameter >>
parameter STAR_SIGN   = 8'h2A;
parameter SPACE_SIGN  = 8'h20;
parameter DOLLAR_SIGN = 8'h24;
parameter CAP_SIGN    = 8'h5e;
parameter DOT_SIGN    = 8'h2e;

// << fstate >>
typedef enum logic [2:0]{
  START,
  COPY_FRONT,
  COPYDOT,
  COPYBACK,
  PASTE,
  PROCESS,
  WAIT,
  DONE
}state;

state fstate;


// << variable >>
logic [5:0] runTimes;
logic [5:0] times;
logic [5:0] patIdx;
logic isStar;
logic [1:0]shiftReg;
logic enable;
logic matchFlag;
logic matchFlag_reg;

integer     i, j, k, l;   // for loop index
logic [7:0] STRING  [33:0];
logic [5:0] sptr;
logic [5:0] dotNum;
logic [5:0] dot_ptr;
logic [5:0] sptr_w;
logic [5:0] patternLen;
logic [7:0] PATTERN [33:0];
logic [7:0] EXTEN [33:0];
logic [7:0] BACKUP [33:0];
logic [5:0] pptr;
logic [5:0] copy_ptr;
logic [5:0] starPos;
logic firstStarphase;
logic isstring_reg;

logic final_match;
logic [4:0]finalIndex;
logic [5:0]matchIndex;

logic [7:0] PATTERN_debug;
logic [7:0] STRING_debug;

logic match_condition;
logic firstPat;

assign PATTERN_debug = PATTERN[patIdx];
assign STRING_debug = STRING[patIdx + times];

assign match_condition = (PATTERN[patIdx] == STRING[times + patIdx] || PATTERN[patIdx] == DOT_SIGN);

// << string array >>
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i=1; i<34; i=i+1) STRING[i] <= 8'd0;
        STRING[0] <= SPACE_SIGN; // white space
        sptr_w <= 6'd1;
    end
    else if(fstate == DONE && firstPat)sptr_w <= 6'd1;
    else if (isstring) begin
        STRING[sptr_w] <= chardata;
        sptr_w <= sptr_w + 6'd1;
    end
    else if (isstring_reg) begin
        STRING[sptr_w] <= SPACE_SIGN;
        sptr_w <= sptr_w + 6'd1;
    end
end

// <<firstStarphase >>
always_ff @(posedge clk or posedge reset) begin
    if (reset) firstStarphase <= 1'd0;
    else if(fstate == WAIT)firstStarphase <= 1'd0;
    else if(isStar && fstate == START)firstStarphase <= 1'b1;
end

// << isstring_reg >>
always_ff @(posedge clk or posedge reset) begin
    if (reset) isstring_reg <= 1'd0;
    else       isstring_reg <= isstring;
end

// << firstPat >>
always_ff @(posedge clk or posedge reset) begin
    if (reset) firstPat <= 1'b0;
    else if(fstate == DONE)firstPat <= 1'b0;
    else if(isstring)firstPat <= 1'b1;
end

// << sptr >>
always_ff @(posedge clk or posedge reset) begin
    if (reset) sptr <= 6'd0;
    else if(enable && firstPat)sptr <= sptr_w;
end

// << pattern & pptr >>
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      for (j=0; j<34; j=j+1)PATTERN[j] <= 8'd0;
      for (l=0; l<34; l=l+1)BACKUP[l] <= 8'd0;
    end
    else if (ispattern && chardata != STAR_SIGN) begin
      PATTERN[pptr] <= (chardata == CAP_SIGN || chardata == DOLLAR_SIGN)? SPACE_SIGN : chardata;
      BACKUP[pptr] <= (chardata == CAP_SIGN || chardata == DOLLAR_SIGN)? SPACE_SIGN : chardata;
    end
    else if(fstate == PASTE)begin
      PATTERN[pptr] <= EXTEN[pptr];
    end
end

always_ff @(posedge clk or posedge reset) begin
    if (reset)pptr <= 6'd0;
    else if (ispattern)begin
      if(chardata != STAR_SIGN)pptr <= pptr + 6'd1;
    end
    else if(fstate == DONE && isStar || fstate == PROCESS && runTimes > 31)pptr <= 6'd0;
    else if(fstate == COPYBACK && copy_ptr == pptr-1) pptr <= 6'd0;
    else if(!isStar && fstate == PROCESS && (  (times == runTimes && (patIdx == (pptr-1 + dotNum) || match_condition == 0 )) || (matchFlag  && match_condition && (patIdx == (pptr-1+ dotNum))) || (match_condition && pptr == 5'd1) ) )pptr <= 6'd0;
    else if(fstate == PASTE)pptr <= pptr + 6'd1;
    else if(fstate == WAIT)pptr <= 6'd0;
end


// << starPos >>
always_ff @(posedge clk or posedge reset) begin
    if(reset)starPos <= 5'd0;
    else if(chardata == STAR_SIGN && fstate == START)starPos <= pptr;
end

// << EXTEN >>
always_ff @(posedge clk or posedge reset) begin
  if (reset) begin
    for (k=0; k<34; k=k+1)EXTEN[k] <= 8'd0;
  end
  else begin
    case(fstate)
      COPY_FRONT:begin
        EXTEN[copy_ptr] <= BACKUP[copy_ptr];
      end
      COPYDOT:begin
        if(dotNum > 5'd0)EXTEN[copy_ptr + dot_ptr] <= DOT_SIGN;
      end
      COPYBACK:begin
        if(copy_ptr != patternLen)EXTEN[copy_ptr + dotNum] <= BACKUP[copy_ptr];
      end
    endcase
  end
end

// << dot_ptr >>
always_ff @(posedge clk or posedge reset) begin
  if(reset)dot_ptr <= 6'd0;
  else begin
    case(fstate)
      COPYDOT:begin
        dot_ptr <= dot_ptr + 6'd1;
      end
      WAIT:begin
        dot_ptr <= 6'd0;
      end
    endcase
  end
end

// << copy_ptr >>
always_ff @(posedge clk or posedge reset) begin
  if(reset)copy_ptr <= 6'd0;
  else begin
    case(fstate)
      WAIT:copy_ptr <= 6'd0;
      PROCESS:if(runTimes > 31)copy_ptr <= 6'd0;
      COPY_FRONT:begin
        copy_ptr <= copy_ptr + 6'd1;
      end
      COPYDOT:begin
        copy_ptr <= copy_ptr;
      end
      COPYBACK:begin
        copy_ptr <= copy_ptr + 6'd1;
      end
    endcase
  end
end

// << dotNum >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)dotNum <= 5'd0;
  else if(fstate == START)dotNum <= 5'd0;
  else if(fstate == WAIT)dotNum <= dotNum + 5'd1;
end

// << enable>>
assign enable = (shiftReg == 2'b10);

// << shiftReg >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)shiftReg <= 2'd0;
  else     shiftReg <= {shiftReg[0], ispattern};
end

// << isStar >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)isStar <= 1'b0;
  else begin
    if(fstate == DONE)isStar <= 1'd0;
    else if(ispattern && chardata == STAR_SIGN)isStar <= 1'd1;
  end
end

// << patternLen >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)patternLen <= 6'd0;
  //else if()
  else if(fstate == COPY_FRONT && firstStarphase)patternLen <= pptr;
end

// << runTimes >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)runTimes <= 6'd0;
  else if(fstate == DONE)runTimes <= 6'd0;
  else if(fstate == PASTE && pptr == patternLen-1+dotNum)runTimes <= sptr - patternLen  - dotNum;
  else if(enable)begin
    if(firstPat)runTimes <= sptr_w - pptr + 1;
    else runTimes <= sptr - pptr + 1;
  end 
  
end

// << times >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)times <= 6'd0;
  else if(fstate == START || isStar && fstate == WAIT)times <= 6'd0;
  else if(fstate == PROCESS)begin
    if(match_condition == 1'b0)times <= times + 6'd1;
    else if(patIdx == (pptr-1+dotNum))begin
      if(times < runTimes)times <= times + 6'd1;
      else                times <= 6'd0;
    end
  end
end

// << patIdx >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)patIdx <= 6'd0;
  else if(fstate == START)patIdx <= 6'd0;
  else if(fstate == PROCESS)begin
    if(match_condition == 1'b0)patIdx <= 6'd0;
    else begin
      if(patIdx < (pptr-1 + dotNum))patIdx <= patIdx + 6'd1;
      else                          patIdx <= 6'd0;
    end
  end
end

// << matchFlag >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)matchFlag <= 1'b0;
  else if(fstate == START || isStar && fstate == WAIT)matchFlag <= 1'b0;
  else if(fstate == PROCESS)begin
    if(match_condition)matchFlag <= 1'b1;
    else matchFlag <= 1'b0;
  end
end

// << matchFlag_reg >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)matchFlag_reg <= 1'b0;
  else     matchFlag_reg <= matchFlag;
end

// << final_match >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)final_match <= 1'b0;
  else if(fstate == START)final_match <= 1'b0;
  else if(fstate == PROCESS && (match_condition && patIdx == (pptr-1)) )final_match <= 1'b1;
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)finalIndex <= 6'd0;
  else if(fstate == START)finalIndex <= 6'd0;
  else if(fstate == PROCESS && (match_condition && patIdx == (pptr-1)))finalIndex <= matchIndex;
end

// << matchIndex >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)matchIndex <= 6'd0;
  else if(fstate == START)matchIndex <= matchIndex <= 6'd0;
  else if(fstate == PROCESS || fstate == WAIT)begin
    if(isStar)begin
      if(!matchFlag_reg && matchFlag)begin
        if(STRING[times + patIdx - 1] == SPACE_SIGN)matchIndex <= times + patIdx - 1;
        else                                        matchIndex <= times + patIdx - 2;
      end
    end
    else begin
      if(!matchFlag_reg && matchFlag)begin
        if(STRING[times + patIdx - 1] == SPACE_SIGN)matchIndex <= times + patIdx - 1;
        else                                        matchIndex <= times + patIdx - 2;
      end
    end
  end
end

// << FSTATE-state >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)fstate <= START;
  else begin
    unique case(fstate)
      START:begin
        if(enable && isStar)fstate <= COPY_FRONT;
        else if(enable)     fstate <= PROCESS;
        else                fstate <= START;
      end
      COPY_FRONT:begin
        if(copy_ptr == starPos-1)fstate <= COPYDOT;
        else                     fstate <= COPY_FRONT;
      end
      COPYDOT:begin
        if((dot_ptr == dotNum - 1) || dotNum == 0)fstate <= COPYBACK;
        else                                      fstate <= COPYDOT;
      end
      COPYBACK:begin
        if(copy_ptr >= patternLen-1)fstate <= PASTE;
        else fstate <= COPYBACK;
      end
      PASTE:begin
        if(pptr == patternLen-1+dotNum)fstate <= PROCESS;
        else fstate <= PASTE;
      end
      PROCESS:begin
        if(runTimes > 32)fstate <= DONE;
        else if(((times == runTimes) && (patIdx == (pptr-1 + dotNum) || match_condition == 0 )) || (match_condition && patIdx == (pptr-1)))begin
          fstate <= WAIT;
        end
        else fstate <= PROCESS;
      end
      WAIT:begin
        if(isStar && (patternLen + dotNum) == 31)fstate <= DONE;
        else if(isStar)fstate <= COPY_FRONT;
        else      fstate <= DONE;
      end
      DONE:begin
        fstate <= START;
      end
      default:fstate <= START;
    endcase
  end
end

// << FSTATE-output >>
always_comb begin
  unique case(fstate)
    DONE:begin
      valid = 1;
      if(isStar)begin
        match_index = finalIndex;
        match = final_match;
      end
      else begin
        match_index = matchIndex;
        match = matchFlag;
      end
      
    end
    default:begin
      valid = 0;
      match_index = 5'd0;
      match = 1'b0;
    end
  endcase
end

endmodule
