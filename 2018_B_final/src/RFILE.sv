module RFILE(clk, rst, A_x, A_y, B_x, B_y, C_x, C_y, rssiA, rssiB, rssiC, valueA, valueB, valueC, expA, expB, expC, busy, out_valid, xt, yt);
input                    clk;
input                    rst;
input        [7:0]       A_x;
input        [7:0]       A_y; 
input        [7:0]       B_x; 
input        [7:0]       B_y; 
input        [7:0]       C_x; 
input        [7:0]       C_y;
input        [19:0]    rssiA;
input        [19:0]    rssiB;
input        [19:0]    rssiC;
input        [15:0]   valueA;
input        [15:0]   valueB;
input        [15:0]   valueC;
output logic [11:0]     expA;
output logic [11:0]     expB;
output logic [11:0]     expC;
output logic            busy;
output logic       out_valid;
output logic [7:0]        xt;
output logic [7:0]        yt;

// =================== state ===================

typedef enum logic [3:0]{
  IDLE,
  WAIT,
  CAL_DIST,
  MULT1,
  MULT2,
  DIV1,
  DIV2,
  MULT3,
  MULT4,
  MULT5,
  FINISH
}state;

state fstate;
// =================== variables ===================
logic [7:0] alpha1;
logic [7:0] alpha2;
logic [7:0] beta1;
logic [7:0] beta2;

logic [16:0] mother;

logic [19:0] rssiA_positive;
logic [19:0] rssiB_positive;
logic [19:0] rssiC_positive;

logic [19+5:0] div1_inputA;
logic [19+5:0] div1_inputB;
logic [19+5:0] div1_inputC;

logic [19:0] div1_outputA;
logic [19:0] div1_outputB;
logic [19:0] div1_outputC;

logic [7:0] mult_srcA1;
logic [7:0] mult_srcA2;
logic [7:0] mult_srcA3;

logic [7:0] mult_srcB1;
logic [7:0] mult_srcB2;
logic [7:0] mult_srcB3;

logic [15:0] mult_product1;
logic [15:0] mult_product2;
logic [15:0] mult_product3;

logic [15:0] A_x_square_reg;
logic [15:0] B_x_square_reg;
logic [15:0] C_x_square_reg;

logic signed [39:0] r1;
logic signed [39:0] r2;

// =================== WIRE CONNECTION ===================
assign busy = (fstate != IDLE);

assign out_valid = (fstate == FINISH);

assign alpha1 = B_x - A_x;
assign alpha2 = C_x - B_x;
assign beta1  = B_y - A_y;
assign beta2  = C_y - B_y;

// assign rssiA_positive = (~rssiA) - {8'd58, 12'hfff};
// assign rssiB_positive = (~rssiB) - {8'd58, 12'hfff};
// assign rssiC_positive = (~rssiC) - {8'd58, 12'hfff};

assign rssiA_positive = ({20{rssiA[19]}} ^ rssiA) - {8'd58, 12'hfff};
assign rssiB_positive = ({20{rssiB[19]}} ^ rssiB) - {8'd58, 12'hfff};
assign rssiC_positive = ({20{rssiC[19]}} ^ rssiC) - {8'd58, 12'hfff};



assign div1_inputA = rssiA_positive >> 2;
assign div1_inputB = rssiB_positive >> 2;
assign div1_inputC = rssiC_positive >> 2;

//assign div1_outputA = div1_inputA / 3'd5;
//assign div1_outputB = div1_inputB / 3'd5;
//assign div1_outputC = div1_inputC / 3'd5;

assign expA = div1_outputA[11:0];
assign expB = div1_outputB[11:0];
assign expC = div1_outputC[11:0];


assign mult_product1 = mult_srcA1 * mult_srcB1;
assign mult_product2 = mult_srcA2 * mult_srcB2;
assign mult_product3 = mult_srcA3 * mult_srcB3;

// =================== MUL INSTANTIATION ===================
parameter A_width = 20;
parameter B_width = 20;

