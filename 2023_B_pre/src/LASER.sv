module LASER (
input CLK,
input RST,
input [3:0] X,
input [3:0] Y,
output reg [3:0] C1X,
output reg [3:0] C1Y,
output reg [3:0] C2X,
output reg [3:0] C2Y,
output reg DONE);


//---------------------------------------------------------------------
//        STATE                            
//---------------------------------------------------------------------
typedef enum logic [3:0]{
  GETDATA,
  FIND1,
  WAIT1,
  FIND2,
  WAIT2,
  FIXED1_FIND2,
  WAIT3,
  FIXED2_FIND1,
  WAIT4,
  JUDGE,
  FINISH
}state;

state fstate;

//---------------------------------------------------------------------
//        LOGIC & VARIABLES DECLARATION                            
//---------------------------------------------------------------------

logic [3:0] arrX [39:0];
logic [3:0] arrY [39:0];

logic [5:0] counter;

logic [3:0] coorX1;
logic [3:0] coorY1;

logic [3:0] coorX2;
logic [3:0] coorY2;

logic [3:0] coorX1_last;
logic [3:0] coorY1_last;

logic [3:0] coorX2_last;
logic [3:0] coorY2_last;

logic [3:0] coorX;
logic [3:0] coorY;

logic [3:0] coorXTmp;
logic [3:0] coorYTmp;

logic [5:0] acc_dot;
logic [5:0] max_dot;

logic [3:0] diffX1_i;
logic [3:0] diffY1_i;

logic [3:0] diffX1;
logic [3:0] diffY1;

logic [7:0] diffX1_square;
logic [7:0] diffY1_square;

logic [3:0] diffX2_i;
logic [3:0] diffY2_i;

logic [3:0] diffX2;
logic [3:0] diffY2;                  

logic [7:0] diffX2_square;
logic [7:0] diffY2_square;

logic [8:0] dist_square1;
logic [8:0] dist_square2;
//---------------------------------------------------------------------
//        WIRE CONNECTION                             
//---------------------------------------------------------------------

assign diffX1 = (arrX[counter] > diffX1_i)?(arrX[counter] - diffX1_i):(diffX1_i - arrX[counter]);
assign diffY1 = (arrY[counter] > diffY1_i)?(arrY[counter] - diffY1_i):(diffY1_i - arrY[counter]);
assign dist_square1 = diffX1_square + diffY1_square;

assign diffX2 = (arrX[counter] > diffX2_i)?(arrX[counter] - diffX2_i):(diffX2_i - arrX[counter]);
assign diffY2 = (arrY[counter] > diffY2_i)?(arrY[counter] - diffY2_i):(diffY2_i - arrY[counter]);
assign dist_square2 = diffX2_square + diffY2_square;

//---------------------------------------------------------------------
//        MODULE INSTANTAITE                             
//---------------------------------------------------------------------




//---------------------------------------------------------------------
//        ALWAYS BLOCK                             
//---------------------------------------------------------------------

// << diffX1_square >>
always_comb begin
  case(diffX1)
    4'd0 :diffX1_square = 9'd0  ;
    4'd1 :diffX1_square = 9'd1  ;
    4'd2 :diffX1_square = 9'd4  ;
    4'd3 :diffX1_square = 9'd9  ;
    4'd4 :diffX1_square = 9'd16 ;
    4'd5 :diffX1_square = 9'd25 ;
    4'd6 :diffX1_square = 9'd36 ;
    4'd7 :diffX1_square = 9'd49 ;
    4'd8 :diffX1_square = 9'd64 ;
    4'd9 :diffX1_square = 9'd81 ;
    4'd10:diffX1_square = 9'd100;
    4'd11:diffX1_square = 9'd121;
    4'd12:diffX1_square = 9'd144;
    4'd13:diffX1_square = 9'd169;
    4'd14:diffX1_square = 9'd196;
    4'd15:diffX1_square = 9'd225;
  endcase
end

