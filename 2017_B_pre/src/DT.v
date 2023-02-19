module DT(
 input                   clk, 
 input                 reset,
 output reg             done, 
 output reg           sti_rd, 
 output reg  [9:0]  sti_addr, 
 input       [15:0]   sti_di, 
 output reg           res_wr, 
 output reg           res_rd, 
 output reg  [13:0] res_addr, 
 output reg  [7:0]    res_do, 
 input       [7:0]    res_di
 );
//---------------------------------------------------------------------
//   LOCAL PARAMETER                       
//--------------------------------------------------------------------- 
localparam IDLE     = 4'd0;
localparam READROM  = 4'd1;
localparam WAIT1    = 4'd2;
localparam FORWARD  = 4'd3;
localparam WAIT2    = 4'd4;
localparam INITADDR = 4'd5;
localparam BACKWARD = 4'd6;
localparam WAIT3    = 4'd7;
localparam FINISH   = 4'd8;
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg  [3:0]  fstate;
reg  [3:0] counter;
reg  [7:0] minimum;
//---------------------------------------------------------------------
//   ALWAYS BLOCK                
//---------------------------------------------------------------------
// ---------- ROM ----------
// << sti_addr >>
always@(posedge clk or negedge reset)begin
  if(!reset)sti_addr <= 10'd0;
  else if(fstate == READROM)sti_addr <= sti_addr + 10'd1;
end
// ---------- RAM ----------
// << counter >>
always@(posedge clk or negedge reset)begin
  if(!reset)counter <= 4'd15;
  else begin
    case(fstate)
      WAIT1:counter <= counter - 4'd1;
      FORWARD:counter <= 4'd0;
      BACKWARD:counter <= 4'd0;
      WAIT2, WAIT3:counter <= counter + 4'd1;
    endcase
  end
end

// << res_do >>
always@(*)begin
  res_do = 8'd0;
  case(fstate)
    WAIT1:res_do = {7'd0, sti_di[counter]};
    WAIT2, WAIT3:begin
      if(counter == 4'd4)res_do = minimum;
      else               res_do = 8'd0;
    end
    default:res_do = 8'd0;
  endcase
end

// << res_addr >>
always@(posedge clk or negedge reset)begin
  if(!reset)res_addr <= 14'd0;
  else begin
    case(fstate)
      WAIT1:begin
        if(res_addr == 14'd16383)res_addr <= 14'd0;
        else                     res_addr <= res_addr + 14'd1;
      end
      FORWARD:begin
        if(res_di == 4'd0)res_addr <= res_addr + 14'd1;
        else              res_addr <= res_addr - 14'd129;
      end
      WAIT2:begin
        case(counter)
          4'd0:res_addr <= res_addr + 14'd1;
          4'd1:res_addr <= res_addr + 14'd1;
          4'd2:res_addr <= res_addr + 14'd126;
          4'd3:res_addr <= res_addr + 14'd1;
          4'd4:res_addr <= res_addr + 14'd1;
        endcase
      end
      INITADDR:res_addr <= 14'd16383;
      BACKWARD:begin
        if(res_di == 4'd0)res_addr <= res_addr - 14'd1;
        else              res_addr <= res_addr + 14'd129;
      end
      WAIT3:begin
        case(counter)
          4'd0:res_addr <= res_addr - 14'd1;
          4'd1:res_addr <= res_addr - 14'd1;
          4'd2:res_addr <= res_addr - 14'd126;
          4'd3:res_addr <= res_addr - 14'd1;
          4'd4:res_addr <= res_addr - 14'd1;
        endcase
      end
    endcase
  end
end

// << minimum >>
always@(posedge clk or negedge reset)begin
  if(!reset)minimum <= 8'd0;
  else begin
    case(fstate)
      WAIT2:begin// find minimum
        case(counter)
          4'd0:minimum <= res_di + 8'd1;
          4'd1:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
          4'd2:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
          4'd3:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
        endcase
      end
      BACKWARD:if(res_di > 8'd0)minimum <= res_di;
      WAIT3:begin// find minimum
        case(counter)
          4'd0:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
          4'd1:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
          4'd2:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
          4'd3:if(res_di + 8'd1 < minimum)minimum <= res_di + 8'd1;
        endcase
      end
    endcase
  end
end
//---------------------------------------------------------------------
//   FSM-STATE           
//---------------------------------------------------------------------
always@(posedge clk or negedge reset)begin
  if(!reset)fstate <= IDLE;
  else begin
    case(fstate)
      IDLE:begin
        fstate <= READROM;
      end
      READROM:begin
        fstate <= WAIT1;
      end
      WAIT1:begin
        if(res_addr == 14'd16383)fstate <= FORWARD;
        else if(counter == 4'd0) fstate <= READROM;
        else                     fstate <= WAIT1;
      end
      FORWARD:begin
        if(res_addr == 14'd16383)fstate <= INITADDR;
        else if(res_di > 8'd0)   fstate <= WAIT2;
        else                     fstate <= FORWARD;
      end
      WAIT2:begin
        if(counter == 4'd4)fstate <= FORWARD;
        else               fstate <= WAIT2;
      end
      INITADDR:begin
        fstate <= BACKWARD;
      end
      BACKWARD:begin
        if(res_addr == 14'd0) fstate <= FINISH;
        else if(res_di > 8'd0)fstate <= WAIT3;
        else                  fstate <= BACKWARD;
      end
      WAIT3:begin
        if(counter == 4'd4)fstate <= BACKWARD;
        else               fstate <= WAIT3;
      end
      FINISH:begin
        fstate <= FINISH;
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
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b0;//RAM_rd
      done     = 1'b0;
    end
    READROM:begin
      sti_rd   = 1'b1;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b0;//RAM_rd
      done     = 1'b0;
    end
    WAIT1:begin
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b1;//RAM_wr
      res_rd   = 1'b0;//RAM_rd
      done     = 1'b0;
    end
    FORWARD:begin
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b1;//RAM_rd
      done     = 1'b0;  
    end
    WAIT2:begin
      sti_rd   = 1'b0;//ROM_rd
      if(counter == 4'd4)res_wr   = 1'b1;//RAM_wr
      else               res_wr   = 1'b0;//RAM_wr
      if(counter == 4'd4)res_rd   = 1'b0;//RAM_rd
      else               res_rd   = 1'b1;//RAM_rd
      done     = 1'b0;  
    end
    INITADDR:begin
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b0;//RAM_rd
      done     = 1'b0;
    end
    BACKWARD:begin
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b1;//RAM_rd
      done     = 1'b0;  
    end
    WAIT3:begin
      sti_rd   = 1'b0;//ROM_rd
      if(counter == 4'd4)res_wr   = 1'b1;//RAM_wr
      else               res_wr   = 1'b0;//RAM_wr
      if(counter == 4'd4)res_rd   = 1'b0;//RAM_rd
      else               res_rd   = 1'b1;//RAM_rd
      done     = 1'b0;  
    end
    FINISH:begin
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b0;//RAM_rd
      done     = 1'b1;  
    end
    default:begin
      sti_rd   = 1'b0;//ROM_rd
      res_wr   = 1'b0;//RAM_wr
      res_rd   = 1'b0;//RAM_rd
      done     = 1'b0;
    end
  endcase
end

endmodule