logic [A_width-1 : 0]            mul_srcA_1;
logic [B_width-1 : 0]            mul_srcB_1;
logic [A_width+B_width-1 : 0] mul_product_1;
// Instance of DW02_mult_2_stage
DW02_mult_2_stage #(A_width, B_width) U1 ( 
  .A(mul_srcA_1),
  .B(mul_srcB_1),
  .TC(1'b0), 
  .CLK(clk),
  .PRODUCT(mul_product_1)
);

logic [A_width-1 : 0]            mul_srcA_2;
logic [B_width-1 : 0]            mul_srcB_2;
logic [A_width+B_width-1 : 0] mul_product_2;
// Instance of DW02_mult_2_stage
DW02_mult_2_stage #(A_width, B_width) U2 ( 
  .A(mul_srcA_2),
  .B(mul_srcB_2),
  .TC(1'b0), 
  .CLK(clk),
  .PRODUCT(mul_product_2)
);

logic [A_width-1 : 0]            mul_srcA_3;
logic [B_width-1 : 0]            mul_srcB_3;
logic [A_width+B_width-1 : 0] mul_product_3;
// Instance of DW02_mult_2_stage
DW02_mult_2_stage #(A_width, B_width) U3 ( 
  .A(mul_srcA_3),
  .B(mul_srcB_3),
  .TC(1'b0), 
  .CLK(clk),
  .PRODUCT(mul_product_3)
);


 // Instance of DW_div_pipe
 /*
parameter inst_a_width = 40;
parameter inst_b_width = 17;
parameter inst_tc_mode = 1; //  Two’s complement control
parameter inst_rem_mode = 1;
parameter inst_num_stages = 2;
parameter inst_stall_mode = 0;
parameter inst_rst_mode = 0;
parameter inst_op_iso_mode = 0;

logic inst_en1;
logic [inst_a_width-1 : 0] div1_a;
logic [inst_b_width-1 : 0] div1_b;
logic  [inst_a_width-1 : 0] div1_quotient;
logic  [inst_b_width-1 : 0] div1_remainder;
logic  divide_by_0_inst1;

assign inst_en1 = 1'b0;
DW_div_pipe #(inst_a_width,   inst_b_width,   inst_tc_mode,  inst_rem_mode,
              inst_num_stages,   inst_stall_mode,   inst_rst_mode, 
inst_op_iso_mode) DIV_U1 (
  .clk(clk),
  .rst_n(rst),   
  .en(inst_en1),
  .a(div1_a),   
  .b(div1_b),   
  .quotient(div1_quotient),
  .remainder(div1_remainder),   
  .divide_by_0(divide_by_0_inst1)
);


logic inst_en2;
logic [inst_a_width-1 : 0] div2_a;
logic [inst_b_width-1 : 0] div2_b;
logic  [inst_a_width-1 : 0] div2_quotient;
logic  [inst_b_width-1 : 0] div2_remainder;
logic  divide_by_0_inst2;

assign inst_en2 = 1'b0;
DW_div_pipe #(inst_a_width,   inst_b_width,   inst_tc_mode,  inst_rem_mode,
              inst_num_stages,   inst_stall_mode,   inst_rst_mode, 
inst_op_iso_mode) DIV_U2 (
  .clk(clk),
  .rst_n(rst),   
  .en(inst_en2),
  .a(div2_a),   
  .b(div2_b),   
  .quotient(div2_quotient),
  .remainder(div2_remainder),   
  .divide_by_0(divide_by_0_inst2)
);


parameter inst_a_width = 40;
parameter inst_b_width = 17;

logic [inst_a_width-1 : 0] div1_a;
logic [inst_b_width-1 : 0] div1_b;
logic [inst_a_width-1 : 0] div2_a;
logic [inst_b_width-1 : 0] div2_b;

logic  [inst_a_width-1 : 0] div1_quotient;
logic  [inst_a_width-1 : 0] div2_quotient;
*/



parameter width_a = 22;
parameter width_b = 17;


