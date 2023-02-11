module huffman(
  clk, 
  reset, 
  gray_valid, 
  gray_data,
  CNT_valid, 
  CNT1, 
  CNT2, 
  CNT3, 
  CNT4, 
  CNT5, 
  CNT6,
  code_valid, 
  HC1, 
  HC2, 
  HC3, 
  HC4, 
  HC5, 
  HC6,
  M1, 
  M2,
  M3, 
  M4, 
  M5, 
  M6
);
//---------------------------------------------------------------------
//   PORTS DECLARATION                    
//--------------------------------------------------------------------- 
input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output reg [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output reg [7:0] M1, M2, M3, M4, M5, M6;

//---------------------------------------------------------------------
//   LOCAL PARAMETER                       
//--------------------------------------------------------------------- 
localparam IDLE       = 4'd0;
localparam READDATA   = 4'd1;
localparam OUTPUTNUM  = 4'd2;
localparam FINDIDX1   = 4'd3;
localparam UPDATE1    = 4'd4;//update the value of curMini
localparam FINDIDX2   = 4'd5;
localparam UPDATE2    = 4'd6;
localparam COMBINE    = 4'd7;
localparam UPDATE3    = 4'd8;
localparam UPDATE_HC  = 4'd9;
localparam UPDATE_PTR = 4'd10;
localparam FINISH     = 4'd15;
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg  [3:0]      fstate;
reg  [7:0]   CNT [5:0];
reg  [2:0]    smallIdx;
reg  [2:0] secSmallIdx;
reg  [2:0]   ptr [5:0];
reg  [7:0]    HC [5:0];
reg  [7:0]  MASK [5:0];
reg  [5:0]    findMask;
reg  [7:0]     curMini;
reg  [2:0]      runIdx;
reg  [7:0]      curAcc;
integer              i;
//---------------------------------------------------------------------
//   ALWAYS BLOCK                
//---------------------------------------------------------------------

// << runIdx >>
always@(posedge clk or posedge reset)begin
  if(reset)runIdx <= 3'd0;
  else begin
    case(fstate)
      UPDATE1, UPDATE2, UPDATE3:begin
        if(runIdx < 3'd5)runIdx <= runIdx + 3'd1;
        else             runIdx <= 3'd0;
      end
    endcase
  end
end

// << CNT >>
always@(posedge clk or posedge reset)begin
  if(reset)begin
    CNT[0] <= 8'd0;
    CNT[1] <= 8'd0;
    CNT[2] <= 8'd0;
    CNT[3] <= 8'd0;
    CNT[4] <= 8'd0;
    CNT[5] <= 8'd0;
  end
  else if(gray_valid)CNT[gray_data-8'd1] <= CNT[gray_data-8'd1] + 8'd1;
end


// << smallIdx >>
always@(posedge clk or posedge reset)begin
  if(reset)smallIdx <= 3'd0;
  else begin
    case(fstate)
      FINDIDX1, COMBINE:begin
        if((CNT[runIdx] < curMini && findMask[runIdx] == 1'b0) || (CNT[runIdx] == curMini && findMask[runIdx] == 1'b0 && runIdx > smallIdx))smallIdx <= runIdx;
      end
      UPDATE_PTR:begin
        for(i=0;i<6;i=i+1)begin
          if(findMask[i] == 1'b0)smallIdx <= i;
        end
      end
      UPDATE2:begin
        if(runIdx == 3'd5)begin
          for(i=0;i<6;i=i+1)begin
            if(findMask[i] == 1'b0)smallIdx <= i;
          end
        end
      end
    endcase
  end
end

// << secSmallIdx >>
always@(posedge clk or posedge reset)begin
  if(reset)secSmallIdx <= 3'd0;
  else begin
    case(fstate)
      FINDIDX2:begin
        if(CNT[runIdx] < curMini && findMask[runIdx] == 1'b0)secSmallIdx <= runIdx;
      end
    endcase
  end
end


// << curMini >>
always@(posedge clk or posedge reset)begin
  if(reset)curMini <= 8'd255;
  else begin
    case(fstate)
      OUTPUTNUM:begin
        curMini <= 8'd255;
      end
      UPDATE1, UPDATE3:begin
        if(runIdx == 3'd5)curMini <= 8'd255;
        else              curMini <= CNT[smallIdx];
      end
      UPDATE2:begin
        if(runIdx == 3'd5)curMini <= 8'd255;
        else              curMini <= CNT[secSmallIdx];
      end
    endcase
  end
end

// << findMask >>
always@(posedge clk or posedge reset)begin
  if(reset)findMask <= 6'd0;
  else begin
    case(fstate)
      UPDATE1:begin
        if(runIdx == 3'd5)findMask[smallIdx] <= 1'b1;
      end
      UPDATE2:begin
        if(runIdx == 3'd5)findMask[secSmallIdx] <= 1'b1;
      end
      UPDATE_HC:begin
        findMask[smallIdx] <= 1'b1;
      end
    endcase
  end
end

// << HC >>
always@(posedge clk or posedge reset)begin
  if(reset)begin
    HC[0] <= 8'd0;
    HC[1] <= 8'd0;
    HC[2] <= 8'd0;
    HC[3] <= 8'd0;
    HC[4] <= 8'd0;
    HC[5] <= 8'd0;
  end
  else begin
    case(fstate)
      UPDATE2:begin
        if(runIdx == 3'd5)begin
          HC[smallIdx][ptr[smallIdx]]       <= 1'b1;
          HC[secSmallIdx][ptr[secSmallIdx]] <= 1'b0;
        end
      end
      UPDATE_HC:begin
        if(CNT[smallIdx] >= curAcc)begin
          HC[smallIdx][ptr[smallIdx]] <= 1'b0;
          for(i=0;i<6;i=i+1)begin
            if(findMask[i] == 1'b1)HC[i][ptr[i]] <= 1'b1;
          end
        end
        else begin
          HC[smallIdx][ptr[smallIdx]] <= 1'b1;
          for(i=0;i<6;i=i+1)begin
            if(findMask[i] == 1'b1)HC[i][ptr[i]] <= 1'b0;
          end
        end
      end
    endcase
  end
end

// << MASk >>
always@(posedge clk or posedge reset)begin
  if(reset)begin
    MASK[0] <= 8'd0;
    MASK[1] <= 8'd0;
    MASK[2] <= 8'd0;
    MASK[3] <= 8'd0;
    MASK[4] <= 8'd0;
    MASK[5] <= 8'd0;
  end
  else begin
    case(fstate)
      UPDATE2:begin
        if(runIdx == 3'd5)begin
          MASK[smallIdx][ptr[smallIdx]] <= 1'b1;
          MASK[secSmallIdx][ptr[secSmallIdx]] <= 1'b1;
        end
      end
      UPDATE_HC:begin
        MASK[smallIdx][ptr[smallIdx]] <= 1'b1;
        for(i=0;i<6;i=i+1)begin
          if(findMask[i] == 1'b1)MASK[i][ptr[i]] <= 1'b1;
        end
      end
    endcase
  end
end

// << ptr >>
always@(posedge clk or posedge reset)begin
  if(reset)begin
    ptr[0] <= 3'd0;
    ptr[1] <= 3'd0;
    ptr[2] <= 3'd0;
    ptr[3] <= 3'd0;
    ptr[4] <= 3'd0;
    ptr[5] <= 3'd0;
  end
  else begin
    case(fstate)
      UPDATE2:begin
        if(runIdx == 3'd5)begin
          ptr[smallIdx] <= ptr[smallIdx] + 3'd1;
          ptr[secSmallIdx] <= ptr[secSmallIdx] + 3'd1;
        end
      end
      UPDATE_PTR:begin
        ptr[smallIdx] <= ptr[smallIdx] + 3'd1;
        for(i=0;i<6;i=i+1)begin
          if(findMask[i] == 1'b1)ptr[i] <= ptr[i] + 3'd1;
        end
      end
    endcase
  end
end

// << curAcc >>
always@(posedge clk or posedge reset)begin
  if(reset)curAcc <= 8'd0;
  else begin
    case(fstate)
      UPDATE2:if(runIdx == 3'd5)curAcc <= CNT[smallIdx] + CNT[secSmallIdx];
      UPDATE_PTR:curAcc <= curAcc + CNT[smallIdx];
    endcase
  end
end

//---------------------------------------------------------------------
//   FSM-STATE           
//---------------------------------------------------------------------
always@(posedge clk or posedge reset)begin
  if(reset)fstate <= IDLE;
  else begin
    case(fstate)
      IDLE:begin
        if(gray_valid)fstate <= READDATA;
        else          fstate <= IDLE;
      end
      READDATA:begin
        if(!gray_valid)fstate <= OUTPUTNUM;
        else           fstate <= READDATA;
      end
      OUTPUTNUM:begin
        fstate <= FINDIDX1;
      end
      FINDIDX1:begin
        fstate <= UPDATE1;
      end
      UPDATE1:begin
        if(runIdx == 3'd5)fstate <= FINDIDX2;
        else              fstate <= FINDIDX1;
      end
      FINDIDX2:begin
        fstate <= UPDATE2;
      end
      UPDATE2:begin
        if(runIdx == 3'd5)fstate <= COMBINE;
        else              fstate <= FINDIDX2;
      end
      COMBINE:begin
        fstate <= UPDATE3;
      end
      UPDATE3:begin
        if(runIdx == 3'd5)fstate <= UPDATE_HC;
        else              fstate <= COMBINE;
      end
      UPDATE_HC:begin
        fstate <= UPDATE_PTR;
      end
      UPDATE_PTR:begin
        if(findMask == 6'b111111)fstate <= FINISH;
        else                     fstate <= COMBINE;
      end
      FINISH:begin
        fstate <= IDLE;
      end
      default:fstate <= IDLE;
    endcase
  end
end
//---------------------------------------------------------------------
//   FSM-OUTPUT               
//---------------------------------------------------------------------
always@(*)begin
  case(fstate)
    IDLE:begin
      // CNT
      CNT1       = 8'd0;
      CNT2       = 8'd0;
      CNT3       = 8'd0;
      CNT4       = 8'd0;
      CNT5       = 8'd0;
      CNT6       = 8'd0;
      CNT_valid  = 1'b0;
      // code
      HC1        = 8'd0; 
      HC2        = 8'd0; 
      HC3        = 8'd0; 
      HC4        = 8'd0; 
      HC5        = 8'd0; 
      HC6        = 8'd0;
      M1         = 8'd0;
      M2         = 8'd0;
      M3         = 8'd0;
      M4         = 8'd0;
      M5         = 8'd0;
      M6         = 8'd0;
      code_valid = 1'b0;
    end
    READDATA:begin
      // CNT
      CNT1       = 8'd0;
      CNT2       = 8'd0;
      CNT3       = 8'd0;
      CNT4       = 8'd0;
      CNT5       = 8'd0;
      CNT6       = 8'd0;
      CNT_valid  = 1'b0;
      // code
      HC1        = 8'd0; 
      HC2        = 8'd0; 
      HC3        = 8'd0; 
      HC4        = 8'd0; 
      HC5        = 8'd0; 
      HC6        = 8'd0;
      M1         = 8'd0;
      M2         = 8'd0;
      M3         = 8'd0;
      M4         = 8'd0;
      M5         = 8'd0;
      M6         = 8'd0;
      code_valid = 1'b0;
    end
    OUTPUTNUM:begin
      // CNT
      CNT1       = CNT[0];
      CNT2       = CNT[1];
      CNT3       = CNT[2];
      CNT4       = CNT[3];
      CNT5       = CNT[4];
      CNT6       = CNT[5];
      CNT_valid  = 1'b1;
      // code
      HC1        = 8'd0; 
      HC2        = 8'd0; 
      HC3        = 8'd0; 
      HC4        = 8'd0; 
      HC5        = 8'd0; 
      HC6        = 8'd0;
      M1         = 8'd0;
      M2         = 8'd0;
      M3         = 8'd0;
      M4         = 8'd0;
      M5         = 8'd0;
      M6         = 8'd0;
      code_valid = 1'b0;
    end
    FINISH:begin
      // CNT
      CNT1       = 8'd0;
      CNT2       = 8'd0;
      CNT3       = 8'd0;
      CNT4       = 8'd0;
      CNT5       = 8'd0;
      CNT6       = 8'd0;
      CNT_valid  = 1'b0;
      // code
      HC1        = HC[0]; 
      HC2        = HC[1]; 
      HC3        = HC[2]; 
      HC4        = HC[3]; 
      HC5        = HC[4]; 
      HC6        = HC[5];
      M1         = MASK[0];
      M2         = MASK[1];
      M3         = MASK[2];
      M4         = MASK[3];
      M5         = MASK[4];
      M6         = MASK[5];
      code_valid = 1'b1;
    end
    default:begin
      // CNT
      CNT1       = 8'd0;
      CNT2       = 8'd0;
      CNT3       = 8'd0;
      CNT4       = 8'd0;
      CNT5       = 8'd0;
      CNT6       = 8'd0;
      CNT_valid  = 1'b0;
      // code
      HC1        = 8'd0; 
      HC2        = 8'd0; 
      HC3        = 8'd0; 
      HC4        = 8'd0; 
      HC5        = 8'd0; 
      HC6        = 8'd0;
      M1         = 8'd0;
      M2         = 8'd0;
      M3         = 8'd0;
      M4         = 8'd0;
      M5         = 8'd0;
      M6         = 8'd0;
      code_valid = 1'b0;
    end
  endcase
end


endmodule

