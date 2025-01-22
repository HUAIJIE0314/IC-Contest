module Bicubic (
input CLK,
input RST,
input [6:0] V0,
input [6:0] H0,
input [4:0] SW,
input [4:0] SH,
input [5:0] TW,
input [5:0] TH,
output logic DONE);



parameter width = 20;
parameter width_a = width+5;
parameter width_b = 6;
//---------------------------------------------------------------------
//        STATE                            
//---------------------------------------------------------------------

typedef enum logic [2:0]{
  GET_PARAM,
  CAL_RATIO_W,
  CAL_RATIO_H,
  READ_ROM1,
  CAL1,
  CAL2,
  STORE,
  FINISH
}state;

state curState, nxtState;

//---------------------------------------------------------------------
//        LOGIC & VARIABLES DECLARATION                            
//---------------------------------------------------------------------
logic [4:0] SW_1;
logic [4:0] SH_1;
logic [5:0] TW_1;
logic [5:0] TH_1;

logic [4+1+width:0] SW_ext;
logic [4+1+width:0] SH_ext;


logic [7:0]  ROM_data;
logic [13:0] ROM_addr;

logic [7:0]  SRAM_rdata;
logic [7:0]  SRAM_wdata;
logic [13:0]  SRAM_addr;
logic SRAM_WEN;

// for divLinear
logic enable;
logic done;
logic [width_a-1:0] a_i;
logic [width_b-1:0] b_i;

logic [width_a-1:0] q_o;
logic [width_b-1:0] r_o;

logic [width_a-1:0] ratio_w;
logic [width_a-1:0] ratio_h;


logic [5:0] cnt_w;
logic [5:0] cnt_h;

logic [1:0] cnt1;
logic [1:0] cnt2;

logic [width_a-1+6:0] ratio_w_acc;
logic [width_a-1+6:0] ratio_h_acc;

logic [width_a-1+6+1:0] originW;
logic [width_a-1+6+1:0] originH;

logic [11:0] originW_int;
logic [11:0] originH_int;
logic [width-1:0] originW_frac;
logic [width-1:0] originH_frac;


//logic [6:0] ylist [3:0];
//logic [6:0] x0;
//logic [6:0] x1;
//logic [6:0] x2;
//logic [6:0] x3;

logic [6:0] originH_int_minus1;
logic [6:0] originW_int_minus1;

logic [6:0] coorY;
logic [6:0] coorX;

logic [7:0] ROM_out [3:0];
logic signed [8:0] ROM_out_ext [3:0];

logic [7:0] tmp [3:0];

logic signed [8+4:0] a;//13bit
logic signed [8+4:0] b;
logic signed [8+4:0] c;
logic signed [8+4:0] d;

logic [width*1-1:0] x;
logic [width*2-1:0] x_2;
logic [width*3-1:0] x_3;

logic [width-1:0] x_2_round;//20bit
logic [width-1:0] x_3_round;//20bit

logic signed [width+13-1+2+2:0] calResult;
logic [7:0] calResult_int;
//---------------------------------------------------------------------
//        WIRE CONNECTION                             
//---------------------------------------------------------------------

assign TH_1 = TH - 5'd1;
assign TW_1 = TW - 5'd1;
assign SH_1 = SH - 6'd1;
assign SW_1 = SW - 6'd1;