// << diffX1_square >>
always_comb begin
  case(diffY1)
    4'd0 :diffY1_square = 9'd0  ;
    4'd1 :diffY1_square = 9'd1  ;
    4'd2 :diffY1_square = 9'd4  ;
    4'd3 :diffY1_square = 9'd9  ;
    4'd4 :diffY1_square = 9'd16 ;
    4'd5 :diffY1_square = 9'd25 ;
    4'd6 :diffY1_square = 9'd36 ;
    4'd7 :diffY1_square = 9'd49 ;
    4'd8 :diffY1_square = 9'd64 ;
    4'd9 :diffY1_square = 9'd81 ;
    4'd10:diffY1_square = 9'd100;
    4'd11:diffY1_square = 9'd121;
    4'd12:diffY1_square = 9'd144;
    4'd13:diffY1_square = 9'd169;
    4'd14:diffY1_square = 9'd196;
    4'd15:diffY1_square = 9'd225;
  endcase
end

// << diffX2_square >>
always_comb begin
  case(diffX2)
    4'd0 :diffX2_square = 9'd0  ;
    4'd1 :diffX2_square = 9'd1  ;
    4'd2 :diffX2_square = 9'd4  ;
    4'd3 :diffX2_square = 9'd9  ;
    4'd4 :diffX2_square = 9'd16 ;
    4'd5 :diffX2_square = 9'd25 ;
    4'd6 :diffX2_square = 9'd36 ;
    4'd7 :diffX2_square = 9'd49 ;
    4'd8 :diffX2_square = 9'd64 ;
    4'd9 :diffX2_square = 9'd81 ;
    4'd10:diffX2_square = 9'd100;
    4'd11:diffX2_square = 9'd121;
    4'd12:diffX2_square = 9'd144;
    4'd13:diffX2_square = 9'd169;
    4'd14:diffX2_square = 9'd196;
    4'd15:diffX2_square = 9'd225;
  endcase
end

// << diffX1_square >>
always_comb begin
  case(diffY2)
    4'd0 :diffY2_square = 9'd0  ;
    4'd1 :diffY2_square = 9'd1  ;
    4'd2 :diffY2_square = 9'd4  ;
    4'd3 :diffY2_square = 9'd9  ;
    4'd4 :diffY2_square = 9'd16 ;
    4'd5 :diffY2_square = 9'd25 ;
    4'd6 :diffY2_square = 9'd36 ;
    4'd7 :diffY2_square = 9'd49 ;
    4'd8 :diffY2_square = 9'd64 ;
    4'd9 :diffY2_square = 9'd81 ;
    4'd10:diffY2_square = 9'd100;
    4'd11:diffY2_square = 9'd121;
    4'd12:diffY2_square = 9'd144;
    4'd13:diffY2_square = 9'd169;
    4'd14:diffY2_square = 9'd196;
    4'd15:diffY2_square = 9'd225;
  endcase
end

// << diffX1_i >>
always_comb begin
  diffX1_i = 4'd0;
  case(fstate)
    GETDATA:     diffX1_i = 4'd0;
    FIND1:       diffX1_i = coorX;
    FIND2:       diffX1_i = coorX1;
    FIXED1_FIND2:diffX1_i = coorX1;
    FIXED2_FIND1:diffX1_i = coorXTmp + coorX;
    default:     diffX1_i = 4'd0;
  endcase
end

// << diffY1_i >>
always_comb begin
  diffY1_i = 4'd0;
  case(fstate)
    GETDATA:     diffY1_i = 4'd0;
    FIND1:       diffY1_i = coorY;
    FIND2:       diffY1_i = coorY1;
    FIXED1_FIND2:diffY1_i = coorY1;
    FIXED2_FIND1:diffY1_i = coorYTmp + coorY;
    default:     diffY1_i = 4'd0;
  endcase
end

// << diffX2_i >>
always_comb begin
  diffX2_i = 4'd0;
  case(fstate)
    GETDATA:     diffX2_i = 4'd0;
    FIND1:       diffX2_i = 4'd0;
    FIND2:       diffX2_i = coorX;
    FIXED1_FIND2:diffX2_i = coorXTmp + coorX;
    FIXED2_FIND1:diffX2_i = coorX2;
    default:     diffX2_i = 4'd0;
  endcase
end

// << diffY2_i >>
always_comb begin
  diffY2_i = 4'd0;
  case(fstate)
    GETDATA:     diffY2_i = 4'd0;
    FIND1:       diffY2_i = 4'd0;
    FIND2:       diffY2_i = coorY;
    FIXED1_FIND2:diffY2_i = coorYTmp + coorY;
    FIXED2_FIND1:diffY2_i = coorY2;
    default:     diffY2_i = 4'd0;
  endcase
