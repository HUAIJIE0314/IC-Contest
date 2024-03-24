//`include "DW_sqrt.v"
module geofence (
  clk,
  reset,
  X,
  Y,
  R,
  valid,
  is_inside
);

input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output logic valid;
output logic is_inside;


//---------------------------------------------------------------------
//        STATE                            
//---------------------------------------------------------------------
typedef enum logic [3:0]{
  GETDATA,
  SORT,
  SUB_MULT,
  SIX_AREA,
  EDGE,
  CAL_S,
  ROOT1,
  ROOT2,
  ACC,
  FINISH
}state;

state fstate;

//---------------------------------------------------------------------
//        LOGIC & VARIABLES DECLARATION                            
//---------------------------------------------------------------------
logic [9:0] xCoor [5:0];
logic [9:0] yCoor [5:0];
logic [9:0] R_len [5:0];
logic [2:0] idx0;
logic [2:0] idx1;
logic [2:0] idx2;


integer i, j, k;

logic signed [10:0] mul_srcA1;
logic signed [10:0] mul_srcB1;
logic signed [10:0] mul_srcA2;
logic signed [10:0] mul_srcB2;
logic signed [21:0] mulResult1;
logic signed [21:0] mulResult2;
logic signed [22:0] outterProduct;
logic signed [22:0] acc;


logic        [22:0] rootIn; // 23
logic        [11:0] rootOut;// (23 + 1) // 2
logic        [9:0]  rootOutRound;// (23 + 1) // 2
logic        [9:0]  rootOutRound_reg;

logic        [11:0] S;
logic        [9:0]  tempOfRoot1;
logic        [9:0]  tempOfRoot2;

logic errFlag;
//---------------------------------------------------------------------
//        WIRE CONNECTION                             
//---------------------------------------------------------------------
assign mulResult1 = mul_srcA1 * mul_srcB1;
assign mulResult2 = mul_srcA2 * mul_srcB2;
assign outterProduct = (fstate == EDGE || fstate == ACC)?($signed(mulResult1) + $signed(mulResult2)):($signed(mulResult1) - $signed(mulResult2));

//---------------------------------------------------------------------
//        MODULE INSTANTAITE                             
//---------------------------------------------------------------------
DW_sqrt SQRT(
  .a(rootIn),
  .root(rootOut)
);
defparam SQRT.width   = 23;
defparam SQRT.tc_mode = 1;

assign rootIn = outterProduct << 2;
assign rootOutRound = (rootOut + 1) >> 1;
//---------------------------------------------------------------------
//        ALWAYS BLOCK                             
//---------------------------------------------------------------------


// << mul_srcA1 >>
always_comb begin
  case(fstate)
    GETDATA: mul_srcA1 = 10'd0;
    SORT:    mul_srcA1 = xCoor[idx1] - xCoor[idx0];
    SUB_MULT:mul_srcA1 = xCoor[idx1];
    EDGE, CAL_S:    mul_srcA1 = xCoor[idx1] - xCoor[idx2];
    ROOT1:   mul_srcA1 = S;
    ROOT2:   mul_srcA1 = S - R_len[idx1];
    ACC:     mul_srcA1 = tempOfRoot1;
    default: mul_srcA1 = 10'd0;
  endcase
end

// << mul_srcB1 >>
always_comb begin
  case(fstate)
    GETDATA: mul_srcB1 = 10'd0;
    SORT:    mul_srcB1 = yCoor[idx2] - yCoor[idx0];
    SUB_MULT:mul_srcB1 = yCoor[idx2];
    EDGE, CAL_S:    mul_srcB1 = xCoor[idx1] - xCoor[idx2];
    ROOT1:   mul_srcB1 = S - rootOutRound_reg;
    ROOT2:   mul_srcB1 = S - R_len[idx2];
    ACC:     mul_srcB1 = tempOfRoot2;
    default: mul_srcB1 = 10'd0;
  endcase
end

// << mul_srcA2 >>
always_comb begin
  case(fstate)
    GETDATA: mul_srcA2 = 10'd0;       
    SORT:    mul_srcA2 = xCoor[idx2] - xCoor[idx0];
    SUB_MULT:mul_srcA2 = xCoor[idx2];
    EDGE, CAL_S:    mul_srcA2 = yCoor[idx1] - yCoor[idx2];
    default: mul_srcA2 = 10'd0;       
  endcase
end

// << mul_srcB2 >>
always_comb begin
  case(fstate)
    GETDATA: mul_srcB2 = 10'd0;      
    SORT:    mul_srcB2 = yCoor[idx1] - yCoor[idx0];
    SUB_MULT:mul_srcB2 = yCoor[idx1];
    EDGE, CAL_S:    mul_srcB2 = yCoor[idx1] - yCoor[idx2];
    default: mul_srcB2 = 10'd0;
  endcase
end

// << errFlag >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)errFlag <= 1'b0;
  else if(fstate == GETDATA)errFlag <= 1'b0;
  else if(fstate == ROOT1 || fstate == ROOT2)begin
    if(mul_srcA1[10] || mul_srcB1[10])errFlag <= 1'b1;
  end;
end

// << S >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)S <= 12'd0;
  else if(fstate == EDGE)S <= (rootOutRound + R_len[idx1] + R_len[idx2]) >> 1;
end

// << rootOutRound_reg >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)rootOutRound_reg <= 10'd0;
  else if(fstate == EDGE)rootOutRound_reg <= rootOutRound;
end

