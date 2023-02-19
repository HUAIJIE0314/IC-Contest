
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	                clk;
input   	              reset;
output  reg [13:0] 	gray_addr;
output  reg       	 gray_req;
input   	         gray_ready;
input       [ 7:0] 	gray_data;
output      [13:0]   lbp_addr;
output  reg         lbp_valid;
output  reg [ 7:0]   lbp_data;
output  reg            finish;
//====================================================================

//---------------------------------------------------------------------
//   LOCAL PARAMETER                       
//--------------------------------------------------------------------- 
localparam IDLE         = 3'd0;
localparam GET_CENTER   = 3'd1;
localparam CAL_LBP      = 3'd2;
localparam WRITE_MEM    = 3'd3;
localparam FINISH       = 3'd4;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
// << reg >>
reg  [2:0]  fstate;
reg  [6:0]   coorX;
reg  [6:0]   coorY;
reg  [7:0]  center;
reg  [3:0] counter;
reg  [7:0]  weight;
// << wire >>
wire [6:0] coorX_L;
wire [6:0] coorX_R;
wire [6:0] coorY_U;
wire [6:0] coorY_D;

//---------------------------------------------------------------------
//   WIRE CONNECTION                
//---------------------------------------------------------------------
assign coorX_L = coorX - 7'd1;
assign coorX_R = coorX + 7'd1;
assign coorY_U = coorY - 7'd1;
assign coorY_D = coorY + 7'd1;

assign lbp_addr = {coorY, coorX};
//---------------------------------------------------------------------
//   ALWAYS BLOCK                
//---------------------------------------------------------------------

// << center >>
always@(posedge clk or posedge reset)begin
  if(reset)center <= 8'd0;
  else if(fstate == GET_CENTER)center <= gray_data;
end

// << weight >>
always@(posedge clk or posedge reset)begin
  if(reset)weight <= 8'd0;
  else if(fstate == GET_CENTER)weight <= 8'd1;
  else if(fstate == CAL_LBP)   weight <= weight << 1;
end

// << coorX >>
always@(posedge clk or posedge reset)begin
  if(reset)coorX <= 7'd1;
  else if(fstate == WRITE_MEM)begin
    if(coorX < 7'd126)coorX <= coorX + 7'd1;
    else              coorX <= 7'd1;
  end
end

// << coorY >>
always@(posedge clk or posedge reset)begin
  if(reset)coorY <= 7'd1;
  else if(fstate == WRITE_MEM)begin
    if(coorX == 7'd126)begin
      if(coorY < 7'd126)coorY <= coorY + 7'd1;
      else              coorY <= 7'd1;
    end
  end
end

// << counter >>
always@(posedge clk or posedge reset)begin
  if(reset)counter <= 4'd0;
  else begin
    if(fstate == CAL_LBP)begin
      if(counter == 4'd3)    counter <= counter + 4'd2;
      else if(counter < 4'd8)counter <= counter + 4'd1;
      else                   counter <= 4'd0;
    end
  end
end

// << lbp_data >>
always@(posedge clk or posedge reset)begin
  if(reset)lbp_data <= 8'd0;
  else begin
    case(fstate)
      GET_CENTER:lbp_data <= 8'd0;
      CAL_LBP:begin
        if(gray_data >= center)lbp_data <= lbp_data + weight;
      end
    endcase
  end
end

// << gray_addr >>
always@(*)begin
  case(fstate)
    GET_CENTER:gray_addr = {coorY  , coorX  };
    CAL_LBP:begin
      case(counter)
        4'd0:gray_addr = {coorY_U, coorX_L};
        4'd1:gray_addr = {coorY_U, coorX  };
        4'd2:gray_addr = {coorY_U, coorX_R};
        4'd3:gray_addr = {coorY  , coorX_L};
        //4'd4:gray_addr = {coorY  , coorX  };
        4'd5:gray_addr = {coorY  , coorX_R};
        4'd6:gray_addr = {coorY_D, coorX_L};
        4'd7:gray_addr = {coorY_D, coorX  };
        4'd8:gray_addr = {coorY_D, coorX_R};
        default:gray_addr = {coorY  , coorX  };
      endcase
    end
  endcase
end

//---------------------------------------------------------------------
//   FSM-STATE           
//---------------------------------------------------------------------
always@(posedge clk or posedge reset)begin
  if(reset)fstate <= IDLE;
  else begin
    case(fstate)
      IDLE:begin
        if(gray_ready)fstate <= GET_CENTER;
        else          fstate <= IDLE;
      end
      GET_CENTER:begin
        fstate <= CAL_LBP;
      end
      CAL_LBP:begin
        if(counter == 4'd8)fstate <= WRITE_MEM;
        else               fstate <= CAL_LBP;
      end
      WRITE_MEM:begin
        if(coorX == 7'd126 && coorY == 7'd126)fstate <= FINISH;
        else                                  fstate <= GET_CENTER;
      end
      FINISH:begin
        fstate <= IDLE;
      end
      default:begin
        fstate <= IDLE;
      end
    endcase
  end
end
//---------------------------------------------------------------------
//   FSM-OUTPUT               
//---------------------------------------------------------------------
always@(*)begin
  case(fstate)
    IDLE:begin
      finish    = 1'b0;
      lbp_valid = 1'b0;
      gray_req  = 1'b0;
    end
    GET_CENTER:begin
      finish    = 1'b0;
      lbp_valid = 1'b0;
      gray_req  = 1'b1;
    end
    CAL_LBP:begin
      finish    = 1'b0;
      lbp_valid = 1'b0;
      gray_req  = 1'b1;
    end
    WRITE_MEM:begin
      finish    = 1'b0;
      lbp_valid = 1'b1;
      gray_req  = 1'b0;
    end
    FINISH:begin
      finish    = 1'b1;
      lbp_valid = 1'b0;
      gray_req  = 1'b0;
    end
    default:begin
      finish    = 1'b0;
      lbp_valid = 1'b0;
      gray_req  = 1'b0;
    end
  endcase
end

//====================================================================
endmodule