end

// << arrX >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)for(integer i=0;i<40;i=i+1)arrX[i] <= 4'd0;
  else begin
    case(fstate)
      GETDATA:arrX[counter] <= X;
    endcase
  end
end

// << arrY >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)for(integer i=0;i<40;i=i+1)arrY[i] <= 4'd0;
  else begin
    case(fstate)
      GETDATA:arrY[counter] <= Y;
    endcase
  end
end

// << counter >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)counter <= 6'd0;
  else begin
    case(fstate)
      GETDATA, FIND1, FIND2, FIXED1_FIND2, FIXED2_FIND1:begin
        if(counter < 6'd39)counter <= counter + 6'd1;
        else               counter <= 6'd0;
      end
    endcase
  end
end

// << acc_dot >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)acc_dot <= 6'd0;
  else begin
    case(fstate)
      GETDATA:acc_dot <= 6'd0;
      FIND1:begin
        if(dist_square1 <= 9'd16)acc_dot <= acc_dot + 6'd1;
      end
      FIND2:begin
        if(dist_square2 <= 8'd16 && dist_square1 > 9'd16)acc_dot <= acc_dot + 6'd1;
      end
      FIXED1_FIND2:begin
        if(dist_square2 <= 8'd16 && dist_square1 > 9'd16)acc_dot <= acc_dot + 6'd1;
      end
      FIXED2_FIND1:begin
        if(dist_square1 <= 8'd16 && dist_square2 > 9'd16)acc_dot <= acc_dot + 6'd1;
      end
      WAIT1, WAIT2, WAIT3, WAIT4:acc_dot <= 6'd0;
    endcase
  end
end

// << max_dot >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)max_dot <= 6'd0;
  else begin
    case(fstate)
      GETDATA:max_dot <= 6'd0;
      WAIT1, WAIT2:begin
        if((&coorX) && (&coorY))max_dot <= 6'd0;
        else if(acc_dot >= max_dot)begin
          max_dot <= acc_dot;
        end
      end
      WAIT3, WAIT4:begin
        if(coorX == 4'd3 && coorY == 4'd3)max_dot <= 6'd0;
        else if(acc_dot >= max_dot)begin
          max_dot <= acc_dot;
        end
      end
    endcase
  end
end

// << coorXTmp, coorYTmp >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)begin
    coorXTmp <= 6'd0;
    coorYTmp <= 6'd0;
  end
  else begin
    case(fstate)
      GETDATA:begin
        coorXTmp <= 6'd0;
        coorYTmp <= 6'd0;
      end
      WAIT2:begin
        if((&coorX) && (&coorY))begin
          coorXTmp <= coorX2;
          coorYTmp <= coorY2;
        end
      end
      JUDGE:begin
        coorXTmp <= coorX2;
        coorYTmp <= coorY2;
      end
      WAIT3:begin
        if(coorX == 4'd3 && coorY == 4'd3)begin
          coorXTmp <= coorX1;
          coorYTmp <= coorY1;
        end
      end
    endcase
  end
end


// << coorX1, coorY1 >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)begin
    coorX1 <= 6'd0;
    coorY1 <= 6'd0;
  end
  else begin
    case(fstate)
      GETDATA:begin
        coorX1 <= 6'd0;
        coorY1 <= 6'd0;
      end
      WAIT1:begin
        if(acc_dot >= max_dot)begin
          coorX1 <= coorX;
          coorY1 <= coorY;
        end
      end
      FIXED2_FIND1, WAIT4:begin
        if(acc_dot >= max_dot)begin
          coorX1 <= coorXTmp + coorX;
          coorY1 <= coorYTmp + coorY;
        end
      end
    endcase
  end
end

// << coorX2, coorY2 >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)begin
    coorX2 <= 6'd0;
    coorY2 <= 6'd0;
  end
  else begin
    case(fstate)
      GETDATA:begin
        coorX2 <= 6'd0;
        coorY2 <= 6'd0;
      end
      WAIT2:begin
        if(acc_dot >= max_dot)begin
          coorX2 <= coorX;
          coorY2 <= coorY;
        end
      end
      FIXED1_FIND2, WAIT3:begin
        if(acc_dot >= max_dot)begin
          coorX2 <= coorXTmp + coorX;
          coorY2 <= coorYTmp + coorY;
        end
      end
    endcase
  end
end

// << coorX >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)coorX <= 4'd0;
  else begin
    case(fstate)
      GETDATA:coorX <= 4'd0;
      WAIT1:begin
        coorX <= coorX + 4'd1;
      end
      WAIT2:begin
        if((&coorX) && (&coorY))coorX <= 4'd13;
        else                    coorX <= coorX + 4'd1;
      end
      WAIT3, WAIT4:begin
        if(coorX == 4'd3 && coorY == 4'd3)coorX <= 4'd13;
        else if(coorX == 4'd3)            coorX <= 4'd13;
        else                              coorX <= coorX + 4'd1;
      end
    endcase
  end
end

// << coorY >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)coorY <= 4'd0;
  else begin
    case(fstate)
      GETDATA:coorY <= 4'd0;
      WAIT1:begin
        if(&coorX)begin
          coorY <= coorY + 4'd1;
        end
      end
      WAIT2:begin
        if((&coorX) && (&coorY))coorY <= 4'd13;
        else if(&coorX)coorY <= coorY + 4'd1;
      end
      WAIT3, WAIT4:begin
        if(coorX == 4'd3 && coorY == 4'd3)coorY <= 4'd13;
        else if(coorX == 4'd3)coorY <= coorY + 4'd1;
      end
    endcase
  end
end

// <<  >>
always_ff@(posedge CLK or posedge RST)begin
  if(RST)begin
    coorX1_last <= 4'd0;
    coorY1_last <= 4'd0;
    coorX2_last <= 4'd0;
    coorY2_last <= 4'd0;
  end
  else begin
    case(fstate)
      JUDGE:begin
        coorX1_last <= coorX1;
        coorY1_last <= coorY1;
        coorX2_last <= coorX2;
        coorY2_last <= coorY2;
      end
    endcase
  end
end

//---------------------------------------------------------------------
//        FSM-State
//---------------------------------------------------------------------
always_ff@(posedge CLK or posedge RST)begin
  if(RST)fstate <= GETDATA;
  else begin
    unique case(fstate)
      GETDATA:begin
        if(counter == 6'd39)fstate <= FIND1;
        else                fstate <= GETDATA;
      end
      FIND1:begin
        if(counter == 6'd39)fstate <= WAIT1;
        else                fstate <= FIND1;
      end
      WAIT1:begin
        if((&coorX) && (&coorY))fstate <= FIND2;
        else                    fstate <= FIND1;
      end
      FIND2:begin
        if(counter == 6'd39)fstate <= WAIT2;
        else                fstate <= FIND2;
      end
      WAIT2:begin
        if((&coorX) && (&coorY))fstate <= FIXED1_FIND2;
        else                    fstate <= FIND2;
      end
      FIXED1_FIND2:begin
        if(counter == 6'd39)fstate <= WAIT3;
        else                fstate <= FIXED1_FIND2;
      end
      WAIT3:begin
        if(coorX == 4'd3 && coorY == 4'd3)fstate <= FIXED2_FIND1;
        else                              fstate <= FIXED1_FIND2;
      end
      FIXED2_FIND1:begin
        if(counter == 6'd39)fstate <= WAIT4;
        else                fstate <= FIXED2_FIND1;
      end
      WAIT4:begin
        if(coorX == 4'd3 && coorY == 4'd3)fstate <= JUDGE;
        else                              fstate <= FIXED2_FIND1;
      end
      JUDGE:begin
        if( 
          coorX1_last == coorX1 &&
          coorY1_last == coorY1 &&
          coorX2_last == coorX2 &&
          coorY2_last == coorY2
        )
        fstate <= FINISH;
        else fstate <= FIXED1_FIND2;
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
  unique case(fstate)
    FINISH:begin
      C1X  = coorX1; 
      C1Y  = coorY1; 
      C2X  = coorX2; 
      C2Y  = coorY2; 
      DONE = 1'b1;
    end
    default:begin
      C1X  = 4'd0; 
      C1Y  = 4'd0; 
      C2X  = 4'd0; 
      C2Y  = 4'd0; 
      DONE = 1'b0;
    end
  endcase
end


endmodule