assign SH_ext = {SH_1, {width{1'b0}}};// 5+20=25bit
assign SW_ext = {SW_1, {width{1'b0}}};// 5+20=25bit

assign originW = ratio_w_acc + {H0, {width{1'b0}}};//32bit(12+20)
assign originH = ratio_h_acc + {V0, {width{1'b0}}};//32bit(12+30)

assign {originW_int, originW_frac} = originW;
assign {originH_int, originH_frac} = originH;

assign originH_int_minus1 = originH_int - 'd1;
assign originW_int_minus1 = originW_int - 'd1;

assign coorY = originH_int_minus1 + cnt2;
assign coorX = originW_int_minus1 + cnt1;

assign ROM_addr = (coorY << 6) + (coorY << 5) + (coorY << 2) + coorX;// 100*y + x

genvar idx;
generate
  for(idx=0;idx<4;idx=idx+1)begin:EXT1bit
    assign ROM_out_ext[idx] = (curState == CAL1)?({1'b0, ROM_out[idx]}):( (curState == CAL2)?({1'b0, tmp[idx]}):(9'd0) );
    //assign ROM_out_ext[idx] = (curState == CAL1)?({1'b0, ROM_out[idx]}):({1'b0, tmp[idx]});
  end
endgenerate

assign a = -ROM_out_ext[0] + (ROM_out_ext[1] + (ROM_out_ext[1] << 1)) - (ROM_out_ext[2] + (ROM_out_ext[2]<<1)) + ROM_out_ext[3];
assign b = (ROM_out_ext[0] << 1) - (ROM_out_ext[1] + (ROM_out_ext[1] << 2)) + (ROM_out_ext[2]<<2) - ROM_out_ext[3];
assign c = -ROM_out_ext[0] + ROM_out_ext[2];
assign d = ROM_out_ext[1] << 1;

assign x   = (curState == CAL1)?(originW_frac):(originH_frac);
assign x_2 = x * x;
assign x_3 = x_2 * x;

assign x_2_round = (x_2[width*2-1:width*1-1] + 'd1) >> 1;
assign x_3_round = (x_3[width*3-1:width*2-1] + 'd1) >> 1;

assign calResult = (a * $signed({1'b0, x_3_round}) + 
                    b * $signed({1'b0, x_2_round}) + 
                    c * $signed({1'b0, x  }) + 
                    $signed({1'b0, d, {width{1'b0}}}) ) >>> 1;
                    
                    
assign calResult_int = (calResult < 'sd0)?(8'd0):((calResult[width+13-1+2:width-1] + 'd1)>>1);

assign DONE = (curState == FINISH);
//---------------------------------------------------------------------
//        MODULE INSTANTAITE                             
//---------------------------------------------------------------------
logic ROM_CEN;
assign ROM_CEN = !(curState == READ_ROM1);
ImgROM u_ImgROM (
  .Q(ROM_data), 
  .CLK(!CLK), 
  .CEN(ROM_CEN), 
  .A(ROM_addr)
);

ResultSRAM u_ResultSRAM (
  .Q(SRAM_rdata), 
  .CLK(!CLK), 
  .CEN(SRAM_WEN/*1'b0*/), 
  .WEN(SRAM_WEN), 
  .A(SRAM_addr), 
  .D(SRAM_wdata)
);

assign enable = (curState == CAL_RATIO_H || curState == CAL_RATIO_W);
divLinear #(.width_a(width_a), .width_b(width_b))divLinear(
  .clk   (CLK   ),
  .rst   (RST   ),
  .enable(enable),
  .a_i   (a_i   ),
  .b_i   (b_i   ),
  .q_o   (q_o   ),
  .r_o   (r_o   ),
  .done  (done  )
);

assign a_i = (curState == CAL_RATIO_W)?(SW_ext):(SH_ext);
assign b_i = (curState == CAL_RATIO_W)?(TW_1):(TH_1);
//---------------------------------------------------------------------
//        ALWAYS BLOCK                             
//---------------------------------------------------------------------
// << ratio_w, ratio_h >>
always_ff@(posedge CLK)begin
  if(curState == CAL_RATIO_W)ratio_w <= q_o;
  if(curState == CAL_RATIO_H)ratio_h <= q_o;
end


// << cnt_w, cnt_h >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)cnt_w <= 6'd0;
  else if(curState == GET_PARAM)cnt_w <= 6'd0;
  else if(curState == STORE)begin
    if(cnt_w < TW-6'd1)cnt_w <= cnt_w + 6'd1;
    else               cnt_w <= 6'd0;
  end
end

always_ff@(posedge CLK or posedge RST)begin
  if(RST)cnt_h <= 6'd0;
  else if(curState == GET_PARAM)cnt_h <= 6'd0;
  else if(curState == STORE)begin
    if(cnt_w == TW-6'd1)begin
      if(cnt_h < TH-6'd1)cnt_h <= cnt_h + 6'd1;
      else               cnt_h <= 6'd0;
    end
  end
end


// << ratio_w_acc, ratio_h_acc >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)ratio_w_acc <= 'd0;
  else if(curState == GET_PARAM)ratio_w_acc <= 'd0;
  else if(curState == STORE)begin
    if(cnt_w < TW-6'd1)ratio_w_acc <= ratio_w_acc + ratio_w;
    else               ratio_w_acc <= 'd0;
  end
end

// << ratio_h_acc >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)ratio_h_acc <= 'd0;
  else if(curState == GET_PARAM)ratio_h_acc <= 'd0;
  else if(curState == STORE)begin
    if(cnt_w == TW-6'd1)begin
      if(cnt_h < TH-6'd1)ratio_h_acc <= ratio_h_acc + ratio_h;
      else               ratio_h_acc <= 'd0;
    end
  end
end

// << cnt1 >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)cnt1 <= 2'd0;
  else if(curState == READ_ROM1)begin
    cnt1 <= cnt1 + 2'd1;
  end
end

// << cnt2 >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)cnt2 <= 2'd0;
  else if(curState == CAL1)begin
    cnt2 <= cnt2 + 2'd1;
  end
end

// << ROM_out >>
always_ff@(posedge CLK)begin
  if(curState == READ_ROM1)begin
    ROM_out[3] <= ROM_data;
    ROM_out[2] <= ROM_out[3];
    ROM_out[1] <= ROM_out[2];
    ROM_out[0] <= ROM_out[1];
  end
end

// << tmp >>
always_ff@(posedge CLK)begin
  if(curState == CAL1)begin
    tmp[3] <= calResult_int;
    tmp[2] <= tmp[3];
    tmp[1] <= tmp[2];
    tmp[0] <= tmp[1];
  end
end

// << SRAM_WEN >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)SRAM_WEN <= 1'b1;
  else   SRAM_WEN <= !(curState == STORE);
end

// <<SRAM_wdata >>
always_ff@(posedge CLK)begin
  if(curState == CAL2)SRAM_wdata <= calResult_int;
end

// <<SRAM_addr >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)SRAM_addr <= 14'h3fff;
  else if(curState == GET_PARAM)SRAM_addr <= 14'h3fff;
  else if(curState == STORE)SRAM_addr <= SRAM_addr + 14'd1;
end

//---------------------------------------------------------------------
//        FSM-State
//---------------------------------------------------------------------
always_ff@(posedge CLK or posedge RST)begin
  if(RST)curState <= GET_PARAM;
  else   curState <= nxtState;
end

always_comb begin
  unique case(curState)
    GET_PARAM:begin
      nxtState = CAL_RATIO_W;
    end
    CAL_RATIO_W:begin
      if(done)nxtState = CAL_RATIO_H;
      else    nxtState = CAL_RATIO_W;
    end
    CAL_RATIO_H:begin
      if(done)nxtState = READ_ROM1;
      else    nxtState = CAL_RATIO_H;
    end
    READ_ROM1:begin
      if(&cnt1)nxtState = CAL1;
      else     nxtState = READ_ROM1;
    end
    CAL1:begin
      if(&cnt2)nxtState = CAL2;
      else     nxtState = READ_ROM1;
    end
    CAL2:begin
      nxtState = STORE;
    end
    STORE:begin
      if(cnt_w == TW-6'd1 && cnt_h == TH-6'd1)nxtState = FINISH;
      else nxtState = READ_ROM1;
    end
    FINISH:begin
      nxtState = GET_PARAM;
    end
    default:begin
      nxtState = GET_PARAM;
    end
  endcase
end

//---------------------------------------------------------------------
//        FSM-output
//---------------------------------------------------------------------
//always_comb begin
//  unique case(curState)
//    FINISH:begin
//      DONE = 1'b1;
//    end
//    default:begin
//      DONE = 1'b0;
//    end
//  endcase
//end


endmodule












module divLinear #(parameter width_a = 8, width_b = 6)(
  input                       clk,
  input                       rst,
  input                    enable,
  input         [width_a-1:0] a_i,
  input         [width_b-1:0] b_i,
  output logic  [width_a-1:0] q_o,
  output logic  [width_b-1:0] r_o,
  output logic               done
);

typedef enum logic [1:0]{IDLE,SUB,RESTORE,FINISH} state;
state fstate;

logic        [$clog2(width_a):0] counter;
logic signed [width_a*2-2:0]        rTmp;
logic signed [width_a*2-2:0]        bTmp;

assign r_o = rTmp[width_b:0];
assign done = (fstate == FINISH);
//<< counter >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)counter <= 'd0;
  else begin
    unique case(fstate)
      IDLE:counter <= 'd0;
      SUB:counter <= counter;
      RESTORE:counter <= counter + 'd1;
      FINISH:counter <= 'd0;
    endcase
  end
end
//<< q_o >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)q_o <= 'd0;
  else begin
    unique case(fstate)
      IDLE:q_o <= 'd0;
      SUB:q_o <= q_o;
      RESTORE:begin
        if(rTmp < 0)q_o <= q_o << 1;
        else        q_o <= {q_o[width_a-1:0], 1'b1};
      end
      FINISH:q_o <= q_o;
    endcase
  end
end
//<< bTmp >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)bTmp <= 'd0;
  else begin
    unique case(fstate)
      IDLE:if(enable)bTmp <= b_i << (width_a-1);
      SUB:bTmp <= bTmp;
      RESTORE:bTmp <= bTmp >> 1;
      FINISH:bTmp <= bTmp;
    endcase
  end
end
//<< rTmp >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)rTmp <= 'd0;
  else begin
    unique case(fstate)
      IDLE:if(enable)rTmp <= a_i;
      SUB:rTmp <= rTmp - bTmp;
      RESTORE:if(rTmp < 0)rTmp <= rTmp + bTmp;
      FINISH: rTmp <= rTmp;
    endcase
  end
end
//<< fstate >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)fstate <= IDLE;
  else begin
    unique case(fstate)
      IDLE:begin
        if(enable)fstate <= SUB;
        else      fstate <= IDLE;
      end
      SUB:fstate <= RESTORE;
      RESTORE:begin
        if(counter == width_a-1)fstate <= FINISH;
        else                  fstate <= SUB;
      end
      FINISH:fstate <= IDLE;
    endcase
  end
end

endmodule