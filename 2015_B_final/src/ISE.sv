module ISE( clk, reset, image_in_index, pixel_in, busy, out_valid, color_index, image_out_index);
input           clk;
input           reset;
input   [4:0]   image_in_index;
input   [23:0]  pixel_in;
output  logic       busy;
output  logic       out_valid;
output  logic [1:0] color_index;
output  logic [4:0] image_out_index;

//---------------------------------------------------------------------
//        STATE                            
//---------------------------------------------------------------------
typedef enum logic [3:0]{
  READ,
  WAIT,
  SORT,
  VALID_R,
  VALID_G,
  VALID_B,
  FINISH
}state;

state fstate;

//---------------------------------------------------------------------
//        LOGIC & VARIABLES DECLARATION                            
//---------------------------------------------------------------------
logic [14:0] sortArr_R [31:0];//{5b index, 10b data}
logic [14:0] sortArr_G [31:0];//{5b index, 10b data}
logic [14:0] sortArr_B [31:0];//{5b index, 10b data}

logic [9:0] divOut;

logic [4:0] ptr_R;
logic [4:0] ptr_G;
logic [4:0] ptr_B;

logic [21:0] acc_R;
logic [21:0] acc_G;
logic [21:0] acc_B;
logic [23:0] selectAcc;

logic [14:0] num_R;
logic [14:0] num_G;
logic [14:0] num_B;
logic [14:0] selectNum;

logic [7:0] pixel_R;
logic [7:0] pixel_G;
logic [7:0] pixel_B;

logic [13:0] pixelIdx;
logic [4:0] times;

logic [4:0] idx1;
logic [4:0] idx2;

logic [1:0] currentClass;
logic [1:0] currentPicClass;
//---------------------------------------------------------------------
//        WIRE CONNECTION                             
//---------------------------------------------------------------------

assign pixel_R = pixel_in[23:16];
assign pixel_G = pixel_in[15:8];
assign pixel_B = pixel_in[7:0];

assign divOut = selectAcc / selectNum;
//---------------------------------------------------------------------
//        MODULE INSTANTAITE                             
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//        ALWAYS BLOCK                             
//---------------------------------------------------------------------

// << currentClass >>
always_comb begin
  if(pixel_R >= pixel_G && pixel_R >= pixel_B)currentClass = 2'd0;
  else if(pixel_G >= pixel_B && pixel_G >  pixel_R)currentClass = 2'd1;
  else if(pixel_B >  pixel_R && pixel_B >  pixel_G)currentClass = 2'd2;
  else currentClass = 2'd3;
end

// << currentPicClass >>
always_comb begin
  if(fstate == WAIT)begin
    if(num_R >= num_G && num_R >= num_B)currentPicClass = 2'd0;
    else if(num_G >= num_B && num_G >  num_R)currentPicClass = 2'd1;
    else if(num_B >  num_R && num_B >  num_G)currentPicClass = 2'd2;
    else currentPicClass = 2'd3;
  end
  else currentPicClass = 2'd3; 
end