logic                       enable1;
logic signed [width_a-1:0] div_a_i1;
logic signed [width_b-1:0] div_b_i1;
logic signed [width_a-1:0] div_q_o1;
logic        [width_b-1:0] div_r_o1;
logic                         done1;

//logic                       enable2;
logic signed [width_a-1:0] div_a_i2;
logic signed [width_b-1:0] div_b_i2;
logic signed [width_a-1:0] div_q_o2;
logic        [width_b-1:0] div_r_o2;
logic                         done2;

assign enable1 = (fstate == DIV1);

divLinear #(.width_a(width_a), .width_b(width_b))divLinear1(
  .clk   (     clk),
  .rst   (     rst),
  .enable( enable1),
  .a_i   (div_a_i1),
  .b_i   (div_b_i1),
  .q_o   (div_q_o1/*div1_quotient*/),
  .r_o   (div_r_o1),
  .done  (   done1)
);

divLinear #(.width_a(width_a), .width_b(width_b))divLinear2(
  .clk   (     clk),
  .rst   (     rst),
  .enable( enable1),
  .a_i   (div_a_i2),
  .b_i   (div_b_i2),
  .q_o   (div_q_o2/*div2_quotient*/),
  .r_o   (div_r_o2),
  .done  (   done2)
);
// =================== always block ===================
parameter BIT = 12+6;
// << div_src >>
always_comb begin
  if(fstate == DIV1)begin
    div_a_i1 = r1 >>> BIT;// >>> 1;
    div_b_i1 = mother << 1;
  end
  else begin
    div_a_i1 = 40'd0;
    div_b_i1 = 17'd1;
  end
end

always_comb begin
  if(fstate == DIV1)begin
    div_a_i2 = r2 >>> BIT;// >>> 1;
    div_b_i2 = mother << 1;
  end
  else begin
    div_a_i2 = 40'd0;
    div_b_i2 = 17'd1;
  end
end

/*
// << div_src >>
always_comb begin
  if(fstate == DIV1)begin
    div1_a = r1;// >>> 1;
    div1_b = mother << 1;
  end
  else begin
    div1_a = 40'd0;
    div1_b = 17'd1;
  end
end

always_comb begin
  if(fstate == DIV1)begin
    div2_a = r2;// >>> 1;
    div2_b = mother << 1;
  end
  else begin
    div2_a = 40'd0;
    div2_b = 17'd1;
  end
end
*/

// << mul_src >>
always_comb begin
  if(fstate == MULT1)begin
    mul_srcA_1 = div1_outputA;
    mul_srcB_1 = div1_outputA;
    mul_srcA_2 = div1_outputB;
    mul_srcB_2 = div1_outputB;
    mul_srcA_3 = div1_outputC;
    mul_srcB_3 = div1_outputC;
  end
  else if(fstate == MULT3)begin
    mul_srcA_1 = div1_outputA;
    mul_srcB_1 = $signed(beta2);
    
    mul_srcA_2 = div1_outputB;
    mul_srcB_2 = $signed(beta1);
    
    mul_srcA_3 = 20'd0;
    mul_srcB_3 = 20'd0;
  end
  else if(fstate == MULT4)begin
    mul_srcA_1 = div1_outputA;
    mul_srcB_1 = $signed(alpha2);
    
    mul_srcA_2 = div1_outputB;
    mul_srcB_2 = $signed(alpha1);
    
    mul_srcA_3 = 20'd0;
    mul_srcB_3 = 20'd0;
  end
  else begin
    mul_srcA_1 = 20'd0;
    mul_srcB_1 = 20'd0;
    mul_srcA_2 = 20'd0;
    mul_srcB_2 = 20'd0;
    mul_srcA_3 = 20'd0;
    mul_srcB_3 = 20'd0;
  end
end

