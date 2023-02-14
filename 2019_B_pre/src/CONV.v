`timescale 1ns/10ps
module  CONV(
  clk,
  reset,
  busy,
  ready,
  iaddr,
  idata,
  cwr,
  caddr_wr,
  cdata_wr,
  crd,
  caddr_rd,
  cdata_rd,
  csel
);
//---------------------------------------------------------------------
//  PORTS DECLARATION                     
//--------------------------------------------------------------------- 
input  clk;
input  reset;
input  ready;
output reg busy;           
output reg [11:0] iaddr;   
input  signed [19:0] idata;
output reg crd;            
input  [19:0] cdata_rd;
output reg [11:0] caddr_rd;
output reg cwr;            
output reg [19:0] cdata_wr;
output reg [11:0] caddr_wr;
output reg [2:0] csel;     
	
//---------------------------------------------------------------------
//   LOCAL PARAMETER                       
//--------------------------------------------------------------------- 
// << state >>
localparam IDLE        = 4'd0;
localparam COUNTADDR   = 4'd1;
localparam CALCONV     = 4'd2;
localparam WRITEMEM_L0 = 4'd3;
localparam COUNTADDR2  = 4'd4;
localparam MAXPOOL     = 4'd5;
localparam WRITEMEM_L1 = 4'd6;
localparam READ_L1     = 4'd7;
localparam WRITEMEM_L2 = 4'd8;
localparam FINISH      = 4'd9;

// << map 0 >> 
localparam k00 = 20'h0A89E;
localparam k01 = 20'h092D5;
localparam k02 = 20'h06D43;
localparam k03 = 20'h01004;
localparam k04 = 20'hF8F71;
localparam k05 = 20'hF6E54;
localparam k06 = 20'hFA6D7;
localparam k07 = 20'hFC834;
localparam k08 = 20'hFAC19;
localparam b00 = 20'h01310;

// << map 1 >> 
localparam k10 = 20'hFDB55;
localparam k11 = 20'h02992;
localparam k12 = 20'hFC994;
localparam k13 = 20'h050FD;
localparam k14 = 20'h02F20;
localparam k15 = 20'h0202D;
localparam k16 = 20'h03BD7;
localparam k17 = 20'hFD369;
localparam k18 = 20'h05E68;
localparam b10 = 20'hF7295;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
// << reg >>
reg                 selKernel;
reg         [ 3:0]     fstate;
reg         [ 5:0]     icoorX;
reg         [ 5:0]     icoorY;
reg         [ 3:0]    counter;
reg         [10:0]     addrL2;
reg  signed [19:0]  kernelTmp;
reg  signed [19:0]   pixelTmp;
reg  signed [43:0]  resultAcc;

// << wire >>
wire        [ 5:0]    icoorX_L;
wire        [ 5:0]    icoorX_R;
wire        [ 5:0]    icoorY_U;
wire        [ 5:0]    icoorY_D;
wire signed [19:0]        tmp0;
wire signed [19:0]        tmp1;
wire signed [19:0]        tmp2;
wire signed [19:0]        tmp3;
wire signed [19:0]        tmp4;
wire signed [19:0]        tmp5;
wire signed [19:0]        tmp6;
wire signed [19:0]        tmp7;
wire signed [19:0]        tmp8;
wire signed [43:0]   mulResult;
wire signed [20:0]  convResult;
wire signed [19:0] totalResult;
//---------------------------------------------------------------------
//   WIRE CONNECTION              
//---------------------------------------------------------------------
// << icoorX & icoorY >>
assign icoorX_L = (fstate < COUNTADDR2)?(icoorX - 6'd1):((icoorX << 1)       );
assign icoorX_R = (fstate < COUNTADDR2)?(icoorX + 6'd1):((icoorX << 1) + 6'd1);
assign icoorY_U = (fstate < COUNTADDR2)?(icoorY - 6'd1):((icoorY << 1)       );
assign icoorY_D = (fstate < COUNTADDR2)?(icoorY + 6'd1):((icoorY << 1) + 6'd1);

// << tmp0 ~ tmp8 >>
assign tmp0 = (icoorX == 6'd0  || icoorY == 6'd0 )?(20'd0):(idata);
assign tmp1 = (icoorY == 6'd0                    )?(20'd0):(idata);
assign tmp2 = (icoorX == 6'd63 || icoorY == 6'd0 )?(20'd0):(idata);
assign tmp3 = (icoorX == 6'd0                    )?(20'd0):(idata);
assign tmp4 = idata;
assign tmp5 = (icoorX == 6'd63                   )?(20'd0):(idata);
assign tmp6 = (icoorX == 6'd0  || icoorY == 6'd63)?(20'd0):(idata);
assign tmp7 = (icoorY == 6'd63                   )?(20'd0):(idata);
assign tmp8 = (icoorX == 6'd63 || icoorY == 6'd63)?(20'd0):(idata);

// << mulResult >>
assign mulResult = pixelTmp * kernelTmp;

// << convResult >>
assign convResult = (resultAcc >> 15) + 21'd1;

// << totalResult >>
assign totalResult = convResult[20:1];

//---------------------------------------------------------------------
//   ALWAYS BLOCK                
//---------------------------------------------------------------------
// << counter >>
always@(posedge clk or posedge reset)begin
  if(reset)counter <= 4'd0;
  else begin
    case(fstate)
      CALCONV:begin
        if(counter < 4'd9)counter <= counter + 4'd1;
        else              counter <= 4'd0;
      end
      MAXPOOL:begin
        if(counter < 4'd3)counter <= counter + 4'd1;
        else              counter <= 4'd0;
      end
    endcase
  end
end

// << iaddr >>
always@(*)begin
  case(fstate)
    COUNTADDR, COUNTADDR2:begin
      iaddr = {icoorY, icoorX};
    end
    CALCONV:begin
      case(counter)
        4'd0:iaddr = {icoorY_U, icoorX_L};
        4'd1:iaddr = {icoorY_U, icoorX  };
        4'd2:iaddr = {icoorY_U, icoorX_R};
        4'd3:iaddr = {icoorY  , icoorX_L};
        4'd4:iaddr = {icoorY  , icoorX  };
        4'd5:iaddr = {icoorY  , icoorX_R};
        4'd6:iaddr = {icoorY_D, icoorX_L};
        4'd7:iaddr = {icoorY_D, icoorX  };
        4'd8:iaddr = {icoorY_D, icoorX_R};
        default:iaddr = {icoorY, icoorX};
      endcase
    end
    default:iaddr = {icoorY, icoorX};
  endcase
end

// << icoorX >>
always@(posedge clk or posedge reset)begin
  if(reset)icoorX <= 6'd0;
  else begin
    case(fstate)
      WRITEMEM_L0:begin
        icoorX <= icoorX + 6'd1;
      end
      WRITEMEM_L1:begin
        if(icoorX < 6'd31)icoorX <= icoorX + 6'd1;
        else              icoorX <= 6'd0;
      end
      WRITEMEM_L2:begin
        if(!selKernel)begin
          if(icoorX < 6'd63)icoorX <= icoorX + 6'd1;
          else              icoorX <= 6'd0;
        end
      end
    endcase
  end
end

// << icoorY >>
always@(posedge clk or posedge reset)begin
  if(reset)icoorY <= 6'd0;
  else begin
    case(fstate)
      WRITEMEM_L0:begin
        if(icoorX == 6'd63)begin
          icoorY <= icoorY + 6'd1;
        end
      end
      WRITEMEM_L1:begin
        if(icoorX == 6'd31)begin
          if(icoorY < 6'd31)icoorY <= icoorY + 6'd1;
          else              icoorY <= 6'd0;
        end
      end
      WRITEMEM_L2:begin
        if(!selKernel)begin
          if(icoorX == 6'd63)begin
            if(icoorY < 6'd31)icoorY <= icoorY + 6'd1;
            else              icoorY <= 6'd0;
          end
        end
      end
    endcase
  end
end

// << kernelTmp >>
always@(*)begin
  if(selKernel == 1'b0)begin
    case(counter)
      4'd0:kernelTmp = k00;
      4'd1:kernelTmp = k01;
      4'd2:kernelTmp = k02;
      4'd3:kernelTmp = k03;
      4'd4:kernelTmp = k04;
      4'd5:kernelTmp = k05;
      4'd6:kernelTmp = k06;
      4'd7:kernelTmp = k07;
      4'd8:kernelTmp = k08;
      default:kernelTmp = 20'd0;
    endcase
  end
  else begin
    case(counter)
      4'd0:kernelTmp = k10;
      4'd1:kernelTmp = k11;
      4'd2:kernelTmp = k12;
      4'd3:kernelTmp = k13;
      4'd4:kernelTmp = k14;
      4'd5:kernelTmp = k15;
      4'd6:kernelTmp = k16;
      4'd7:kernelTmp = k17;
      4'd8:kernelTmp = k18;
      default:kernelTmp = 20'd0;
    endcase
  end
end

// << pixelTmp >>
always@(*)begin
  case(counter)
    4'd0:pixelTmp = tmp0;
    4'd1:pixelTmp = tmp1;
    4'd2:pixelTmp = tmp2;
    4'd3:pixelTmp = tmp3;
    4'd4:pixelTmp = tmp4;
    4'd5:pixelTmp = tmp5;
    4'd6:pixelTmp = tmp6;
    4'd7:pixelTmp = tmp7;
    4'd8:pixelTmp = tmp8;
    default:pixelTmp = 20'd0;
  endcase
end

// << resultAcc >>
always@(posedge clk or posedge reset)begin
  if(reset)resultAcc <= 44'd0;
  else begin
    case(fstate)
      COUNTADDR:resultAcc <= 44'd0;
      CALCONV:begin
        if(counter >= 4'd0 && counter <= 4'd8)resultAcc <= resultAcc + mulResult;
        else if(counter == 4'd9)begin
          if(!selKernel)resultAcc <= resultAcc + {b00, 16'd0};
          else          resultAcc <= resultAcc + {b10, 16'd0};
        end
      end
      MAXPOOL:begin
        case(counter)
          4'd0:resultAcc <= cdata_rd;
          4'd1, 4'd2, 4'd3:if(cdata_rd > resultAcc)resultAcc <= cdata_rd;
        endcase
      end
    endcase
  end
end

// << csel >>
always@(*)begin
  case(fstate)
    WRITEMEM_L0, MAXPOOL:begin
      if(!selKernel)csel = 3'd1;
      else          csel = 3'd2;
    end
    WRITEMEM_L1, READ_L1:begin
      if(!selKernel)csel = 3'd3;
      else          csel = 3'd4;
    end
    WRITEMEM_L2:begin
      csel = 3'd5;
    end
    default:csel = 3'd0;
  endcase
end

// << cdata_wr >>
always@(*)begin
  case(fstate)
    WRITEMEM_L0:begin
      if(totalResult[19])cdata_wr = 20'd0;
      else               cdata_wr = totalResult;
    end
    WRITEMEM_L1:begin
      cdata_wr = resultAcc;
    end
    WRITEMEM_L2:begin
      cdata_wr = cdata_rd;
    end
    default:cdata_wr = 20'd0;
  endcase
end

// << caddr_rd >>
always@(*)begin
  case(fstate)
    MAXPOOL:begin
      case(counter)
        4'd0:caddr_rd = {icoorY_U, icoorX_L};
        4'd1:caddr_rd = {icoorY_U, icoorX_R};
        4'd2:caddr_rd = {icoorY_D, icoorX_L};
        4'd3:caddr_rd = {icoorY_D, icoorX_R};
        default:caddr_rd = {icoorY_U, icoorX_L};
      endcase
    end
    READ_L1:begin
      caddr_rd = {icoorY, icoorX};
    end
    default:caddr_rd = {icoorY_U, icoorX_L};
  endcase
end

// << caddr_wr >>
always@(*)begin
  case(fstate)
    WRITEMEM_L0:begin
      caddr_wr = iaddr;
    end
    WRITEMEM_L1:begin
      caddr_wr = {2'd0, icoorY[4:0], icoorX[4:0]};
    end
    WRITEMEM_L2:begin
      caddr_wr = addrL2;
    end
    default:caddr_wr = 12'd0;
  endcase
end

// << selKernel >>
always@(posedge clk or posedge reset)begin
  if(reset)selKernel <= 1'b0;
  else begin
    case(fstate)
      WRITEMEM_L0:begin
        if(iaddr == 12'd4095)selKernel <= ~selKernel;
      end
      WRITEMEM_L1:begin
        if(caddr_wr == 12'd1023)selKernel <= ~selKernel;
      end
      READ_L1:selKernel <= ~selKernel;
    endcase
  end
end

// << addrL2 >>
always@(posedge clk or posedge reset)begin
  if(reset)addrL2 <= 11'd0;
  else begin
    if(fstate == WRITEMEM_L2)addrL2 <= addrL2 + 11'd1;
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
        if(ready)fstate <= COUNTADDR;
        else     fstate <= IDLE;
      end
      COUNTADDR:begin
        fstate <= CALCONV;
      end
      CALCONV:begin
        if(counter == 4'd9)fstate <= WRITEMEM_L0;
        else               fstate <= CALCONV;
      end
      WRITEMEM_L0:begin
        if(iaddr == 12'd4095 && selKernel)fstate <= COUNTADDR2;
        else                              fstate <= COUNTADDR;
      end
      COUNTADDR2:begin
        fstate <= MAXPOOL;
      end
      MAXPOOL:begin
        if(counter == 4'd3)fstate <= WRITEMEM_L1;
        else               fstate <= MAXPOOL;
      end
      WRITEMEM_L1:begin
        if(caddr_wr == 12'd1023 && selKernel)fstate <= READ_L1;
        else                                 fstate <= COUNTADDR2;
      end
      READ_L1:begin
        fstate <= WRITEMEM_L2;
      end
      WRITEMEM_L2:begin
        if(addrL2 == 11'd2047)fstate <= FINISH;
        else                  fstate <= READ_L1;
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
      busy   = 1'b0;
      cwr    = 1'b0;
      crd    = 1'b0;
    end
    COUNTADDR:begin
      busy   = 1'b1;
      cwr    = 1'b0;
      crd    = 1'b0;
    end
    CALCONV:begin
      busy   = 1'b1;
      cwr    = 1'b0;
      crd    = 1'b0;
    end
    WRITEMEM_L0:begin
      busy   = 1'b1;
      cwr    = 1'b1;
      crd    = 1'b0;
    end
    COUNTADDR2:begin
      busy   = 1'b1;
      cwr    = 1'b0;
      crd    = 1'b0;
    end
    MAXPOOL:begin
      busy   = 1'b1;
      cwr    = 1'b0;
      crd    = 1'b1;
    end
    WRITEMEM_L1:begin
      busy   = 1'b1;
      cwr    = 1'b1;
      crd    = 1'b0;
    end
    READ_L1:begin
      busy   = 1'b1;
      cwr    = 1'b0;
      crd    = 1'b1;
    end
    WRITEMEM_L2:begin
      busy   = 1'b1;
      cwr    = 1'b1;
      crd    = 1'b0;
    end
    FINISH:begin
      busy   = 1'b0;
      cwr    = 1'b0;
      crd    = 1'b0;
    end
    default:begin
      busy   = 1'b1;
      cwr    = 1'b0;
      crd    = 1'b0;
    end
  endcase
end

endmodule


