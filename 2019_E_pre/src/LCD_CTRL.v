module LCD_CTRL(
  clk, 
  reset, 
  cmd, 
  cmd_valid, 
  IROM_Q,
  IROM_rd,
  IROM_A, 
  IRAM_valid,
  IRAM_D,
  IRAM_A, 
  busy, 
  done
);

//---------------------------------------------------------------------
//  PORTS DECLARATION                     
//--------------------------------------------------------------------- 
input                clk;
input              reset;
input  [3:0]         cmd;
input          cmd_valid;
input  [7:0]      IROM_Q;
output           IROM_rd;
output [5:0]      IROM_A;
output        IRAM_valid;
output [7:0]      IRAM_D;
output [5:0]      IRAM_A;
output              busy;
output              done;
 
reg              IROM_rd;
reg    [5:0]      IROM_A;
reg    [7:0]      IRAM_D;
reg    [5:0]      IRAM_A;
reg           IRAM_valid;
reg                 busy;
reg                 done;
//---------------------------------------------------------------------
//   LOCAL PARAMETER                       
//--------------------------------------------------------------------- 
localparam IDLE      = 4'd0;
localparam READROM   = 4'd1;
localparam READCMD   = 4'd2;
localparam PROC      = 4'd3;
localparam WRITERAM  = 4'd14;
localparam FINISH    = 4'd15;  
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
// << reg >>
reg  [3:0]     fstate;
reg  [2:0]      coorX;
reg  [2:0]      coorY;
reg  [3:0]     cmdReg;
reg  [7:0] map [63:0];
integer             i;
// << wire >>
wire [2:0]    coorX_L;
wire [2:0]    coorY_U;

wire [7:0]        pt0;
wire [7:0]        pt1;
wire [7:0]        pt2;
wire [7:0]        pt3;

wire [7:0]    minTmp1;
wire [7:0]    minTmp2;
wire [7:0]        min;

wire [7:0]    maxTmp1;
wire [7:0]    maxTmp2;
wire [7:0]        max;

wire [9:0]        avg;
//---------------------------------------------------------------------
//   WIRE CONNECTION              
//---------------------------------------------------------------------
assign coorX_L = coorX - 3'd1;
assign coorY_U = coorY - 3'd1;

assign pt0 = map[{coorY_U, coorX_L}];
assign pt1 = map[{coorY_U, coorX  }];
assign pt2 = map[{coorY  , coorX_L}];
assign pt3 = map[{coorY  , coorX  }];

assign minTmp1 = (pt0 < pt1)?(pt0):(pt1);
assign minTmp2 = (pt2 < pt3)?(pt2):(pt3);
assign min     = (minTmp1 < minTmp2)?(minTmp1):(minTmp2);

assign maxTmp1 = (pt0 > pt1)?(pt0):(pt1);
assign maxTmp2 = (pt2 > pt3)?(pt2):(pt3);
assign max     = (maxTmp1 > maxTmp2)?(maxTmp1):(maxTmp2);

assign avg = (pt0 + pt1 + pt2 + pt3) >> 2;
//---------------------------------------------------------------------
//   ALWAYS BLOCK                
//---------------------------------------------------------------------

// << cmdReg >>
always@(posedge clk or posedge reset)begin
  if(reset)cmdReg <= 4'd0;
  else begin
    if(cmd_valid)cmdReg <= cmd;
  end
end

// << coorX >>
always@(posedge clk or posedge reset)begin
  if(reset)coorX <= 3'd4;
  else if(fstate == PROC)begin
    case(cmdReg)
      4'd3:if(coorX > 3'd1)coorX <= coorX - 3'd1;
      4'd4:if(coorX < 3'd7)coorX <= coorX + 3'd1;
    endcase
  end
end

// << coorY >>
always@(posedge clk or posedge reset)begin
  if(reset)coorY <= 3'd4;
  else if(fstate == PROC)begin
    case(cmdReg)
      4'd1:if(coorY > 3'd1)coorY <= coorY - 3'd1;
      4'd2:if(coorY < 3'd7)coorY <= coorY + 3'd1;
    endcase
  end
end