// << mult_srcAB1 ~ mult_srcAB3 >>
always_comb begin
  case(fstate)
    /*
    CAL_DIST:begin
      mult_srcA1 = alpha1;
      mult_srcA2 = alpha2;
      mult_srcA3 = 8'd0;
      
      mult_srcB1 = beta2;
      mult_srcB2 = beta1;
      mult_srcB3 = 8'd0;
    end
    */
    MULT1:begin
      mult_srcA1 = A_x;
      mult_srcA2 = B_x;
      mult_srcA3 = C_x;
      
      mult_srcB1 = A_x;
      mult_srcB2 = B_x;
      mult_srcB3 = C_x;
    end
    MULT2:begin
      mult_srcA1 = A_y;
      mult_srcA2 = B_y;
      mult_srcA3 = C_y;
      
      mult_srcB1 = A_y;
      mult_srcB2 = B_y;
      mult_srcB3 = C_y;
    end
    default:begin
      mult_srcA1 = 8'd0;
      mult_srcA2 = 8'd0;
      mult_srcA3 = 8'd0;
      
      mult_srcB1 = 8'd0;
      mult_srcB2 = 8'd0;
      mult_srcB3 = 8'd0;
    end
  endcase
end

// << A_x_square_reg ~ C_x_square_reg >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)begin
    A_x_square_reg <= 16'd0;
    B_x_square_reg <= 16'd0;
    C_x_square_reg <= 16'd0;
  end
  else if(fstate == MULT1)begin
    A_x_square_reg <= mult_product1;
    B_x_square_reg <= mult_product2;
    C_x_square_reg <= mult_product3;
  end
end

// << r1, r2 >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)begin
    r1 <= 40'd0;
    r2 <= 40'd0;
  end
  else if(fstate == MULT2)begin
    r1 <= (mul_product_1 - mul_product_2) + ((B_x_square_reg - A_x_square_reg)<<24) + ((mult_product2 - mult_product1)<<24);
    r2 <= (mul_product_2 - mul_product_3) + ((C_x_square_reg - B_x_square_reg)<<24) + ((mult_product3 - mult_product2)<<24);
  end
end

// << mother >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)mother <= 17'd0;
  else if(fstate == CAL_DIST)begin
    //mother <= mult_product1 - mult_product2;
    mother <= $signed(alpha1)*$signed(beta2)  - $signed(alpha2)*$signed(beta1);
  end
end

