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

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output logic CNT_valid;
output logic [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output logic code_valid;
output logic [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output logic [7:0] M1, M2, M3, M4, M5, M6;

//---------------------------------------------------------------------
//        STATE                            
//---------------------------------------------------------------------
typedef enum logic [2:0]{
  IDLE,
  SORT,
  CORRECT,
  RUN,
  GEN_CODE,
  WAIT1,
  WAIT2,
  FINISH
}state;

state fstate;

//---------------------------------------------------------------------
//        LOGIC & VARIABLES DECLARATION                            
//---------------------------------------------------------------------

logic [10:0] array [5:0];
logic [6:0] counter;
logic [7:0] currentSum;
logic [10:0] sortOut [5:0];

logic [2:0] ptr  [5:0];
logic [7:0] mask [5:0];
logic [7:0] code [5:0];


//logic [7:0] data [5:0];
//logic [2:0] index [5:0];

logic [2:0] level;

integer i, j, k, l;
//---------------------------------------------------------------------
//        WIRE CONNECTION                             
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//        MODULE INSTANTAITE                             
//---------------------------------------------------------------------
SORT_element6 SORT_element6(
  .index_data1_i(array[0]),   //{3b index, 8b data}
  .index_data2_i(array[1]),   //{3b index, 8b data}
  .index_data3_i(array[2]),   //{3b index, 8b data}
  .index_data4_i(array[3]),   //{3b index, 8b data}
  .index_data5_i(array[4]),   //{3b index, 8b data}
  .index_data6_i(array[5]),   //{3b index, 8b data}
  .index_data1_o(sortOut[0]), //{3b index, 8b data}
  .index_data2_o(sortOut[1]), //{3b index, 8b data}
  .index_data3_o(sortOut[2]), //{3b index, 8b data}
  .index_data4_o(sortOut[3]), //{3b index, 8b data}
  .index_data5_o(sortOut[4]), //{3b index, 8b data}
  .index_data6_o(sortOut[5])  //{3b index, 8b data}
);
//---------------------------------------------------------------------
//        ALWAYS BLOCK                             
//---------------------------------------------------------------------

// << array >>
//integer idx;
always_ff@(posedge clk or posedge reset)begin:ALWAYS_BLOCK1
  if(reset)for(integer idx=0;idx<6;idx=idx+1)array[idx] <= 11'd0;
  else if(fstate == FINISH && counter == 7'd6)for(integer idx=0;idx<6;idx=idx+1)array[idx] <= {idx[2:0], 8'd0};
  else if(fstate == SORT)for(integer idx=0;idx<6;idx=idx+1)array[idx] <= sortOut[idx];
  else if(gray_valid)begin
    for(integer idx=0;idx<6;idx=idx+1)begin
      if(gray_data == (idx[7:0]+8'd1))array[idx] <= {idx[2:0], (array[idx][7:0] + 8'd1)};
    end
  end 
  else if(fstate == CORRECT)begin
    if(array[counter][10:8] < array[counter+1][10:8] && array[counter][7:0] == array[counter+1][7:0])begin
      array[counter] <= array[counter+1];
      array[counter+1] <= array[counter];
    end
  end
end

/*
integer idx2;
always_comb
  for(integer idx2=0;idx2<6;idx2=idx2+1)begin:CONNECT
    assign data [idx2] = array[idx2][7:0];
    assign index[idx2] = array[idx2][10:8];
  end
end
*/


// << counter >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)counter <= 7'd0;
  else begin
    case(fstate)
      IDLE:begin
        if(gray_valid)begin
          if(counter < 7'd99)counter <= counter + 7'd1;
          else               counter <= 7'd0;
        end
      end
      SORT:begin
        counter <= 7'd0;
      end
      CORRECT:begin
        if(counter < 7'd4)counter <=counter + 7'd1;
        else              counter <= 7'd1;
      end
      RUN:begin
        if(currentSum > array[counter][7:0])counter <= counter + 7'd1;
      end
      GEN_CODE:begin
        if(level == 3'd4)counter <= 7'd0;
        else             counter <= level + 1;
      end 
      FINISH:begin
        if(counter < 7'd6)counter <=counter + 7'd1;
        else              counter <= 7'd0;
      end
    endcase
  end
end


// << currentSum >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)currentSum <= 7'd0;
  else if(fstate == FINISH)currentSum <= 7'd0;
  else if(fstate == SORT)begin
    currentSum <= sortOut[0][7:0];// + sortOut[1][7:0];
  end
  else if(fstate == GEN_CODE)begin
    currentSum <= currentSum + array[level+3'd1][7:0];
  end
  else if(fstate == WAIT1)currentSum <= currentSum + array[level+3'd1][7:0] + array[level+3'd2][7:0];
end

// << level >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)level <= 3'd0;
  else if(fstate == IDLE)level <= 3'd0;//revise 1
  else if(fstate == GEN_CODE)level <= level + 3'd1;
  else if(fstate == WAIT1)level <= level + 3'd2;
end


// << ptr >>
always_ff@(posedge clk or posedge reset)begin:ALWAYS_BLOCK2
  if(reset)for(integer idx3=0;idx3<6;idx3=idx3+1)ptr[idx3] <= 3'd0;
  else if(fstate == IDLE)for(integer idx3=0;idx3<6;idx3=idx3+1)ptr[idx3] <= 3'd0;
  else if(fstate == GEN_CODE)begin
    if(level == 3'd0)begin
      ptr[level] <= ptr[level] + 3'd1;
      ptr[level+1] <= ptr[level+1] + 3'd1;
    end
    else begin
      for(integer idx3=0;idx3<6;idx3=idx3+1)begin
        if(idx3[2:0] <= level+1)ptr[idx3] <= ptr[idx3] + 3'd1;
      end
    end
  end
  else if(fstate == WAIT1)begin
    for(integer idx3=0;idx3<6;idx3=idx3+1)begin
      if((idx3[2:0] == level + 1) || (idx3[2:0] == level + 2))ptr[idx3] <= ptr[idx3] + 3'd1;
    end 
  end
  else if(fstate == WAIT2)begin
    for(integer idx3=0;idx3<6;idx3=idx3+1)begin
      if(idx3[2:0] <= level)ptr[idx3] <= ptr[idx3] + 3'd1;
    end 
  end
end


// << mask >>
always_ff@(posedge clk or posedge reset)begin:ALWAYS_BLOCK3
  if(reset)for(integer idx4=0;idx4<6;idx4=idx4+1)mask[idx4] <= 8'd0;
  else begin
    case(fstate)
      IDLE:for(integer idx4=0;idx4<6;idx4=idx4+1)mask[idx4] <= 8'd0;
      GEN_CODE, WAIT1, WAIT2:for(integer idx4=0;idx4<6;idx4=idx4+1)mask[idx4][ptr[idx4]] <= 1'b1;
    endcase
  end
end



// << code >>
always_ff@(posedge clk or posedge reset)begin:ALWAYS_BLOCK4
  if(reset)for(integer idx5=0;idx5<6;idx5=idx5+1)code[idx5] <= 8'd0;
  else if(fstate == IDLE)for(integer idx5=0;idx5<6;idx5=idx5+1)code[idx5] <= 8'd0;
  else if(fstate == GEN_CODE)begin
    for(integer idx5=0;idx5<6;idx5=idx5+1)begin
      if(idx5[2:0] <= level)begin
        if(currentSum > array[level+1][7:0])code[idx5][ptr[idx5]] <= 1'b0;
        else                                code[idx5][ptr[idx5]] <= 1'b1;
      end
      else if(idx5[2:0] == (level+3'd1))begin
        if(currentSum > array[level+1][7:0])code[idx5][ptr[idx5]] <= 1'b1;
        else                                code[idx5][ptr[idx5]] <= 1'b0;
      end
    end
  end
  else if(fstate == WAIT1)begin
    for(integer idx5=0;idx5<6;idx5=idx5+1)begin
      if(idx5[2:0] == level + 1)begin
        if(array[level+1][7:0] > array[level+2][7:0])code[idx5][ptr[idx5]] <= 1'b0;
        else                                         code[idx5][ptr[idx5]] <= 1'b1;
      end
      else if(idx5[2:0] == level + 2)begin
        if(array[level+1][7:0] > array[level+2][7:0])code[idx5][ptr[idx5]] <= 1'b1;
        else                                         code[idx5][ptr[idx5]] <= 1'b0;
      end
    end
  end
  else if(fstate == WAIT2)begin
    for(integer idx5=0;idx5<6;idx5=idx5+1)begin
      if((idx5[2:0] == level) || (idx5[2:0] == level-1))begin
        if((array[level][7:0] + array[level-1][7:0]) > (array[level-2][7:0] + array[level-3][7:0]))code[idx5][ptr[idx5]] <= 1'b0;
        else                                                                                       code[idx5][ptr[idx5]] <= 1'b1;
      end
      else if((idx5[2:0] == level-2) || (idx5[2:0] == level-3))begin
        if((array[level][7:0] + array[level-1][7:0]) > (array[level-2][7:0] + array[level-3][7:0]))code[idx5][ptr[idx5]] <= 1'b1;
        else                                                                                       code[idx5][ptr[idx5]] <= 1'b0;
      end
    end
  end
end

//---------------------------------------------------------------------
//        FSM-State
//---------------------------------------------------------------------

always_ff@(posedge clk or posedge reset)begin
  if(reset)fstate <= IDLE;
  else begin
    unique case(fstate)
      IDLE:begin
        if(gray_valid && counter == 7'd99)fstate <= SORT;
        else                              fstate <= IDLE;
      end
      SORT:begin
        fstate <= CORRECT;
      end
      CORRECT:begin
        if(counter == 3'd4)fstate <= RUN;
        else               fstate <= CORRECT;
      end
      RUN:begin
        if(currentSum <= array[level+2][7:0] || level >= 3'd4)fstate <= GEN_CODE;
        else                                                  fstate <= WAIT1;
      end
      GEN_CODE:begin
        if(level == 3'd4)fstate <= FINISH; 
        else             fstate <= RUN;
      end
      WAIT1:begin
        fstate <= WAIT2;
      end
      WAIT2:begin
        fstate <= RUN;
      end
      FINISH:begin
        if(counter == 7'd6)fstate <= IDLE;
        else               fstate <= FINISH;
      end
      default:begin
        fstate <= IDLE;
      end
    endcase
  end
end



//---------------------------------------------------------------------
//        FSM-output
//---------------------------------------------------------------------
always_comb begin
  CNT1 = 8'd0;
  CNT2 = 8'd0;
  CNT3 = 8'd0;
  CNT4 = 8'd0;
  CNT5 = 8'd0;
  CNT6 = 8'd0;
  CNT_valid = 1'b0;
  unique case(fstate)
    SORT:begin
      CNT1 = array[0][7:0];
      CNT2 = array[1][7:0];
      CNT3 = array[2][7:0];
      CNT4 = array[3][7:0];
      CNT5 = array[4][7:0];
      CNT6 = array[5][7:0];
      CNT_valid = 1'b1;
    end
    default:begin
      CNT1 = 8'd0;
      CNT2 = 8'd0;
      CNT3 = 8'd0;
      CNT4 = 8'd0;
      CNT5 = 8'd0;
      CNT6 = 8'd0;
      CNT_valid = 1'b0;
    end
  endcase
end

// << code_valid >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)code_valid <= 1'b0;
  else if(fstate == IDLE)code_valid <= 1'b0;
  else if(code_valid)code_valid <= 1'b0;
  else if(fstate == FINISH && counter == 7'd6)code_valid <= 1'b1;
end

// << HC1 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)HC1 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd0)HC1 <= code[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)HC2 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd1)HC2 <= code[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)HC3 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd2)HC3 <= code[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)HC4 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd3)HC4 <= code[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)HC5 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd4)HC5 <= code[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)HC6 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd5)HC6 <= code[counter[2:0]];
end

// << M1 >>
always_ff@(posedge clk or posedge reset)begin
  if(reset)M1 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd0)M1 <= mask[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)M2 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd1)M2 <= mask[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)M3 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd2)M3 <= mask[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)M4 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd3)M4 <= mask[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)M5 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd4)M5 <= mask[counter[2:0]];
end

always_ff@(posedge clk or posedge reset)begin
  if(reset)M6 <= 8'd0;
  else if(fstate == FINISH)if(array[counter[2:0]][10:8] == 3'd5)M6 <= mask[counter[2:0]];
end

endmodule



module SORT_element6(
  input [10:0] index_data1_i, //{3b index, 8b data}
  input [10:0] index_data2_i, //{3b index, 8b data}
  input [10:0] index_data3_i, //{3b index, 8b data}
  input [10:0] index_data4_i, //{3b index, 8b data}
  input [10:0] index_data5_i, //{3b index, 8b data}
  input [10:0] index_data6_i, //{3b index, 8b data}
  
  output logic  [10:0] index_data1_o, //{3b index, 8b data}
  output logic  [10:0] index_data2_o, //{3b index, 8b data}
  output logic  [10:0] index_data3_o, //{3b index, 8b data}
  output logic  [10:0] index_data4_o, //{3b index, 8b data}
  output logic  [10:0] index_data5_o, //{3b index, 8b data}
  output logic  [10:0] index_data6_o  //{3b index, 8b data}
  
);

logic [10:0] stage1_1;
logic [10:0] stage1_2;
logic [10:0] stage1_3;
logic [10:0] stage1_4;
logic [10:0] stage1_5;
logic [10:0] stage1_6;

SORT_element3 STAGE1_1(
  .index_data1_i(index_data1_i), //{3b index, 8b data}
  .index_data2_i(index_data2_i), //{3b index, 8b data}
  .index_data3_i(index_data3_i), //{3b index, 8b data}
  .index_data1_o(stage1_1), //{3b index, 8b data}
  .index_data2_o(stage1_2), //{3b index, 8b data}
  .index_data3_o(stage1_3) //{3b index, 8b data}
);

SORT_element3 STAGE1_2(
  .index_data1_i(index_data4_i), //{3b index, 8b data}
  .index_data2_i(index_data5_i), //{3b index, 8b data}
  .index_data3_i(index_data6_i), //{3b index, 8b data}
  .index_data1_o(stage1_4), //{3b index, 8b data}
  .index_data2_o(stage1_5), //{3b index, 8b data}
  .index_data3_o(stage1_6) //{3b index, 8b data}
);



logic [10:0] stage2_1;
logic [10:0] stage2_2;
logic [10:0] stage2_3;
logic [10:0] stage2_4;
logic [10:0] stage2_5;
logic [10:0] stage2_6;

SORT_element2 STAGE2_1(
  .index_data1_i(stage1_1), //{3b index, 8b data}
  .index_data2_i(stage1_4), //{3b index, 8b data}
  .index_data1_o(stage2_1), //{3b index, 8b data}
  .index_data2_o(stage2_2) //{3b index, 8b data}
);

SORT_element2 STAGE2_2(
  .index_data1_i(stage1_2), //{3b index, 8b data}
  .index_data2_i(stage1_5), //{3b index, 8b data}
  .index_data1_o(stage2_3), //{3b index, 8b data}
  .index_data2_o(stage2_4) //{3b index, 8b data}
);

SORT_element2 STAGE2_3(
  .index_data1_i(stage1_3), //{3b index, 8b data}
  .index_data2_i(stage1_6), //{3b index, 8b data}
  .index_data1_o(stage2_5), //{3b index, 8b data}
  .index_data2_o(stage2_6) //{3b index, 8b data}
);



logic [10:0] stage3_1;
logic [10:0] stage3_2;
logic [10:0] stage3_3;
logic [10:0] stage3_4;

SORT_element2 STAGE3_1(
  .index_data1_i(stage2_2), //{3b index, 8b data}
  .index_data2_i(stage2_3), //{3b index, 8b data}
  .index_data1_o(stage3_1), //{3b index, 8b data}
  .index_data2_o(stage3_2) //{3b index, 8b data}
);

SORT_element2 STAGE3_2(
  .index_data1_i(stage2_4), //{3b index, 8b data}
  .index_data2_i(stage2_5), //{3b index, 8b data}
  .index_data1_o(stage3_3), //{3b index, 8b data}
  .index_data2_o(stage3_4) //{3b index, 8b data}
);

logic [10:0] stage4_1;
logic [10:0] stage4_2;

SORT_element2 STAGE4_1(
  .index_data1_i(stage3_2), //{3b index, 8b data}
  .index_data2_i(stage3_3), //{3b index, 8b data}
  .index_data1_o(stage4_1), //{3b index, 8b data}
  .index_data2_o(stage4_2) //{3b index, 8b data}
);

assign index_data1_o = stage2_1;
assign index_data2_o = stage3_1;
assign index_data3_o = stage4_1;
assign index_data4_o = stage4_2;
assign index_data5_o = stage3_4;
assign index_data6_o = stage2_6;

endmodule



module SORT_element2(
  input [10:0] index_data1_i, //{3b index, 8b data}
  input [10:0] index_data2_i, //{3b index, 8b data}
  
  output logic  [10:0] index_data1_o, //{3b index, 8b data}
  output logic  [10:0] index_data2_o //{3b index, 8b data}
);

assign index_data1_o = (index_data1_i[7:0] < index_data2_i[7:0])?(index_data1_i):(index_data2_i);
assign index_data2_o = (index_data1_i[7:0] < index_data2_i[7:0])?(index_data2_i):(index_data1_i);

endmodule


module SORT_element3(
  input [10:0] index_data1_i, //{3b index, 8b data}
  input [10:0] index_data2_i, //{3b index, 8b data}
  input [10:0] index_data3_i, //{3b index, 8b data}
  
  output logic  [10:0] index_data1_o, //{3b index, 8b data}
  output logic  [10:0] index_data2_o, //{3b index, 8b data}
  output logic  [10:0] index_data3_o //{3b index, 8b data}
  
);

logic [10:0] stage1_1;
logic [10:0] stage1_2;

SORT_element2 STAGE1(
  .index_data1_i(index_data1_i), //{3b index, 8b data}
  .index_data2_i(index_data2_i), //{3b index, 8b data}
  .index_data1_o(stage1_1), //{3b index, 8b data}
  .index_data2_o(stage1_2) //{3b index, 8b data}
);

logic [10:0] stage2_1;
logic [10:0] stage2_2;

SORT_element2 STAGE2(
  .index_data1_i(stage1_2), //{3b index, 8b data}
  .index_data2_i(index_data3_i), //{3b index, 8b data}
  .index_data1_o(stage2_1), //{3b index, 8b data}
  .index_data2_o(stage2_2) //{3b index, 8b data}
);


logic [10:0] stage3_1;
logic [10:0] stage3_2;

SORT_element2 STAGE3(
  .index_data1_i(stage1_1), //{3b index, 8b data}
  .index_data2_i(stage2_1), //{3b index, 8b data}
  .index_data1_o(stage3_1), //{3b index, 8b data}
  .index_data2_o(stage3_2) //{3b index, 8b data}
);

assign index_data1_o = stage3_1;
assign index_data2_o = stage3_2;
assign index_data3_o = stage2_2;

endmodule