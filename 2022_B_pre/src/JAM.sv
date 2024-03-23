module JAM (
input              CLK,
input              RST,
output logic [2:0] W,
output logic [2:0] J,
input        [6:0] Cost,
output logic [3:0] MatchCount,
output logic [8:0] MinCost,
output logic       Valid
);

logic [3:0] count_read;  // count the number of read to ROM
logic [2:0] arr [7:0];    // to store the current list
logic [9:0] roundCost;   // store the cost for each round

logic [2:0] P1;
logic [2:0] P2;

logic [2:0] P1_reg;
logic [2:0] P2_reg;
logic [2:0] beforeSort [7:0];
logic [2:0] afterSort [7:0];
logic [2:0] sortMin;

logic [9:0] roundCost_add_Cost;
logic LoopFinish;

assign roundCost_add_Cost = roundCost + Cost;
assign LoopFinish = (arr[0] == 3'd7) &&
                    (arr[1] == 3'd6) &&
                    (arr[2] == 3'd5) &&
                    (arr[3] == 3'd4) &&
                    (arr[4] == 3'd3) &&
                    (arr[5] == 3'd2) &&
                    (arr[6] == 3'd1) &&
                    (arr[7] == 3'd0) ;

genvar idx;
generate
    for(idx=0;idx<8;idx=idx+1)begin:instanceSomething
        setNumber setNumber(
            .selfIdx   (idx[2:0]),
            .self_value(arr[idx]),
            .P1_i      (P1),
            .P1_value  (arr[P1]),
            .number_o  (beforeSort[idx])
        );
    end
endgenerate


sort8 sort8(
  .in1 (beforeSort[0]),
  .in2 (beforeSort[1]),
  .in3 (beforeSort[2]),
  .in4 (beforeSort[3]),
  .in5 (beforeSort[4]),
  .in6 (beforeSort[5]),
  .in7 (beforeSort[6]),
  .in8 (beforeSort[7]),
  .out1( afterSort[0]),
  .out2( afterSort[1]),
  .out3( afterSort[2]),
  .out4( afterSort[3]),
  .out5( afterSort[4]),
  .out6( afterSort[5]),
  .out7( afterSort[6]),
  .out8( afterSort[7])
);

assign sortMin = afterSort[0];

// --------------------- //
//         FSM           //
// --------------------- //
typedef enum logic [2:0] {
    RESET, SWITCH, LIST, READ, FINISH
} fsm;
fsm state;



// arr
always_ff @(posedge CLK or posedge RST) begin
    if (RST) begin
        arr[0] <= 3'd0;
        arr[1] <= 3'd1;
        arr[2] <= 3'd2;
        arr[3] <= 3'd3;
        arr[4] <= 3'd4;
        arr[5] <= 3'd5;
        arr[6] <= 3'd6;
        arr[7] <= 3'd7;
    end
    else if (state == SWITCH) begin
        arr[P1] <= arr[P2];
        arr[P2] <= arr[P1];
    end
    else if (state == LIST) begin
        case (P1_reg)
            'd0: begin
                arr[1] <= arr[7];
                arr[7] <= arr[1];
                arr[2] <= arr[6];
                arr[6] <= arr[2];
                arr[3] <= arr[5];
                arr[5] <= arr[3];
            end
            'd1: begin
                arr[2] <= arr[7];
                arr[7] <= arr[2];
                arr[3] <= arr[6];
                arr[6] <= arr[3];
                arr[4] <= arr[5];
                arr[5] <= arr[4];
            end
            'd2: begin
                arr[3] <= arr[7];
                arr[7] <= arr[3];
                arr[4] <= arr[6];
                arr[6] <= arr[4];
            end
            'd3: begin
                arr[4] <= arr[7];
                arr[7] <= arr[4];
                arr[5] <= arr[6];
                arr[6] <= arr[5];
            end
            'd4: begin
                arr[5] <= arr[7];
                arr[7] <= arr[5];
            end
            'd5: begin
                arr[6] <= arr[7];
                arr[7] <= arr[6];
            end
        endcase
    end
    else begin
        arr[0] <= arr[0];
        arr[1] <= arr[1];
        arr[2] <= arr[2];
        arr[3] <= arr[3];
        arr[4] <= arr[4];
        arr[5] <= arr[5];
        arr[6] <= arr[6];
        arr[7] <= arr[7];
    end
end

// find P1
always_comb begin
    if (arr[7] > arr[6])      P1 = 3'd6;
    else if (arr[6] > arr[5]) P1 = 3'd5;
    else if (arr[5] > arr[4]) P1 = 3'd4;
    else if (arr[4] > arr[3]) P1 = 3'd3;
    else if (arr[3] > arr[2]) P1 = 3'd2;
    else if (arr[2] > arr[1]) P1 = 3'd1;
    else if (arr[1] > arr[0]) P1 = 3'd0;
    else                      P1 = 3'd0;
end

// find P2
always_comb begin
    if      (arr[7] == sortMin) P2 = 3'd7;
    else if (arr[6] == sortMin) P2 = 3'd6;
    else if (arr[5] == sortMin) P2 = 3'd5;
    else if (arr[4] == sortMin) P2 = 3'd4;
    else if (arr[3] == sortMin) P2 = 3'd3;
    else if (arr[2] == sortMin) P2 = 3'd2;
    else if (arr[1] == sortMin) P2 = 3'd1;
    else                        P2 = 3'd0;
end


always_ff @(posedge CLK or posedge RST) begin
    if (RST)
        state <= RESET;
    else begin
        case (state)
            RESET:
                state <= SWITCH;
            SWITCH:
                state <= LIST;
            LIST:
                state <= READ;
            READ:
                if(count_read == 4'd8 || (roundCost_add_Cost > MinCost && count_read > 4'd1) )begin
                    if(LoopFinish)state <= FINISH;
                    else          state <= SWITCH;
                end
                else state <= READ;
            FINISH:
                state <= RESET;
            default:
                state <= RESET;
        endcase
    end
end


// --------------------- //
//        counter        //
// --------------------- //
always_ff @(posedge CLK or posedge RST) begin
    if (RST)
        count_read <= 4'd0;
    else if (state == SWITCH)
        count_read <= 4'd0;
    else if (state == READ)
        count_read <= count_read + 4'd1;
    else
        count_read <= count_read;
end

// --------------------- //
//    P1_reg, P2_reg     //
// --------------------- //

always_ff @(posedge CLK or posedge RST) begin
    if (RST)P1_reg <= 3'd0;
    else if(state == SWITCH)P1_reg <= P1;
end

always_ff @(posedge CLK or posedge RST) begin
    if (RST)P2_reg <= 3'd0;
    else if(state == SWITCH)P2_reg <= P2;
end



// --------------------- //
//          ROM          //
// --------------------- //
// W, J
always_comb begin
    if (state == READ) begin
        W = count_read;
        J = (count_read == 4'd8)?(3'd0):(arr[count_read]);
    end
    else begin
        W = 3'd0;
        J = 3'd0;
    end
end

// roundCost
always_ff @(posedge CLK or posedge RST) begin
    if (RST)
        roundCost <= 10'd0;
    else if (count_read == 4'd1 && state == READ)
        roundCost <= Cost;
    else if (state == READ)
        roundCost <= roundCost_add_Cost;
    else
        roundCost <= roundCost;
end

// --------------------- //
//        OUTPUT         //
// --------------------- //
always_ff @(posedge CLK or posedge RST) begin
    if (RST)MinCost <= 9'd511;
    else if(state == RESET)MinCost <= 9'd511;
    else if (count_read == 4'd8 && state == READ && roundCost_add_Cost < MinCost)MinCost <= roundCost_add_Cost; 
end

always_ff @(posedge CLK or posedge RST) begin
    if (RST)MatchCount <= 4'd0;
    else if(state == RESET)MatchCount <= 4'd0;
    else if (count_read == 4'd8 && state == READ)begin
        if(roundCost_add_Cost < MinCost)MatchCount <= 4'd1;
        else if(roundCost_add_Cost == MinCost)MatchCount <= MatchCount + 4'd1;
    end 
end

assign Valid = (state == FINISH);

endmodule




module setNumber(
    input  [2:0] selfIdx,
    input  [2:0] self_value,
    input  [2:0] P1_i,
    input  [2:0] P1_value,
    output logic [2:0] number_o
);

always_comb begin
    if(selfIdx <= P1_i)number_o = 3'd7;
    else begin
        if(self_value > P1_value)number_o = self_value;
        else                     number_o = 3'd7;
    end
end

endmodule





module sort2(
  input         [2:0] in1 ,
  input         [2:0] in2 ,
  output logic  [2:0] out1,
  output logic  [2:0] out2
);

always_comb begin
    if(in1 < in2)begin
        out1 = in1;
        out2 = in2;
    end
    else begin
        out1 = in2;
        out2 = in1;
    end
end

endmodule




module sort4(
  input         [2:0] in1 ,
  input         [2:0] in2 ,
  input         [2:0] in3 ,
  input         [2:0] in4 ,
  output logic  [2:0] out1,
  output logic  [2:0] out2,
  output logic  [2:0] out3,
  output logic  [2:0] out4
);

logic  [2:0] stage1_1;
logic  [2:0] stage1_2;
logic  [2:0] stage1_3;
logic  [2:0] stage1_4;

sort2 S1_1(
    .in1 (in1),
    .in2 (in2),
    .out1(stage1_1),
    .out2(stage1_2)
);

sort2 S1_2(
    .in1 (in3),
    .in2 (in4),
    .out1(stage1_3),
    .out2(stage1_4)
);

logic  [2:0] stage2_1;
logic  [2:0] stage2_2;
logic  [2:0] stage2_3;
logic  [2:0] stage2_4;

sort2 S2_1(
    .in1 (stage1_1),
    .in2 (stage1_3),
    .out1(stage2_1),
    .out2(stage2_2)
);

sort2 S2_2(
    .in1 (stage1_2),
    .in2 (stage1_4),
    .out1(stage2_3),
    .out2(stage2_4)
);

logic  [2:0] stage3_1;
logic  [2:0] stage3_2;

sort2 S3_1(
    .in1 (stage2_2),
    .in2 (stage2_3),
    .out1(stage3_1),
    .out2(stage3_2)
);

assign out1 = stage2_1;
assign out2 = stage3_1;
assign out3 = stage3_2;
assign out4 = stage2_4;

endmodule



module sort8(
  input         [2:0] in1 ,
  input         [2:0] in2 ,
  input         [2:0] in3 ,
  input         [2:0] in4 ,
  input         [2:0] in5 ,
  input         [2:0] in6 ,
  input         [2:0] in7 ,
  input         [2:0] in8 ,
  output logic  [2:0] out1,
  output logic  [2:0] out2,
  output logic  [2:0] out3,
  output logic  [2:0] out4,
  output logic  [2:0] out5,
  output logic  [2:0] out6,
  output logic  [2:0] out7,
  output logic  [2:0] out8
);

logic  [2:0] stage1_1;
logic  [2:0] stage1_2;
logic  [2:0] stage1_3;
logic  [2:0] stage1_4;
logic  [2:0] stage1_5;
logic  [2:0] stage1_6;
logic  [2:0] stage1_7;
logic  [2:0] stage1_8;

sort2 S1_1(
    .in1 (in1),
    .in2 (in2),
    .out1(stage1_1),
    .out2(stage1_2)
);

sort2 S1_2(
    .in1 (in3),
    .in2 (in4),
    .out1(stage1_3),
    .out2(stage1_4)
);

sort2 S1_3(
    .in1 (in5),
    .in2 (in6),
    .out1(stage1_5),
    .out2(stage1_6)
);

sort2 S1_4(
    .in1 (in7),
    .in2 (in8),
    .out1(stage1_7),
    .out2(stage1_8)
);

logic  [2:0] stage2_1;
logic  [2:0] stage2_2;
logic  [2:0] stage2_3;
logic  [2:0] stage2_4;
logic  [2:0] stage2_5;
logic  [2:0] stage2_6;
logic  [2:0] stage2_7;
logic  [2:0] stage2_8;

sort4 S2_1(
    .in1 (stage1_1),
    .in2 (stage1_3),
    .in3 (stage1_5),
    .in4 (stage1_7),
    .out1(stage2_1),
    .out2(stage2_2),
    .out3(stage2_3),
    .out4(stage2_4)
);

sort4 S2_2(
    .in1 (stage1_2),
    .in2 (stage1_4),
    .in3 (stage1_6),
    .in4 (stage1_8),
    .out1(stage2_5),
    .out2(stage2_6),
    .out3(stage2_7),
    .out4(stage2_8)
);


logic  [2:0] stage3_1;
logic  [2:0] stage3_2;
logic  [2:0] stage3_3;
logic  [2:0] stage3_4;
logic  [2:0] stage3_5;
logic  [2:0] stage3_6;

sort2 S3_1(
    .in1 (stage2_2),
    .in2 (stage2_5),
    .out1(stage3_1),
    .out2(stage3_2)
);

sort2 S3_2(
    .in1 (stage2_3),
    .in2 (stage2_6),
    .out1(stage3_3),
    .out2(stage3_4)
);

sort2 S3_3(
    .in1 (stage2_4),
    .in2 (stage2_7),
    .out1(stage3_5),
    .out2(stage3_6)
);

logic  [2:0] stage4_1;
logic  [2:0] stage4_2;
logic  [2:0] stage4_3;
logic  [2:0] stage4_4;

sort4 S4_1(
    .in1 (stage2_2),
    .in2 (stage2_3),
    .in3 (stage2_4),
    .in4 (stage2_5),
    .out1(stage4_1),
    .out2(stage4_2),
    .out3(stage4_3),
    .out4(stage4_4)
);


assign out1 = stage2_1;
assign out2 = stage3_1;
assign out3 = stage4_1;
assign out4 = stage4_2;
assign out5 = stage4_3;
assign out6 = stage4_4;
assign out7 = stage3_6;
assign out8 = stage2_8;

endmodule