// << tempOfRoot1 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)tempOfRoot1 <= 10'd0;
  else if(fstate == ROOT1)tempOfRoot1 <= rootOutRound;
end

// << tempOfRoot2 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)tempOfRoot2 <= 10'd0;
  else if(fstate == ROOT2)tempOfRoot2 <= rootOutRound;
end

// << acc >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)acc <= 23'd0;
  else begin
    case(fstate)
      GETDATA:acc <= 23'd0;
      SUB_MULT:acc <= acc - outterProduct;
      SIX_AREA:acc <= acc >> 1;
      ACC:acc <= acc - mulResult1;
    endcase
  end
end

// << R_len >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)for(k=0;k<6;k=k+1)R_len[k] <= 10'd0;
  else begin
    case(fstate)
      GETDATA:begin
        R_len[idx1] <= R;
      end
      SORT:begin
        if(outterProduct[22])begin
          R_len[idx1] <= R_len[idx2];
          R_len[idx2] <= R_len[idx1];
        end
      end
    endcase
  end
end


// << xCoor >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)for(i=0;i<6;i=i+1)xCoor[i] <= 10'd0;
  else begin
    case(fstate)
      GETDATA:begin
        xCoor[idx1] <= X;
      end
      SORT:begin
        if(outterProduct[22])begin
          xCoor[idx1] <= xCoor[idx2];
          xCoor[idx2] <= xCoor[idx1];
        end
      end
    endcase
  end
end

// << yCoor >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)for(j=0;j<6;j=j+1)yCoor[j] <= 10'd0;
  else begin
    case(fstate)
      GETDATA:begin
        yCoor[idx1] <= Y;
      end
      SORT:begin
        if(outterProduct[22])begin
          yCoor[idx1] <= yCoor[idx2];
          yCoor[idx2] <= yCoor[idx1];
        end
      end
      
    endcase
  end
end


// << idx0 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)idx0 <= 3'd0;
  else begin
    case(fstate)
      GETDATA:begin
        idx0 <= 3'd0;
      end
      SORT:begin
        if(idx1 == 3'd5 && idx2 == 3'd5)begin
          if(idx0 < 3'd5)idx0 <= idx0 + 3'd1;
          else           idx0 <= 3'd0;
        end
      end
    endcase
  end
end

// << idx1 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)idx1 <= 3'd0;
  else begin
    case(fstate)
      GETDATA:begin
        if(idx1 < 3'd5)idx1 <= idx1 + 3'd1;
        else           idx1 <= 3'd0;
      end
      SORT:begin
        if(idx2 == 3'd5)begin
          if(idx1 < 3'd5)idx1 <= idx1 + 3'd1;
          else           idx1 <= 3'd0;
        end
      end
      SUB_MULT:begin
        if(idx1 < 3'd5)idx1 <= idx1 + 3'd1;
        else           idx1 <= 3'd0;
      end
      ACC:begin
        if(idx1 < 3'd5)idx1 <= idx1 + 3'd1;
        else           idx1 <= 3'd0;
      end
      FINISH:begin
        
      end
    endcase
  end
end

// << idx2 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)idx2 <= 3'd0;
  else begin
    case(fstate)
      GETDATA:begin
        idx2 <= 3'd0;
      end
      SORT:begin
        if(idx2 < 3'd5)idx2 <= idx2 + 3'd1;
        else begin 
          if(idx1 == 3'd5)idx2 <= 3'd1;
          else            idx2 <= 3'd0;
        end 
      end
      SUB_MULT:begin
        if(idx2 < 3'd5)idx2 <= idx2 + 3'd1;
        else begin 
          if(idx1 == 3'd5)idx2 <= 3'd1;
          else            idx2 <= 3'd0;
        end 
      end
      ACC:begin
        if(idx2 < 3'd5)idx2 <= idx2 + 3'd1;
        else           idx2 <= 3'd0;
      end
      FINISH:begin
        
      end
    endcase
  end
end

//---------------------------------------------------------------------
//        FSM-State
//---------------------------------------------------------------------
always_ff@(posedge clk or posedge reset)begin
  if(reset)fstate <= GETDATA;
  else begin
    unique case(fstate)
      GETDATA:begin
        if(idx1 == 3'd5)fstate <= SORT;
        else            fstate <= GETDATA;
      end
      SORT:begin
        if(idx1 == 3'd5 && idx2 == 3'd5 && idx0 == 3'd5)fstate <= SUB_MULT;
        else                            fstate <= SORT;
      end
      SUB_MULT:begin
        if(idx1 == 3'd5 && idx2 == 3'd0)fstate <= SIX_AREA;
        else                            fstate <= SUB_MULT;
      end
      SIX_AREA:begin
        fstate <= EDGE;
      end
      EDGE:begin
        fstate <= CAL_S;
      end
      CAL_S:begin
        fstate <= ROOT1;
      end
      ROOT1:begin
        fstate <= ROOT2;
      end
      ROOT2:begin
        fstate <= ACC;
      end
      ACC:begin
        if(idx1 == 3'd5)fstate <= FINISH;
        else            fstate <= EDGE;
      end
      FINISH:begin
        fstate <= GETDATA;
      end
      default:begin
        fstate <= GETDATA;
      end
    endcase
  end
end



//---------------------------------------------------------------------
//        FSM-output
//---------------------------------------------------------------------
always_comb begin
  if(fstate == FINISH)begin
    is_inside = (acc > 23'sd0) & (!errFlag);
    valid = 1'b1;
  end
  else begin
    is_inside = 1'b0;
    valid = 1'b0;
  end
end


endmodule



