// << xt >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)xt <= 8'd0;
  else if(fstate == MULT4)begin
    xt <= (((mul_product_1 - mul_product_2) >> 5) + 'd1) >> 1;
  end
end

// << yt >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)yt <= 8'd0;
  else if(fstate == MULT5)begin
    yt <= (((mul_product_2 - mul_product_1) >> 5) + 'd1) >> 1;;//(mul_product_2 - mul_product_1);
  end
end

// << div1_outputA ~ div1_outputC >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)begin
    div1_outputA <= 20'd0;
    div1_outputB <= 20'd0;
    div1_outputC <= 20'd0;
 end
  else begin
    if(fstate == WAIT)begin
      //div1_outputA <= div1_inputA / 3'd5;
      //div1_outputB <= div1_inputB / 3'd5;
      //div1_outputC <= div1_inputC / 3'd5;
      
     //div1_outputA <= (div1_inputA * 51)>>8;
     //div1_outputB <= (div1_inputB * 51)>>8;
     //div1_outputC <= (div1_inputC * 51)>>8;
      
      //div1_outputA <= (rssiA_positive * 51)/512;
      //div1_outputB <= (rssiB_positive * 51)/512;
      //div1_outputC <= (rssiC_positive * 51)/512;
      
      div1_outputA <= ( (div1_inputA<<5) + (div1_inputA<<4) + (div1_inputA<<1) + (div1_inputA) ) >> 8;
      div1_outputB <= ( (div1_inputB<<5) + (div1_inputB<<4) + (div1_inputB<<1) + (div1_inputB) ) >> 8;
      div1_outputC <= ( (div1_inputC<<5) + (div1_inputC<<4) + (div1_inputC<<1) + (div1_inputC) ) >> 8;
      
    end
    else if(fstate == CAL_DIST)begin
      if(div1_outputA[12])div1_outputA <= (valueA << 3) + (valueA << 1);
      else                div1_outputA <= valueA;
      
      if(div1_outputB[12])div1_outputB <= (valueB << 3) + (valueB << 1);
      else                div1_outputB <= valueB;
      
      if(div1_outputC[12])div1_outputC <= (valueC << 3) + (valueC << 1);
      else                div1_outputC <= valueC;
    end
    else if(fstate == DIV2)begin
      //div1_outputA <= div1_quotient[31:12];
      //div1_outputB <= div2_quotient[31:12];
      
      //div1_outputA <= div1_quotient[(12-BIT)+19:(12-BIT)];
      //div1_outputB <= div2_quotient[(12-BIT)+19:(12-BIT)];
      
      div1_outputA <= div_q_o1[19:0];
      div1_outputB <= div_q_o2[19:0];
    end
  end
end



// =================== finite state machine ===================
always_ff@(posedge clk or posedge rst)begin
  if(rst)fstate <= IDLE;
  else begin
    unique case(fstate)
      IDLE:begin
        fstate <= WAIT;
      end
      WAIT:begin
        fstate <= CAL_DIST;
      end
      CAL_DIST:begin
        fstate <= MULT1;
      end
      MULT1:begin
        fstate <= MULT2;
      end
      MULT2:begin
        fstate <= DIV1;
      end
      DIV1:begin
        fstate <= DIV2;
      end
      DIV2:begin
        if(done1)fstate <= MULT3;
      end
      MULT3:begin
        fstate <= MULT4;
      end
      MULT4:begin
        fstate <= MULT5;
      end
      MULT5:begin
        fstate <= FINISH;
      end
      FINISH:begin
        fstate <= IDLE;
      end
      default:fstate <= IDLE;
    endcase
  end
end



endmodule



module divLinear #(parameter width_a = 8, width_b = 4)(
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

logic        [$clog2(width_a)-1:0] counter;
logic signed [width_a*2-2:0]          rTmp;
logic signed [width_a*2-2:0]          bTmp;
logic                             sign_bit;

assign r_o = rTmp[width_b:0];

//<< counter >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)counter <= 'd0;
  else begin
    case(fstate)
      IDLE:counter <= 'd0;
      RESTORE:counter <= counter + 'd1;
      FINISH:counter <= 'd0;
    endcase
  end
end

//<< q_o >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)q_o <= 'd0;
  else begin
    case(fstate)
      IDLE:q_o <= 'd0;
      RESTORE:begin
        if(rTmp < 0)q_o <= q_o << 1;
        else        q_o <= {q_o[width_a-1:0], 1'b1};
      end
      FINISH:begin
        if(sign_bit)q_o <= (~q_o) + 'd1;
        else        q_o <= q_o;
      end 
    endcase
  end
end

//<< sign_bit >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)sign_bit <= 'd0;
  else begin
    case(fstate)
      IDLE:if(enable)sign_bit <= a_i[width_a-1] ^ b_i[width_b-1];
      FINISH:sign_bit <= 1'b0;
    endcase
  end
end


//<< done >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)done <= 1'b0;
  else   done <= (fstate == FINISH);
end

//<< bTmp >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)bTmp <= 'd0;
  else begin
    case(fstate)
      IDLE:begin
        if(enable)begin
          if(b_i[width_b-1])bTmp <= (-$signed(b_i)) << (width_a-1);
          else              bTmp <= b_i << (width_a-1);
        end
      end
      RESTORE:bTmp <= bTmp >> 1;
    endcase
  end
end

//<< rTmp >>
always_ff@(posedge clk or posedge rst)begin
  if(rst)rTmp <= 'd0;
  else begin
    case(fstate)
      IDLE:begin
        if(enable)begin
          if(a_i[width_a-1])rTmp <= -$signed(a_i);
          else              rTmp <= a_i;
        end
      end
      SUB:rTmp <= rTmp - bTmp;
      RESTORE:if(rTmp < 0)rTmp <= rTmp + bTmp;
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