// << selectAcc >>
always_comb begin
  if(fstate == WAIT)begin
    if(currentPicClass == 2'd0)     selectAcc = acc_R << 2;
    else if(currentPicClass == 2'd1)selectAcc = acc_G << 2;
    else if(currentPicClass == 2'd2)selectAcc = acc_B << 2;
    else selectAcc = 24'd0;
  end
  else selectAcc = 24'd0; 
end

// << selectNum >>
always_comb begin
  if(fstate == WAIT)begin
    if(currentPicClass == 2'd0)     selectNum = num_R;
    else if(currentPicClass == 2'd1)selectNum = num_G;
    else if(currentPicClass == 2'd2)selectNum = num_B;
    else selectNum = 14'd0;
  end
  else selectNum = 15'd0; 
end


// << pixelIdx >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)pixelIdx <= 14'd0;
  else if(fstate == SORT)pixelIdx <= 14'd0;
  else if(fstate == READ)begin
    pixelIdx <= pixelIdx + 14'd1;
  end
end

// << times >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)times <= 5'd0;
  else begin
    case(fstate)
      SORT, FINISH:times <= 5'd0;
      WAIT:times <= times + 5'd1;
      VALID_R:times <= (times == ptr_R-5'd1 || ptr_R == 5'd0)?(5'd0):(times+5'd1);
      VALID_G:times <= (times == ptr_G-5'd1 || ptr_G == 5'd0)?(5'd0):(times+5'd1);
      VALID_B:times <= (times == ptr_B-5'd1 || ptr_B == 5'd0)?(5'd0):(times+5'd1);
    endcase
  end
end

// ------------------------- acc ------------------------- 
// << acc_R >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)acc_R <= 22'd0;
  else if(fstate == WAIT)acc_R <= 22'd0;
  else if(fstate == READ && currentClass == 2'd0)acc_R <= acc_R + pixel_R;
end
 
// << acc_G >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)acc_G <= 22'd0;
  else if(fstate == WAIT)acc_G <= 22'd0;
  else if(fstate == READ && currentClass == 2'd1)acc_G <= acc_G + pixel_G;
end

// << acc_B >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)acc_B <= 22'd0;
  else if(fstate == WAIT)acc_B <= 22'd0;
  else if(fstate == READ && currentClass == 2'd2)acc_B <= acc_B + pixel_B;
end

// ------------------------- num -------------------------
// << num_R >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)num_R <= 15'd0;
  else if(fstate == WAIT)num_R <= 15'd0;
  else if(fstate == READ && currentClass == 2'd0)num_R <= num_R + 15'd1;
end
 
// << num_G >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)num_G <= 15'd0;
  else if(fstate == WAIT)num_G <= 15'd0;
  else if(fstate == READ && currentClass == 2'd1)num_G <= num_G + 15'd1;
end

// << num_B >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)num_B <= 15'd0;
  else if(fstate == WAIT)num_B <= 15'd0;
  else if(fstate == READ && currentClass == 2'd2)num_B <= num_B + 15'd1;
end

// ------------------------- ptr -------------------------
// << ptr_R >> (reset!!!!)
always_ff@(posedge clk or posedge reset)begin
  if(reset)ptr_R <= 5'd0;
  else if(fstate == FINISH)ptr_R <= 5'd0;
  else if(fstate == WAIT && currentPicClass == 2'd0)ptr_R <= ptr_R + 5'd1;
end

// << ptr_G >> (reset!!!!)
always_ff@(posedge clk or posedge reset)begin
  if(reset)ptr_G <= 5'd0;
  else if(fstate == FINISH)ptr_G <= 5'd0;
  else if(fstate == WAIT && currentPicClass == 2'd1)ptr_G <= ptr_G + 5'd1;
end

// << ptr_B >> (reset!!!!)
always_ff@(posedge clk or posedge reset)begin
  if(reset)ptr_B <= 5'd0;
  else if(fstate == FINISH)ptr_B <= 5'd0;
  else if(fstate == WAIT && currentPicClass == 2'd2)ptr_B <= ptr_B + 5'd1;
end

// ------------------------- sortArr -------------------------
// << sortArr_R >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)for(integer i=0;i<32;i=i+1)sortArr_R[i] <= {5'd0, 10'd1023};
  else if(fstate == FINISH)for(integer i=0;i<32;i=i+1)sortArr_R[i] <= {5'd0, 10'd1023};
  else if(fstate == WAIT && currentPicClass == 2'd0)sortArr_R[ptr_R] <= {times, divOut};
  else if(fstate == SORT)begin
    if(sortArr_R[idx1][9:0] < sortArr_R[idx2][9:0])begin
      sortArr_R[idx1] <= sortArr_R[idx2];
      sortArr_R[idx2] <= sortArr_R[idx1];
    end
  end
end

// << sortArr_G >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)for(integer i=0;i<32;i=i+1)sortArr_G[i] <= {5'd0, 10'd1023};
  else if(fstate == FINISH)for(integer i=0;i<32;i=i+1)sortArr_G[i] <= {5'd0, 10'd1023};
  else if(fstate == WAIT && currentPicClass == 2'd1)sortArr_G[ptr_G] <= {times, divOut};
  else if(fstate == SORT)begin
    if(sortArr_G[idx1][9:0] < sortArr_G[idx2][9:0])begin
      sortArr_G[idx1] <= sortArr_G[idx2];
      sortArr_G[idx2] <= sortArr_G[idx1];
    end
  end
end

// << sortArr_B >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)for(integer i=0;i<32;i=i+1)sortArr_B[i] <= {5'd0, 10'd1023};
  else if(fstate == FINISH)for(integer i=0;i<32;i=i+1)sortArr_B[i] <= {5'd0, 10'd1023};
  else if(fstate == WAIT && currentPicClass == 2'd2)sortArr_B[ptr_B] <= {times, divOut};
  else if(fstate == SORT)begin
    if(sortArr_B[idx1][9:0] < sortArr_B[idx2][9:0])begin
      sortArr_B[idx1] <= sortArr_B[idx2];
      sortArr_B[idx2] <= sortArr_B[idx1];
    end
  end
end

// ------------------------- idx -------------------------
// << idx1 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)idx1 <= 5'd0;
  else if(fstate == READ || fstate == FINISH)idx1 <= 5'd0;
  else if(fstate == SORT)begin
    if(&idx1)idx1 <= idx2 + 5'd1;
    else     idx1 <= idx1 + 5'd1;
  end
end

// << idx2 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)idx2 <= 5'd0;
  else if(fstate == READ || fstate == FINISH)idx2 <= 5'd0;
  else if(fstate == SORT)begin
    if(&idx1)begin
      if(idx2 < 5'd30)idx2 <= idx2 + 5'd1;
      else            idx2 <= 5'd0;
    end
  end
end

//---------------------------------------------------------------------
//        FSM-State
//---------------------------------------------------------------------
always_ff@(posedge clk or posedge reset)begin
  if(reset)fstate <= READ;
  else begin
    unique case(fstate)
      READ:begin
        if(&pixelIdx)fstate <= WAIT;
        else         fstate <= READ;
      end
      WAIT:begin
        if(&times)fstate <= SORT;
        else      fstate <= READ;
      end
      SORT:begin
        if((&idx1) & (idx2 == 5'd30))fstate <= VALID_R;
        else fstate <= SORT;
      end
      VALID_R:begin
        if(times == ptr_R-5'd1 || ptr_R == 5'd0)fstate <= VALID_G;
        else                                    fstate <= VALID_R;
      end
      VALID_G:begin
        if(times == ptr_G-5'd1 || ptr_G == 5'd0)fstate <= VALID_B;
        else                                    fstate <= VALID_G;
      end
      VALID_B:begin
        if(times == ptr_B-5'd1 || ptr_B == 5'd0)fstate <= FINISH;
        else                                    fstate <= VALID_B;
      end
      FINISH:begin
        fstate <= READ;
      end
      default:begin
        fstate <= READ;
      end
    endcase
  end
end



//---------------------------------------------------------------------
//        FSM-output
//---------------------------------------------------------------------
always_comb begin
  busy = 1'b1;
  out_valid = 1'b0;
  image_out_index = 5'd0;
  color_index = 2'd0;
  unique case(fstate)
    READ:begin
      busy = 1'b0;
      out_valid = 1'b0;
      image_out_index = 5'd0;
      color_index = 2'd0;
    end
    WAIT:begin
      busy = 1'b1;
      out_valid = 1'b0;
      image_out_index = 5'd0;
      color_index = 2'd0;
    end
    VALID_R:begin
      busy = 1'b1;
      out_valid = (ptr_R > 5'd0);
      image_out_index = sortArr_R[times][14:10];
      color_index = 2'd0;
    end
    VALID_G:begin
      busy = 1'b1;
      out_valid = (ptr_G > 5'd0);
      image_out_index = sortArr_G[times][14:10];
      color_index = 2'd1;
    end
    VALID_B:begin
      busy = 1'b1;
      out_valid = (ptr_B > 5'd0);
      image_out_index = sortArr_B[times][14:10];
      color_index = 2'd2;
    end
    default:begin
      busy = 1'b1;
      out_valid = 1'b0;
      image_out_index = 5'd0;
      color_index = 2'd0;
    end
  endcase
end





endmodule



