// << busy >>
always@(posedge clk or posedge reset)begin
  if(reset)busy <= 1'b1;
  else begin
    case(fstate)
      READROM:begin
        if(IROM_A == 6'd62)busy  <= 1'b0;
        else               busy  <= 1'b1;
      end
      PROC:busy  <= 1'b0;
      FINISH: busy  <= 1'b0;
      default:busy  <= 1'b1;
    endcase
  end
end

// << IROM_A >>
always@(posedge clk or posedge reset)begin
  if(reset)IROM_A <= 6'd0;
  else if(fstate == READROM)begin
    if(IROM_A < 6'd63)IROM_A <= IROM_A + 6'd1;
    else              IROM_A <= 6'd0;
  end
end

// << map >>
always@(posedge clk or posedge reset)begin
  if(reset)begin
    for(i=0;i<64;i=i+1)map[i] <= 8'd0;
  end
  else if(IROM_rd)map[IROM_A] <= IROM_Q;
  else if(fstate == PROC)begin
    case(cmdReg)
      4'd5:begin//Max
        map[{coorY_U, coorX_L}] <= max;
        map[{coorY_U, coorX  }] <= max;
        map[{coorY  , coorX_L}] <= max;
        map[{coorY  , coorX  }] <= max;
      end
      4'd6:begin//Min
        map[{coorY_U, coorX_L}] <= min;
        map[{coorY_U, coorX  }] <= min;
        map[{coorY  , coorX_L}] <= min;
        map[{coorY  , coorX  }] <= min;
      end
      4'd7:begin//Average
        map[{coorY_U, coorX_L}] <= avg;
        map[{coorY_U, coorX  }] <= avg;
        map[{coorY  , coorX_L}] <= avg;
        map[{coorY  , coorX  }] <= avg;
      end
      4'd8:begin//Counterclockwise Rotation
        map[{coorY_U, coorX_L}] <= pt1;
        map[{coorY_U, coorX  }] <= pt3;
        map[{coorY  , coorX_L}] <= pt0;
        map[{coorY  , coorX  }] <= pt2;
      end
      4'd9:begin//Clockwise Rotation
        map[{coorY_U, coorX_L}] <= pt2;
        map[{coorY_U, coorX  }] <= pt0;
        map[{coorY  , coorX_L}] <= pt3;
        map[{coorY  , coorX  }] <= pt1;
      end
      4'd10:begin//Mirror X
        map[{coorY_U, coorX_L}] <= pt2;
        map[{coorY_U, coorX  }] <= pt3;
        map[{coorY  , coorX_L}] <= pt0;
        map[{coorY  , coorX  }] <= pt1;
      end
      4'd11:begin//Mirror Y
        map[{coorY_U, coorX_L}] <= pt1;
        map[{coorY_U, coorX  }] <= pt0;
        map[{coorY  , coorX_L}] <= pt3;
        map[{coorY  , coorX  }] <= pt2;
      end
    endcase
  end
end

// << IRAM_A >>
always@(posedge clk or posedge reset)begin
  if(reset)IRAM_A <= 6'd0;
  else if(fstate == WRITERAM)begin
    if(IRAM_A < 6'd63)IRAM_A <= IRAM_A + 6'd1;
    else              IRAM_A <= 6'd0;
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
        fstate <= READROM;
      end
      READROM:begin
        if(IROM_A == 6'd63)fstate <= READCMD;
        else               fstate <= READROM;
      end
      READCMD:begin
        if(cmdReg == 4'd0)fstate <= WRITERAM;
        else              fstate <= PROC;
      end
      PROC:begin
        fstate <= READCMD;
      end
      WRITERAM:begin
        if(IRAM_A == 6'd63)fstate <= FINISH;
        else               fstate <= WRITERAM;
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
      done       = 1'b0;
      IROM_rd    = 1'b0;
      IRAM_D     = 6'd0;
      IRAM_valid = 1'b0;
    end
    READROM:begin
      done       = 1'b0;
      IROM_rd    = 1'b1;
      IRAM_D     = 6'd0;
      IRAM_valid = 1'b0;
    end
    READCMD:begin
      done       = 1'b0;
      IROM_rd    = 1'b0;
      IRAM_D     = 6'd0;
      IRAM_valid = 1'b0;
    end
    PROC:begin
      done       = 1'b0;
      IROM_rd    = 1'b0;
      IRAM_D     = 6'd0;
      IRAM_valid = 1'b0;
    end
    WRITERAM:begin
      done       = 1'b0;
      IROM_rd    = 1'b0;
      IRAM_D     = map[IRAM_A];
      IRAM_valid = 1'b1;
    end
    FINISH:begin
      done       = 1'b1;
      IROM_rd    = 1'b0;
      IRAM_D     = 6'd0;
      IRAM_valid = 1'b0;
    end
    default:begin
      done       = 1'b0;
      IROM_rd    = 1'b0;
      IRAM_D     = 6'd0;
      IRAM_valid = 1'b0;
    end
  endcase
end

endmodule




