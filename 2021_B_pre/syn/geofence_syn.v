/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03-SP1-1
// Date      : Sun Mar 24 22:21:08 2024
/////////////////////////////////////////////////////////////


module geofence_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;
  wire   n1, n2, n3;
  wire   [10:2] carry;

  CMPR22X2 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX2 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR22X2 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CMPR22X2 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  OAI2BB1X1 U1 ( .A0N(carry[10]), .A1N(n2), .B0(n3), .Y(SUM[10]) );
  CLKINVX1 U2 ( .A(carry[10]), .Y(n1) );
  NAND2X1 U3 ( .A(n1), .B(A[10]), .Y(n3) );
  INVXL U4 ( .A(A[10]), .Y(n2) );
  ADDHX4 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CMPR22X4 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
endmodule


module geofence_DW01_inc_1 ( A, SUM );
  input [22:0] A;
  output [22:0] SUM;

  wire   [22:2] carry;

  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX2 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHX1 U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADDHX1 U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHXL U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(A[2]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADDHXL U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  INVXL U2 ( .A(A[2]), .Y(SUM[2]) );
  XOR2X1 U1 ( .A(carry[22]), .B(A[22]), .Y(SUM[22]) );
endmodule


module geofence_DW01_absval_0 ( A, ABSVAL );
  input [22:0] A;
  output [22:0] ABSVAL;
  wire   n1;
  wire   [22:0] AN;
  wire   [22:0] AMUX1;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  MX2XL U1 ( .A(A[19]), .B(AMUX1[19]), .S0(n1), .Y(ABSVAL[19]) );
  CLKMX2X2 U2 ( .A(A[20]), .B(AMUX1[20]), .S0(n1), .Y(ABSVAL[20]) );
  CLKMX2X2 U5 ( .A(A[18]), .B(AMUX1[18]), .S0(n1), .Y(ABSVAL[18]) );
  BUFX16 U6 ( .A(A[22]), .Y(n1) );
  CLKMX2X2 U7 ( .A(A[6]), .B(AMUX1[6]), .S0(n1), .Y(ABSVAL[6]) );
  CLKMX2X2 U8 ( .A(A[14]), .B(AMUX1[14]), .S0(n1), .Y(ABSVAL[14]) );
  CLKMX2X2 U9 ( .A(A[12]), .B(AMUX1[12]), .S0(n1), .Y(ABSVAL[12]) );
  CLKMX2X2 U10 ( .A(A[4]), .B(AMUX1[4]), .S0(n1), .Y(ABSVAL[4]) );
  CLKMX2X2 U11 ( .A(A[8]), .B(AMUX1[8]), .S0(n1), .Y(ABSVAL[8]) );
  INVX3 U12 ( .A(n1), .Y(AN[22]) );
  AND2X2 U13 ( .A(AMUX1[22]), .B(n1), .Y(ABSVAL[22]) );
  MX2XL U14 ( .A(A[16]), .B(AMUX1[16]), .S0(n1), .Y(ABSVAL[16]) );
  MX2XL U15 ( .A(A[17]), .B(AMUX1[17]), .S0(n1), .Y(ABSVAL[17]) );
  MX2XL U16 ( .A(A[15]), .B(AMUX1[15]), .S0(n1), .Y(ABSVAL[15]) );
  MX2XL U17 ( .A(A[13]), .B(AMUX1[13]), .S0(n1), .Y(ABSVAL[13]) );
  MX2XL U19 ( .A(A[11]), .B(AMUX1[11]), .S0(n1), .Y(ABSVAL[11]) );
  MX2XL U20 ( .A(A[9]), .B(AMUX1[9]), .S0(n1), .Y(ABSVAL[9]) );
  MX2XL U21 ( .A(A[7]), .B(AMUX1[7]), .S0(n1), .Y(ABSVAL[7]) );
  MX2XL U22 ( .A(A[5]), .B(AMUX1[5]), .S0(n1), .Y(ABSVAL[5]) );
  MX2XL U23 ( .A(A[3]), .B(AMUX1[3]), .S0(n1), .Y(ABSVAL[3]) );
  INVXL U24 ( .A(A[9]), .Y(AN[9]) );
  INVXL U25 ( .A(A[8]), .Y(AN[8]) );
  INVXL U26 ( .A(A[7]), .Y(AN[7]) );
  INVXL U27 ( .A(A[6]), .Y(AN[6]) );
  INVXL U28 ( .A(A[5]), .Y(AN[5]) );
  INVXL U29 ( .A(A[4]), .Y(AN[4]) );
  INVXL U30 ( .A(A[3]), .Y(AN[3]) );
  INVXL U31 ( .A(A[2]), .Y(AN[2]) );
  CLKINVX1 U32 ( .A(A[21]), .Y(AN[21]) );
  CLKINVX1 U33 ( .A(A[19]), .Y(AN[19]) );
  CLKINVX1 U34 ( .A(A[18]), .Y(AN[18]) );
  CLKINVX1 U35 ( .A(A[17]), .Y(AN[17]) );
  CLKINVX1 U36 ( .A(A[16]), .Y(AN[16]) );
  CLKINVX1 U37 ( .A(A[15]), .Y(AN[15]) );
  CLKINVX1 U39 ( .A(A[13]), .Y(AN[13]) );
  CLKINVX1 U40 ( .A(A[12]), .Y(AN[12]) );
  INVX1 U41 ( .A(A[11]), .Y(AN[11]) );
  INVXL U42 ( .A(A[10]), .Y(AN[10]) );
  CLKMX2X2 U44 ( .A(A[2]), .B(AMUX1[2]), .S0(n1), .Y(ABSVAL[2]) );
  geofence_DW01_inc_1 NEG ( .A({AN[22:2], 1'b1, 1'b1}), .SUM({AMUX1[22:2], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1}) );
  CLKINVX1 U4 ( .A(A[20]), .Y(AN[20]) );
  MX2X1 U3 ( .A(A[21]), .B(AMUX1[21]), .S0(n1), .Y(ABSVAL[21]) );
  INVX1 U18 ( .A(A[14]), .Y(AN[14]) );
  MX2X1 U38 ( .A(A[10]), .B(AMUX1[10]), .S0(n1), .Y(ABSVAL[10]) );
endmodule


module geofence_DW_sqrt_0 ( a, root );
  input [22:0] a;
  output [11:0] root;
  wire   \PartRem[12][0] , \PartRem[11][1] , \PartRem[11][0] ,
         \PartRem[10][3] , \PartRem[10][2] , \PartRem[10][1] ,
         \PartRem[10][0] , \PartRem[9][4] , \PartRem[9][3] , \PartRem[9][2] ,
         \PartRem[9][1] , \PartRem[9][0] , \PartRem[8][5] , \PartRem[8][4] ,
         \PartRem[8][3] , \PartRem[8][2] , \PartRem[8][1] , \PartRem[8][0] ,
         \PartRem[7][6] , \PartRem[7][5] , \PartRem[7][4] , \PartRem[7][3] ,
         \PartRem[7][2] , \PartRem[7][1] , \PartRem[7][0] , \PartRem[6][7] ,
         \PartRem[6][6] , \PartRem[6][5] , \PartRem[6][4] , \PartRem[6][3] ,
         \PartRem[6][2] , \PartRem[6][1] , \PartRem[6][0] , \PartRem[5][8] ,
         \PartRem[5][7] , \PartRem[5][6] , \PartRem[5][5] , \PartRem[5][4] ,
         \PartRem[5][3] , \PartRem[5][2] , \PartRem[5][1] , \PartRem[5][0] ,
         \PartRem[4][9] , \PartRem[4][8] , \PartRem[4][7] , \PartRem[4][6] ,
         \PartRem[4][5] , \PartRem[4][4] , \PartRem[4][3] , \PartRem[4][2] ,
         \PartRem[4][1] , \PartRem[4][0] , \PartRem[3][10] , \PartRem[3][9] ,
         \PartRem[3][8] , \PartRem[3][7] , \PartRem[3][6] , \PartRem[3][5] ,
         \PartRem[3][3] , \PartRem[3][2] , \PartRem[3][1] , \PartRem[3][0] ,
         \PartRem[2][11] , \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] ,
         \PartRem[2][7] , \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] ,
         \PartRem[2][3] , \PartRem[2][2] , \PartRem[2][1] , \PartRem[2][0] ,
         \PartRoot[9][2] , \PartRoot[8][2] , \PartRoot[7][2] ,
         \PartRoot[6][2] , \PartRoot[5][2] , \PartRoot[4][2] ,
         \PartRoot[3][2] , \PartRoot[2][2] , \SumTmp[10][2] , \SumTmp[9][3] ,
         \SumTmp[9][2] , \SumTmp[8][4] , \SumTmp[8][3] , \SumTmp[8][2] ,
         \SumTmp[7][5] , \SumTmp[7][4] , \SumTmp[7][3] , \SumTmp[7][2] ,
         \SumTmp[6][6] , \SumTmp[6][5] , \SumTmp[6][4] , \SumTmp[6][3] ,
         \SumTmp[6][2] , \SumTmp[5][7] , \SumTmp[5][6] , \SumTmp[5][5] ,
         \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] , \SumTmp[4][8] ,
         \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] , \SumTmp[4][4] ,
         \SumTmp[4][3] , \SumTmp[4][2] , \SumTmp[3][9] , \SumTmp[3][8] ,
         \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] , \SumTmp[3][4] ,
         \SumTmp[3][3] , \SumTmp[3][2] , \SumTmp[2][10] , \SumTmp[2][9] ,
         \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] , \SumTmp[2][5] ,
         \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] , \SumTmp[1][11] ,
         \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] , \SumTmp[1][7] ,
         \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , \SumTmp[1][3] ,
         \SumTmp[1][2] , \CryTmp[10][2] , \CryTmp[9][4] , \CryTmp[9][3] ,
         \CryTmp[9][2] , \CryTmp[8][5] , \CryTmp[8][4] , \CryTmp[8][3] ,
         \CryTmp[8][2] , \CryTmp[7][6] , \CryTmp[7][5] , \CryTmp[7][4] ,
         \CryTmp[7][3] , \CryTmp[7][2] , \CryTmp[6][7] , \CryTmp[6][6] ,
         \CryTmp[6][5] , \CryTmp[6][4] , \CryTmp[6][3] , \CryTmp[6][2] ,
         \CryTmp[5][8] , \CryTmp[5][7] , \CryTmp[5][6] , \CryTmp[5][5] ,
         \CryTmp[5][4] , \CryTmp[5][3] , \CryTmp[5][2] , \CryTmp[4][9] ,
         \CryTmp[4][8] , \CryTmp[4][7] , \CryTmp[4][6] , \CryTmp[4][5] ,
         \CryTmp[4][4] , \CryTmp[4][3] , \CryTmp[4][2] , \CryTmp[3][10] ,
         \CryTmp[3][9] , \CryTmp[3][8] , \CryTmp[3][7] , \CryTmp[3][6] ,
         \CryTmp[3][5] , \CryTmp[3][4] , \CryTmp[3][3] , \CryTmp[3][2] ,
         \CryTmp[2][11] , \CryTmp[2][10] , \CryTmp[2][9] , \CryTmp[2][8] ,
         \CryTmp[2][7] , \CryTmp[2][6] , \CryTmp[2][5] , \CryTmp[2][4] ,
         \CryTmp[2][3] , \CryTmp[2][2] , \CryTmp[1][12] , \CryTmp[1][11] ,
         \CryTmp[1][10] , \CryTmp[1][9] , \CryTmp[1][8] , \CryTmp[1][7] ,
         \CryTmp[1][6] , \CryTmp[1][5] , \CryTmp[1][4] , \CryTmp[1][3] ,
         \CryTmp[1][2] , n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n15, n16,
         n17, n18, n19, n20, n21, n22, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  ADDFXL u_fa_PartRem_1_3 ( .A(\PartRem[2][3] ), .B(n16), .CI(\CryTmp[1][3] ), 
        .CO(\CryTmp[1][4] ), .S(\SumTmp[1][3] ) );
  ADDFXL u_fa_PartRem_8_3 ( .A(\PartRem[9][3] ), .B(n30), .CI(\CryTmp[8][3] ), 
        .CO(\CryTmp[8][4] ), .S(\SumTmp[8][3] ) );
  ADDFXL u_fa_PartRem_6_4 ( .A(\PartRem[7][4] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[6][4] ), .CO(\CryTmp[6][5] ), .S(\SumTmp[6][4] ) );
  ADDFXL u_fa_PartRem_1_8 ( .A(\PartRem[2][8] ), .B(n21), .CI(\CryTmp[1][8] ), 
        .CO(\CryTmp[1][9] ), .S(\SumTmp[1][8] ) );
  ADDFXL u_fa_PartRem_3_6 ( .A(\PartRem[4][6] ), .B(n21), .CI(\CryTmp[3][6] ), 
        .CO(\CryTmp[3][7] ), .S(\SumTmp[3][6] ) );
  ADDFXL u_fa_PartRem_4_5 ( .A(\PartRem[5][5] ), .B(n21), .CI(\CryTmp[4][5] ), 
        .CO(\CryTmp[4][6] ), .S(\SumTmp[4][5] ) );
  ADDFXL u_fa_PartRem_5_4 ( .A(\PartRem[6][4] ), .B(n21), .CI(\CryTmp[5][4] ), 
        .CO(\CryTmp[5][5] ), .S(\SumTmp[5][4] ) );
  ADDFXL u_fa_PartRem_1_5 ( .A(\PartRem[2][5] ), .B(n18), .CI(\CryTmp[1][5] ), 
        .CO(\CryTmp[1][6] ), .S(\SumTmp[1][5] ) );
  ADDFXL u_fa_PartRem_2_4 ( .A(n1), .B(n18), .CI(\CryTmp[2][4] ), .CO(
        \CryTmp[2][5] ), .S(\SumTmp[2][4] ) );
  ADDFXL u_fa_PartRem_2_9 ( .A(\PartRem[3][9] ), .B(n30), .CI(\CryTmp[2][9] ), 
        .CO(\CryTmp[2][10] ), .S(\SumTmp[2][9] ) );
  ADDFHX2 u_fa_PartRem_2_10 ( .A(\PartRem[3][10] ), .B(n31), .CI(
        \CryTmp[2][10] ), .CO(\CryTmp[2][11] ), .S(\SumTmp[2][10] ) );
  ADDFHX2 u_fa_PartRem_3_9 ( .A(\PartRem[4][9] ), .B(n31), .CI(\CryTmp[3][9] ), 
        .CO(\CryTmp[3][10] ), .S(\SumTmp[3][9] ) );
  ADDFHX2 u_fa_PartRem_4_8 ( .A(\PartRem[5][8] ), .B(n31), .CI(\CryTmp[4][8] ), 
        .CO(\CryTmp[4][9] ), .S(\SumTmp[4][8] ) );
  ADDFHX2 u_fa_PartRem_5_7 ( .A(\PartRem[6][7] ), .B(n31), .CI(\CryTmp[5][7] ), 
        .CO(\CryTmp[5][8] ), .S(\SumTmp[5][7] ) );
  ADDFHX2 u_fa_PartRem_6_6 ( .A(\PartRem[7][6] ), .B(n31), .CI(\CryTmp[6][6] ), 
        .CO(\CryTmp[6][7] ), .S(\SumTmp[6][6] ) );
  ADDFHX2 u_fa_PartRem_7_5 ( .A(\PartRem[8][5] ), .B(n31), .CI(\CryTmp[7][5] ), 
        .CO(\CryTmp[7][6] ), .S(\SumTmp[7][5] ) );
  ADDFHX2 u_fa_PartRem_8_4 ( .A(\PartRem[9][4] ), .B(n31), .CI(\CryTmp[8][4] ), 
        .CO(\CryTmp[8][5] ), .S(\SumTmp[8][4] ) );
  ADDFHX2 u_fa_PartRem_9_3 ( .A(\PartRem[10][3] ), .B(n31), .CI(\CryTmp[9][3] ), .CO(\CryTmp[9][4] ), .S(\SumTmp[9][3] ) );
  ADDFHX2 u_fa_PartRem_3_3 ( .A(\PartRem[4][3] ), .B(n18), .CI(\CryTmp[3][3] ), 
        .CO(\CryTmp[3][4] ), .S(\SumTmp[3][3] ) );
  ADDFHX2 u_fa_PartRem_5_3 ( .A(\PartRem[6][3] ), .B(n20), .CI(\CryTmp[5][3] ), 
        .CO(\CryTmp[5][4] ), .S(\SumTmp[5][3] ) );
  ADDFHX2 u_fa_PartRem_4_3 ( .A(\PartRem[5][3] ), .B(n19), .CI(\CryTmp[4][3] ), 
        .CO(\CryTmp[4][4] ), .S(\SumTmp[4][3] ) );
  ADDFHX2 u_fa_PartRem_1_4 ( .A(\PartRem[2][4] ), .B(n17), .CI(\CryTmp[1][4] ), 
        .CO(\CryTmp[1][5] ), .S(\SumTmp[1][4] ) );
  ADDFHX2 u_fa_PartRem_2_3 ( .A(\PartRem[3][3] ), .B(n17), .CI(\CryTmp[2][3] ), 
        .CO(\CryTmp[2][4] ), .S(\SumTmp[2][3] ) );
  ADDFHX2 u_fa_PartRem_1_11 ( .A(\PartRem[2][11] ), .B(n31), .CI(
        \CryTmp[1][11] ), .CO(\CryTmp[1][12] ), .S(\SumTmp[1][11] ) );
  ADDFHX2 u_fa_PartRem_1_9 ( .A(\PartRem[2][9] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[1][9] ), .CO(\CryTmp[1][10] ), .S(\SumTmp[1][9] ) );
  ADDFHX2 u_fa_PartRem_2_8 ( .A(\PartRem[3][8] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[2][8] ), .CO(\CryTmp[2][9] ), .S(\SumTmp[2][8] ) );
  ADDFHX2 u_fa_PartRem_3_7 ( .A(\PartRem[4][7] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[3][7] ), .CO(\CryTmp[3][8] ), .S(\SumTmp[3][7] ) );
  ADDFHX2 u_fa_PartRem_4_6 ( .A(\PartRem[5][6] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[4][6] ), .CO(\CryTmp[4][7] ), .S(\SumTmp[4][6] ) );
  ADDFHX2 u_fa_PartRem_5_5 ( .A(\PartRem[6][5] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[5][5] ), .CO(\CryTmp[5][6] ), .S(\SumTmp[5][5] ) );
  ADDFHX2 u_fa_PartRem_3_5 ( .A(\PartRem[4][5] ), .B(n20), .CI(\CryTmp[3][5] ), 
        .CO(\CryTmp[3][6] ), .S(\SumTmp[3][5] ) );
  ADDFHX2 u_fa_PartRem_4_4 ( .A(\PartRem[5][4] ), .B(n20), .CI(\CryTmp[4][4] ), 
        .CO(\CryTmp[4][5] ), .S(\SumTmp[4][4] ) );
  ADDFHX2 u_fa_PartRem_2_5 ( .A(\PartRem[3][5] ), .B(n19), .CI(\CryTmp[2][5] ), 
        .CO(\CryTmp[2][6] ), .S(\SumTmp[2][5] ) );
  ADDFHX2 u_fa_PartRem_1_7 ( .A(\PartRem[2][7] ), .B(n20), .CI(\CryTmp[1][7] ), 
        .CO(\CryTmp[1][8] ), .S(\SumTmp[1][7] ) );
  ADDFHX2 u_fa_PartRem_2_6 ( .A(\PartRem[3][6] ), .B(n20), .CI(\CryTmp[2][6] ), 
        .CO(\CryTmp[2][7] ), .S(\SumTmp[2][6] ) );
  ADDFHX2 u_fa_PartRem_1_6 ( .A(\PartRem[2][6] ), .B(n19), .CI(\CryTmp[1][6] ), 
        .CO(\CryTmp[1][7] ), .S(\SumTmp[1][6] ) );
  ADDFHX4 u_fa_PartRem_3_2 ( .A(\PartRem[4][2] ), .B(n17), .CI(\CryTmp[3][2] ), 
        .CO(\CryTmp[3][3] ), .S(\SumTmp[3][2] ) );
  ADDFX1 u_fa_PartRem_6_2 ( .A(\PartRem[7][2] ), .B(n20), .CI(\CryTmp[6][2] ), 
        .CO(\CryTmp[6][3] ), .S(\SumTmp[6][2] ) );
  ADDFX1 u_fa_PartRem_8_2 ( .A(\PartRem[9][2] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[8][2] ), .CO(\CryTmp[8][3] ), .S(\SumTmp[8][2] ) );
  ADDFHX2 u_fa_PartRem_1_2 ( .A(\PartRem[2][2] ), .B(n15), .CI(\CryTmp[1][2] ), 
        .CO(\CryTmp[1][3] ), .S(\SumTmp[1][2] ) );
  ADDFHX4 u_fa_PartRem_2_2 ( .A(\PartRem[3][2] ), .B(n16), .CI(\CryTmp[2][2] ), 
        .CO(\CryTmp[2][3] ), .S(\SumTmp[2][2] ) );
  ADDFX2 u_fa_PartRem_6_3 ( .A(\PartRem[7][3] ), .B(n21), .CI(\CryTmp[6][3] ), 
        .CO(\CryTmp[6][4] ), .S(\SumTmp[6][3] ) );
  ADDFHX4 u_fa_PartRem_9_2 ( .A(\PartRem[10][2] ), .B(n30), .CI(\CryTmp[9][2] ), .CO(\CryTmp[9][3] ), .S(\SumTmp[9][2] ) );
  ADDFX1 u_fa_PartRem_5_2 ( .A(\PartRem[6][2] ), .B(n19), .CI(\CryTmp[5][2] ), 
        .CO(\CryTmp[5][3] ), .S(\SumTmp[5][2] ) );
  ADDFX1 u_fa_PartRem_7_2 ( .A(\PartRem[8][2] ), .B(n21), .CI(\CryTmp[7][2] ), 
        .CO(\CryTmp[7][3] ), .S(\SumTmp[7][2] ) );
  ADDFHX1 u_fa_PartRem_7_3 ( .A(\PartRem[8][3] ), .B(\PartRoot[9][2] ), .CI(
        \CryTmp[7][3] ), .CO(\CryTmp[7][4] ), .S(\SumTmp[7][3] ) );
  ADDFHX4 u_fa_PartRem_4_2 ( .A(\PartRem[5][2] ), .B(n18), .CI(\CryTmp[4][2] ), 
        .CO(\CryTmp[4][3] ), .S(\SumTmp[4][2] ) );
  MX2X1 U4 ( .A(\SumTmp[3][2] ), .B(\PartRem[4][2] ), .S0(\PartRoot[3][2] ), 
        .Y(n1) );
  MX2XL U5 ( .A(\SumTmp[5][3] ), .B(\PartRem[6][3] ), .S0(\PartRoot[5][2] ), 
        .Y(\PartRem[5][5] ) );
  OA21X2 U6 ( .A0(\CryTmp[1][2] ), .A1(n60), .B0(n64), .Y(n61) );
  INVX1 U7 ( .A(n8), .Y(\PartRem[6][3] ) );
  AOI2BB2X1 U8 ( .B0(n17), .B1(n54), .A0N(n55), .A1N(n56), .Y(n2) );
  OAI21X2 U9 ( .A0(\PartRem[11][0] ), .A1(n30), .B0(n5), .Y(\PartRem[10][2] )
         );
  AND2X2 U10 ( .A(n40), .B(root[9]), .Y(n41) );
  XNOR2X4 U11 ( .A(n16), .B(\PartRem[4][0] ), .Y(\PartRem[3][2] ) );
  BUFX20 U12 ( .A(\PartRoot[3][2] ), .Y(n16) );
  OAI21X2 U14 ( .A0(\CryTmp[9][2] ), .A1(\PartRoot[9][2] ), .B0(n78), .Y(
        \PartRem[9][3] ) );
  AND2X2 U16 ( .A(n2), .B(root[5]), .Y(n52) );
  NAND2X2 U18 ( .A(n3), .B(n4), .Y(\PartRem[10][3] ) );
  OR2X1 U19 ( .A(n30), .B(\CryTmp[10][2] ), .Y(n3) );
  OR2X2 U20 ( .A(n79), .B(n32), .Y(n4) );
  MX2X1 U21 ( .A(\SumTmp[7][2] ), .B(\PartRem[8][2] ), .S0(n20), .Y(
        \PartRem[7][4] ) );
  OA22X4 U22 ( .A0(root[9]), .A1(n40), .B0(n41), .B1(n42), .Y(n37) );
  BUFX20 U23 ( .A(\PartRoot[8][2] ), .Y(n21) );
  OAI21X2 U24 ( .A0(\PartRoot[9][2] ), .A1(\PartRem[10][0] ), .B0(
        \PartRem[10][1] ), .Y(n78) );
  NAND2BX4 U25 ( .AN(\PartRem[11][0] ), .B(n32), .Y(\CryTmp[10][2] ) );
  INVX1 U26 ( .A(\PartRem[11][1] ), .Y(n32) );
  BUFX20 U27 ( .A(\PartRoot[5][2] ), .Y(n18) );
  MX2XL U28 ( .A(\SumTmp[5][4] ), .B(\PartRem[6][4] ), .S0(n18), .Y(
        \PartRem[5][6] ) );
  MX2X1 U29 ( .A(\SumTmp[4][2] ), .B(\PartRem[5][2] ), .S0(n17), .Y(
        \PartRem[4][4] ) );
  MXI2XL U30 ( .A(\PartRem[2][3] ), .B(\SumTmp[1][3] ), .S0(root[1]), .Y(n56)
         );
  MXI2XL U31 ( .A(\PartRem[2][7] ), .B(\SumTmp[1][7] ), .S0(root[1]), .Y(n45)
         );
  BUFX20 U33 ( .A(\PartRoot[4][2] ), .Y(n17) );
  BUFX20 U34 ( .A(\PartRoot[7][2] ), .Y(n20) );
  XNOR2X2 U35 ( .A(n19), .B(\PartRem[7][0] ), .Y(\PartRem[6][2] ) );
  NAND2X2 U36 ( .A(\PartRem[11][0] ), .B(n30), .Y(n5) );
  INVX16 U37 ( .A(n7), .Y(\PartRoot[9][2] ) );
  BUFX16 U38 ( .A(\PartRoot[2][2] ), .Y(n15) );
  BUFX12 U41 ( .A(\PartRoot[6][2] ), .Y(n19) );
  AND2X8 U42 ( .A(n31), .B(\CryTmp[10][2] ), .Y(root[10]) );
  OAI21X2 U43 ( .A0(n57), .A1(n58), .B0(n59), .Y(n54) );
  OAI21X4 U44 ( .A0(n16), .A1(\PartRem[4][0] ), .B0(\PartRem[4][1] ), .Y(n68)
         );
  MX2X1 U45 ( .A(\SumTmp[2][3] ), .B(\PartRem[3][3] ), .S0(n15), .Y(
        \PartRem[2][5] ) );
  MX2XL U46 ( .A(\SumTmp[2][4] ), .B(n1), .S0(n15), .Y(\PartRem[2][6] ) );
  INVXL U47 ( .A(n60), .Y(n22) );
  NAND2X1 U48 ( .A(\PartRem[2][0] ), .B(n60), .Y(n62) );
  OAI21X2 U49 ( .A0(n60), .A1(\PartRem[2][0] ), .B0(\PartRem[2][1] ), .Y(n64)
         );
  NOR2X2 U50 ( .A(\PartRem[11][0] ), .B(n30), .Y(n79) );
  XNOR2X4 U51 ( .A(n15), .B(\PartRem[3][0] ), .Y(\PartRem[2][2] ) );
  OAI21X2 U52 ( .A0(\CryTmp[2][2] ), .A1(n15), .B0(n69), .Y(\PartRem[2][3] )
         );
  OAI21X2 U53 ( .A0(n15), .A1(\PartRem[3][0] ), .B0(\PartRem[3][1] ), .Y(n69)
         );
  MX2XL U54 ( .A(\SumTmp[8][3] ), .B(\PartRem[9][3] ), .S0(n21), .Y(
        \PartRem[8][5] ) );
  OAI21X4 U55 ( .A0(n17), .A1(\PartRem[5][0] ), .B0(\PartRem[5][1] ), .Y(n67)
         );
  OAI21X1 U56 ( .A0(n21), .A1(\PartRem[9][0] ), .B0(\PartRem[9][1] ), .Y(n73)
         );
  MX2XL U57 ( .A(\SumTmp[5][2] ), .B(\PartRem[6][2] ), .S0(n18), .Y(
        \PartRem[5][4] ) );
  OA21X2 U58 ( .A0(n20), .A1(\PartRem[8][0] ), .B0(\PartRem[8][1] ), .Y(n11)
         );
  MX2XL U60 ( .A(\SumTmp[7][3] ), .B(\PartRem[8][3] ), .S0(n20), .Y(
        \PartRem[7][5] ) );
  XNOR2X4 U61 ( .A(\PartRoot[9][2] ), .B(\PartRem[10][0] ), .Y(\PartRem[9][2] ) );
  AOI2BB1X1 U62 ( .A0N(\CryTmp[6][2] ), .A1N(n19), .B0(n9), .Y(n8) );
  OA21X2 U63 ( .A0(n19), .A1(\PartRem[7][0] ), .B0(\PartRem[7][1] ), .Y(n9) );
  MXI2X4 U64 ( .A(\PartRem[2][2] ), .B(\SumTmp[1][2] ), .S0(root[1]), .Y(n58)
         );
  XNOR2X4 U65 ( .A(n20), .B(\PartRem[8][0] ), .Y(\PartRem[7][2] ) );
  OA22X2 U66 ( .A0(root[5]), .A1(n2), .B0(n52), .B1(n53), .Y(n49) );
  XNOR2X4 U67 ( .A(n17), .B(\PartRem[5][0] ), .Y(\PartRem[4][2] ) );
  MX2XL U68 ( .A(\SumTmp[3][3] ), .B(\PartRem[4][3] ), .S0(n16), .Y(
        \PartRem[3][5] ) );
  OA21X4 U69 ( .A0(n37), .A1(n38), .B0(n39), .Y(n33) );
  OAI2BB1XL U70 ( .A0N(n38), .A1N(n37), .B0(n30), .Y(n39) );
  OA21X4 U71 ( .A0(n49), .A1(n50), .B0(n51), .Y(n46) );
  OAI2BB1XL U72 ( .A0N(n50), .A1N(n49), .B0(n19), .Y(n51) );
  OAI2BB1XL U73 ( .A0N(n62), .A1N(n61), .B0(n15), .Y(n63) );
  OA21X4 U74 ( .A0(n61), .A1(n62), .B0(n63), .Y(n57) );
  OAI21X2 U75 ( .A0(n46), .A1(n47), .B0(n48), .Y(n43) );
  OAI21X1 U76 ( .A0(n18), .A1(\PartRem[6][0] ), .B0(\PartRem[6][1] ), .Y(n66)
         );
  OAI2BB1X4 U77 ( .A0N(n34), .A1N(n33), .B0(n31), .Y(n35) );
  MX2XL U78 ( .A(\SumTmp[5][6] ), .B(\PartRem[6][6] ), .S0(n18), .Y(
        \PartRem[5][8] ) );
  MX2XL U79 ( .A(\SumTmp[2][9] ), .B(\PartRem[3][9] ), .S0(n15), .Y(
        \PartRem[2][11] ) );
  MX2XL U81 ( .A(\SumTmp[2][7] ), .B(\PartRem[3][7] ), .S0(n15), .Y(
        \PartRem[2][9] ) );
  OAI211X4 U82 ( .A0(n33), .A1(n34), .B0(n35), .C0(n36), .Y(root[0]) );
  AOI2BB1X2 U83 ( .A0N(\CryTmp[7][2] ), .A1N(n20), .B0(n11), .Y(n10) );
  INVX3 U84 ( .A(n10), .Y(\PartRem[7][3] ) );
  MX2XL U85 ( .A(\SumTmp[4][6] ), .B(\PartRem[5][6] ), .S0(n17), .Y(
        \PartRem[4][8] ) );
  MX2XL U86 ( .A(\SumTmp[3][7] ), .B(\PartRem[4][7] ), .S0(n16), .Y(
        \PartRem[3][9] ) );
  MX2XL U87 ( .A(\SumTmp[2][8] ), .B(\PartRem[3][8] ), .S0(n15), .Y(
        \PartRem[2][10] ) );
  MXI2XL U88 ( .A(\PartRem[2][8] ), .B(\SumTmp[1][8] ), .S0(root[1]), .Y(n42)
         );
  NOR2BX4 U89 ( .AN(n72), .B(\CryTmp[4][9] ), .Y(\PartRoot[4][2] ) );
  NOR2BX4 U90 ( .AN(n70), .B(\CryTmp[2][11] ), .Y(\PartRoot[2][2] ) );
  INVXL U91 ( .A(n17), .Y(root[4]) );
  NOR2BX4 U92 ( .AN(n71), .B(\CryTmp[3][10] ), .Y(\PartRoot[3][2] ) );
  NOR2BX4 U93 ( .AN(n75), .B(\CryTmp[6][7] ), .Y(\PartRoot[6][2] ) );
  INVXL U94 ( .A(n19), .Y(root[6]) );
  NOR2BX4 U95 ( .AN(n74), .B(\CryTmp[5][8] ), .Y(\PartRoot[5][2] ) );
  MXI2XL U96 ( .A(\SumTmp[2][10] ), .B(\PartRem[3][10] ), .S0(n15), .Y(n65) );
  NOR2BX4 U97 ( .AN(n76), .B(\CryTmp[7][6] ), .Y(\PartRoot[7][2] ) );
  MXI2XL U98 ( .A(\PartRem[2][4] ), .B(\SumTmp[1][4] ), .S0(root[1]), .Y(n53)
         );
  MX2XL U99 ( .A(\SumTmp[6][5] ), .B(\PartRem[7][5] ), .S0(n19), .Y(
        \PartRem[6][7] ) );
  MX2XL U100 ( .A(\SumTmp[7][4] ), .B(\PartRem[8][4] ), .S0(n20), .Y(
        \PartRem[7][6] ) );
  NOR2BX4 U101 ( .AN(n77), .B(\CryTmp[8][5] ), .Y(\PartRoot[8][2] ) );
  MXI2XL U102 ( .A(\PartRem[2][5] ), .B(\SumTmp[1][5] ), .S0(root[1]), .Y(n50)
         );
  AO21X4 U103 ( .A0(\SumTmp[10][2] ), .A1(root[10]), .B0(\CryTmp[9][4] ), .Y(
        n7) );
  MX2XL U104 ( .A(\SumTmp[6][2] ), .B(\PartRem[7][2] ), .S0(n19), .Y(
        \PartRem[6][4] ) );
  MX2XL U105 ( .A(\SumTmp[2][2] ), .B(\PartRem[3][2] ), .S0(n15), .Y(
        \PartRem[2][4] ) );
  MX2XL U106 ( .A(\SumTmp[8][2] ), .B(\PartRem[9][2] ), .S0(n21), .Y(
        \PartRem[8][4] ) );
  MX2XL U107 ( .A(\SumTmp[9][2] ), .B(\PartRem[10][2] ), .S0(\PartRoot[9][2] ), 
        .Y(\PartRem[9][4] ) );
  XNOR2X2 U109 ( .A(n21), .B(\PartRem[9][0] ), .Y(\PartRem[8][2] ) );
  CLKINVX1 U112 ( .A(n18), .Y(root[5]) );
  CLKINVX1 U113 ( .A(n21), .Y(root[8]) );
  CLKINVX1 U115 ( .A(n20), .Y(root[7]) );
  OAI2BB1X1 U116 ( .A0N(n47), .A1N(n46), .B0(n20), .Y(n48) );
  CLKINVX1 U117 ( .A(\PartRoot[9][2] ), .Y(root[9]) );
  XOR2X1 U118 ( .A(n31), .B(\CryTmp[10][2] ), .Y(\SumTmp[10][2] ) );
  OAI2BB1X1 U119 ( .A0N(n58), .A1N(n57), .B0(n16), .Y(n59) );
  NOR2BX4 U120 ( .AN(n65), .B(\CryTmp[1][12] ), .Y(n60) );
  OAI21X1 U121 ( .A0(\CryTmp[3][2] ), .A1(n16), .B0(n68), .Y(\PartRem[3][3] )
         );
  MXI2X1 U122 ( .A(\PartRem[2][11] ), .B(\SumTmp[1][11] ), .S0(root[1]), .Y(
        n36) );
  MXI2X1 U123 ( .A(\PartRem[2][10] ), .B(\SumTmp[1][10] ), .S0(root[1]), .Y(
        n34) );
  MXI2X1 U124 ( .A(\PartRem[2][9] ), .B(\SumTmp[1][9] ), .S0(root[1]), .Y(n38)
         );
  NOR2X1 U126 ( .A(n21), .B(n43), .Y(n44) );
  MXI2X1 U127 ( .A(\PartRem[2][6] ), .B(\SumTmp[1][6] ), .S0(root[1]), .Y(n47)
         );
  CLKINVX1 U128 ( .A(n15), .Y(root[2]) );
  CLKMX2X2 U129 ( .A(\SumTmp[3][8] ), .B(\PartRem[4][8] ), .S0(n16), .Y(
        \PartRem[3][10] ) );
  CLKMX2X2 U130 ( .A(\SumTmp[3][5] ), .B(\PartRem[4][5] ), .S0(n16), .Y(
        \PartRem[3][7] ) );
  CLKMX2X2 U131 ( .A(\SumTmp[4][3] ), .B(\PartRem[5][3] ), .S0(n17), .Y(
        \PartRem[4][5] ) );
  CLKMX2X2 U132 ( .A(\SumTmp[2][6] ), .B(\PartRem[3][6] ), .S0(n15), .Y(
        \PartRem[2][8] ) );
  CLKMX2X2 U133 ( .A(\SumTmp[3][4] ), .B(\PartRem[4][4] ), .S0(n16), .Y(
        \PartRem[3][6] ) );
  CLKMX2X2 U134 ( .A(\SumTmp[2][5] ), .B(\PartRem[3][5] ), .S0(n15), .Y(
        \PartRem[2][7] ) );
  CLKMX2X2 U135 ( .A(\SumTmp[4][5] ), .B(\PartRem[5][5] ), .S0(n17), .Y(
        \PartRem[4][7] ) );
  MXI2X1 U136 ( .A(\PartRem[4][9] ), .B(\SumTmp[3][9] ), .S0(root[3]), .Y(n70)
         );
  CLKMX2X2 U137 ( .A(\SumTmp[5][5] ), .B(\PartRem[6][5] ), .S0(n18), .Y(
        \PartRem[5][7] ) );
  CLKMX2X2 U138 ( .A(\SumTmp[6][3] ), .B(\PartRem[7][3] ), .S0(n19), .Y(
        \PartRem[6][5] ) );
  CLKMX2X2 U139 ( .A(\SumTmp[3][6] ), .B(\PartRem[4][6] ), .S0(n16), .Y(
        \PartRem[3][8] ) );
  MXI2X1 U140 ( .A(\PartRem[5][8] ), .B(\SumTmp[4][8] ), .S0(root[4]), .Y(n71)
         );
  CLKMX2X2 U141 ( .A(\SumTmp[4][4] ), .B(\PartRem[5][4] ), .S0(n17), .Y(
        \PartRem[4][6] ) );
  MXI2X1 U142 ( .A(\PartRem[6][7] ), .B(\SumTmp[5][7] ), .S0(root[5]), .Y(n72)
         );
  MXI2X1 U143 ( .A(\PartRem[7][6] ), .B(\SumTmp[6][6] ), .S0(root[6]), .Y(n74)
         );
  MXI2X1 U144 ( .A(\PartRem[8][5] ), .B(\SumTmp[7][5] ), .S0(root[7]), .Y(n75)
         );
  MXI2X1 U145 ( .A(\PartRem[9][4] ), .B(\SumTmp[8][4] ), .S0(root[8]), .Y(n76)
         );
  MXI2X1 U146 ( .A(\PartRem[10][3] ), .B(\SumTmp[9][3] ), .S0(root[9]), .Y(n77) );
  OR2X1 U147 ( .A(\PartRem[10][1] ), .B(\PartRem[10][0] ), .Y(\CryTmp[9][2] )
         );
  OR2X1 U148 ( .A(\PartRem[9][1] ), .B(\PartRem[9][0] ), .Y(\CryTmp[8][2] ) );
  OR2X1 U149 ( .A(\PartRem[8][1] ), .B(\PartRem[8][0] ), .Y(\CryTmp[7][2] ) );
  OR2X1 U152 ( .A(\PartRem[5][1] ), .B(\PartRem[5][0] ), .Y(\CryTmp[4][2] ) );
  OR2X1 U154 ( .A(\PartRem[3][1] ), .B(\PartRem[3][0] ), .Y(\CryTmp[2][2] ) );
  OR2X1 U155 ( .A(\PartRem[2][1] ), .B(\PartRem[2][0] ), .Y(\CryTmp[1][2] ) );
  geofence_DW01_absval_0 u_absval_AInt ( .A({a[22:2], 1'b0, 1'b0}), .ABSVAL({
        \PartRem[12][0] , \PartRem[11][1] , \PartRem[11][0] , \PartRem[10][1] , 
        \PartRem[10][0] , \PartRem[9][1] , \PartRem[9][0] , \PartRem[8][1] , 
        \PartRem[8][0] , \PartRem[7][1] , \PartRem[7][0] , \PartRem[6][1] , 
        \PartRem[6][0] , \PartRem[5][1] , \PartRem[5][0] , \PartRem[4][1] , 
        \PartRem[4][0] , \PartRem[3][1] , \PartRem[3][0] , \PartRem[2][1] , 
        \PartRem[2][0] , SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1}) );
  ADDFX1 u_fa_PartRem_3_4 ( .A(\PartRem[4][4] ), .B(n19), .CI(\CryTmp[3][4] ), 
        .CO(\CryTmp[3][5] ), .S(\SumTmp[3][4] ) );
  ADDFX1 u_fa_PartRem_7_4 ( .A(\PartRem[8][4] ), .B(n30), .CI(\CryTmp[7][4] ), 
        .CO(\CryTmp[7][5] ), .S(\SumTmp[7][4] ) );
  CMPR32X2 u_fa_PartRem_6_5 ( .A(\PartRem[7][5] ), .B(n30), .C(\CryTmp[6][5] ), 
        .CO(\CryTmp[6][6] ), .S(\SumTmp[6][5] ) );
  ADDFX1 u_fa_PartRem_5_6 ( .A(\PartRem[6][6] ), .B(n30), .CI(\CryTmp[5][6] ), 
        .CO(\CryTmp[5][7] ), .S(\SumTmp[5][6] ) );
  ADDFX1 u_fa_PartRem_4_7 ( .A(\PartRem[5][7] ), .B(n30), .CI(\CryTmp[4][7] ), 
        .CO(\CryTmp[4][8] ), .S(\SumTmp[4][7] ) );
  ADDFX1 u_fa_PartRem_3_8 ( .A(\PartRem[4][8] ), .B(n30), .CI(\CryTmp[3][8] ), 
        .CO(\CryTmp[3][9] ), .S(\SumTmp[3][8] ) );
  ADDFX1 u_fa_PartRem_1_10 ( .A(\PartRem[2][10] ), .B(n30), .CI(
        \CryTmp[1][10] ), .CO(\CryTmp[1][11] ), .S(\SumTmp[1][10] ) );
  ADDFX1 u_fa_PartRem_2_7 ( .A(\PartRem[3][7] ), .B(n21), .CI(\CryTmp[2][7] ), 
        .CO(\CryTmp[2][8] ), .S(\SumTmp[2][7] ) );
  OAI21X1 U15 ( .A0(\CryTmp[8][2] ), .A1(n21), .B0(n73), .Y(\PartRem[8][3] )
         );
  OAI21X1 U13 ( .A0(\CryTmp[5][2] ), .A1(n18), .B0(n66), .Y(\PartRem[5][3] )
         );
  INVX16 U110 ( .A(\PartRem[12][0] ), .Y(n31) );
  OR2X1 U150 ( .A(\PartRem[7][1] ), .B(\PartRem[7][0] ), .Y(\CryTmp[6][2] ) );
  BUFX4 U17 ( .A(n22), .Y(root[1]) );
  OR2X1 U3 ( .A(\PartRem[4][1] ), .B(\PartRem[4][0] ), .Y(\CryTmp[3][2] ) );
  OR2X1 U32 ( .A(\PartRem[6][1] ), .B(\PartRem[6][0] ), .Y(\CryTmp[5][2] ) );
  OAI21X1 U39 ( .A0(\CryTmp[4][2] ), .A1(n17), .B0(n67), .Y(\PartRem[4][3] )
         );
  MX2X1 U40 ( .A(\SumTmp[6][4] ), .B(\PartRem[7][4] ), .S0(n19), .Y(
        \PartRem[6][6] ) );
  MX2X1 U59 ( .A(\SumTmp[4][7] ), .B(\PartRem[5][7] ), .S0(n17), .Y(
        \PartRem[4][9] ) );
  INVXL U80 ( .A(n16), .Y(root[3]) );
  AOI2BB2X1 U108 ( .B0(n21), .B1(n43), .A0N(n44), .A1N(n45), .Y(n40) );
  XNOR2X1 U111 ( .A(n18), .B(\PartRem[6][0] ), .Y(\PartRem[5][2] ) );
  INVX20 U114 ( .A(root[10]), .Y(n30) );
  NOR2X2 U125 ( .A(n17), .B(n54), .Y(n55) );
endmodule


module geofence_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [23:0] carry;

  ADDFXL U2_3 ( .A(A[3]), .B(n24), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFXL U2_21 ( .A(A[21]), .B(n6), .CI(carry[21]), .CO(carry[22]), .S(
        DIFF[21]) );
  XOR3XL U2_22 ( .A(A[22]), .B(n6), .C(carry[22]), .Y(DIFF[22]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n25), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_5 ( .A(A[5]), .B(n22), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFXL U2_9 ( .A(A[9]), .B(n18), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n19), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFHX2 U2_18 ( .A(A[18]), .B(n9), .CI(carry[18]), .CO(carry[19]), .S(
        DIFF[18]) );
  ADDFHX1 U2_11 ( .A(A[11]), .B(n16), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFHX1 U2_12 ( .A(A[12]), .B(n15), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n23), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_20 ( .A(A[20]), .B(n7), .CI(carry[20]), .CO(carry[21]), .S(
        DIFF[20]) );
  ADDFXL U2_13 ( .A(A[13]), .B(n14), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n21), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFXL U2_15 ( .A(A[15]), .B(n12), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFXL U2_10 ( .A(A[10]), .B(n17), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFHX2 U2_7 ( .A(A[7]), .B(n20), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFHX2 U2_14 ( .A(A[14]), .B(n13), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFHX2 U2_17 ( .A(A[17]), .B(n10), .CI(carry[17]), .CO(carry[18]), .S(
        DIFF[17]) );
  ADDFHX2 U2_16 ( .A(A[16]), .B(n11), .CI(carry[16]), .CO(carry[17]), .S(
        DIFF[16]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n26), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  CLKINVX1 U1 ( .A(B[17]), .Y(n10) );
  NAND2BX1 U2 ( .AN(B[19]), .B(carry[19]), .Y(n2) );
  NAND3X1 U3 ( .A(n2), .B(n3), .C(n4), .Y(carry[20]) );
  INVX1 U4 ( .A(B[16]), .Y(n11) );
  NAND2X1 U5 ( .A(A[19]), .B(carry[19]), .Y(n3) );
  INVXL U6 ( .A(B[6]), .Y(n21) );
  XOR2X1 U7 ( .A(n8), .B(A[19]), .Y(n1) );
  XOR2X1 U8 ( .A(carry[19]), .B(n1), .Y(DIFF[19]) );
  INVXL U10 ( .A(B[3]), .Y(n24) );
  INVX1 U11 ( .A(B[20]), .Y(n7) );
  INVXL U12 ( .A(B[7]), .Y(n20) );
  INVXL U13 ( .A(B[0]), .Y(n27) );
  INVXL U14 ( .A(B[4]), .Y(n23) );
  INVXL U15 ( .A(B[1]), .Y(n26) );
  NAND2XL U16 ( .A(B[0]), .B(n5), .Y(carry[1]) );
  XNOR2X1 U17 ( .A(n27), .B(A[0]), .Y(DIFF[0]) );
  INVXL U18 ( .A(B[22]), .Y(n6) );
  INVXL U19 ( .A(B[13]), .Y(n14) );
  INVXL U20 ( .A(B[14]), .Y(n13) );
  INVXL U21 ( .A(B[15]), .Y(n12) );
  INVXL U22 ( .A(B[10]), .Y(n17) );
  INVXL U23 ( .A(B[11]), .Y(n16) );
  INVXL U24 ( .A(B[12]), .Y(n15) );
  INVXL U25 ( .A(B[8]), .Y(n19) );
  INVXL U26 ( .A(B[9]), .Y(n18) );
  INVXL U27 ( .A(B[5]), .Y(n22) );
  INVXL U28 ( .A(B[18]), .Y(n9) );
  CLKINVX1 U29 ( .A(B[19]), .Y(n8) );
  INVXL U30 ( .A(B[2]), .Y(n25) );
  INVXL U31 ( .A(A[0]), .Y(n5) );
  NAND2XL U9 ( .A(A[19]), .B(n8), .Y(n4) );
endmodule


module geofence_DW01_add_0 ( A, B, CI, SUM, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4;
  wire   [22:1] carry;

  ADDFXL U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  XOR3XL U1_22 ( .A(A[22]), .B(B[22]), .C(carry[22]), .Y(SUM[22]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX2 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFX2 U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  ADDFXL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFHX1 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFHX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFHX1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  XOR3XL U1 ( .A(carry[17]), .B(A[17]), .C(B[17]), .Y(SUM[17]) );
  AND2X1 U3 ( .A(B[0]), .B(A[0]), .Y(n1) );
  NAND2X1 U4 ( .A(A[17]), .B(carry[17]), .Y(n3) );
  NAND2XL U5 ( .A(A[17]), .B(B[17]), .Y(n4) );
  XOR2X1 U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  ADDFXL U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  ADDFX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  NAND2X1 U2 ( .A(B[17]), .B(carry[17]), .Y(n2) );
  NAND3X1 U6 ( .A(n2), .B(n3), .C(n4), .Y(carry[18]) );
endmodule


module geofence_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFHX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFHX2 U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n4), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n11), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  INVXL U1 ( .A(A[0]), .Y(n1) );
  XNOR2X1 U2 ( .A(n2), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U3 ( .A(B[3]), .Y(n5) );
  CLKINVX1 U4 ( .A(B[5]), .Y(n7) );
  CLKINVX1 U5 ( .A(B[7]), .Y(n9) );
  CLKINVX1 U6 ( .A(B[1]), .Y(n3) );
  NAND2X1 U7 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U8 ( .A(B[2]), .Y(n4) );
  CLKINVX1 U9 ( .A(B[4]), .Y(n6) );
  INVXL U11 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U12 ( .A(B[9]), .Y(n11) );
  CLKINVX1 U13 ( .A(B[8]), .Y(n10) );
  ADDFXL U2_1 ( .A(A[1]), .B(n3), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  CMPR32X2 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n8), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  INVXL U10 ( .A(B[6]), .Y(n8) );
  INVXL U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n3), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n8), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n4), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  CLKINVX1 U1 ( .A(B[2]), .Y(n4) );
  INVX1 U2 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(B[6]), .Y(n8) );
  NAND2BX1 U5 ( .AN(n2), .B(n1), .Y(carry[1]) );
  CLKINVX1 U6 ( .A(B[1]), .Y(n3) );
  CLKINVX1 U7 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U8 ( .A(B[8]), .Y(n10) );
  XNOR2XL U9 ( .A(n2), .B(A[0]), .Y(DIFF[0]) );
  XNOR2X1 U10 ( .A(A[10]), .B(carry[10]), .Y(DIFF[10]) );
  CLKINVX1 U11 ( .A(B[3]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[5]), .Y(n7) );
  CLKINVX1 U13 ( .A(B[7]), .Y(n9) );
  CLKINVX1 U14 ( .A(B[9]), .Y(n11) );
  ADDFXL U2_9 ( .A(A[9]), .B(n11), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  INVXL U3 ( .A(B[4]), .Y(n6) );
endmodule


module geofence_DW01_add_1 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;

  wire   [11:1] carry;

  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X1 U3 ( .A(B[0]), .B(A[0]), .Y(carry[1]) );
  ADDFX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  CLKAND2X3 U1 ( .A(A[10]), .B(carry[10]), .Y(SUM[11]) );
  CLKXOR2X2 U2 ( .A(A[10]), .B(carry[10]), .Y(SUM[10]) );
endmodule


module geofence_DW_mult_tc_0 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n25, n26, n27, n28, n29, n30, n32, n33, n34,
         n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n115, n116, n117,
         n118, n119, n120, n121, n122, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n355, n357, n358, n359, n360, n361,
         n363, n364, n365, n366, n369, n370, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466;

  ADDFXL U26 ( .A(n30), .B(n125), .CI(n115), .CO(n26), .S(n27) );
  ADDFXL U27 ( .A(n377), .B(n116), .CI(n32), .CO(n28), .S(n29) );
  CMPR42X1 U29 ( .A(n136), .B(n126), .C(n38), .D(n117), .ICI(n35), .S(n34), 
        .ICO(n32), .CO(n33) );
  CMPR42X1 U30 ( .A(n127), .B(n118), .C(n379), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  CMPR42X1 U32 ( .A(n137), .B(n128), .C(n44), .D(n48), .ICI(n45), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U33 ( .A(n50), .B(n146), .CI(n119), .CO(n43), .S(n44) );
  CMPR42X1 U34 ( .A(n382), .B(n55), .C(n56), .D(n49), .ICI(n52), .S(n47), 
        .ICO(n45), .CO(n46) );
  CMPR42X1 U37 ( .A(n139), .B(n130), .C(n57), .D(n62), .ICI(n58), .S(n54), 
        .ICO(n52), .CO(n53) );
  CMPR42X1 U38 ( .A(n157), .B(n121), .C(n64), .D(n147), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  CMPR42X1 U39 ( .A(n380), .B(n69), .C(n70), .D(n63), .ICI(n66), .S(n60), 
        .ICO(n58), .CO(n59) );
  CMPR42X1 U40 ( .A(n131), .B(n158), .C(n148), .D(n122), .ICI(n72), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U42 ( .A(n140), .B(n73), .C(n78), .D(n71), .ICI(n74), .S(n68), 
        .ICO(n66), .CO(n67) );
  CMPR42X1 U43 ( .A(n159), .B(n108), .C(n149), .D(n132), .ICI(n77), .S(n71), 
        .ICO(n69), .CO(n70) );
  CMPR42X1 U46 ( .A(n150), .B(n85), .C(n79), .D(n83), .ICI(n80), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDFXL U49 ( .A(n142), .B(n151), .CI(n161), .CO(n83), .S(n84) );
  OAI22XL U268 ( .A0(n446), .A1(n466), .B0(n374), .B1(n447), .Y(n133) );
  XOR2X1 U269 ( .A(b[8]), .B(n384), .Y(n427) );
  OAI2BB1XL U272 ( .A0N(a[5]), .A1N(n387), .B0(n363), .Y(n369) );
  XOR2XL U273 ( .A(b[3]), .B(n384), .Y(n422) );
  XOR2X1 U275 ( .A(n378), .B(b[0]), .Y(n445) );
  XOR2X1 U276 ( .A(b[10]), .B(a[1]), .Y(n395) );
  ADDHX1 U277 ( .A(n177), .B(n167), .CO(n106), .S(n107) );
  OAI22XL U278 ( .A0(n410), .A1(n394), .B0(n411), .B1(n386), .Y(n177) );
  OAI22XL U280 ( .A0(n411), .A1(n394), .B0(n412), .B1(n386), .Y(n176) );
  OAI22XL U281 ( .A0(n447), .A1(n466), .B0(n374), .B1(n448), .Y(n132) );
  ADDFXL U282 ( .A(n129), .B(n120), .CI(n138), .CO(n48), .S(n49) );
  OAI21XL U283 ( .A0(b[0]), .A1(n385), .B0(n394), .Y(n113) );
  CMPR42X1 U284 ( .A(n145), .B(n174), .C(n164), .D(n154), .ICI(n102), .S(n99), 
        .ICO(n97), .CO(n98) );
  XOR2X1 U285 ( .A(b[1]), .B(n384), .Y(n420) );
  XNOR2XL U286 ( .A(b[2]), .B(a[5]), .Y(n431) );
  XNOR2XL U287 ( .A(b[4]), .B(a[5]), .Y(n433) );
  XOR2X1 U288 ( .A(b[2]), .B(n384), .Y(n421) );
  OAI22XL U290 ( .A0(n413), .A1(n394), .B0(n414), .B1(n386), .Y(n174) );
  NOR2XL U291 ( .A(n375), .B(n458), .Y(n118) );
  OAI21XL U292 ( .A0(n466), .A1(n445), .B0(n366), .Y(n134) );
  XOR2X1 U293 ( .A(b[4]), .B(n384), .Y(n423) );
  XOR3XL U294 ( .A(n25), .B(n4), .C(n388), .Y(product[21]) );
  OAI22XL U295 ( .A0(n439), .A1(n355), .B0(n397), .B1(n440), .Y(n143) );
  NOR2XL U296 ( .A(n375), .B(n461), .Y(n115) );
  OAI22XL U297 ( .A0(n412), .A1(n394), .B0(n413), .B1(n386), .Y(n175) );
  OAI22XL U298 ( .A0(n466), .A1(n453), .B0(n405), .B1(n407), .Y(n126) );
  NOR2X1 U300 ( .A(n375), .B(n460), .Y(n116) );
  OAI22XL U302 ( .A0(n409), .A1(n394), .B0(n410), .B1(n386), .Y(n178) );
  ADDFX2 U303 ( .A(n60), .B(n67), .CI(n13), .CO(n12), .S(product[12]) );
  ADDFHX2 U304 ( .A(n42), .B(n46), .CI(n10), .CO(n9), .S(product[15]) );
  XNOR2X4 U307 ( .A(a[2]), .B(a[1]), .Y(n418) );
  XOR2X1 U311 ( .A(n384), .B(b[0]), .Y(n419) );
  XOR2XL U314 ( .A(b[9]), .B(n384), .Y(n428) );
  XOR2XL U315 ( .A(b[5]), .B(n384), .Y(n424) );
  OAI32X1 U316 ( .A0(n384), .A1(b[0]), .A2(n418), .B0(n384), .B1(n357), .Y(
        n112) );
  ADDHX1 U317 ( .A(n144), .B(n110), .CO(n95), .S(n96) );
  OAI22XL U318 ( .A0(b[0]), .A1(n394), .B0(n409), .B1(n386), .Y(n179) );
  XNOR2X4 U319 ( .A(n376), .B(a[9]), .Y(n393) );
  XOR2X1 U321 ( .A(b[1]), .B(n385), .Y(n409) );
  NOR2XL U323 ( .A(n374), .B(n387), .Y(n135) );
  OAI2BB2XL U325 ( .B0(n373), .B1(n430), .A0N(n369), .A1N(n370), .Y(n155) );
  NAND2X1 U326 ( .A(n360), .B(n361), .Y(n448) );
  NAND2X1 U327 ( .A(b[3]), .B(a[9]), .Y(n360) );
  XOR2X1 U328 ( .A(b[9]), .B(n385), .Y(n417) );
  XOR2X1 U329 ( .A(b[3]), .B(n385), .Y(n411) );
  XOR2X1 U331 ( .A(b[5]), .B(n385), .Y(n413) );
  XOR2X1 U332 ( .A(b[6]), .B(n385), .Y(n414) );
  INVX3 U335 ( .A(a[1]), .Y(n385) );
  XOR2X1 U336 ( .A(b[4]), .B(n385), .Y(n412) );
  XOR2X1 U337 ( .A(b[1]), .B(n383), .Y(n430) );
  BUFX4 U338 ( .A(n399), .Y(n373) );
  BUFX4 U339 ( .A(n405), .Y(n374) );
  ADDFXL U340 ( .A(n105), .B(n106), .CI(n21), .CO(n20), .S(product[4]) );
  XOR2X1 U341 ( .A(b[2]), .B(n385), .Y(n410) );
  ADDFXL U343 ( .A(n101), .B(n104), .CI(n20), .CO(n19), .S(product[5]) );
  ADDFX2 U344 ( .A(n28), .B(n27), .CI(n6), .CO(n5), .S(product[19]) );
  ADDFXL U345 ( .A(n94), .B(n98), .CI(n18), .CO(n17), .S(product[7]) );
  ADDFXL U346 ( .A(n47), .B(n53), .CI(n11), .CO(n10), .S(product[14]) );
  ADDFX2 U347 ( .A(n89), .B(n93), .CI(n17), .CO(n16), .S(product[8]) );
  ADDFX2 U348 ( .A(n100), .B(n99), .CI(n19), .CO(n18), .S(product[6]) );
  ADDFHX2 U349 ( .A(n54), .B(n59), .CI(n12), .CO(n11), .S(product[13]) );
  ADDFXL U350 ( .A(n26), .B(n25), .CI(n5), .CO(n4), .S(product[20]) );
  OAI32XL U352 ( .A0(n378), .A1(b[0]), .A2(n374), .B0(n378), .B1(n466), .Y(
        n109) );
  OAI22XL U354 ( .A0(n448), .A1(n466), .B0(n374), .B1(n449), .Y(n131) );
  NAND2X6 U355 ( .A(n418), .B(n462), .Y(n357) );
  OAI22XL U357 ( .A0(n428), .A1(n357), .B0(n418), .B1(n429), .Y(n158) );
  XOR2X1 U358 ( .A(b[4]), .B(n381), .Y(n442) );
  XNOR2X1 U360 ( .A(a[8]), .B(a[7]), .Y(n405) );
  CMPR42X1 U361 ( .A(n162), .B(n143), .C(n95), .D(n92), .ICI(n91), .S(n89), 
        .ICO(n87), .CO(n88) );
  ADDFXL U362 ( .A(n76), .B(n81), .CI(n15), .CO(n14), .S(product[10]) );
  OAI22XL U363 ( .A0(n430), .A1(n402), .B0(n373), .B1(n431), .Y(n154) );
  ADDFXL U364 ( .A(n68), .B(n75), .CI(n14), .CO(n13), .S(product[11]) );
  ADDFX2 U365 ( .A(n178), .B(n168), .CI(n23), .CO(n22), .S(product[2]) );
  ADDFX2 U366 ( .A(n29), .B(n33), .CI(n7), .CO(n6), .S(product[18]) );
  INVX4 U368 ( .A(n370), .Y(n402) );
  AND2X4 U369 ( .A(n373), .B(n463), .Y(n370) );
  OAI22XL U370 ( .A0(n422), .A1(n357), .B0(n418), .B1(n423), .Y(n164) );
  NAND2XL U371 ( .A(n359), .B(n378), .Y(n361) );
  CLKINVX1 U372 ( .A(b[3]), .Y(n359) );
  NAND2XL U374 ( .A(n383), .B(b[0]), .Y(n363) );
  NAND2XL U377 ( .A(n364), .B(n365), .Y(n172) );
  XOR2X1 U378 ( .A(b[7]), .B(n385), .Y(n415) );
  XOR2X1 U380 ( .A(b[1]), .B(n381), .Y(n439) );
  OAI32XL U383 ( .A0(n383), .A1(b[0]), .A2(n373), .B0(n383), .B1(n402), .Y(
        n111) );
  ADDFHX4 U384 ( .A(n107), .B(n112), .CI(n22), .CO(n21), .S(product[3]) );
  XNOR2X1 U385 ( .A(a[4]), .B(a[3]), .Y(n399) );
  ADDFHX4 U387 ( .A(n82), .B(n88), .CI(n16), .CO(n15), .S(product[9]) );
  ADDHX1 U388 ( .A(n113), .B(n179), .CO(n23), .S(product[1]) );
  OAI22XL U391 ( .A0(n414), .A1(n394), .B0(n415), .B1(n386), .Y(n173) );
  CMPR42X2 U392 ( .A(n124), .B(n141), .C(n170), .D(n160), .ICI(n133), .S(n79), 
        .ICO(n77), .CO(n78) );
  NOR2X1 U393 ( .A(n375), .B(n387), .Y(n124) );
  ADDHX1 U394 ( .A(n134), .B(n109), .CO(n85), .S(n86) );
  XNOR2X4 U395 ( .A(a[6]), .B(a[5]), .Y(n397) );
  NOR2XL U396 ( .A(n375), .B(n455), .Y(n121) );
  NOR2XL U397 ( .A(n375), .B(n454), .Y(n122) );
  XOR2X1 U399 ( .A(b[3]), .B(n381), .Y(n441) );
  XOR2X1 U400 ( .A(b[3]), .B(n383), .Y(n432) );
  XOR2XL U401 ( .A(b[6]), .B(n384), .Y(n425) );
  NAND2BXL U402 ( .AN(n391), .B(n390), .Y(n72) );
  XOR2XL U403 ( .A(b[10]), .B(n384), .Y(n429) );
  INVX1 U404 ( .A(n64), .Y(n380) );
  INVXL U405 ( .A(n50), .Y(n382) );
  CMPR42X2 U406 ( .A(n171), .B(n86), .C(n87), .D(n90), .ICI(n84), .S(n82), 
        .ICO(n80), .CO(n81) );
  NOR2XL U407 ( .A(n375), .B(n456), .Y(n120) );
  OAI2BB1XL U408 ( .A0N(n386), .A1N(n394), .B0(n395), .Y(n391) );
  AO21XL U409 ( .A0(n357), .A1(n418), .B0(n429), .Y(n157) );
  XOR2XL U410 ( .A(b[10]), .B(n383), .Y(n400) );
  INVX1 U411 ( .A(n38), .Y(n379) );
  XOR2XL U412 ( .A(b[10]), .B(n381), .Y(n403) );
  AO21XL U413 ( .A0(n355), .A1(n397), .B0(n403), .Y(n136) );
  NOR2XL U414 ( .A(n375), .B(n459), .Y(n117) );
  XOR2XL U415 ( .A(b[10]), .B(n378), .Y(n406) );
  XOR2XL U416 ( .A(b[10]), .B(a[10]), .Y(n389) );
  NAND2XL U417 ( .A(n389), .B(n393), .Y(n25) );
  XOR2XL U418 ( .A(n381), .B(b[0]), .Y(n438) );
  OAI22XL U419 ( .A0(n419), .A1(n357), .B0(n418), .B1(n420), .Y(n167) );
  XOR2XL U420 ( .A(b[9]), .B(n383), .Y(n401) );
  XOR2XL U421 ( .A(b[7]), .B(n384), .Y(n426) );
  XOR2XL U422 ( .A(b[4]), .B(n378), .Y(n449) );
  XOR2XL U423 ( .A(b[7]), .B(n383), .Y(n436) );
  XOR2XL U424 ( .A(b[8]), .B(n383), .Y(n437) );
  XOR2XL U425 ( .A(b[5]), .B(n383), .Y(n434) );
  NAND2XL U426 ( .A(n392), .B(n393), .Y(n390) );
  XOR2XL U428 ( .A(b[5]), .B(n378), .Y(n450) );
  XOR2XL U431 ( .A(b[6]), .B(n381), .Y(n398) );
  XOR2XL U432 ( .A(b[5]), .B(n381), .Y(n396) );
  XOR2XL U433 ( .A(b[8]), .B(n381), .Y(n444) );
  XOR2XL U434 ( .A(b[2]), .B(n376), .Y(n454) );
  XOR2XL U435 ( .A(b[3]), .B(n376), .Y(n455) );
  XOR2XL U436 ( .A(b[4]), .B(n376), .Y(n456) );
  XOR2XL U437 ( .A(b[9]), .B(n381), .Y(n404) );
  XOR2XL U438 ( .A(b[7]), .B(n378), .Y(n452) );
  XOR2XL U440 ( .A(b[8]), .B(n378), .Y(n453) );
  XOR2XL U441 ( .A(b[9]), .B(n378), .Y(n407) );
  INVX1 U443 ( .A(n30), .Y(n377) );
  XOR2XL U444 ( .A(b[8]), .B(n376), .Y(n460) );
  XOR2XL U445 ( .A(b[7]), .B(n376), .Y(n459) );
  NOR2BX1 U446 ( .AN(n389), .B(n375), .Y(n388) );
  NOR2X1 U447 ( .A(n386), .B(n387), .Y(product[0]) );
  XOR2X1 U448 ( .A(n390), .B(n391), .Y(n73) );
  OAI22XL U449 ( .A0(n396), .A1(n355), .B0(n397), .B1(n398), .Y(n64) );
  OAI22XL U450 ( .A0(n373), .A1(n400), .B0(n401), .B1(n402), .Y(n50) );
  OAI22XL U451 ( .A0(n397), .A1(n403), .B0(n404), .B1(n355), .Y(n38) );
  OAI22XL U452 ( .A0(n374), .A1(n406), .B0(n407), .B1(n466), .Y(n30) );
  OAI22XL U453 ( .A0(n416), .A1(n394), .B0(n417), .B1(n386), .Y(n171) );
  XOR2X1 U454 ( .A(b[8]), .B(n385), .Y(n416) );
  NOR2XL U455 ( .A(n418), .B(n387), .Y(n168) );
  OAI22XL U456 ( .A0(n420), .A1(n357), .B0(n418), .B1(n421), .Y(n166) );
  OAI22XL U457 ( .A0(n421), .A1(n357), .B0(n418), .B1(n422), .Y(n165) );
  OAI22XL U458 ( .A0(n423), .A1(n357), .B0(n418), .B1(n424), .Y(n163) );
  OAI22XL U459 ( .A0(n424), .A1(n357), .B0(n418), .B1(n425), .Y(n162) );
  OAI22XL U460 ( .A0(n425), .A1(n357), .B0(n418), .B1(n426), .Y(n161) );
  NOR2XL U461 ( .A(n373), .B(n387), .Y(n156) );
  OAI22XL U462 ( .A0(n431), .A1(n402), .B0(n373), .B1(n432), .Y(n153) );
  OAI22XL U463 ( .A0(n432), .A1(n402), .B0(n373), .B1(n433), .Y(n152) );
  OAI22XL U464 ( .A0(n433), .A1(n402), .B0(n373), .B1(n434), .Y(n151) );
  OAI22XL U465 ( .A0(n434), .A1(n402), .B0(n373), .B1(n435), .Y(n150) );
  OAI22XL U466 ( .A0(n435), .A1(n402), .B0(n373), .B1(n436), .Y(n149) );
  OAI22XL U467 ( .A0(n436), .A1(n402), .B0(n373), .B1(n437), .Y(n148) );
  OAI22XL U468 ( .A0(n437), .A1(n402), .B0(n373), .B1(n401), .Y(n147) );
  AO21X1 U469 ( .A0(n402), .A1(n373), .B0(n400), .Y(n146) );
  NOR2XL U470 ( .A(n397), .B(n387), .Y(n145) );
  OAI22XL U471 ( .A0(n440), .A1(n355), .B0(n397), .B1(n441), .Y(n142) );
  XOR2X1 U472 ( .A(b[2]), .B(n381), .Y(n440) );
  OAI22XL U473 ( .A0(n441), .A1(n355), .B0(n397), .B1(n442), .Y(n141) );
  OAI22XL U474 ( .A0(n442), .A1(n355), .B0(n397), .B1(n396), .Y(n140) );
  OAI22XL U475 ( .A0(n398), .A1(n355), .B0(n397), .B1(n443), .Y(n139) );
  OAI22XL U476 ( .A0(n443), .A1(n355), .B0(n397), .B1(n444), .Y(n138) );
  OAI22XL U477 ( .A0(n444), .A1(n355), .B0(n397), .B1(n404), .Y(n137) );
  XOR2X1 U478 ( .A(b[2]), .B(n378), .Y(n447) );
  OAI22XL U479 ( .A0(n449), .A1(n466), .B0(n374), .B1(n450), .Y(n130) );
  OAI22XL U480 ( .A0(n450), .A1(n466), .B0(n374), .B1(n451), .Y(n129) );
  OAI22XL U481 ( .A0(n451), .A1(n466), .B0(n374), .B1(n452), .Y(n128) );
  OAI22XL U482 ( .A0(n452), .A1(n466), .B0(n374), .B1(n453), .Y(n127) );
  AO21X1 U483 ( .A0(n466), .A1(n374), .B0(n406), .Y(n125) );
  NOR2X1 U484 ( .A(n375), .B(n457), .Y(n119) );
  XOR2X1 U485 ( .A(b[5]), .B(n376), .Y(n457) );
  XOR2X1 U486 ( .A(b[9]), .B(n376), .Y(n461) );
  XOR2X1 U487 ( .A(a[3]), .B(a[2]), .Y(n462) );
  XOR2X1 U488 ( .A(a[9]), .B(a[8]), .Y(n465) );
  INVX3 U267 ( .A(a[0]), .Y(n386) );
  INVX3 U312 ( .A(a[3]), .Y(n384) );
  NAND2X2 U274 ( .A(a[1]), .B(n386), .Y(n394) );
  XOR2X1 U381 ( .A(a[5]), .B(a[4]), .Y(n463) );
  ADDHX1 U382 ( .A(n155), .B(n111), .CO(n102), .S(n103) );
  INVX3 U270 ( .A(a[7]), .Y(n381) );
  XOR2X1 U389 ( .A(a[7]), .B(a[6]), .Y(n464) );
  NAND2X2 U351 ( .A(n397), .B(n464), .Y(n355) );
  INVX3 U309 ( .A(a[9]), .Y(n378) );
  XOR2X1 U310 ( .A(b[1]), .B(n378), .Y(n446) );
  INVX6 U320 ( .A(a[10]), .Y(n376) );
  OAI22XL U308 ( .A0(n438), .A1(n355), .B0(n397), .B1(n439), .Y(n144) );
  CMPR42X1 U390 ( .A(n173), .B(n153), .C(n163), .D(n97), .ICI(n96), .S(n94), 
        .ICO(n92), .CO(n93) );
  OAI2BB2XL U266 ( .B0(n417), .B1(n394), .A0N(n395), .A1N(a[0]), .Y(n170) );
  OAI22XL U386 ( .A0(n426), .A1(n357), .B0(n418), .B1(n427), .Y(n160) );
  OAI22XL U359 ( .A0(n427), .A1(n357), .B0(n418), .B1(n428), .Y(n159) );
  INVX3 U330 ( .A(a[5]), .Y(n383) );
  OR2X1 U356 ( .A(n416), .B(n386), .Y(n365) );
  OR2X1 U376 ( .A(n415), .B(n394), .Y(n364) );
  OR2X1 U324 ( .A(n374), .B(n446), .Y(n366) );
  OR2X1 U264 ( .A(n376), .B(b[0]), .Y(n358) );
  XOR2X1 U265 ( .A(b[1]), .B(a[10]), .Y(n392) );
  OAI32XL U271 ( .A0(n381), .A1(b[0]), .A2(n397), .B0(n381), .B1(n355), .Y(
        n110) );
  XOR2X1 U279 ( .A(b[6]), .B(n383), .Y(n435) );
  XOR2X1 U289 ( .A(b[6]), .B(n378), .Y(n451) );
  NOR2XL U299 ( .A(n375), .B(n358), .Y(n108) );
  XOR2X1 U301 ( .A(b[7]), .B(n381), .Y(n443) );
  XOR2X1 U305 ( .A(b[6]), .B(n376), .Y(n458) );
  ADDFXL U306 ( .A(n152), .B(n135), .CI(n172), .CO(n90), .S(n91) );
  INVX2 U313 ( .A(n393), .Y(n375) );
  ADDFX1 U322 ( .A(n176), .B(n156), .CI(n166), .CO(n104), .S(n105) );
  CMPR32X2 U333 ( .A(n165), .B(n175), .C(n103), .CO(n100), .S(n101) );
  ADDFXL U334 ( .A(n37), .B(n41), .CI(n9), .CO(n8), .S(product[16]) );
  ADDFX1 U342 ( .A(n36), .B(n34), .CI(n8), .CO(n7), .S(product[17]) );
  NAND2X2 U353 ( .A(n405), .B(n465), .Y(n466) );
  INVX1 U367 ( .A(b[0]), .Y(n387) );
endmodule


module geofence_DW_mult_tc_1 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n25, n26, n27, n28, n29, n30, n32, n33, n34,
         n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n115, n116, n117,
         n118, n119, n120, n121, n122, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n354, n356, n357, n358, n359, n360,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464;

  ADDFXL U26 ( .A(n30), .B(n125), .CI(n115), .CO(n26), .S(n27) );
  ADDFXL U27 ( .A(n373), .B(n116), .CI(n32), .CO(n28), .S(n29) );
  CMPR42X1 U29 ( .A(n136), .B(n126), .C(n38), .D(n117), .ICI(n35), .S(n34), 
        .ICO(n32), .CO(n33) );
  CMPR42X1 U30 ( .A(n127), .B(n118), .C(n375), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  CMPR42X1 U32 ( .A(n137), .B(n128), .C(n44), .D(n48), .ICI(n45), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U33 ( .A(n50), .B(n146), .CI(n119), .CO(n43), .S(n44) );
  CMPR42X1 U34 ( .A(n378), .B(n55), .C(n56), .D(n49), .ICI(n52), .S(n47), 
        .ICO(n45), .CO(n46) );
  CMPR42X1 U37 ( .A(n139), .B(n130), .C(n57), .D(n62), .ICI(n58), .S(n54), 
        .ICO(n52), .CO(n53) );
  CMPR42X1 U38 ( .A(n157), .B(n121), .C(n64), .D(n147), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  CMPR42X1 U39 ( .A(n376), .B(n69), .C(n70), .D(n63), .ICI(n66), .S(n60), 
        .ICO(n58), .CO(n59) );
  CMPR42X1 U40 ( .A(n131), .B(n158), .C(n148), .D(n122), .ICI(n72), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U42 ( .A(n140), .B(n73), .C(n78), .D(n71), .ICI(n74), .S(n68), 
        .ICO(n66), .CO(n67) );
  ADDFXL U49 ( .A(n142), .B(n151), .CI(n161), .CO(n83), .S(n84) );
  XOR2X1 U264 ( .A(b[7]), .B(n380), .Y(n422) );
  NAND2X4 U265 ( .A(n396), .B(n460), .Y(n354) );
  OAI22X1 U266 ( .A0(n410), .A1(n390), .B0(n411), .B1(n382), .Y(n172) );
  CLKXOR2X2 U267 ( .A(b[7]), .B(n381), .Y(n410) );
  OAI22XL U269 ( .A0(n444), .A1(n356), .B0(n401), .B1(n445), .Y(n132) );
  CMPR42X2 U275 ( .A(n171), .B(n86), .C(n87), .D(n90), .ICI(n84), .S(n82), 
        .ICO(n80), .CO(n81) );
  OAI22XL U278 ( .A0(n443), .A1(n356), .B0(n369), .B1(n444), .Y(n133) );
  OAI22X1 U279 ( .A0(n463), .A1(n422), .B0(n413), .B1(n423), .Y(n160) );
  XOR2X1 U280 ( .A(b[8]), .B(n380), .Y(n423) );
  ADDFX1 U285 ( .A(n176), .B(n156), .CI(n166), .CO(n104), .S(n105) );
  NOR2XL U286 ( .A(n396), .B(n383), .Y(n156) );
  ADDFXL U287 ( .A(n129), .B(n120), .CI(n138), .CO(n48), .S(n49) );
  CMPR32X2 U288 ( .A(n152), .B(n135), .C(n172), .CO(n90), .S(n91) );
  NOR2XL U289 ( .A(n369), .B(n383), .Y(n135) );
  BUFX2 U290 ( .A(b[1]), .Y(n357) );
  INVX3 U291 ( .A(a[1]), .Y(n381) );
  XOR2X1 U295 ( .A(b[3]), .B(n374), .Y(n445) );
  XOR2X1 U296 ( .A(b[9]), .B(n380), .Y(n424) );
  XOR2X1 U297 ( .A(b[3]), .B(n381), .Y(n406) );
  XOR2X1 U299 ( .A(b[5]), .B(n380), .Y(n420) );
  NAND2X6 U300 ( .A(n369), .B(n462), .Y(n356) );
  XOR2X1 U303 ( .A(n357), .B(n381), .Y(n404) );
  XOR2X1 U304 ( .A(b[2]), .B(n381), .Y(n405) );
  OAI22XL U305 ( .A0(n407), .A1(n390), .B0(n408), .B1(n382), .Y(n175) );
  OAI22XL U306 ( .A0(n427), .A1(n354), .B0(n396), .B1(n428), .Y(n154) );
  ADDFX2 U308 ( .A(n37), .B(n41), .CI(n9), .CO(n8), .S(product[16]) );
  ADDFX4 U309 ( .A(n28), .B(n27), .CI(n6), .CO(n5), .S(product[19]) );
  XOR2X1 U311 ( .A(n357), .B(n379), .Y(n427) );
  XOR2X1 U312 ( .A(n357), .B(n380), .Y(n416) );
  AND2X2 U313 ( .A(n370), .B(n389), .Y(n124) );
  OAI22XL U314 ( .A0(n428), .A1(n354), .B0(n396), .B1(n429), .Y(n153) );
  OAI22XL U315 ( .A0(n463), .A1(n417), .B0(n413), .B1(n418), .Y(n165) );
  AO21XL U316 ( .A0(n356), .A1(n401), .B0(n402), .Y(n125) );
  OAI22XL U317 ( .A0(n463), .A1(n418), .B0(n413), .B1(n419), .Y(n164) );
  XOR3X1 U318 ( .A(n25), .B(n4), .C(n384), .Y(product[21]) );
  OAI22XL U319 ( .A0(n404), .A1(n390), .B0(n405), .B1(n382), .Y(n178) );
  OAI22XL U320 ( .A0(n464), .A1(n439), .B0(n394), .B1(n392), .Y(n140) );
  OAI21XL U321 ( .A0(n370), .A1(n381), .B0(n390), .Y(n113) );
  AO21XL U322 ( .A0(n463), .A1(n413), .B0(n425), .Y(n157) );
  OAI22XL U326 ( .A0(n416), .A1(n463), .B0(n413), .B1(n417), .Y(n166) );
  OAI22XL U329 ( .A0(n408), .A1(n390), .B0(n409), .B1(n382), .Y(n174) );
  OAI22XL U330 ( .A0(n406), .A1(n390), .B0(n407), .B1(n382), .Y(n176) );
  XOR2X1 U331 ( .A(n357), .B(n374), .Y(n443) );
  XOR2X1 U333 ( .A(b[4]), .B(n374), .Y(n446) );
  ADDHX1 U334 ( .A(n177), .B(n167), .CO(n106), .S(n107) );
  OAI22XL U335 ( .A0(n414), .A1(n463), .B0(n413), .B1(n416), .Y(n167) );
  ADDFXL U336 ( .A(n47), .B(n53), .CI(n11), .CO(n10), .S(product[14]) );
  ADDFXL U337 ( .A(n105), .B(n106), .CI(n21), .CO(n20), .S(product[4]) );
  OAI22XL U339 ( .A0(n420), .A1(n463), .B0(n413), .B1(n421), .Y(n162) );
  ADDFX2 U341 ( .A(n94), .B(n98), .CI(n18), .CO(n17), .S(product[7]) );
  NOR2XL U342 ( .A(n413), .B(n383), .Y(n168) );
  ADDFX2 U343 ( .A(n100), .B(n99), .CI(n19), .CO(n18), .S(product[6]) );
  NOR3X1 U344 ( .A(n372), .B(n370), .C(n371), .Y(n108) );
  OAI32XL U346 ( .A0(n377), .A1(n370), .A2(n368), .B0(n377), .B1(n464), .Y(
        n110) );
  OAI22X1 U347 ( .A0(n442), .A1(n356), .B0(n369), .B1(n443), .Y(n134) );
  OAI32XL U349 ( .A0(n380), .A1(n370), .A2(n413), .B0(n380), .B1(n463), .Y(
        n112) );
  ADDFX2 U350 ( .A(n107), .B(n112), .CI(n22), .CO(n21), .S(product[3]) );
  OAI22XL U351 ( .A0(n424), .A1(n463), .B0(n413), .B1(n425), .Y(n158) );
  XOR2X1 U352 ( .A(n357), .B(n377), .Y(n436) );
  XOR2X1 U353 ( .A(b[4]), .B(n377), .Y(n439) );
  OAI2BB1X1 U354 ( .A0N(n382), .A1N(n390), .B0(n391), .Y(n387) );
  CMPR42X1 U355 ( .A(n150), .B(n85), .C(n79), .D(n83), .ICI(n80), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDFX2 U356 ( .A(n165), .B(n175), .CI(n103), .CO(n100), .S(n101) );
  ADDFHX2 U357 ( .A(n82), .B(n88), .CI(n16), .CO(n15), .S(product[9]) );
  ADDFX2 U358 ( .A(n76), .B(n81), .CI(n15), .CO(n14), .S(product[10]) );
  ADDFX2 U359 ( .A(n68), .B(n75), .CI(n14), .CO(n13), .S(product[11]) );
  ADDFX2 U360 ( .A(n178), .B(n168), .CI(n23), .CO(n22), .S(product[2]) );
  XOR2X1 U361 ( .A(b[3]), .B(n380), .Y(n418) );
  OAI22X1 U364 ( .A0(n409), .A1(n390), .B0(n410), .B1(n382), .Y(n173) );
  OAI22XL U366 ( .A0(n405), .A1(n390), .B0(n406), .B1(n382), .Y(n177) );
  XOR2X1 U367 ( .A(b[3]), .B(n377), .Y(n438) );
  XOR2X1 U369 ( .A(b[3]), .B(n379), .Y(n429) );
  XOR2X1 U370 ( .A(b[4]), .B(n380), .Y(n419) );
  CMPR42X2 U371 ( .A(n173), .B(n153), .C(n163), .D(n97), .ICI(n96), .S(n94), 
        .ICO(n92), .CO(n93) );
  XNOR2X2 U372 ( .A(a[8]), .B(a[7]), .Y(n401) );
  XOR2X1 U374 ( .A(n377), .B(n370), .Y(n435) );
  OAI32XL U375 ( .A0(n379), .A1(n370), .A2(n396), .B0(n379), .B1(n354), .Y(
        n111) );
  XNOR2X4 U376 ( .A(a[2]), .B(a[1]), .Y(n413) );
  NOR2XL U377 ( .A(n382), .B(n383), .Y(product[0]) );
  INVX1 U378 ( .A(n370), .Y(n383) );
  XOR2X1 U379 ( .A(b[5]), .B(n381), .Y(n408) );
  XNOR2X4 U381 ( .A(a[4]), .B(a[3]), .Y(n396) );
  XOR3X2 U382 ( .A(n17), .B(n93), .C(n89), .Y(product[8]) );
  NAND2XL U383 ( .A(n89), .B(n17), .Y(n358) );
  NAND2XL U384 ( .A(n93), .B(n17), .Y(n359) );
  NAND2XL U385 ( .A(n93), .B(n89), .Y(n360) );
  NAND3X1 U386 ( .A(n358), .B(n359), .C(n360), .Y(n16) );
  XNOR2X2 U388 ( .A(a[6]), .B(a[5]), .Y(n394) );
  OAI22XL U389 ( .A0(n426), .A1(n354), .B0(n396), .B1(n427), .Y(n155) );
  XOR2X1 U390 ( .A(b[6]), .B(n380), .Y(n421) );
  ADDHX1 U391 ( .A(n113), .B(n179), .CO(n23), .S(product[1]) );
  INVX1 U396 ( .A(n64), .Y(n376) );
  INVXL U397 ( .A(n50), .Y(n378) );
  NAND2BXL U399 ( .AN(n387), .B(n386), .Y(n72) );
  NOR2XL U400 ( .A(n371), .B(n453), .Y(n120) );
  NOR2XL U401 ( .A(n371), .B(n452), .Y(n121) );
  INVX1 U402 ( .A(n38), .Y(n375) );
  NOR2XL U403 ( .A(n371), .B(n455), .Y(n118) );
  NOR2XL U404 ( .A(n371), .B(n456), .Y(n117) );
  NAND2XL U405 ( .A(n385), .B(n389), .Y(n25) );
  NOR2BXL U406 ( .AN(n385), .B(n371), .Y(n384) );
  ADDHX1 U408 ( .A(n155), .B(n111), .CO(n102), .S(n103) );
  ADDHX1 U409 ( .A(n144), .B(n110), .CO(n95), .S(n96) );
  OAI22XL U410 ( .A0(n435), .A1(n464), .B0(n368), .B1(n436), .Y(n144) );
  XOR2X1 U411 ( .A(b[4]), .B(n381), .Y(n407) );
  XOR2XL U412 ( .A(b[4]), .B(n379), .Y(n430) );
  NOR2XL U413 ( .A(n371), .B(n451), .Y(n122) );
  XOR2XL U414 ( .A(b[2]), .B(n372), .Y(n451) );
  OAI22XL U415 ( .A0(n370), .A1(n390), .B0(n404), .B1(n382), .Y(n179) );
  XOR2XL U417 ( .A(b[9]), .B(n379), .Y(n398) );
  XOR2XL U418 ( .A(b[5]), .B(n379), .Y(n431) );
  XOR2XL U419 ( .A(b[6]), .B(n377), .Y(n395) );
  XOR2XL U420 ( .A(b[5]), .B(n377), .Y(n392) );
  XOR2XL U421 ( .A(b[6]), .B(n374), .Y(n448) );
  XOR2XL U422 ( .A(b[5]), .B(n374), .Y(n447) );
  XOR2XL U424 ( .A(b[7]), .B(n379), .Y(n433) );
  NAND2XL U425 ( .A(n388), .B(n389), .Y(n386) );
  XOR2XL U426 ( .A(b[6]), .B(n379), .Y(n432) );
  XOR2XL U427 ( .A(b[8]), .B(n377), .Y(n441) );
  AO21XL U430 ( .A0(n354), .A1(n396), .B0(n397), .Y(n146) );
  NOR2XL U431 ( .A(n371), .B(n454), .Y(n119) );
  XOR2XL U432 ( .A(b[5]), .B(n372), .Y(n454) );
  XOR2XL U433 ( .A(b[3]), .B(n372), .Y(n452) );
  XOR2XL U434 ( .A(b[4]), .B(n372), .Y(n453) );
  XOR2XL U435 ( .A(b[9]), .B(n377), .Y(n400) );
  XOR2XL U437 ( .A(b[9]), .B(n374), .Y(n403) );
  XOR2XL U438 ( .A(b[8]), .B(n374), .Y(n450) );
  XOR2XL U439 ( .A(b[10]), .B(n377), .Y(n399) );
  XOR2XL U440 ( .A(b[10]), .B(n374), .Y(n402) );
  INVX1 U441 ( .A(n30), .Y(n373) );
  XOR2XL U442 ( .A(b[8]), .B(n372), .Y(n457) );
  XOR2XL U443 ( .A(b[6]), .B(n372), .Y(n455) );
  XOR2XL U444 ( .A(b[7]), .B(n372), .Y(n456) );
  XOR2XL U445 ( .A(b[10]), .B(a[10]), .Y(n385) );
  ADDFX2 U446 ( .A(n36), .B(n34), .CI(n8), .CO(n7), .S(product[17]) );
  ADDFX2 U447 ( .A(n29), .B(n33), .CI(n7), .CO(n6), .S(product[18]) );
  XOR2X1 U448 ( .A(n386), .B(n387), .Y(n73) );
  OAI22XL U449 ( .A0(n392), .A1(n464), .B0(n368), .B1(n395), .Y(n64) );
  OAI22XL U450 ( .A0(n396), .A1(n397), .B0(n398), .B1(n354), .Y(n50) );
  OAI22XL U451 ( .A0(n368), .A1(n399), .B0(n400), .B1(n464), .Y(n38) );
  OAI22XL U452 ( .A0(n369), .A1(n402), .B0(n403), .B1(n356), .Y(n30) );
  XOR2X1 U454 ( .A(n380), .B(n370), .Y(n414) );
  XOR2X1 U455 ( .A(b[2]), .B(n380), .Y(n417) );
  OAI22XL U456 ( .A0(n419), .A1(n463), .B0(n413), .B1(n420), .Y(n163) );
  OAI22XL U457 ( .A0(n421), .A1(n463), .B0(n413), .B1(n422), .Y(n161) );
  XOR2X1 U458 ( .A(n379), .B(n370), .Y(n426) );
  XOR2X1 U459 ( .A(b[2]), .B(n379), .Y(n428) );
  OAI22XL U460 ( .A0(n429), .A1(n354), .B0(n396), .B1(n430), .Y(n152) );
  OAI22XL U461 ( .A0(n430), .A1(n354), .B0(n396), .B1(n431), .Y(n151) );
  OAI22XL U462 ( .A0(n431), .A1(n354), .B0(n396), .B1(n432), .Y(n150) );
  OAI22XL U463 ( .A0(n432), .A1(n354), .B0(n396), .B1(n433), .Y(n149) );
  OAI22XL U464 ( .A0(n433), .A1(n354), .B0(n396), .B1(n434), .Y(n148) );
  OAI22XL U465 ( .A0(n434), .A1(n354), .B0(n396), .B1(n398), .Y(n147) );
  NOR2XL U466 ( .A(n368), .B(n383), .Y(n145) );
  OAI22XL U467 ( .A0(n437), .A1(n464), .B0(n368), .B1(n438), .Y(n142) );
  XOR2X1 U468 ( .A(b[2]), .B(n377), .Y(n437) );
  OAI22XL U469 ( .A0(n438), .A1(n464), .B0(n368), .B1(n439), .Y(n141) );
  OAI22XL U470 ( .A0(n395), .A1(n464), .B0(n368), .B1(n440), .Y(n139) );
  OAI22XL U471 ( .A0(n440), .A1(n464), .B0(n368), .B1(n441), .Y(n138) );
  OAI22XL U472 ( .A0(n441), .A1(n464), .B0(n368), .B1(n400), .Y(n137) );
  AO21X1 U473 ( .A0(n464), .A1(n368), .B0(n399), .Y(n136) );
  XOR2X1 U474 ( .A(n374), .B(n370), .Y(n442) );
  XOR2X1 U475 ( .A(b[2]), .B(n374), .Y(n444) );
  OAI22XL U476 ( .A0(n445), .A1(n356), .B0(n369), .B1(n446), .Y(n131) );
  OAI22XL U477 ( .A0(n446), .A1(n356), .B0(n369), .B1(n447), .Y(n130) );
  OAI22XL U478 ( .A0(n447), .A1(n356), .B0(n369), .B1(n448), .Y(n129) );
  OAI22XL U479 ( .A0(n448), .A1(n356), .B0(n369), .B1(n449), .Y(n128) );
  OAI22XL U480 ( .A0(n449), .A1(n356), .B0(n369), .B1(n450), .Y(n127) );
  OAI22XL U481 ( .A0(n450), .A1(n356), .B0(n369), .B1(n403), .Y(n126) );
  NOR2X1 U482 ( .A(n371), .B(n457), .Y(n116) );
  NOR2X1 U483 ( .A(n371), .B(n458), .Y(n115) );
  XOR2X1 U484 ( .A(b[9]), .B(n372), .Y(n458) );
  XOR2X1 U485 ( .A(a[3]), .B(a[2]), .Y(n459) );
  XOR2X1 U486 ( .A(a[5]), .B(a[4]), .Y(n460) );
  XOR2X1 U487 ( .A(a[7]), .B(a[6]), .Y(n461) );
  XOR2X1 U488 ( .A(a[9]), .B(a[8]), .Y(n462) );
  XOR2X1 U394 ( .A(b[6]), .B(n381), .Y(n409) );
  INVX3 U327 ( .A(a[9]), .Y(n374) );
  CMPR42X1 U328 ( .A(n145), .B(n174), .C(n164), .D(n154), .ICI(n102), .S(n99), 
        .ICO(n97), .CO(n98) );
  INVX6 U284 ( .A(a[10]), .Y(n372) );
  OAI22XL U365 ( .A0(n436), .A1(n464), .B0(n368), .B1(n437), .Y(n143) );
  XOR2X1 U368 ( .A(b[9]), .B(n381), .Y(n412) );
  XOR2X1 U332 ( .A(b[10]), .B(a[1]), .Y(n391) );
  OAI22XL U276 ( .A0(n411), .A1(n390), .B0(n412), .B1(n382), .Y(n171) );
  OAI2BB2XL U363 ( .B0(n412), .B1(n390), .A0N(n391), .A1N(a[0]), .Y(n170) );
  CMPR42X1 U362 ( .A(n124), .B(n141), .C(n170), .D(n160), .ICI(n133), .S(n79), 
        .ICO(n77), .CO(n78) );
  XOR2X1 U323 ( .A(b[10]), .B(n380), .Y(n425) );
  OAI22XL U282 ( .A0(n423), .A1(n463), .B0(n413), .B1(n424), .Y(n159) );
  ADDFX2 U273 ( .A(n26), .B(n25), .CI(n5), .CO(n4), .S(product[20]) );
  INVX6 U298 ( .A(a[3]), .Y(n380) );
  BUFX16 U387 ( .A(n394), .Y(n368) );
  CLKINVX3 U392 ( .A(a[7]), .Y(n377) );
  BUFX12 U325 ( .A(n401), .Y(n369) );
  CMPR42X2 U268 ( .A(n162), .B(n143), .C(n95), .D(n92), .ICI(n91), .S(n89), 
        .ICO(n87), .CO(n88) );
  XOR2X1 U270 ( .A(b[8]), .B(n381), .Y(n411) );
  XOR2X1 U271 ( .A(n357), .B(a[10]), .Y(n388) );
  XOR2X1 U272 ( .A(b[8]), .B(n379), .Y(n434) );
  XOR2X1 U274 ( .A(b[10]), .B(n379), .Y(n397) );
  OAI32XL U277 ( .A0(n374), .A1(n370), .A2(n369), .B0(n374), .B1(n356), .Y(
        n109) );
  XOR2X1 U281 ( .A(b[7]), .B(n377), .Y(n440) );
  XOR2X1 U283 ( .A(b[7]), .B(n374), .Y(n449) );
  BUFX2 U292 ( .A(b[0]), .Y(n370) );
  ADDHXL U293 ( .A(n134), .B(n109), .CO(n85), .S(n86) );
  INVX2 U294 ( .A(a[0]), .Y(n382) );
  CMPR42X1 U301 ( .A(n159), .B(n108), .C(n149), .D(n132), .ICI(n77), .S(n71), 
        .ICO(n69), .CO(n70) );
  ADDFX1 U302 ( .A(n60), .B(n67), .CI(n13), .CO(n12), .S(product[12]) );
  ADDFX1 U307 ( .A(n101), .B(n104), .CI(n20), .CO(n19), .S(product[5]) );
  ADDFXL U310 ( .A(n54), .B(n59), .CI(n12), .CO(n11), .S(product[13]) );
  NAND2X2 U324 ( .A(n413), .B(n459), .Y(n463) );
  ADDFHX2 U338 ( .A(n42), .B(n46), .CI(n10), .CO(n9), .S(product[15]) );
  NAND2X2 U340 ( .A(n368), .B(n461), .Y(n464) );
  XNOR2X1 U345 ( .A(n372), .B(a[9]), .Y(n389) );
  NAND2X2 U348 ( .A(a[1]), .B(n382), .Y(n390) );
  INVX2 U373 ( .A(a[5]), .Y(n379) );
  INVX2 U380 ( .A(n389), .Y(n371) );
endmodule


module geofence_DW01_add_6 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n56;

  ADDFXL U2 ( .A(B[9]), .B(A[9]), .CI(n3), .CO(SUM[10]), .S(SUM[9]) );
  ADDFXL U3 ( .A(B[8]), .B(A[8]), .CI(n4), .CO(n3), .S(SUM[8]) );
  ADDFXL U4 ( .A(B[7]), .B(A[7]), .CI(n5), .CO(n4), .S(SUM[7]) );
  ADDFXL U5 ( .A(B[6]), .B(A[6]), .CI(n6), .CO(n5), .S(SUM[6]) );
  ADDFXL U6 ( .A(B[5]), .B(A[5]), .CI(n7), .CO(n6), .S(SUM[5]) );
  ADDFXL U7 ( .A(B[4]), .B(A[4]), .CI(n8), .CO(n7), .S(SUM[4]) );
  ADDFXL U8 ( .A(B[3]), .B(A[3]), .CI(n9), .CO(n8), .S(SUM[3]) );
  ADDFXL U9 ( .A(B[2]), .B(A[2]), .CI(n10), .CO(n9), .S(SUM[2]) );
  ADDFXL U10 ( .A(n13), .B(A[1]), .CI(B[1]), .CO(n10), .S(SUM[1]) );
  NAND2XL U16 ( .A(A[0]), .B(B[0]), .Y(n12) );
  OR2X1 U20 ( .A(A[0]), .B(B[0]), .Y(n56) );
  AND2X1 U21 ( .A(n56), .B(n12), .Y(SUM[0]) );
  INVXL U22 ( .A(n12), .Y(n13) );
endmodule


module geofence_DW01_sub_15 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n13, n15, n16, n17, n18, n19,
         n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n35, n37, n39,
         n40, n41, n42, n43, n45, n46, n47, n48, n50, n52, n54, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n107, n108, n109, n110;

  NAND2X1 U63 ( .A(n57), .B(n47), .Y(n10) );
  XNOR2X1 U67 ( .A(n67), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U68 ( .A(n67), .B(A[0]), .Y(n48) );
  NAND2X1 U66 ( .A(n66), .B(A[1]), .Y(n47) );
  NOR2X1 U65 ( .A(n66), .B(A[1]), .Y(n46) );
  NAND2X1 U51 ( .A(A[3]), .B(n64), .Y(n39) );
  AOI21X2 U59 ( .A0(n57), .A1(n1), .B0(n45), .Y(n43) );
  OAI21X1 U53 ( .A0(n41), .A1(n43), .B0(n42), .Y(n40) );
  NAND2X1 U37 ( .A(A[5]), .B(n62), .Y(n31) );
  NAND2X1 U43 ( .A(A[4]), .B(n63), .Y(n34) );
  AOI21X2 U45 ( .A0(n40), .A1(n107), .B0(n37), .Y(n35) );
  NAND2XL U48 ( .A(n107), .B(n39), .Y(n8) );
  XNOR2XL U44 ( .A(n8), .B(n40), .Y(DIFF[3]) );
  NOR2X1 U28 ( .A(A[6]), .B(n61), .Y(n25) );
  NAND2XL U54 ( .A(n56), .B(n42), .Y(n9) );
  OAI21X2 U39 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  NAND2X1 U23 ( .A(A[7]), .B(n60), .Y(n23) );
  NAND2X1 U34 ( .A(n108), .B(n31), .Y(n6) );
  AOI21X1 U31 ( .A0(n32), .A1(n108), .B0(n29), .Y(n27) );
  NAND2X1 U40 ( .A(n54), .B(n34), .Y(n7) );
  XOR2X1 U52 ( .A(n9), .B(n43), .Y(DIFF[2]) );
  XNOR2XL U30 ( .A(n32), .B(n6), .Y(DIFF[5]) );
  NOR2X1 U14 ( .A(A[8]), .B(n59), .Y(n17) );
  NAND2X1 U20 ( .A(n109), .B(n23), .Y(n4) );
  XOR2XL U38 ( .A(n35), .B(n7), .Y(DIFF[4]) );
  OAI21X1 U25 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  NAND2XL U26 ( .A(n52), .B(n26), .Y(n5) );
  XOR2XL U24 ( .A(n27), .B(n5), .Y(DIFF[6]) );
  XNOR2XL U16 ( .A(n24), .B(n4), .Y(DIFF[7]) );
  NAND2X1 U15 ( .A(A[8]), .B(n59), .Y(n18) );
  NAND2X1 U12 ( .A(n50), .B(n18), .Y(n3) );
  AOI21X1 U17 ( .A0(n24), .A1(n109), .B0(n21), .Y(n19) );
  XOR2XL U10 ( .A(n19), .B(n3), .Y(DIFF[8]) );
  NAND2X1 U9 ( .A(A[9]), .B(n58), .Y(n15) );
  NAND2X1 U6 ( .A(n110), .B(n15), .Y(n2) );
  OAI21X1 U11 ( .A0(n19), .A1(n17), .B0(n18), .Y(n16) );
  AOI21XL U3 ( .A0(n16), .A1(n110), .B0(n13), .Y(DIFF[10]) );
  NOR2X4 U56 ( .A(A[2]), .B(n65), .Y(n41) );
  NAND2X1 U57 ( .A(A[2]), .B(n65), .Y(n42) );
  XNOR2XL U2 ( .A(n16), .B(n2), .Y(DIFF[9]) );
  OR2X1 U82 ( .A(A[9]), .B(n58), .Y(n110) );
  OR2X1 U83 ( .A(A[7]), .B(n60), .Y(n109) );
  OR2X1 U84 ( .A(A[5]), .B(n62), .Y(n108) );
  INVXL U85 ( .A(n15), .Y(n13) );
  INVXL U86 ( .A(B[9]), .Y(n58) );
  INVX1 U87 ( .A(n17), .Y(n50) );
  INVXL U88 ( .A(n23), .Y(n21) );
  INVX1 U89 ( .A(B[8]), .Y(n59) );
  INVXL U90 ( .A(n25), .Y(n52) );
  INVXL U91 ( .A(B[7]), .Y(n60) );
  INVXL U92 ( .A(n31), .Y(n29) );
  CLKINVX1 U93 ( .A(B[6]), .Y(n61) );
  INVXL U94 ( .A(n39), .Y(n37) );
  INVXL U95 ( .A(B[5]), .Y(n62) );
  CLKINVX1 U96 ( .A(B[4]), .Y(n63) );
  INVX1 U97 ( .A(n46), .Y(n57) );
  INVX1 U98 ( .A(B[2]), .Y(n65) );
  INVXL U99 ( .A(B[3]), .Y(n64) );
  INVX1 U100 ( .A(B[1]), .Y(n66) );
  CLKINVX1 U101 ( .A(B[0]), .Y(n67) );
  INVXL U102 ( .A(n47), .Y(n45) );
  NOR2XL U103 ( .A(A[4]), .B(n63), .Y(n33) );
  XOR2X1 U104 ( .A(n10), .B(n48), .Y(DIFF[1]) );
  NAND2XL U105 ( .A(A[6]), .B(n61), .Y(n26) );
  OR2X2 U106 ( .A(A[3]), .B(n64), .Y(n107) );
  CLKINVX1 U107 ( .A(n41), .Y(n56) );
  CLKINVX1 U108 ( .A(n33), .Y(n54) );
  CLKINVX1 U109 ( .A(n48), .Y(n1) );
endmodule


module geofence_DW01_sub_17 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n15, n17, n18, n19,
         n20, n21, n23, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n43, n44, n45, n46, n48, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n104, n105,
         n106;

  NAND2X1 U60 ( .A(n54), .B(n44), .Y(n9) );
  XNOR2X1 U64 ( .A(A[0]), .B(n64), .Y(DIFF[0]) );
  NOR2X1 U62 ( .A(A[1]), .B(n63), .Y(n43) );
  NAND2X1 U63 ( .A(A[1]), .B(n63), .Y(n44) );
  NOR2X2 U65 ( .A(A[0]), .B(n64), .Y(n45) );
  NOR2X1 U48 ( .A(A[3]), .B(n61), .Y(n35) );
  NOR2X1 U55 ( .A(A[2]), .B(n62), .Y(n39) );
  NAND2X1 U56 ( .A(A[2]), .B(n62), .Y(n40) );
  NAND2X1 U49 ( .A(A[3]), .B(n61), .Y(n36) );
  NAND2X1 U43 ( .A(A[4]), .B(n60), .Y(n33) );
  NOR2X2 U42 ( .A(A[4]), .B(n60), .Y(n32) );
  OAI21X2 U52 ( .A0(n39), .A1(n104), .B0(n40), .Y(n38) );
  NOR2X2 U34 ( .A(A[5]), .B(n59), .Y(n27) );
  OAI21XL U39 ( .A0(n32), .A1(n36), .B0(n33), .Y(n31) );
  NOR2XL U38 ( .A(n32), .B(n35), .Y(n30) );
  NAND2X1 U29 ( .A(A[6]), .B(n58), .Y(n25) );
  XOR2X1 U44 ( .A(n7), .B(n37), .Y(DIFF[3]) );
  NAND2XL U53 ( .A(n53), .B(n40), .Y(n8) );
  AOI21X2 U37 ( .A0(n30), .A1(n38), .B0(n31), .Y(n29) );
  XOR2XL U57 ( .A(n9), .B(n45), .Y(DIFF[1]) );
  NAND2X1 U21 ( .A(A[7]), .B(n57), .Y(n20) );
  NAND2X1 U32 ( .A(n50), .B(n28), .Y(n5) );
  OAI21XL U45 ( .A0(n37), .A1(n35), .B0(n36), .Y(n34) );
  OAI21X1 U31 ( .A0(n29), .A1(n27), .B0(n28), .Y(n26) );
  NAND2X1 U40 ( .A(n51), .B(n33), .Y(n6) );
  XOR2X1 U50 ( .A(n8), .B(n104), .Y(DIFF[2]) );
  XNOR2X1 U36 ( .A(n34), .B(n6), .Y(DIFF[4]) );
  XOR2XL U30 ( .A(n29), .B(n5), .Y(DIFF[5]) );
  NAND2X1 U18 ( .A(n48), .B(n20), .Y(n3) );
  AOI21X1 U23 ( .A0(n26), .A1(n105), .B0(n23), .Y(n21) );
  NAND2X1 U26 ( .A(n105), .B(n25), .Y(n4) );
  XOR2XL U16 ( .A(n21), .B(n3), .Y(DIFF[7]) );
  NAND2X1 U15 ( .A(A[8]), .B(n56), .Y(n17) );
  XNOR2XL U22 ( .A(n26), .B(n4), .Y(DIFF[6]) );
  NOR2X1 U6 ( .A(A[9]), .B(n55), .Y(n11) );
  OAI21X1 U17 ( .A0(n21), .A1(n19), .B0(n20), .Y(n18) );
  NAND2X1 U12 ( .A(n106), .B(n17), .Y(n2) );
  XNOR2X1 U8 ( .A(n18), .B(n2), .Y(DIFF[8]) );
  NAND2XL U4 ( .A(n46), .B(n12), .Y(n1) );
  AOI21X2 U9 ( .A0(n18), .A1(n106), .B0(n15), .Y(n13) );
  XOR2X1 U2 ( .A(n13), .B(n1), .Y(DIFF[9]) );
  NAND2X1 U35 ( .A(A[5]), .B(n59), .Y(n28) );
  OR2X1 U79 ( .A(A[8]), .B(n56), .Y(n106) );
  OR2X1 U80 ( .A(A[6]), .B(n58), .Y(n105) );
  INVX1 U81 ( .A(B[5]), .Y(n59) );
  INVXL U82 ( .A(n11), .Y(n46) );
  INVXL U83 ( .A(n17), .Y(n15) );
  CLKINVX1 U84 ( .A(B[9]), .Y(n55) );
  CLKINVX1 U85 ( .A(B[8]), .Y(n56) );
  INVXL U86 ( .A(n25), .Y(n23) );
  CLKINVX1 U87 ( .A(n27), .Y(n50) );
  INVX1 U88 ( .A(n38), .Y(n37) );
  CLKINVX1 U89 ( .A(B[6]), .Y(n58) );
  CLKINVX1 U90 ( .A(B[7]), .Y(n57) );
  INVX1 U91 ( .A(B[4]), .Y(n60) );
  INVX1 U92 ( .A(B[3]), .Y(n61) );
  INVX1 U93 ( .A(B[2]), .Y(n62) );
  INVX1 U94 ( .A(B[1]), .Y(n63) );
  INVXL U95 ( .A(n19), .Y(n48) );
  NAND2XL U96 ( .A(n52), .B(n36), .Y(n7) );
  NOR2X1 U97 ( .A(A[7]), .B(n57), .Y(n19) );
  NAND2XL U98 ( .A(A[9]), .B(n55), .Y(n12) );
  OA21XL U99 ( .A0(n43), .A1(n45), .B0(n44), .Y(n104) );
  OA21XL U100 ( .A0(n13), .A1(n11), .B0(n12), .Y(DIFF[10]) );
  CLKINVX1 U101 ( .A(B[0]), .Y(n64) );
  INVX1 U102 ( .A(n43), .Y(n54) );
  INVX1 U103 ( .A(n39), .Y(n53) );
  CLKINVX1 U104 ( .A(n35), .Y(n52) );
  CLKINVX1 U105 ( .A(n32), .Y(n51) );
endmodule


module geofence_DW01_sub_19 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n29, n30, n32, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n50, n51, n52, n54, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n111,
         n112, n113, n114, n115;

  NAND2X1 U60 ( .A(n60), .B(n47), .Y(n8) );
  NAND2X1 U67 ( .A(n61), .B(n51), .Y(n9) );
  XNOR2X1 U71 ( .A(n71), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U72 ( .A(n71), .B(A[0]), .Y(n52) );
  NOR2X1 U69 ( .A(n70), .B(A[1]), .Y(n50) );
  NAND2X1 U70 ( .A(n70), .B(A[1]), .Y(n51) );
  NOR2X1 U62 ( .A(n69), .B(A[2]), .Y(n46) );
  NAND2X1 U63 ( .A(n69), .B(A[2]), .Y(n47) );
  OAI21X1 U59 ( .A0(n46), .A1(n112), .B0(n47), .Y(n45) );
  NAND2X1 U50 ( .A(n67), .B(A[4]), .Y(n40) );
  NAND2X1 U56 ( .A(n68), .B(A[3]), .Y(n43) );
  NAND2X1 U41 ( .A(n66), .B(A[5]), .Y(n34) );
  NAND2X1 U33 ( .A(n65), .B(A[6]), .Y(n29) );
  OAI21XL U46 ( .A0(n39), .A1(n43), .B0(n40), .Y(n38) );
  NOR2XL U45 ( .A(n42), .B(n39), .Y(n37) );
  NAND2XL U53 ( .A(n59), .B(n43), .Y(n7) );
  AOI21X1 U44 ( .A0(n45), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U51 ( .A(n44), .B(n7), .Y(DIFF[3]) );
  XOR2XL U64 ( .A(n9), .B(n52), .Y(DIFF[1]) );
  NAND2X1 U23 ( .A(n64), .B(A[7]), .Y(n22) );
  AOI21XL U27 ( .A0(n111), .A1(n32), .B0(n27), .Y(n25) );
  NAND2XL U26 ( .A(n111), .B(n113), .Y(n24) );
  NAND2X1 U38 ( .A(n113), .B(n34), .Y(n5) );
  OAI21XL U52 ( .A0(n44), .A1(n42), .B0(n43), .Y(n41) );
  NAND2X1 U47 ( .A(n58), .B(n40), .Y(n6) );
  XOR2XL U57 ( .A(n8), .B(n112), .Y(DIFF[2]) );
  NOR2X1 U14 ( .A(n63), .B(A[8]), .Y(n16) );
  XNOR2X1 U42 ( .A(n41), .B(n6), .Y(DIFF[4]) );
  AOI21X1 U35 ( .A0(n35), .A1(n113), .B0(n32), .Y(n30) );
  OAI21X1 U25 ( .A0(n36), .A1(n24), .B0(n25), .Y(n23) );
  NAND2X1 U20 ( .A(n114), .B(n22), .Y(n3) );
  NAND2XL U30 ( .A(n111), .B(n29), .Y(n4) );
  NAND2X1 U15 ( .A(n63), .B(A[8]), .Y(n17) );
  XNOR2XL U16 ( .A(n23), .B(n3), .Y(DIFF[7]) );
  XOR2X1 U24 ( .A(n30), .B(n4), .Y(DIFF[6]) );
  AOI21X1 U17 ( .A0(n23), .A1(n114), .B0(n20), .Y(n18) );
  NAND2XL U12 ( .A(n54), .B(n17), .Y(n2) );
  NAND2X1 U9 ( .A(n62), .B(A[9]), .Y(n14) );
  XOR2XL U10 ( .A(n18), .B(n2), .Y(DIFF[8]) );
  NAND2X1 U6 ( .A(n115), .B(n14), .Y(n1) );
  XNOR2XL U2 ( .A(n15), .B(n1), .Y(DIFF[9]) );
  AOI21XL U3 ( .A0(n15), .A1(n115), .B0(n12), .Y(n10) );
  XOR2X1 U1 ( .A(n10), .B(A[10]), .Y(DIFF[10]) );
  NOR2X1 U55 ( .A(n68), .B(A[3]), .Y(n42) );
  NOR2X1 U49 ( .A(n67), .B(A[4]), .Y(n39) );
  XNOR2X1 U34 ( .A(n35), .B(n5), .Y(DIFF[5]) );
  OR2X1 U86 ( .A(n62), .B(A[9]), .Y(n115) );
  CLKINVX1 U87 ( .A(n36), .Y(n35) );
  OR2X1 U88 ( .A(n64), .B(A[7]), .Y(n114) );
  OR2X1 U89 ( .A(n65), .B(A[6]), .Y(n111) );
  OR2X1 U90 ( .A(n66), .B(A[5]), .Y(n113) );
  INVXL U91 ( .A(n14), .Y(n12) );
  INVX1 U92 ( .A(B[9]), .Y(n62) );
  INVXL U93 ( .A(n22), .Y(n20) );
  INVX1 U94 ( .A(B[8]), .Y(n63) );
  CLKINVX1 U95 ( .A(n34), .Y(n32) );
  INVX1 U96 ( .A(n29), .Y(n27) );
  CLKINVX1 U97 ( .A(B[6]), .Y(n65) );
  CLKINVX1 U98 ( .A(B[5]), .Y(n66) );
  INVX1 U99 ( .A(B[4]), .Y(n67) );
  INVX1 U100 ( .A(B[3]), .Y(n68) );
  INVX1 U101 ( .A(B[2]), .Y(n69) );
  INVXL U102 ( .A(B[0]), .Y(n71) );
  INVX1 U103 ( .A(B[1]), .Y(n70) );
  INVXL U104 ( .A(B[7]), .Y(n64) );
  OAI21X1 U105 ( .A0(n18), .A1(n16), .B0(n17), .Y(n15) );
  OA21XL U106 ( .A0(n50), .A1(n52), .B0(n51), .Y(n112) );
  INVXL U107 ( .A(n50), .Y(n61) );
  INVX1 U108 ( .A(n46), .Y(n60) );
  CLKINVX1 U109 ( .A(n42), .Y(n59) );
  INVX1 U110 ( .A(n39), .Y(n58) );
  CLKINVX1 U111 ( .A(n16), .Y(n54) );
  INVX3 U112 ( .A(n45), .Y(n44) );
endmodule


module geofence_DW01_sub_21 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n13, n15, n16, n17, n18, n19,
         n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n35, n37, n39,
         n40, n41, n42, n43, n45, n46, n47, n48, n50, n52, n54, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n107, n108, n109, n110;

  XNOR2X1 U30 ( .A(n32), .B(n6), .Y(DIFF[5]) );
  NAND2X1 U34 ( .A(n108), .B(n31), .Y(n6) );
  NAND2X1 U40 ( .A(n54), .B(n34), .Y(n7) );
  XNOR2X1 U44 ( .A(n40), .B(n8), .Y(DIFF[3]) );
  NAND2X1 U48 ( .A(n107), .B(n39), .Y(n8) );
  XOR2X1 U52 ( .A(n9), .B(n43), .Y(DIFF[2]) );
  NAND2XL U54 ( .A(n56), .B(n42), .Y(n9) );
  XOR2X1 U58 ( .A(n10), .B(n48), .Y(DIFF[1]) );
  NAND2XL U63 ( .A(n57), .B(n47), .Y(n10) );
  NOR2X1 U65 ( .A(n66), .B(A[1]), .Y(n46) );
  NAND2X1 U66 ( .A(n66), .B(A[1]), .Y(n47) );
  XNOR2X1 U67 ( .A(n67), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U68 ( .A(n67), .B(A[0]), .Y(n48) );
  NOR2X1 U56 ( .A(n65), .B(A[2]), .Y(n41) );
  NAND2X1 U51 ( .A(n64), .B(A[3]), .Y(n39) );
  NOR2X1 U42 ( .A(n63), .B(A[4]), .Y(n33) );
  OAI21X1 U53 ( .A0(n41), .A1(n43), .B0(n42), .Y(n40) );
  NAND2X1 U43 ( .A(n63), .B(A[4]), .Y(n34) );
  NAND2X1 U37 ( .A(A[5]), .B(n62), .Y(n31) );
  AOI21X2 U45 ( .A0(n40), .A1(n107), .B0(n37), .Y(n35) );
  NOR2X1 U28 ( .A(n61), .B(A[6]), .Y(n25) );
  OAI21X1 U39 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  NOR2X1 U14 ( .A(n59), .B(A[8]), .Y(n17) );
  NAND2X1 U23 ( .A(A[7]), .B(n60), .Y(n23) );
  NAND2X1 U29 ( .A(n61), .B(A[6]), .Y(n26) );
  AOI21X2 U31 ( .A0(n32), .A1(n108), .B0(n29), .Y(n27) );
  XOR2XL U38 ( .A(n35), .B(n7), .Y(DIFF[4]) );
  NAND2X1 U15 ( .A(n59), .B(A[8]), .Y(n18) );
  OAI21X1 U25 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  NAND2X1 U26 ( .A(n52), .B(n26), .Y(n5) );
  AOI21X1 U17 ( .A0(n24), .A1(n109), .B0(n21), .Y(n19) );
  XOR2XL U24 ( .A(n27), .B(n5), .Y(DIFF[6]) );
  NAND2XL U20 ( .A(n109), .B(n23), .Y(n4) );
  NAND2X1 U12 ( .A(n50), .B(n18), .Y(n3) );
  XOR2XL U10 ( .A(n19), .B(n3), .Y(DIFF[8]) );
  NAND2X1 U9 ( .A(A[9]), .B(n58), .Y(n15) );
  OAI21X1 U11 ( .A0(n19), .A1(n17), .B0(n18), .Y(n16) );
  NAND2X1 U6 ( .A(n110), .B(n15), .Y(n2) );
  XNOR2XL U2 ( .A(n16), .B(n2), .Y(DIFF[9]) );
  AOI21XL U3 ( .A0(n16), .A1(n110), .B0(n13), .Y(DIFF[10]) );
  OR2X1 U82 ( .A(A[9]), .B(n58), .Y(n110) );
  OR2X1 U83 ( .A(A[7]), .B(n60), .Y(n109) );
  OR2X1 U84 ( .A(A[5]), .B(n62), .Y(n108) );
  OR2X1 U85 ( .A(n64), .B(A[3]), .Y(n107) );
  INVX1 U86 ( .A(n15), .Y(n13) );
  INVXL U87 ( .A(B[9]), .Y(n58) );
  INVXL U88 ( .A(n23), .Y(n21) );
  INVXL U89 ( .A(n31), .Y(n29) );
  INVX1 U90 ( .A(B[8]), .Y(n59) );
  CLKINVX1 U91 ( .A(B[7]), .Y(n60) );
  INVX1 U92 ( .A(B[6]), .Y(n61) );
  INVXL U93 ( .A(B[5]), .Y(n62) );
  INVX1 U94 ( .A(B[4]), .Y(n63) );
  INVXL U95 ( .A(B[3]), .Y(n64) );
  NAND2XL U96 ( .A(n65), .B(A[2]), .Y(n42) );
  AOI21XL U97 ( .A0(n57), .A1(n1), .B0(n45), .Y(n43) );
  XNOR2X1 U98 ( .A(n24), .B(n4), .Y(DIFF[7]) );
  CLKINVX1 U99 ( .A(B[0]), .Y(n67) );
  CLKINVX1 U100 ( .A(B[1]), .Y(n66) );
  CLKINVX1 U101 ( .A(B[2]), .Y(n65) );
  INVXL U102 ( .A(n41), .Y(n56) );
  INVX1 U103 ( .A(n33), .Y(n54) );
  CLKINVX1 U104 ( .A(n25), .Y(n52) );
  CLKINVX1 U105 ( .A(n17), .Y(n50) );
  INVX1 U106 ( .A(n47), .Y(n45) );
  CLKINVX1 U107 ( .A(n46), .Y(n57) );
  CLKINVX1 U108 ( .A(n39), .Y(n37) );
  INVX1 U109 ( .A(n48), .Y(n1) );
endmodule


module geofence_DW01_sub_23 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n15, n17, n18, n19,
         n20, n21, n23, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n43, n44, n45, n46, n48, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n104, n105,
         n107;

  NAND2X1 U32 ( .A(n50), .B(n28), .Y(n5) );
  XNOR2X1 U36 ( .A(n34), .B(n6), .Y(DIFF[4]) );
  NAND2X1 U40 ( .A(n51), .B(n33), .Y(n6) );
  OAI21X1 U45 ( .A0(n37), .A1(n35), .B0(n36), .Y(n34) );
  NAND2X1 U46 ( .A(n52), .B(n36), .Y(n7) );
  XOR2X1 U50 ( .A(n8), .B(n104), .Y(DIFF[2]) );
  NAND2XL U53 ( .A(n53), .B(n40), .Y(n8) );
  XOR2X1 U57 ( .A(n9), .B(n45), .Y(DIFF[1]) );
  NAND2XL U60 ( .A(n54), .B(n44), .Y(n9) );
  NOR2X1 U62 ( .A(A[1]), .B(n63), .Y(n43) );
  NAND2X1 U63 ( .A(A[1]), .B(n63), .Y(n44) );
  XNOR2X1 U64 ( .A(A[0]), .B(n64), .Y(DIFF[0]) );
  NOR2X1 U65 ( .A(A[0]), .B(n64), .Y(n45) );
  NOR2X2 U48 ( .A(A[3]), .B(n61), .Y(n35) );
  NAND2X1 U56 ( .A(A[2]), .B(n62), .Y(n40) );
  NOR2X2 U55 ( .A(A[2]), .B(n62), .Y(n39) );
  NOR2X1 U42 ( .A(A[4]), .B(n60), .Y(n32) );
  NAND2X1 U43 ( .A(A[4]), .B(n60), .Y(n33) );
  NOR2X1 U34 ( .A(A[5]), .B(n59), .Y(n27) );
  OAI21XL U39 ( .A0(n32), .A1(n36), .B0(n33), .Y(n31) );
  NOR2XL U38 ( .A(n35), .B(n32), .Y(n30) );
  NAND2X1 U35 ( .A(A[5]), .B(n59), .Y(n28) );
  NAND2X1 U29 ( .A(A[6]), .B(n58), .Y(n25) );
  AOI21X1 U37 ( .A0(n30), .A1(n38), .B0(n31), .Y(n29) );
  XOR2XL U44 ( .A(n7), .B(n37), .Y(DIFF[3]) );
  NOR2X1 U20 ( .A(A[7]), .B(n57), .Y(n19) );
  OAI21X1 U31 ( .A0(n29), .A1(n27), .B0(n28), .Y(n26) );
  NAND2X1 U15 ( .A(A[8]), .B(n56), .Y(n17) );
  AOI21X1 U23 ( .A0(n26), .A1(n105), .B0(n23), .Y(n21) );
  NAND2X1 U26 ( .A(n105), .B(n25), .Y(n4) );
  XOR2XL U30 ( .A(n29), .B(n5), .Y(DIFF[5]) );
  XNOR2XL U22 ( .A(n26), .B(n4), .Y(DIFF[6]) );
  OAI21X2 U17 ( .A0(n21), .A1(n19), .B0(n20), .Y(n18) );
  NAND2X1 U12 ( .A(n107), .B(n17), .Y(n2) );
  NAND2XL U18 ( .A(n48), .B(n20), .Y(n3) );
  NOR2X1 U6 ( .A(A[9]), .B(n55), .Y(n11) );
  XOR2XL U16 ( .A(n21), .B(n3), .Y(DIFF[7]) );
  NAND2X1 U7 ( .A(A[9]), .B(n55), .Y(n12) );
  AOI21X1 U9 ( .A0(n18), .A1(n107), .B0(n15), .Y(n13) );
  XOR2XL U2 ( .A(n13), .B(n1), .Y(DIFF[9]) );
  OAI21X2 U52 ( .A0(n39), .A1(n104), .B0(n40), .Y(n38) );
  OR2X1 U79 ( .A(A[8]), .B(n56), .Y(n107) );
  OR2X1 U80 ( .A(A[6]), .B(n58), .Y(n105) );
  INVX1 U81 ( .A(n17), .Y(n15) );
  INVXL U82 ( .A(n11), .Y(n46) );
  INVX1 U83 ( .A(B[9]), .Y(n55) );
  INVXL U84 ( .A(n25), .Y(n23) );
  INVXL U85 ( .A(B[8]), .Y(n56) );
  CLKINVX1 U86 ( .A(B[7]), .Y(n57) );
  CLKINVX1 U87 ( .A(B[6]), .Y(n58) );
  CLKINVX1 U88 ( .A(B[5]), .Y(n59) );
  INVXL U89 ( .A(B[4]), .Y(n60) );
  INVX1 U90 ( .A(B[2]), .Y(n62) );
  INVX1 U91 ( .A(B[3]), .Y(n61) );
  INVXL U92 ( .A(n19), .Y(n48) );
  NAND2X1 U93 ( .A(A[3]), .B(n61), .Y(n36) );
  NAND2XL U94 ( .A(n46), .B(n12), .Y(n1) );
  XNOR2X1 U95 ( .A(n18), .B(n2), .Y(DIFF[8]) );
  NAND2XL U96 ( .A(A[7]), .B(n57), .Y(n20) );
  OA21XL U97 ( .A0(n43), .A1(n45), .B0(n44), .Y(n104) );
  OA21XL U98 ( .A0(n13), .A1(n11), .B0(n12), .Y(DIFF[10]) );
  CLKINVX1 U99 ( .A(B[0]), .Y(n64) );
  CLKINVX1 U100 ( .A(B[1]), .Y(n63) );
  INVXL U101 ( .A(n43), .Y(n54) );
  INVXL U102 ( .A(n39), .Y(n53) );
  INVXL U103 ( .A(n35), .Y(n52) );
  INVXL U104 ( .A(n32), .Y(n51) );
  INVX1 U105 ( .A(n27), .Y(n50) );
  CLKINVX1 U106 ( .A(n38), .Y(n37) );
endmodule


module geofence_DW01_sub_25 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n18,
         n19, n20, n21, n22, n24, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n44, n46, n47, n48, n50, n52,
         n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n106,
         n107, n108;

  NAND2X1 U12 ( .A(n108), .B(n18), .Y(n3) );
  NAND2X1 U18 ( .A(n50), .B(n21), .Y(n4) );
  NAND2X1 U26 ( .A(n107), .B(n26), .Y(n5) );
  NAND2X1 U32 ( .A(n52), .B(n29), .Y(n6) );
  XNOR2X1 U36 ( .A(n35), .B(n7), .Y(DIFF[4]) );
  NAND2X1 U40 ( .A(n53), .B(n34), .Y(n7) );
  NAND2X1 U43 ( .A(n62), .B(A[4]), .Y(n34) );
  OAI21XL U45 ( .A0(n38), .A1(n36), .B0(n37), .Y(n35) );
  NAND2X1 U46 ( .A(n54), .B(n37), .Y(n8) );
  XOR2X1 U50 ( .A(n9), .B(n42), .Y(DIFF[2]) );
  NAND2XL U53 ( .A(n55), .B(n41), .Y(n9) );
  XOR2X1 U57 ( .A(n10), .B(n47), .Y(DIFF[1]) );
  AOI21X1 U58 ( .A0(n1), .A1(n106), .B0(n44), .Y(n42) );
  NAND2XL U62 ( .A(n106), .B(n46), .Y(n10) );
  XNOR2X1 U66 ( .A(n66), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U67 ( .A(n66), .B(A[0]), .Y(n47) );
  NOR2X1 U48 ( .A(n63), .B(A[3]), .Y(n36) );
  NAND2X1 U56 ( .A(n64), .B(A[2]), .Y(n41) );
  NOR2X1 U55 ( .A(n64), .B(A[2]), .Y(n40) );
  NOR2X1 U42 ( .A(n62), .B(A[4]), .Y(n33) );
  OAI21X2 U52 ( .A0(n40), .A1(n42), .B0(n41), .Y(n39) );
  NAND2X1 U49 ( .A(n63), .B(A[3]), .Y(n37) );
  NOR2X1 U34 ( .A(n61), .B(A[5]), .Y(n28) );
  OAI21XL U39 ( .A0(n33), .A1(n37), .B0(n34), .Y(n32) );
  NOR2XL U38 ( .A(n33), .B(n36), .Y(n31) );
  NAND2X1 U29 ( .A(n60), .B(A[6]), .Y(n26) );
  NAND2X1 U35 ( .A(n61), .B(A[5]), .Y(n29) );
  AOI21X1 U37 ( .A0(n31), .A1(n39), .B0(n32), .Y(n30) );
  XOR2XL U44 ( .A(n38), .B(n8), .Y(DIFF[3]) );
  NOR2X1 U20 ( .A(n59), .B(A[7]), .Y(n20) );
  OAI21X1 U31 ( .A0(n30), .A1(n28), .B0(n29), .Y(n27) );
  NAND2X1 U15 ( .A(n58), .B(A[8]), .Y(n18) );
  NAND2X1 U21 ( .A(n59), .B(A[7]), .Y(n21) );
  AOI21X1 U23 ( .A0(n27), .A1(n107), .B0(n24), .Y(n22) );
  XOR2XL U30 ( .A(n30), .B(n6), .Y(DIFF[5]) );
  OAI21X1 U17 ( .A0(n22), .A1(n20), .B0(n21), .Y(n19) );
  XNOR2XL U22 ( .A(n27), .B(n5), .Y(DIFF[6]) );
  XNOR2XL U8 ( .A(n19), .B(n3), .Y(DIFF[8]) );
  NOR2X1 U6 ( .A(n57), .B(A[9]), .Y(n12) );
  XOR2XL U16 ( .A(n22), .B(n4), .Y(DIFF[7]) );
  NAND2X1 U7 ( .A(n57), .B(A[9]), .Y(n13) );
  AOI21X1 U9 ( .A0(n19), .A1(n108), .B0(n16), .Y(n14) );
  OAI21XL U3 ( .A0(n14), .A1(n12), .B0(n13), .Y(n11) );
  NAND2XL U4 ( .A(n48), .B(n13), .Y(n2) );
  XNOR2X1 U1 ( .A(n11), .B(A[10]), .Y(DIFF[10]) );
  XOR2XL U2 ( .A(n14), .B(n2), .Y(DIFF[9]) );
  OR2X1 U81 ( .A(n58), .B(A[8]), .Y(n108) );
  OR2X1 U82 ( .A(n60), .B(A[6]), .Y(n107) );
  OR2X1 U83 ( .A(n65), .B(A[1]), .Y(n106) );
  INVXL U84 ( .A(n18), .Y(n16) );
  INVX1 U85 ( .A(B[9]), .Y(n57) );
  INVXL U86 ( .A(n26), .Y(n24) );
  INVX1 U87 ( .A(B[8]), .Y(n58) );
  INVX1 U88 ( .A(B[7]), .Y(n59) );
  INVX1 U89 ( .A(B[6]), .Y(n60) );
  INVX1 U90 ( .A(B[5]), .Y(n61) );
  INVXL U91 ( .A(B[4]), .Y(n62) );
  NAND2XL U92 ( .A(n65), .B(A[1]), .Y(n46) );
  INVXL U93 ( .A(n39), .Y(n38) );
  INVX1 U94 ( .A(B[0]), .Y(n66) );
  CLKINVX1 U95 ( .A(B[1]), .Y(n65) );
  CLKINVX1 U96 ( .A(B[2]), .Y(n64) );
  CLKINVX1 U97 ( .A(B[3]), .Y(n63) );
  INVXL U98 ( .A(n40), .Y(n55) );
  INVXL U99 ( .A(n36), .Y(n54) );
  INVXL U100 ( .A(n33), .Y(n53) );
  INVX1 U101 ( .A(n28), .Y(n52) );
  INVX1 U102 ( .A(n20), .Y(n50) );
  CLKINVX1 U103 ( .A(n12), .Y(n48) );
  INVX1 U104 ( .A(n46), .Y(n44) );
  INVX1 U105 ( .A(n47), .Y(n1) );
endmodule


module geofence_DW01_sub_27 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n16, n18, n19,
         n20, n21, n22, n24, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n44, n45, n46, n47, n48, n50, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n106, n107;

  OAI21X4 U52 ( .A0(n40), .A1(n42), .B0(n41), .Y(n39) );
  AOI21X4 U58 ( .A0(n56), .A1(n1), .B0(n44), .Y(n42) );
  NAND2X1 U62 ( .A(n56), .B(n46), .Y(n10) );
  XNOR2X1 U66 ( .A(n66), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U64 ( .A(n65), .B(A[1]), .Y(n45) );
  NOR2X1 U67 ( .A(n66), .B(A[0]), .Y(n47) );
  NAND2X2 U56 ( .A(n64), .B(A[2]), .Y(n41) );
  NOR2X4 U55 ( .A(n64), .B(A[2]), .Y(n40) );
  NOR2X1 U42 ( .A(A[4]), .B(n62), .Y(n33) );
  NOR2X1 U34 ( .A(A[5]), .B(n61), .Y(n28) );
  NAND2X1 U49 ( .A(A[3]), .B(n63), .Y(n37) );
  NAND2X1 U43 ( .A(A[4]), .B(n62), .Y(n34) );
  NAND2X1 U35 ( .A(A[5]), .B(n61), .Y(n29) );
  NOR2XL U38 ( .A(n36), .B(n33), .Y(n31) );
  OAI21XL U39 ( .A0(n33), .A1(n37), .B0(n34), .Y(n32) );
  OAI21X1 U45 ( .A0(n38), .A1(n36), .B0(n37), .Y(n35) );
  NAND2X1 U40 ( .A(n53), .B(n34), .Y(n7) );
  XNOR2X1 U36 ( .A(n35), .B(n7), .Y(DIFF[4]) );
  XOR2X1 U44 ( .A(n8), .B(n38), .Y(DIFF[3]) );
  NAND2XL U32 ( .A(n52), .B(n29), .Y(n6) );
  NAND2XL U53 ( .A(n55), .B(n41), .Y(n9) );
  XOR2XL U57 ( .A(n10), .B(n47), .Y(DIFF[1]) );
  XOR2XL U30 ( .A(n30), .B(n6), .Y(DIFF[5]) );
  NAND2X1 U29 ( .A(A[6]), .B(n60), .Y(n26) );
  XOR2X1 U50 ( .A(n9), .B(n42), .Y(DIFF[2]) );
  NOR2X1 U20 ( .A(A[7]), .B(n59), .Y(n20) );
  OAI21X1 U31 ( .A0(n30), .A1(n28), .B0(n29), .Y(n27) );
  NOR2X1 U6 ( .A(A[9]), .B(n57), .Y(n12) );
  NAND2X1 U15 ( .A(A[8]), .B(n58), .Y(n18) );
  NAND2X1 U21 ( .A(A[7]), .B(n59), .Y(n21) );
  AOI21X1 U23 ( .A0(n27), .A1(n106), .B0(n24), .Y(n22) );
  NAND2X1 U7 ( .A(A[9]), .B(n57), .Y(n13) );
  NAND2XL U18 ( .A(n50), .B(n21), .Y(n4) );
  NAND2X1 U26 ( .A(n106), .B(n26), .Y(n5) );
  OAI21X2 U17 ( .A0(n22), .A1(n20), .B0(n21), .Y(n19) );
  XOR2XL U16 ( .A(n22), .B(n4), .Y(DIFF[7]) );
  XNOR2XL U22 ( .A(n27), .B(n5), .Y(DIFF[6]) );
  NAND2X1 U12 ( .A(n107), .B(n18), .Y(n3) );
  AOI21X1 U9 ( .A0(n19), .A1(n107), .B0(n16), .Y(n14) );
  XNOR2XL U8 ( .A(n19), .B(n3), .Y(DIFF[8]) );
  NOR2X2 U48 ( .A(A[3]), .B(n63), .Y(n36) );
  NAND2X2 U46 ( .A(n54), .B(n37), .Y(n8) );
  AOI21X1 U37 ( .A0(n31), .A1(n39), .B0(n32), .Y(n30) );
  OR2X1 U81 ( .A(A[8]), .B(n58), .Y(n107) );
  OR2X1 U82 ( .A(A[6]), .B(n60), .Y(n106) );
  INVX1 U83 ( .A(n18), .Y(n16) );
  INVX1 U84 ( .A(n20), .Y(n50) );
  INVX1 U85 ( .A(B[9]), .Y(n57) );
  INVXL U86 ( .A(B[8]), .Y(n58) );
  INVXL U87 ( .A(n26), .Y(n24) );
  INVX1 U88 ( .A(n28), .Y(n52) );
  INVX3 U89 ( .A(n39), .Y(n38) );
  INVX1 U90 ( .A(n36), .Y(n54) );
  INVX1 U91 ( .A(B[5]), .Y(n61) );
  INVX1 U92 ( .A(B[3]), .Y(n63) );
  INVX1 U93 ( .A(n45), .Y(n56) );
  INVX1 U94 ( .A(n47), .Y(n1) );
  INVXL U95 ( .A(n46), .Y(n44) );
  INVX1 U96 ( .A(B[2]), .Y(n64) );
  CLKINVX1 U97 ( .A(B[0]), .Y(n66) );
  CLKINVX1 U98 ( .A(B[1]), .Y(n65) );
  INVX1 U99 ( .A(B[4]), .Y(n62) );
  INVXL U100 ( .A(B[6]), .Y(n60) );
  INVX1 U101 ( .A(B[7]), .Y(n59) );
  NAND2XL U102 ( .A(n65), .B(A[1]), .Y(n46) );
  INVXL U103 ( .A(n12), .Y(n48) );
  NAND2XL U104 ( .A(n48), .B(n13), .Y(n2) );
  XOR2X1 U105 ( .A(n14), .B(n2), .Y(DIFF[9]) );
  OA21XL U106 ( .A0(n14), .A1(n12), .B0(n13), .Y(DIFF[10]) );
  CLKINVX1 U107 ( .A(n40), .Y(n55) );
  CLKINVX1 U108 ( .A(n33), .Y(n53) );
endmodule


module geofence_DW01_sub_29 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n13, n15, n16, n17, n18, n19,
         n21, n23, n24, n25, n26, n27, n29, n31, n32, n37, n38, n39, n41, n42,
         n43, n44, n45, n46, n47, n48, n50, n52, n53, n55, n57, n59, n60, n61,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n112, n113, n114,
         n115, n116, n117;

  NAND2X1 U44 ( .A(n59), .B(n38), .Y(n7) );
  AOI21X1 U49 ( .A0(n45), .A1(n60), .B0(n41), .Y(n39) );
  NAND2X1 U52 ( .A(n60), .B(n43), .Y(n8) );
  XOR2X1 U56 ( .A(n9), .B(n48), .Y(DIFF[2]) );
  OAI21X4 U58 ( .A0(n46), .A1(n48), .B0(n47), .Y(n45) );
  NAND2XL U59 ( .A(n61), .B(n47), .Y(n9) );
  NAND2X2 U62 ( .A(n70), .B(A[2]), .Y(n47) );
  AOI21X4 U64 ( .A0(n113), .A1(n1), .B0(n50), .Y(n48) );
  NAND2XL U68 ( .A(n113), .B(n52), .Y(n10) );
  NAND2X1 U71 ( .A(n71), .B(A[1]), .Y(n52) );
  XNOR2X1 U72 ( .A(A[0]), .B(n72), .Y(DIFF[0]) );
  NOR2X1 U46 ( .A(A[4]), .B(n68), .Y(n37) );
  NOR2X1 U54 ( .A(A[3]), .B(n69), .Y(n42) );
  NAND2X1 U55 ( .A(A[3]), .B(n69), .Y(n43) );
  NAND2X1 U37 ( .A(A[5]), .B(n67), .Y(n31) );
  OAI21X1 U39 ( .A0(n112), .A1(n44), .B0(n115), .Y(n32) );
  XOR2X1 U63 ( .A(n10), .B(n53), .Y(DIFF[1]) );
  NOR2X1 U14 ( .A(A[8]), .B(n64), .Y(n17) );
  NOR2X1 U28 ( .A(A[6]), .B(n66), .Y(n25) );
  NAND2X1 U29 ( .A(A[6]), .B(n66), .Y(n26) );
  NAND2X1 U23 ( .A(A[7]), .B(n65), .Y(n23) );
  AOI21X2 U31 ( .A0(n32), .A1(n114), .B0(n29), .Y(n27) );
  OAI21X1 U25 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  NAND2X1 U34 ( .A(n114), .B(n31), .Y(n6) );
  XOR2X1 U38 ( .A(n39), .B(n7), .Y(DIFF[4]) );
  XNOR2XL U30 ( .A(n32), .B(n6), .Y(DIFF[5]) );
  AOI21X1 U17 ( .A0(n24), .A1(n116), .B0(n21), .Y(n19) );
  NAND2XL U12 ( .A(n55), .B(n18), .Y(n3) );
  XOR2XL U10 ( .A(n19), .B(n3), .Y(DIFF[8]) );
  NAND2X1 U26 ( .A(n57), .B(n26), .Y(n5) );
  NAND2X1 U20 ( .A(n116), .B(n23), .Y(n4) );
  XOR2XL U24 ( .A(n27), .B(n5), .Y(DIFF[6]) );
  XNOR2XL U16 ( .A(n24), .B(n4), .Y(DIFF[7]) );
  NAND2X1 U9 ( .A(A[9]), .B(n63), .Y(n15) );
  OAI21X1 U11 ( .A0(n19), .A1(n17), .B0(n18), .Y(n16) );
  NAND2X1 U6 ( .A(n117), .B(n15), .Y(n2) );
  XNOR2XL U2 ( .A(n16), .B(n2), .Y(DIFF[9]) );
  AOI21XL U3 ( .A0(n16), .A1(n117), .B0(n13), .Y(DIFF[10]) );
  NOR2X1 U61 ( .A(n70), .B(A[2]), .Y(n46) );
  OR2X1 U87 ( .A(A[9]), .B(n63), .Y(n117) );
  OR2X1 U88 ( .A(A[7]), .B(n65), .Y(n116) );
  OR2X1 U89 ( .A(A[5]), .B(n67), .Y(n114) );
  OR2X1 U90 ( .A(n42), .B(n37), .Y(n112) );
  OR2X1 U91 ( .A(n71), .B(A[1]), .Y(n113) );
  INVXL U92 ( .A(n15), .Y(n13) );
  INVXL U93 ( .A(B[9]), .Y(n63) );
  INVX1 U94 ( .A(n25), .Y(n57) );
  INVXL U95 ( .A(n23), .Y(n21) );
  INVXL U96 ( .A(n17), .Y(n55) );
  INVXL U97 ( .A(n31), .Y(n29) );
  INVX1 U98 ( .A(B[6]), .Y(n66) );
  CLKINVX1 U99 ( .A(B[7]), .Y(n65) );
  CLKINVX1 U100 ( .A(B[8]), .Y(n64) );
  CLKINVX1 U101 ( .A(n45), .Y(n44) );
  INVXL U102 ( .A(B[5]), .Y(n67) );
  INVXL U103 ( .A(B[3]), .Y(n69) );
  CLKINVX1 U104 ( .A(B[4]), .Y(n68) );
  INVXL U105 ( .A(B[2]), .Y(n70) );
  NAND2XL U106 ( .A(A[4]), .B(n68), .Y(n38) );
  NOR2X1 U107 ( .A(A[0]), .B(n72), .Y(n53) );
  XOR2X1 U108 ( .A(n8), .B(n44), .Y(DIFF[3]) );
  NAND2XL U109 ( .A(A[8]), .B(n64), .Y(n18) );
  OA21XL U110 ( .A0(n43), .A1(n37), .B0(n38), .Y(n115) );
  CLKINVX1 U111 ( .A(B[0]), .Y(n72) );
  CLKINVX1 U112 ( .A(B[1]), .Y(n71) );
  INVXL U113 ( .A(n46), .Y(n61) );
  CLKINVX1 U114 ( .A(n37), .Y(n59) );
  CLKINVX1 U115 ( .A(n52), .Y(n50) );
  INVX1 U116 ( .A(n43), .Y(n41) );
  CLKINVX1 U117 ( .A(n42), .Y(n60) );
  CLKINVX1 U118 ( .A(n53), .Y(n1) );
endmodule


module geofence_DW01_sub_31 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n15, n17, n18, n19,
         n20, n21, n23, n25, n26, n27, n28, n29, n31, n33, n34, n35, n36, n37,
         n39, n41, n42, n43, n44, n45, n46, n48, n50, n52, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n104, n105, n106, n108;

  NAND2X1 U40 ( .A(n104), .B(n33), .Y(n6) );
  OAI21X4 U45 ( .A0(n35), .A1(n37), .B0(n36), .Y(n34) );
  XNOR2X1 U50 ( .A(n8), .B(n42), .Y(DIFF[2]) );
  NAND2XL U54 ( .A(n105), .B(n41), .Y(n8) );
  OAI21X4 U59 ( .A0(n43), .A1(n45), .B0(n44), .Y(n42) );
  NAND2XL U60 ( .A(n54), .B(n44), .Y(n9) );
  NOR2X1 U62 ( .A(A[1]), .B(n63), .Y(n43) );
  NAND2X1 U63 ( .A(A[1]), .B(n63), .Y(n44) );
  XNOR2X1 U64 ( .A(A[0]), .B(n64), .Y(DIFF[0]) );
  NOR2X1 U65 ( .A(A[0]), .B(n64), .Y(n45) );
  NAND2X1 U57 ( .A(A[2]), .B(n62), .Y(n41) );
  NAND2X1 U43 ( .A(A[4]), .B(n60), .Y(n33) );
  NAND2X1 U49 ( .A(A[3]), .B(n61), .Y(n36) );
  NOR2X1 U48 ( .A(A[3]), .B(n61), .Y(n35) );
  AOI21X2 U51 ( .A0(n105), .A1(n42), .B0(n39), .Y(n37) );
  NAND2XL U35 ( .A(n59), .B(A[5]), .Y(n28) );
  NAND2X1 U29 ( .A(n58), .B(A[6]), .Y(n25) );
  AOI21X1 U37 ( .A0(n34), .A1(n104), .B0(n31), .Y(n29) );
  NAND2XL U46 ( .A(n52), .B(n36), .Y(n7) );
  XOR2X1 U58 ( .A(n9), .B(n45), .Y(DIFF[1]) );
  XOR2XL U44 ( .A(n7), .B(n37), .Y(DIFF[3]) );
  NAND2X1 U15 ( .A(n56), .B(A[8]), .Y(n17) );
  NAND2X1 U21 ( .A(A[7]), .B(n57), .Y(n20) );
  XNOR2X1 U36 ( .A(n34), .B(n6), .Y(DIFF[4]) );
  AOI21X1 U23 ( .A0(n26), .A1(n106), .B0(n23), .Y(n21) );
  XOR2XL U30 ( .A(n29), .B(n5), .Y(DIFF[5]) );
  OAI21X1 U17 ( .A0(n21), .A1(n19), .B0(n20), .Y(n18) );
  NAND2X1 U12 ( .A(n108), .B(n17), .Y(n2) );
  XNOR2XL U8 ( .A(n18), .B(n2), .Y(DIFF[8]) );
  NAND2XL U18 ( .A(n48), .B(n20), .Y(n3) );
  NAND2X1 U26 ( .A(n106), .B(n25), .Y(n4) );
  NOR2X1 U6 ( .A(n55), .B(A[9]), .Y(n11) );
  XOR2XL U16 ( .A(n21), .B(n3), .Y(DIFF[7]) );
  XNOR2X1 U22 ( .A(n26), .B(n4), .Y(DIFF[6]) );
  NAND2X1 U7 ( .A(n55), .B(A[9]), .Y(n12) );
  NAND2X1 U4 ( .A(n46), .B(n12), .Y(n1) );
  AOI21X1 U9 ( .A0(n18), .A1(n108), .B0(n15), .Y(n13) );
  XOR2XL U2 ( .A(n13), .B(n1), .Y(DIFF[9]) );
  OAI21X1 U31 ( .A0(n29), .A1(n27), .B0(n28), .Y(n26) );
  OR2X1 U79 ( .A(n56), .B(A[8]), .Y(n108) );
  OR2X1 U80 ( .A(n58), .B(A[6]), .Y(n106) );
  OR2X1 U81 ( .A(A[4]), .B(n60), .Y(n104) );
  INVX1 U82 ( .A(n11), .Y(n46) );
  INVXL U83 ( .A(n17), .Y(n15) );
  CLKINVX1 U84 ( .A(B[9]), .Y(n55) );
  INVXL U85 ( .A(n25), .Y(n23) );
  INVXL U86 ( .A(n27), .Y(n50) );
  CLKINVX1 U87 ( .A(B[8]), .Y(n56) );
  CLKINVX1 U88 ( .A(B[7]), .Y(n57) );
  INVX1 U89 ( .A(B[6]), .Y(n58) );
  INVXL U90 ( .A(n33), .Y(n31) );
  CLKINVX1 U91 ( .A(B[5]), .Y(n59) );
  INVXL U92 ( .A(B[4]), .Y(n60) );
  INVXL U93 ( .A(n41), .Y(n39) );
  INVX1 U94 ( .A(B[3]), .Y(n61) );
  NOR2X1 U95 ( .A(n59), .B(A[5]), .Y(n27) );
  NAND2XL U96 ( .A(n50), .B(n28), .Y(n5) );
  NOR2XL U97 ( .A(A[7]), .B(n57), .Y(n19) );
  INVXL U98 ( .A(B[0]), .Y(n64) );
  OR2X2 U99 ( .A(A[2]), .B(n62), .Y(n105) );
  OA21XL U100 ( .A0(n13), .A1(n11), .B0(n12), .Y(DIFF[10]) );
  CLKINVX1 U101 ( .A(B[1]), .Y(n63) );
  CLKINVX1 U102 ( .A(B[2]), .Y(n62) );
  INVXL U103 ( .A(n43), .Y(n54) );
  CLKINVX1 U104 ( .A(n35), .Y(n52) );
  CLKINVX1 U105 ( .A(n19), .Y(n48) );
endmodule


module geofence_DW01_sub_33 ( A, B, CI, DIFF, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n123;

  XOR2X1 U1 ( .A(n2), .B(n1), .Y(DIFF[22]) );
  XOR2X1 U2 ( .A(n25), .B(A[22]), .Y(n1) );
  ADDFXL U3 ( .A(n26), .B(A[21]), .CI(n3), .CO(n2), .S(DIFF[21]) );
  ADDFXL U4 ( .A(n27), .B(A[20]), .CI(n4), .CO(n3), .S(DIFF[20]) );
  ADDFXL U5 ( .A(n28), .B(A[19]), .CI(n5), .CO(n4), .S(DIFF[19]) );
  ADDFXL U6 ( .A(n29), .B(A[18]), .CI(n6), .CO(n5), .S(DIFF[18]) );
  ADDFXL U7 ( .A(n30), .B(A[17]), .CI(n7), .CO(n6), .S(DIFF[17]) );
  ADDFXL U8 ( .A(n31), .B(A[16]), .CI(n8), .CO(n7), .S(DIFF[16]) );
  ADDFXL U9 ( .A(n32), .B(A[15]), .CI(n9), .CO(n8), .S(DIFF[15]) );
  ADDFXL U10 ( .A(n33), .B(A[14]), .CI(n10), .CO(n9), .S(DIFF[14]) );
  ADDFXL U11 ( .A(n34), .B(A[13]), .CI(n11), .CO(n10), .S(DIFF[13]) );
  ADDFXL U12 ( .A(n35), .B(A[12]), .CI(n12), .CO(n11), .S(DIFF[12]) );
  ADDFXL U13 ( .A(n36), .B(A[11]), .CI(n13), .CO(n12), .S(DIFF[11]) );
  ADDFXL U14 ( .A(n37), .B(A[10]), .CI(n14), .CO(n13), .S(DIFF[10]) );
  ADDFXL U15 ( .A(n38), .B(A[9]), .CI(n15), .CO(n14), .S(DIFF[9]) );
  ADDFXL U16 ( .A(n39), .B(A[8]), .CI(n16), .CO(n15), .S(DIFF[8]) );
  ADDFXL U17 ( .A(n40), .B(A[7]), .CI(n17), .CO(n16), .S(DIFF[7]) );
  ADDFXL U18 ( .A(n41), .B(A[6]), .CI(n18), .CO(n17), .S(DIFF[6]) );
  ADDFXL U19 ( .A(n19), .B(A[5]), .CI(n42), .CO(n18), .S(DIFF[5]) );
  ADDFXL U20 ( .A(n20), .B(A[4]), .CI(n43), .CO(n19), .S(DIFF[4]) );
  ADDFXL U21 ( .A(n44), .B(A[3]), .CI(n21), .CO(n20), .S(DIFF[3]) );
  ADDFXL U22 ( .A(n22), .B(A[2]), .CI(n45), .CO(n21), .S(DIFF[2]) );
  ADDFXL U23 ( .A(n123), .B(A[1]), .CI(n46), .CO(n22), .S(DIFF[1]) );
  XNOR2X1 U25 ( .A(n47), .B(A[0]), .Y(DIFF[0]) );
  OR2XL U53 ( .A(n47), .B(A[0]), .Y(n123) );
  INVXL U54 ( .A(B[0]), .Y(n47) );
  INVXL U55 ( .A(B[1]), .Y(n46) );
  INVXL U56 ( .A(B[2]), .Y(n45) );
  INVXL U57 ( .A(B[3]), .Y(n44) );
  INVXL U58 ( .A(B[4]), .Y(n43) );
  INVXL U59 ( .A(B[5]), .Y(n42) );
  INVXL U60 ( .A(B[6]), .Y(n41) );
  INVXL U61 ( .A(B[7]), .Y(n40) );
  INVXL U62 ( .A(B[8]), .Y(n39) );
  INVXL U63 ( .A(B[9]), .Y(n38) );
  INVXL U64 ( .A(B[10]), .Y(n37) );
  INVXL U65 ( .A(B[11]), .Y(n36) );
  INVXL U66 ( .A(B[12]), .Y(n35) );
  INVXL U67 ( .A(B[13]), .Y(n34) );
  INVXL U68 ( .A(B[14]), .Y(n33) );
  INVXL U69 ( .A(B[15]), .Y(n32) );
  INVXL U70 ( .A(B[16]), .Y(n31) );
  INVXL U71 ( .A(B[17]), .Y(n30) );
  INVXL U72 ( .A(B[18]), .Y(n29) );
  INVXL U73 ( .A(B[19]), .Y(n28) );
  INVXL U74 ( .A(B[20]), .Y(n27) );
  INVXL U75 ( .A(B[21]), .Y(n26) );
  INVXL U76 ( .A(B[22]), .Y(n25) );
endmodule


module geofence_DW01_sub_35 ( A, B, CI, DIFF, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n122;

  XOR2X1 U1 ( .A(n2), .B(n1), .Y(DIFF[22]) );
  XOR2X1 U2 ( .A(A[22]), .B(n27), .Y(n1) );
  ADDFXL U3 ( .A(B[21]), .B(n27), .CI(n3), .CO(n2), .S(DIFF[21]) );
  ADDFXL U4 ( .A(n28), .B(A[20]), .CI(n4), .CO(n3), .S(DIFF[20]) );
  ADDFXL U5 ( .A(n29), .B(A[19]), .CI(n5), .CO(n4), .S(DIFF[19]) );
  ADDFXL U6 ( .A(n30), .B(A[18]), .CI(n6), .CO(n5), .S(DIFF[18]) );
  ADDFXL U7 ( .A(n31), .B(A[17]), .CI(n7), .CO(n6), .S(DIFF[17]) );
  ADDFXL U8 ( .A(n32), .B(A[16]), .CI(n8), .CO(n7), .S(DIFF[16]) );
  ADDFXL U9 ( .A(n33), .B(A[15]), .CI(n9), .CO(n8), .S(DIFF[15]) );
  ADDFXL U10 ( .A(n34), .B(A[14]), .CI(n10), .CO(n9), .S(DIFF[14]) );
  ADDFXL U11 ( .A(n35), .B(A[13]), .CI(n11), .CO(n10), .S(DIFF[13]) );
  ADDFXL U12 ( .A(n36), .B(A[12]), .CI(n12), .CO(n11), .S(DIFF[12]) );
  ADDFXL U13 ( .A(n37), .B(A[11]), .CI(n13), .CO(n12), .S(DIFF[11]) );
  ADDFXL U14 ( .A(n38), .B(A[10]), .CI(n14), .CO(n13), .S(DIFF[10]) );
  ADDFXL U15 ( .A(n39), .B(A[9]), .CI(n15), .CO(n14), .S(DIFF[9]) );
  ADDFXL U16 ( .A(n40), .B(A[8]), .CI(n16), .CO(n15), .S(DIFF[8]) );
  ADDFXL U17 ( .A(n41), .B(A[7]), .CI(n17), .CO(n16), .S(DIFF[7]) );
  ADDFXL U18 ( .A(n42), .B(A[6]), .CI(n18), .CO(n17), .S(DIFF[6]) );
  ADDFXL U19 ( .A(n43), .B(A[5]), .CI(n19), .CO(n18), .S(DIFF[5]) );
  ADDFXL U20 ( .A(n44), .B(A[4]), .CI(n20), .CO(n19), .S(DIFF[4]) );
  ADDFXL U21 ( .A(n45), .B(A[3]), .CI(n21), .CO(n20), .S(DIFF[3]) );
  ADDFXL U22 ( .A(n46), .B(A[2]), .CI(n22), .CO(n21), .S(DIFF[2]) );
  ADDFXL U23 ( .A(n47), .B(A[1]), .CI(n122), .CO(n22), .S(DIFF[1]) );
  XNOR2X1 U25 ( .A(n48), .B(A[0]), .Y(DIFF[0]) );
  OR2XL U53 ( .A(n48), .B(A[0]), .Y(n122) );
  INVXL U54 ( .A(B[0]), .Y(n48) );
  INVXL U55 ( .A(B[1]), .Y(n47) );
  INVXL U56 ( .A(B[2]), .Y(n46) );
  INVXL U57 ( .A(B[3]), .Y(n45) );
  INVXL U58 ( .A(B[4]), .Y(n44) );
  INVXL U59 ( .A(B[5]), .Y(n43) );
  INVXL U60 ( .A(B[6]), .Y(n42) );
  INVXL U61 ( .A(B[7]), .Y(n41) );
  INVXL U62 ( .A(B[8]), .Y(n40) );
  INVXL U63 ( .A(B[9]), .Y(n39) );
  INVXL U64 ( .A(B[10]), .Y(n38) );
  INVXL U65 ( .A(B[11]), .Y(n37) );
  INVXL U66 ( .A(B[12]), .Y(n36) );
  INVXL U67 ( .A(B[13]), .Y(n35) );
  INVXL U68 ( .A(B[14]), .Y(n34) );
  INVXL U69 ( .A(B[15]), .Y(n33) );
  INVXL U70 ( .A(B[16]), .Y(n32) );
  INVXL U71 ( .A(B[17]), .Y(n31) );
  INVXL U72 ( .A(B[18]), .Y(n30) );
  INVXL U73 ( .A(B[19]), .Y(n29) );
  INVXL U74 ( .A(B[20]), .Y(n28) );
  INVXL U75 ( .A(A[21]), .Y(n27) );
endmodule


module geofence ( clk, reset, X, Y, R, valid, is_inside );
  input [9:0] X;
  input [9:0] Y;
  input [10:0] R;
  input clk, reset;
  output valid, is_inside;
  wire   n3377, N583, N584, N585, N586, N587, N588, N589, N590, N591, N592,
         N593, N594, N595, N596, N597, N598, N599, N600, N601, N602, N603,
         N604, N605, N606, N607, N608, N609, N610, N611, N612, N613, N614,
         N615, N616, N617, N618, N619, N620, N621, N622, N623, N624, N625,
         N626, N627, N628, \xCoor[5][9] , \xCoor[5][8] , \xCoor[5][7] ,
         \xCoor[5][6] , \xCoor[5][5] , \xCoor[5][4] , \xCoor[5][3] ,
         \xCoor[5][2] , \xCoor[5][1] , \xCoor[5][0] , \xCoor[4][9] ,
         \xCoor[4][8] , \xCoor[4][7] , \xCoor[4][6] , \xCoor[4][5] ,
         \xCoor[4][4] , \xCoor[4][3] , \xCoor[4][2] , \xCoor[4][1] ,
         \xCoor[4][0] , \xCoor[3][9] , \xCoor[3][8] , \xCoor[3][7] ,
         \xCoor[3][6] , \xCoor[3][5] , \xCoor[3][4] , \xCoor[3][3] ,
         \xCoor[3][2] , \xCoor[3][1] , \xCoor[3][0] , \xCoor[2][9] ,
         \xCoor[2][8] , \xCoor[2][7] , \xCoor[2][6] , \xCoor[2][5] ,
         \xCoor[2][4] , \xCoor[2][3] , \xCoor[2][2] , \xCoor[2][1] ,
         \xCoor[2][0] , \xCoor[1][9] , \xCoor[1][8] , \xCoor[1][7] ,
         \xCoor[1][6] , \xCoor[1][5] , \xCoor[1][4] , \xCoor[1][3] ,
         \xCoor[1][2] , \xCoor[1][1] , \xCoor[1][0] , \xCoor[0][9] ,
         \xCoor[0][8] , \xCoor[0][7] , \xCoor[0][6] , \xCoor[0][5] ,
         \xCoor[0][4] , \xCoor[0][3] , \xCoor[0][2] , \xCoor[0][1] ,
         \xCoor[0][0] , N697, N698, N699, N700, N701, N702, N703, N704, N705,
         N706, N707, N756, N757, N758, N759, N760, N761, N762, N763, N764,
         N765, N766, \R_len[5][9] , \R_len[5][8] , \R_len[5][7] ,
         \R_len[5][6] , \R_len[5][5] , \R_len[5][4] , \R_len[5][3] ,
         \R_len[5][2] , \R_len[5][1] , \R_len[5][0] , \R_len[4][9] ,
         \R_len[4][8] , \R_len[4][7] , \R_len[4][6] , \R_len[4][5] ,
         \R_len[4][4] , \R_len[4][3] , \R_len[4][2] , \R_len[4][1] ,
         \R_len[4][0] , \R_len[3][9] , \R_len[3][8] , \R_len[3][7] ,
         \R_len[3][6] , \R_len[3][5] , \R_len[3][4] , \R_len[3][3] ,
         \R_len[3][2] , \R_len[3][1] , \R_len[3][0] , \R_len[2][9] ,
         \R_len[2][8] , \R_len[2][7] , \R_len[2][6] , \R_len[2][5] ,
         \R_len[2][4] , \R_len[2][3] , \R_len[2][2] , \R_len[2][1] ,
         \R_len[2][0] , \R_len[1][9] , \R_len[1][8] , \R_len[1][7] ,
         \R_len[1][6] , \R_len[1][5] , \R_len[1][4] , \R_len[1][3] ,
         \R_len[1][2] , \R_len[1][1] , \R_len[1][0] , \R_len[0][9] ,
         \R_len[0][8] , \R_len[0][7] , \R_len[0][6] , \R_len[0][5] ,
         \R_len[0][4] , \R_len[0][3] , \R_len[0][2] , \R_len[0][1] ,
         \R_len[0][0] , N783, N784, N785, N786, N787, N788, N789, N790, N791,
         N792, N793, \yCoor[5][9] , \yCoor[5][8] , \yCoor[5][7] ,
         \yCoor[5][6] , \yCoor[5][5] , \yCoor[5][4] , \yCoor[5][3] ,
         \yCoor[5][2] , \yCoor[5][1] , \yCoor[5][0] , \yCoor[4][9] ,
         \yCoor[4][8] , \yCoor[4][7] , \yCoor[4][6] , \yCoor[4][5] ,
         \yCoor[4][4] , \yCoor[4][3] , \yCoor[4][2] , \yCoor[4][1] ,
         \yCoor[4][0] , \yCoor[3][9] , \yCoor[3][8] , \yCoor[3][7] ,
         \yCoor[3][6] , \yCoor[3][5] , \yCoor[3][4] , \yCoor[3][3] ,
         \yCoor[3][2] , \yCoor[3][1] , \yCoor[3][0] , \yCoor[2][9] ,
         \yCoor[2][8] , \yCoor[2][7] , \yCoor[2][6] , \yCoor[2][5] ,
         \yCoor[2][4] , \yCoor[2][3] , \yCoor[2][2] , \yCoor[2][1] ,
         \yCoor[2][0] , \yCoor[1][9] , \yCoor[1][8] , \yCoor[1][7] ,
         \yCoor[1][6] , \yCoor[1][5] , \yCoor[1][4] , \yCoor[1][3] ,
         \yCoor[1][2] , \yCoor[1][1] , \yCoor[1][0] , \yCoor[0][9] ,
         \yCoor[0][8] , \yCoor[0][7] , \yCoor[0][6] , \yCoor[0][5] ,
         \yCoor[0][4] , \yCoor[0][3] , \yCoor[0][2] , \yCoor[0][1] ,
         \yCoor[0][0] , N862, N863, N864, N865, N866, N867, N868, N869, N870,
         N871, N872, N895, N896, N897, N898, N901, N902, N903, N904, N921,
         N922, N923, N924, N925, N926, N927, N928, N929, N930, N931, N932,
         N933, N934, N935, N936, N937, N938, N939, N940, N941, N942, N959,
         N960, N961, N962, N963, N964, N965, N966, N967, N968, N969, N1009,
         N1010, N1011, N1012, N1013, N1014, N1015, N1016, N1017, N1018, N1019,
         N1020, N1021, N1022, N1023, N1024, N1025, N1026, N1027, N1028, N1029,
         N1078, N1079, N1080, N1081, N1082, N1083, N1084, N1085, N1086, N1087,
         N1088, N1139, N1140, N1141, N1142, N1143, N1144, N1145, N1146, N1147,
         N1148, N1149, N1150, N1151, N1152, N1153, N1154, N1155, N1156, N1157,
         N1158, N1159, N1208, N1209, N1210, N1211, N1212, N1213, N1214, N1215,
         N1216, N1217, N1218, N1280, N1281, N1282, N1283, N1284, N1285, N1286,
         N1287, N1288, N1289, N1290, N1303, N1304, N1305, N1306, N1307, N1308,
         N1309, N1310, N1311, N1312, N1313, N1314, N1315, N1316, N1317, N1318,
         N1319, N1320, N1321, N1322, N1323, N1324, N1325, N1326, N1327, N1328,
         N1329, N1330, N1331, N1332, N1333, N1334, N1335, N1336, N1337, N1338,
         N1339, N1340, N1341, N1342, N1343, N1344, N1345, N1346, N1347, N1348,
         N1393, N1394, N1395, N1396, N1397, N1398, N1399, N1400, N1401, N1402,
         N1415, N1416, N1417, N1418, N1421, N1422, N1423, N1424, N1596, N1597,
         N1598, N1599, N1600, N1601, N1602, N1603, N1604, N1605, N1799, N1800,
         N1801, N1802, N1803, N1804, N1805, N1806, N1807, N1808, N1821, N1822,
         N1823, N1824, N1825, N1827, N1829, N1830, N2173, N2174, N2175, N2176,
         N2178, n98, n102, n104, n105, n106, n107, n109, n110, n111, n112,
         n114, n116, n118, n120, n122, n124, n126, n128, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n146, n147, n148, n150, n151, n153, n155, n157, n159, n161,
         n163, n165, n167, n169, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n212,
         n214, n216, n218, n220, n222, n224, n226, n228, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n243, n245,
         n247, n249, n251, n253, n255, n257, n259, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n292, n294, n296, n298, n300, n302, n304,
         n306, n308, n310, n312, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n331, n333,
         n335, n337, n339, n341, n343, n345, n347, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n388,
         n389, n391, n392, n393, n394, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n420, n421, n422, n423, n424, n425,
         n428, n429, n434, n436, n437, n440, n441, n442, n443, n444, n445,
         n449, n450, n451, n452, n453, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n724, n725, n726,
         n727, n728, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, n942, n943, n944, n945, n946, n947, n948,
         n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, n959,
         n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
         n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981,
         n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992,
         n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n2940, n2943, n2946, n2947,
         n2951, n2952, n2956, n2958, n2959, n2962, n2966, n2969, n2970, n2974,
         n2975, n2976, n2977, n2978, n2979, n2980, n2985, n2992, n2993, n2994,
         n2995, n2996, n2997, n2999, n3000, n3001, n3002, n3003, n3004, n3005,
         n3006, n3007, n3008, n3009, n3011, n3012, n3013, n3014, n3015, n3016,
         n3017, n3018, n3019, n3020, n3021, n3022, n3023, n3024, n3025, n3026,
         n3027, n3028, n3029, n3030, n3031, n3032, n3033, n3034, n3035, n3036,
         n3037, n3038, n3039, n3040, n3041, n3042, n3043, n3044, n3045, n3046,
         n3047, n3048, n3049, n3050, n3051, n3052, n3053, n3054, n3055, n3056,
         n3057, n3058, n3059, n3060, n3061, n3062, n3063, n3065, n3068, n3069,
         n3070, n3071, n3072, n3073, n3074, n3075, n3076, n3077, n3078, n3079,
         n3080, n3081, n3082, n3083, n3084, n3085, n3086, n3087, n3088, n3089,
         n3090, n3091, n3092, n3093, n3094, n3095, n3096, n3097, n3098, n3099,
         n3100, n3101, n3102, n3103, n3104, n3105, n3106, n3107, n3108, n3109,
         n3110, n3111, n3112, n3113, n3114, n3115, n3116, n3117, n3118, n3119,
         n3120, n3121, n3122, n3123, n3124, n3125, n3126, n3127, n3128, n3129,
         n3130, n3133, n3134, n3135, n3136, n3137, n3138, n3139, n3140, n3141,
         n3142, n3143, n3144, n3145, n3146, n3147, n3148, n3149, n3150, n3151,
         n3152, n3153, n3154, n3155, n3156, n3157, n3158, n3159, n3160, n3161,
         n3162, n3163, n3164, n3165, n3166, n3167, n3168, n3169, n3170, n3171,
         n3172, n3173, n3174, n3175, n3176, n3177, n3178, n3179, n3180, n3181,
         n3182, n3183, n3184, n3185, n3186, n3187, n3188, n3189, n3190, n3191,
         n3192, n3193, n3194, n3195, n3196, n3197, n3199, n3202, n3203, n3204,
         n3205, n3206, n3208, n3209, n3210, n3212, n3213, n3214, n3215, n3216,
         n3217, n3219, n3220, n3221, n3222, n3223, n3224, n3225, n3226, n3228,
         n3229, n3230, n3231, n3233, n3234, n3235, n3236, n3237, n3238, n3239,
         n3240, n3241, n3242, n3243, n3244, n3245, n3246, n3247, n3248, n3249,
         n3250, n3251, n3252, n3253, n3254, n3255, n3256, n3257, n3258, n3259,
         n3260, n3261, n3262, n3263, n3264, n3265, n3266, n3267, n3268, n3269,
         n3270, n3271, n3272, n3273, n3274, n3275, n3276, n3277, n3278, n3279,
         n3280, n3281, n3282, n3283, n3284, n3285, n3286, n3287, n3288, n3289,
         n3290, n3291, n3292, n3293, n3294, n3295, n3296, n3297, n3298, n3299,
         n3300, n3301, n3302, n3303, n3304, n3305, n3306, n3307, n3308, n3309,
         n3310, n3311, n3312, n3313, n3314, n3315, n3316, n3317, n3318, n3319,
         n3320, n3321, n3322, n3323, n3324, n3325, n3326, n3327, n3328, n3329,
         n3330, n3331, n3332, n3333, n3334, n3335, n3336, n3337, n3338, n3339,
         n3340, n3341, n3342, n3343, n3344, n3345, n3346, n3347, n3348, n3349,
         n3350, n3351, n3352, n3353, n3354, n3355, n3356, n3357, n3358, n3360,
         n3361, n3363, n3364, n3365, n3366, n3367, n3368, n3369, n3370, n3371,
         n3372, n3373, n3378, n3379, n3380, n3381, n3382, n3383, n3384, n3385,
         n3386, n3387, n3388, n3389, n3390, n3391, n3392, n3393, n3394, n3395,
         n3396, n3397, n3398, n3399, n3400, n3401, n3402, n3403, n3404, n3405,
         n3406, n3407, n3408, n3409, n3410, n3411, n3412, n3413, n3414, n3415,
         n3416, n3417, n3418, n3419, n3420, n3421, n3422, n3423, n3424, n3425,
         n3426, n3427, n3428, n3429, n3430, n3431, n3432, n3433, n3434, n3435,
         n3436, n3437, n3438, n3439, n3440, n3441, n3442, n3443, n3444, n3445,
         n3446, n3447, n3448, n3449, n3450, n3451, n3452, n3453, n3454, n3455,
         n3456, n3457, n3458, n3459, n3460, n3461, n3462, n3463, n3464, n3465,
         n3466, n3467, n3468, n3469, n3470, n3471, n3475;
  wire   [10:0] mul_srcA1;
  wire   [10:0] mul_srcB1;
  wire   [21:0] mulResult1;
  wire   [10:0] mul_srcA2;
  wire   [10:0] mul_srcB2;
  wire   [21:0] mulResult2;
  wire   [22:0] outterProduct;
  wire   [11:0] rootOut;
  wire   [9:0] rootOutRound;
  wire   [2:0] idx1;
  wire   [2:0] idx0;
  wire   [2:0] idx2;
  wire   [10:0] S;
  wire   [9:0] tempOfRoot1;
  wire   [9:0] rootOutRound_reg;
  wire   [9:0] tempOfRoot2;
  wire   [22:0] acc;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  DFFRX1 errFlag_reg ( .D(n807), .CK(clk), .RN(n3219), .Q(n2947), .QN(n3361)
         );
  DFFRX1 \acc_reg[20]  ( .D(n990), .CK(clk), .RN(n3220), .Q(acc[20]), .QN(n774) );
  DFFRX1 \acc_reg[19]  ( .D(n991), .CK(clk), .RN(n3220), .Q(acc[19]), .QN(n775) );
  DFFRX1 \acc_reg[21]  ( .D(n989), .CK(clk), .RN(n3220), .Q(acc[21]), .QN(n773) );
  DFFRX1 \acc_reg[17]  ( .D(n993), .CK(clk), .RN(n3220), .Q(acc[17]), .QN(n777) );
  DFFRX1 \acc_reg[13]  ( .D(n997), .CK(clk), .RN(n3220), .Q(acc[13]), .QN(n781) );
  DFFRX1 \acc_reg[6]  ( .D(n1004), .CK(clk), .RN(n3222), .Q(acc[6]), .QN(n788)
         );
  DFFRX1 \acc_reg[2]  ( .D(n1008), .CK(clk), .RN(n3223), .Q(acc[2]), .QN(n792)
         );
  DFFRX1 \acc_reg[18]  ( .D(n992), .CK(clk), .RN(n3220), .Q(acc[18]), .QN(n776) );
  DFFRX1 \acc_reg[15]  ( .D(n995), .CK(clk), .RN(n3220), .Q(acc[15]), .QN(n779) );
  DFFRX1 \acc_reg[11]  ( .D(n999), .CK(clk), .RN(n3224), .Q(acc[11]), .QN(n783) );
  DFFRX1 \acc_reg[8]  ( .D(n1002), .CK(clk), .RN(n3222), .Q(acc[8]), .QN(n786)
         );
  DFFRX1 \acc_reg[4]  ( .D(n1006), .CK(clk), .RN(n3222), .Q(acc[4]), .QN(n790)
         );
  DFFRX1 \acc_reg[16]  ( .D(n994), .CK(clk), .RN(n3220), .Q(acc[16]), .QN(n778) );
  DFFRX1 \acc_reg[14]  ( .D(n996), .CK(clk), .RN(n3220), .Q(acc[14]), .QN(n780) );
  DFFRX1 \acc_reg[10]  ( .D(n1000), .CK(clk), .RN(n3288), .Q(acc[10]), .QN(
        n784) );
  DFFRX1 \acc_reg[7]  ( .D(n1003), .CK(clk), .RN(n3288), .Q(acc[7]), .QN(n787)
         );
  DFFRX1 \acc_reg[3]  ( .D(n1007), .CK(clk), .RN(n3223), .Q(acc[3]), .QN(n791)
         );
  DFFRX1 \acc_reg[12]  ( .D(n998), .CK(clk), .RN(n3220), .Q(acc[12]), .QN(n782) );
  DFFRX1 \acc_reg[9]  ( .D(n1001), .CK(clk), .RN(n3224), .Q(acc[9]), .QN(n785)
         );
  DFFRX1 \acc_reg[5]  ( .D(n1005), .CK(clk), .RN(n3222), .Q(acc[5]), .QN(n789)
         );
  DFFRX1 \acc_reg[1]  ( .D(n1009), .CK(clk), .RN(n3222), .Q(acc[1]), .QN(n793)
         );
  DFFRX1 \acc_reg[22]  ( .D(n988), .CK(clk), .RN(n3220), .Q(acc[22]), .QN(n772) );
  DFFRX1 \acc_reg[0]  ( .D(n1010), .CK(clk), .RN(n3217), .Q(acc[0]), .QN(n527)
         );
  DFFRX1 \rootOutRound_reg_reg[8]  ( .D(n735), .CK(clk), .RN(n3224), .Q(
        rootOutRound_reg[8]), .QN(n728) );
  DFFRX1 \rootOutRound_reg_reg[6]  ( .D(n741), .CK(clk), .RN(n3219), .Q(
        rootOutRound_reg[6]), .QN(n726) );
  DFFRX1 \rootOutRound_reg_reg[4]  ( .D(n747), .CK(clk), .RN(n3222), .Q(
        rootOutRound_reg[4]), .QN(n724) );
  DFFRX1 \rootOutRound_reg_reg[2]  ( .D(n753), .CK(clk), .RN(n3222), .Q(
        rootOutRound_reg[2]), .QN(n722) );
  DFFRX2 \S_reg[9]  ( .D(n762), .CK(clk), .RN(n3219), .Q(S[9]), .QN(n711) );
  DFFRX1 \tempOfRoot2_reg[0]  ( .D(n757), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[0]) );
  DFFRX1 \tempOfRoot1_reg[0]  ( .D(n758), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[0]) );
  DFFRX1 \tempOfRoot2_reg[1]  ( .D(n754), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[1]) );
  DFFRX1 \tempOfRoot1_reg[1]  ( .D(n755), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[1]) );
  DFFRX1 \tempOfRoot2_reg[2]  ( .D(n751), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[2]) );
  DFFRX1 \tempOfRoot1_reg[2]  ( .D(n752), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[2]) );
  DFFRX1 \tempOfRoot2_reg[3]  ( .D(n748), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[3]) );
  DFFRX1 \tempOfRoot1_reg[3]  ( .D(n749), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[3]) );
  DFFRX1 \tempOfRoot2_reg[4]  ( .D(n745), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[4]) );
  DFFRX1 \tempOfRoot1_reg[4]  ( .D(n746), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[4]) );
  DFFRX1 \tempOfRoot2_reg[5]  ( .D(n742), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[5]) );
  DFFRX1 \tempOfRoot1_reg[5]  ( .D(n743), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[5]) );
  DFFRX1 \tempOfRoot2_reg[6]  ( .D(n739), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[6]) );
  DFFRX1 \tempOfRoot1_reg[6]  ( .D(n740), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[6]) );
  DFFRX1 \tempOfRoot2_reg[7]  ( .D(n736), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[7]) );
  DFFRX1 \tempOfRoot1_reg[7]  ( .D(n737), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[7]) );
  DFFRX1 \tempOfRoot2_reg[8]  ( .D(n733), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[8]) );
  DFFRX1 \tempOfRoot1_reg[8]  ( .D(n734), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[8]) );
  DFFRX1 \tempOfRoot2_reg[9]  ( .D(n730), .CK(clk), .RN(n3288), .Q(
        tempOfRoot2[9]) );
  DFFRX1 \tempOfRoot1_reg[9]  ( .D(n731), .CK(clk), .RN(n3288), .Q(
        tempOfRoot1[9]) );
  DFFRXL \xCoor_reg[4][8]  ( .D(n885), .CK(clk), .RN(n3288), .Q(\xCoor[4][8] ), 
        .QN(n630) );
  DFFRXL \xCoor_reg[1][8]  ( .D(n915), .CK(clk), .RN(n3288), .Q(\xCoor[1][8] ), 
        .QN(n600) );
  DFFRXL \xCoor_reg[5][2]  ( .D(n869), .CK(clk), .RN(n3288), .Q(\xCoor[5][2] ), 
        .QN(n646) );
  DFFRXL \xCoor_reg[4][2]  ( .D(n879), .CK(clk), .RN(n3288), .Q(\xCoor[4][2] ), 
        .QN(n636) );
  DFFRXL \xCoor_reg[1][2]  ( .D(n909), .CK(clk), .RN(n3288), .Q(\xCoor[1][2] ), 
        .QN(n606) );
  DFFRXL \xCoor_reg[5][6]  ( .D(n873), .CK(clk), .RN(n3288), .Q(\xCoor[5][6] ), 
        .QN(n642) );
  DFFRXL \xCoor_reg[5][4]  ( .D(n871), .CK(clk), .RN(n3288), .Q(\xCoor[5][4] ), 
        .QN(n644) );
  DFFRXL \xCoor_reg[4][6]  ( .D(n883), .CK(clk), .RN(n3288), .Q(\xCoor[4][6] ), 
        .QN(n632) );
  DFFRXL \xCoor_reg[1][6]  ( .D(n913), .CK(clk), .RN(n3288), .Q(\xCoor[1][6] ), 
        .QN(n602) );
  DFFRXL \xCoor_reg[1][4]  ( .D(n911), .CK(clk), .RN(n3288), .Q(\xCoor[1][4] ), 
        .QN(n604) );
  DFFRXL \yCoor_reg[5][4]  ( .D(n811), .CK(clk), .RN(n3288), .Q(\yCoor[5][4] ), 
        .QN(n704) );
  DFFRXL \yCoor_reg[4][0]  ( .D(n827), .CK(clk), .RN(n3288), .Q(\yCoor[4][0] ), 
        .QN(n688) );
  DFFRXL \yCoor_reg[1][0]  ( .D(n857), .CK(clk), .RN(n3288), .Q(\yCoor[1][0] ), 
        .QN(n658) );
  DFFRXL \yCoor_reg[4][1]  ( .D(n818), .CK(clk), .RN(n3288), .Q(\yCoor[4][1] ), 
        .QN(n697) );
  DFFRXL \yCoor_reg[1][1]  ( .D(n848), .CK(clk), .RN(n3288), .Q(\yCoor[1][1] ), 
        .QN(n667) );
  DFFRXL \yCoor_reg[4][8]  ( .D(n825), .CK(clk), .RN(n3288), .Q(\yCoor[4][8] ), 
        .QN(n690) );
  DFFRXL \yCoor_reg[1][8]  ( .D(n855), .CK(clk), .RN(n3288), .Q(\yCoor[1][8] ), 
        .QN(n660) );
  DFFRXL \yCoor_reg[4][9]  ( .D(n826), .CK(clk), .RN(n3288), .Q(\yCoor[4][9] ), 
        .QN(n689) );
  DFFRXL \yCoor_reg[1][9]  ( .D(n856), .CK(clk), .RN(n3288), .Q(\yCoor[1][9] ), 
        .QN(n659) );
  DFFRXL \yCoor_reg[4][7]  ( .D(n824), .CK(clk), .RN(n3288), .Q(\yCoor[4][7] ), 
        .QN(n691) );
  DFFRXL \yCoor_reg[1][7]  ( .D(n854), .CK(clk), .RN(n3288), .Q(\yCoor[1][7] ), 
        .QN(n661) );
  DFFRXL \yCoor_reg[4][6]  ( .D(n823), .CK(clk), .RN(n3288), .Q(\yCoor[4][6] ), 
        .QN(n692) );
  DFFRXL \yCoor_reg[1][6]  ( .D(n853), .CK(clk), .RN(n3288), .Q(\yCoor[1][6] ), 
        .QN(n662) );
  DFFRXL \yCoor_reg[1][5]  ( .D(n852), .CK(clk), .RN(n3288), .Q(\yCoor[1][5] ), 
        .QN(n663) );
  DFFRXL \yCoor_reg[4][2]  ( .D(n819), .CK(clk), .RN(n3288), .Q(\yCoor[4][2] ), 
        .QN(n696) );
  DFFRXL \yCoor_reg[1][2]  ( .D(n849), .CK(clk), .RN(n3288), .Q(\yCoor[1][2] ), 
        .QN(n666) );
  DFFRXL \yCoor_reg[4][3]  ( .D(n820), .CK(clk), .RN(n3288), .Q(\yCoor[4][3] ), 
        .QN(n695) );
  DFFRXL \yCoor_reg[1][3]  ( .D(n850), .CK(clk), .RN(n3288), .Q(\yCoor[1][3] ), 
        .QN(n665) );
  DFFRXL \R_len_reg[4][4]  ( .D(n941), .CK(clk), .RN(n3288), .Q(\R_len[4][4] ), 
        .QN(n574) );
  DFFRXL \R_len_reg[5][4]  ( .D(n931), .CK(clk), .RN(n3288), .Q(\R_len[5][4] ), 
        .QN(n584) );
  DFFRXL \R_len_reg[1][4]  ( .D(n971), .CK(clk), .RN(n3288), .Q(\R_len[1][4] ), 
        .QN(n544) );
  DFFRXL \R_len_reg[2][7]  ( .D(n964), .CK(clk), .RN(n3288), .Q(\R_len[2][7] ), 
        .QN(n551) );
  DFFRXL \R_len_reg[2][0]  ( .D(n967), .CK(clk), .RN(n3288), .Q(\R_len[2][0] ), 
        .QN(n548) );
  DFFRXL \R_len_reg[3][7]  ( .D(n954), .CK(clk), .RN(n3288), .Q(\R_len[3][7] ), 
        .QN(n561) );
  DFFRXL \R_len_reg[0][7]  ( .D(n984), .CK(clk), .RN(n3288), .Q(\R_len[0][7] ), 
        .QN(n531) );
  DFFRXL \R_len_reg[3][0]  ( .D(n957), .CK(clk), .RN(n3288), .Q(\R_len[3][0] ), 
        .QN(n558) );
  DFFRXL \xCoor_reg[3][5]  ( .D(n892), .CK(clk), .RN(n3288), .Q(\xCoor[3][5] ), 
        .QN(n623) );
  DFFRXL \xCoor_reg[3][4]  ( .D(n891), .CK(clk), .RN(n3288), .Q(\xCoor[3][4] ), 
        .QN(n624) );
  DFFRXL \xCoor_reg[0][5]  ( .D(n922), .CK(clk), .RN(n3288), .Q(\xCoor[0][5] ), 
        .QN(n593) );
  DFFRXL \xCoor_reg[0][4]  ( .D(n921), .CK(clk), .RN(n3288), .Q(\xCoor[0][4] ), 
        .QN(n594) );
  DFFRXL \xCoor_reg[2][9]  ( .D(n906), .CK(clk), .RN(n3288), .Q(\xCoor[2][9] ), 
        .QN(n609) );
  DFFRXL \xCoor_reg[2][8]  ( .D(n905), .CK(clk), .RN(n3288), .Q(\xCoor[2][8] ), 
        .QN(n610) );
  DFFRXL \xCoor_reg[2][0]  ( .D(n907), .CK(clk), .RN(n3288), .Q(\xCoor[2][0] ), 
        .QN(n608) );
  DFFRXL \xCoor_reg[3][3]  ( .D(n890), .CK(clk), .RN(n3288), .Q(\xCoor[3][3] ), 
        .QN(n625) );
  DFFRXL \xCoor_reg[3][2]  ( .D(n889), .CK(clk), .RN(n3288), .Q(\xCoor[3][2] ), 
        .QN(n626) );
  DFFRXL \xCoor_reg[3][1]  ( .D(n888), .CK(clk), .RN(n3288), .Q(\xCoor[3][1] ), 
        .QN(n627) );
  DFFRXL \xCoor_reg[0][3]  ( .D(n920), .CK(clk), .RN(n3288), .Q(\xCoor[0][3] ), 
        .QN(n595) );
  DFFRXL \xCoor_reg[0][2]  ( .D(n919), .CK(clk), .RN(n3288), .Q(\xCoor[0][2] ), 
        .QN(n596) );
  DFFRXL \xCoor_reg[0][1]  ( .D(n918), .CK(clk), .RN(n3288), .Q(\xCoor[0][1] ), 
        .QN(n597) );
  DFFRXL \R_len_reg[2][6]  ( .D(n963), .CK(clk), .RN(n3288), .Q(\R_len[2][6] ), 
        .QN(n552) );
  DFFRXL \xCoor_reg[2][7]  ( .D(n904), .CK(clk), .RN(n3288), .Q(\xCoor[2][7] ), 
        .QN(n611) );
  DFFRXL \xCoor_reg[2][6]  ( .D(n903), .CK(clk), .RN(n3288), .Q(\xCoor[2][6] ), 
        .QN(n612) );
  DFFRXL \xCoor_reg[2][5]  ( .D(n902), .CK(clk), .RN(n3288), .Q(\xCoor[2][5] ), 
        .QN(n613) );
  DFFRXL \xCoor_reg[2][4]  ( .D(n901), .CK(clk), .RN(n3288), .Q(\xCoor[2][4] ), 
        .QN(n614) );
  DFFRXL \xCoor_reg[2][3]  ( .D(n900), .CK(clk), .RN(n3288), .Q(\xCoor[2][3] ), 
        .QN(n615) );
  DFFRXL \xCoor_reg[2][2]  ( .D(n899), .CK(clk), .RN(n3288), .Q(\xCoor[2][2] ), 
        .QN(n616) );
  DFFRXL \xCoor_reg[2][1]  ( .D(n898), .CK(clk), .RN(n3288), .Q(\xCoor[2][1] ), 
        .QN(n617) );
  DFFRXL \R_len_reg[3][6]  ( .D(n953), .CK(clk), .RN(n3288), .Q(\R_len[3][6] ), 
        .QN(n562) );
  DFFRXL \xCoor_reg[3][9]  ( .D(n896), .CK(clk), .RN(n3288), .Q(\xCoor[3][9] ), 
        .QN(n619) );
  DFFRX1 \fstate_reg[3]  ( .D(N2176), .CK(clk), .RN(n3221), .Q(n3017), .QN(
        n803) );
  DFFRX1 \fstate_reg[2]  ( .D(N2175), .CK(clk), .RN(n3221), .Q(n2977), .QN(
        n804) );
  DFFRX1 \fstate_reg[1]  ( .D(N2174), .CK(clk), .RN(n3222), .Q(n2976), .QN(
        n805) );
  DFFRX1 \rootOutRound_reg_reg[9]  ( .D(n732), .CK(clk), .RN(n3219), .Q(
        rootOutRound_reg[9]) );
  DFFRX1 \rootOutRound_reg_reg[7]  ( .D(n738), .CK(clk), .RN(n3223), .Q(
        rootOutRound_reg[7]), .QN(n727) );
  DFFRX1 \rootOutRound_reg_reg[5]  ( .D(n744), .CK(clk), .RN(n3219), .Q(
        rootOutRound_reg[5]), .QN(n725) );
  DFFRX1 \rootOutRound_reg_reg[3]  ( .D(n750), .CK(clk), .RN(n3288), .Q(
        rootOutRound_reg[3]) );
  DFFRX1 \S_reg[6]  ( .D(n765), .CK(clk), .RN(n3221), .Q(S[6]), .QN(n714) );
  DFFRX1 \xCoor_reg[1][9]  ( .D(n916), .CK(clk), .RN(n3219), .Q(\xCoor[1][9] ), 
        .QN(n599) );
  DFFRX1 \xCoor_reg[4][9]  ( .D(n886), .CK(clk), .RN(n3216), .Q(\xCoor[4][9] ), 
        .QN(n629) );
  DFFRX1 \yCoor_reg[5][9]  ( .D(n816), .CK(clk), .RN(n3222), .Q(\yCoor[5][9] ), 
        .QN(n699) );
  DFFRX1 \yCoor_reg[2][9]  ( .D(n846), .CK(clk), .RN(n3215), .Q(\yCoor[2][9] ), 
        .QN(n669) );
  DFFRX1 \xCoor_reg[5][8]  ( .D(n875), .CK(clk), .RN(n3223), .Q(\xCoor[5][8] ), 
        .QN(n640) );
  DFFRX1 \yCoor_reg[5][8]  ( .D(n815), .CK(clk), .RN(n3216), .Q(\yCoor[5][8] ), 
        .QN(n700) );
  DFFRX1 \yCoor_reg[2][8]  ( .D(n845), .CK(clk), .RN(n3288), .Q(\yCoor[2][8] ), 
        .QN(n670) );
  DFFRX1 \xCoor_reg[5][9]  ( .D(n876), .CK(clk), .RN(n3215), .Q(\xCoor[5][9] ), 
        .QN(n639) );
  DFFRX1 \yCoor_reg[0][9]  ( .D(n866), .CK(clk), .RN(n3217), .Q(\yCoor[0][9] ), 
        .QN(n649) );
  DFFRX1 \yCoor_reg[3][9]  ( .D(n836), .CK(clk), .RN(n3216), .Q(\yCoor[3][9] ), 
        .QN(n679) );
  DFFRX1 \xCoor_reg[0][8]  ( .D(n925), .CK(clk), .RN(n3217), .Q(\xCoor[0][8] ), 
        .QN(n590) );
  DFFRX1 \yCoor_reg[0][8]  ( .D(n865), .CK(clk), .RN(n3217), .Q(\yCoor[0][8] ), 
        .QN(n650) );
  DFFRX1 \yCoor_reg[3][8]  ( .D(n835), .CK(clk), .RN(n3216), .Q(\yCoor[3][8] ), 
        .QN(n680) );
  DFFRX1 \xCoor_reg[3][8]  ( .D(n895), .CK(clk), .RN(n3224), .Q(\xCoor[3][8] ), 
        .QN(n620) );
  DFFRX1 \xCoor_reg[0][9]  ( .D(n926), .CK(clk), .RN(n3217), .Q(\xCoor[0][9] ), 
        .QN(n589) );
  DFFRX1 \rootOutRound_reg_reg[1]  ( .D(n756), .CK(clk), .RN(n3219), .Q(
        rootOutRound_reg[1]), .QN(n721) );
  DFFRX1 \S_reg[4]  ( .D(n767), .CK(clk), .RN(n3221), .Q(S[4]), .QN(n716) );
  DFFRX1 \xCoor_reg[1][7]  ( .D(n914), .CK(clk), .RN(n3219), .Q(\xCoor[1][7] ), 
        .QN(n601) );
  DFFRX1 \xCoor_reg[4][7]  ( .D(n884), .CK(clk), .RN(n3223), .Q(\xCoor[4][7] ), 
        .QN(n631) );
  DFFRX1 \yCoor_reg[2][7]  ( .D(n844), .CK(clk), .RN(n3288), .Q(\yCoor[2][7] ), 
        .QN(n671) );
  DFFRX1 \yCoor_reg[5][7]  ( .D(n814), .CK(clk), .RN(n3224), .Q(\yCoor[5][7] ), 
        .QN(n701) );
  DFFRX1 \yCoor_reg[2][6]  ( .D(n843), .CK(clk), .RN(n3288), .Q(\yCoor[2][6] ), 
        .QN(n672) );
  DFFRX1 \yCoor_reg[5][6]  ( .D(n813), .CK(clk), .RN(n3222), .Q(\yCoor[5][6] ), 
        .QN(n702) );
  DFFRX1 \xCoor_reg[5][7]  ( .D(n874), .CK(clk), .RN(n3215), .Q(\xCoor[5][7] ), 
        .QN(n641) );
  DFFRX1 \yCoor_reg[0][7]  ( .D(n864), .CK(clk), .RN(n3217), .Q(\yCoor[0][7] ), 
        .QN(n651) );
  DFFRX1 \yCoor_reg[3][7]  ( .D(n834), .CK(clk), .RN(n3215), .Q(\yCoor[3][7] ), 
        .QN(n681) );
  DFFRX1 \xCoor_reg[0][6]  ( .D(n923), .CK(clk), .RN(n3217), .Q(\xCoor[0][6] ), 
        .QN(n592) );
  DFFRX1 \yCoor_reg[0][6]  ( .D(n863), .CK(clk), .RN(n3288), .Q(\yCoor[0][6] ), 
        .QN(n652) );
  DFFRX1 \xCoor_reg[3][6]  ( .D(n893), .CK(clk), .RN(n3224), .Q(\xCoor[3][6] ), 
        .QN(n622) );
  DFFRX1 \yCoor_reg[3][6]  ( .D(n833), .CK(clk), .RN(n3224), .Q(\yCoor[3][6] ), 
        .QN(n682) );
  DFFRX1 \xCoor_reg[0][7]  ( .D(n924), .CK(clk), .RN(n3217), .Q(\xCoor[0][7] ), 
        .QN(n591) );
  DFFRX1 \xCoor_reg[3][7]  ( .D(n894), .CK(clk), .RN(n3224), .Q(\xCoor[3][7] ), 
        .QN(n621) );
  DFFRX1 \S_reg[2]  ( .D(n769), .CK(clk), .RN(n3221), .Q(S[2]), .QN(n718) );
  DFFRX1 \xCoor_reg[1][5]  ( .D(n912), .CK(clk), .RN(n3219), .Q(\xCoor[1][5] ), 
        .QN(n603) );
  DFFRX1 \xCoor_reg[4][5]  ( .D(n882), .CK(clk), .RN(n3222), .Q(\xCoor[4][5] ), 
        .QN(n633) );
  DFFRX1 \yCoor_reg[2][5]  ( .D(n842), .CK(clk), .RN(n3216), .Q(\yCoor[2][5] ), 
        .QN(n673) );
  DFFRX1 \yCoor_reg[5][5]  ( .D(n812), .CK(clk), .RN(n3288), .Q(\yCoor[5][5] ), 
        .QN(n703) );
  DFFRX1 \yCoor_reg[2][4]  ( .D(n841), .CK(clk), .RN(n3215), .Q(\yCoor[2][4] ), 
        .QN(n674) );
  DFFRX1 \xCoor_reg[5][5]  ( .D(n872), .CK(clk), .RN(n3215), .Q(\xCoor[5][5] ), 
        .QN(n643) );
  DFFRX1 \yCoor_reg[0][5]  ( .D(n862), .CK(clk), .RN(n3288), .Q(\yCoor[0][5] ), 
        .QN(n653) );
  DFFRX1 \yCoor_reg[3][5]  ( .D(n832), .CK(clk), .RN(n3216), .Q(\yCoor[3][5] ), 
        .QN(n683) );
  DFFRX1 \yCoor_reg[0][4]  ( .D(n861), .CK(clk), .RN(n3288), .Q(\yCoor[0][4] ), 
        .QN(n654) );
  DFFRX1 \xCoor_reg[1][3]  ( .D(n910), .CK(clk), .RN(n3219), .Q(\xCoor[1][3] ), 
        .QN(n605) );
  DFFRX1 \xCoor_reg[4][3]  ( .D(n880), .CK(clk), .RN(n3223), .Q(\xCoor[4][3] ), 
        .QN(n635) );
  DFFRX1 \yCoor_reg[2][3]  ( .D(n840), .CK(clk), .RN(n3220), .Q(\yCoor[2][3] ), 
        .QN(n675) );
  DFFRX1 \yCoor_reg[5][3]  ( .D(n810), .CK(clk), .RN(n3220), .Q(\yCoor[5][3] ), 
        .QN(n705) );
  DFFRX1 \yCoor_reg[2][2]  ( .D(n839), .CK(clk), .RN(n3216), .Q(\yCoor[2][2] ), 
        .QN(n676) );
  DFFRX1 \yCoor_reg[5][2]  ( .D(n809), .CK(clk), .RN(n3222), .Q(\yCoor[5][2] ), 
        .QN(n706) );
  DFFRX1 \xCoor_reg[5][3]  ( .D(n870), .CK(clk), .RN(n3215), .Q(\xCoor[5][3] ), 
        .QN(n645) );
  DFFRX1 \yCoor_reg[3][4]  ( .D(n831), .CK(clk), .RN(n3215), .Q(\yCoor[3][4] ), 
        .QN(n684) );
  DFFRX1 \yCoor_reg[0][3]  ( .D(n860), .CK(clk), .RN(n3288), .Q(\yCoor[0][3] ), 
        .QN(n655) );
  DFFRX1 \yCoor_reg[3][3]  ( .D(n830), .CK(clk), .RN(n3222), .Q(\yCoor[3][3] ), 
        .QN(n685) );
  DFFRX1 \S_reg[0]  ( .D(n760), .CK(clk), .RN(n3288), .Q(S[0]), .QN(n709) );
  DFFRX1 \R_len_reg[1][0]  ( .D(n977), .CK(clk), .RN(n3288), .Q(\R_len[1][0] ), 
        .QN(n538) );
  DFFRX1 \R_len_reg[4][0]  ( .D(n947), .CK(clk), .RN(n3223), .Q(\R_len[4][0] ), 
        .QN(n568) );
  DFFRX1 \R_len_reg[5][0]  ( .D(n937), .CK(clk), .RN(n3223), .Q(\R_len[5][0] ), 
        .QN(n578) );
  DFFRX1 \xCoor_reg[1][1]  ( .D(n908), .CK(clk), .RN(n3216), .Q(\xCoor[1][1] ), 
        .QN(n607) );
  DFFRX1 \xCoor_reg[4][1]  ( .D(n878), .CK(clk), .RN(n3216), .Q(\xCoor[4][1] ), 
        .QN(n637) );
  DFFRX1 \yCoor_reg[2][1]  ( .D(n838), .CK(clk), .RN(n3215), .Q(\yCoor[2][1] ), 
        .QN(n677) );
  DFFRX1 \yCoor_reg[5][1]  ( .D(n808), .CK(clk), .RN(n3216), .Q(\yCoor[5][1] ), 
        .QN(n707) );
  DFFRX1 \xCoor_reg[5][1]  ( .D(n868), .CK(clk), .RN(n3221), .Q(\xCoor[5][1] ), 
        .QN(n647) );
  DFFRX1 \yCoor_reg[2][0]  ( .D(n847), .CK(clk), .RN(n3216), .Q(\yCoor[2][0] ), 
        .QN(n668) );
  DFFRX1 \yCoor_reg[0][2]  ( .D(n859), .CK(clk), .RN(n3217), .Q(\yCoor[0][2] ), 
        .QN(n656) );
  DFFRX1 \yCoor_reg[3][2]  ( .D(n829), .CK(clk), .RN(n3216), .Q(\yCoor[3][2] ), 
        .QN(n686) );
  DFFRX1 \yCoor_reg[0][1]  ( .D(n858), .CK(clk), .RN(n3217), .Q(\yCoor[0][1] ), 
        .QN(n657) );
  DFFRX1 \yCoor_reg[3][1]  ( .D(n828), .CK(clk), .RN(n3215), .Q(\yCoor[3][1] ), 
        .QN(n687) );
  DFFRX1 \xCoor_reg[1][0]  ( .D(n917), .CK(clk), .RN(n3219), .Q(\xCoor[1][0] ), 
        .QN(n598) );
  DFFRX1 \xCoor_reg[4][0]  ( .D(n887), .CK(clk), .RN(n3221), .Q(\xCoor[4][0] ), 
        .QN(n628) );
  DFFRX1 \yCoor_reg[5][0]  ( .D(n817), .CK(clk), .RN(n3220), .Q(\yCoor[5][0] ), 
        .QN(n698) );
  DFFRX1 \xCoor_reg[5][0]  ( .D(n877), .CK(clk), .RN(n3215), .Q(\xCoor[5][0] ), 
        .QN(n638) );
  DFFRX1 \yCoor_reg[0][0]  ( .D(n867), .CK(clk), .RN(n3217), .Q(\yCoor[0][0] ), 
        .QN(n648) );
  DFFRX1 \yCoor_reg[3][0]  ( .D(n837), .CK(clk), .RN(n3221), .Q(\yCoor[3][0] ), 
        .QN(n678) );
  DFFRX1 \xCoor_reg[0][0]  ( .D(n927), .CK(clk), .RN(n3217), .Q(\xCoor[0][0] ), 
        .QN(n588) );
  DFFRX1 \xCoor_reg[3][0]  ( .D(n897), .CK(clk), .RN(n3224), .Q(\xCoor[3][0] ), 
        .QN(n618) );
  DFFRX1 \S_reg[7]  ( .D(n764), .CK(clk), .RN(n3219), .Q(S[7]), .QN(n713) );
  DFFRX1 \S_reg[5]  ( .D(n766), .CK(clk), .RN(n3221), .Q(S[5]), .QN(n715) );
  DFFRX1 \S_reg[3]  ( .D(n768), .CK(clk), .RN(n3221), .Q(S[3]), .QN(n717) );
  DFFRX1 \S_reg[1]  ( .D(n770), .CK(clk), .RN(n3221), .Q(S[1]), .QN(n719) );
  DFFRX1 \R_len_reg[2][9]  ( .D(n966), .CK(clk), .RN(n3288), .Q(\R_len[2][9] ), 
        .QN(n549) );
  DFFRX1 \R_len_reg[5][9]  ( .D(n936), .CK(clk), .RN(n3223), .Q(\R_len[5][9] ), 
        .QN(n579) );
  DFFRX1 \R_len_reg[0][9]  ( .D(n986), .CK(clk), .RN(n3217), .Q(\R_len[0][9] ), 
        .QN(n529) );
  DFFRX1 \R_len_reg[1][8]  ( .D(n975), .CK(clk), .RN(n3217), .Q(\R_len[1][8] ), 
        .QN(n540) );
  DFFRX1 \R_len_reg[4][8]  ( .D(n945), .CK(clk), .RN(n3223), .Q(\R_len[4][8] ), 
        .QN(n570) );
  DFFRX1 \R_len_reg[1][9]  ( .D(n976), .CK(clk), .RN(n3223), .Q(\R_len[1][9] ), 
        .QN(n539) );
  DFFRX1 \R_len_reg[4][9]  ( .D(n946), .CK(clk), .RN(n3220), .Q(\R_len[4][9] ), 
        .QN(n569) );
  DFFRX1 \R_len_reg[2][8]  ( .D(n965), .CK(clk), .RN(n3288), .Q(\R_len[2][8] ), 
        .QN(n550) );
  DFFRX1 \R_len_reg[5][8]  ( .D(n935), .CK(clk), .RN(n3223), .Q(\R_len[5][8] ), 
        .QN(n580) );
  DFFRX1 \R_len_reg[0][8]  ( .D(n985), .CK(clk), .RN(n3224), .Q(\R_len[0][8] ), 
        .QN(n530) );
  DFFRX1 \R_len_reg[3][8]  ( .D(n955), .CK(clk), .RN(n3222), .Q(\R_len[3][8] ), 
        .QN(n560) );
  DFFRX1 \R_len_reg[3][9]  ( .D(n956), .CK(clk), .RN(n3216), .Q(\R_len[3][9] ), 
        .QN(n559) );
  DFFRX1 \R_len_reg[1][6]  ( .D(n973), .CK(clk), .RN(n3222), .Q(\R_len[1][6] ), 
        .QN(n542) );
  DFFRX1 \R_len_reg[4][6]  ( .D(n943), .CK(clk), .RN(n3223), .Q(\R_len[4][6] ), 
        .QN(n572) );
  DFFRX1 \R_len_reg[5][6]  ( .D(n933), .CK(clk), .RN(n3220), .Q(\R_len[5][6] ), 
        .QN(n582) );
  DFFRX1 \R_len_reg[0][6]  ( .D(n983), .CK(clk), .RN(n3224), .Q(\R_len[0][6] ), 
        .QN(n532) );
  DFFRX1 \R_len_reg[1][5]  ( .D(n972), .CK(clk), .RN(n3222), .Q(\R_len[1][5] ), 
        .QN(n543) );
  DFFRX1 \R_len_reg[4][5]  ( .D(n942), .CK(clk), .RN(n3222), .Q(\R_len[4][5] ), 
        .QN(n573) );
  DFFRX1 \R_len_reg[1][7]  ( .D(n974), .CK(clk), .RN(n3222), .Q(\R_len[1][7] ), 
        .QN(n541) );
  DFFRX1 \R_len_reg[4][7]  ( .D(n944), .CK(clk), .RN(n3223), .Q(\R_len[4][7] ), 
        .QN(n571) );
  DFFRX1 \R_len_reg[2][5]  ( .D(n962), .CK(clk), .RN(n3288), .Q(\R_len[2][5] ), 
        .QN(n553) );
  DFFRX1 \R_len_reg[5][5]  ( .D(n932), .CK(clk), .RN(n3223), .Q(\R_len[5][5] ), 
        .QN(n583) );
  DFFRX1 \R_len_reg[5][7]  ( .D(n934), .CK(clk), .RN(n3223), .Q(\R_len[5][7] ), 
        .QN(n581) );
  DFFRX1 \R_len_reg[0][5]  ( .D(n982), .CK(clk), .RN(n3224), .Q(\R_len[0][5] ), 
        .QN(n533) );
  DFFRX1 \R_len_reg[3][5]  ( .D(n952), .CK(clk), .RN(n3215), .Q(\R_len[3][5] ), 
        .QN(n563) );
  DFFRX1 \rootOutRound_reg_reg[0]  ( .D(n759), .CK(clk), .RN(n3220), .Q(
        rootOutRound_reg[0]), .QN(n720) );
  DFFRX1 \R_len_reg[1][1]  ( .D(n968), .CK(clk), .RN(n3219), .Q(\R_len[1][1] ), 
        .QN(n547) );
  DFFRX1 \R_len_reg[4][1]  ( .D(n938), .CK(clk), .RN(n3216), .Q(\R_len[4][1] ), 
        .QN(n577) );
  DFFRX1 \R_len_reg[1][3]  ( .D(n970), .CK(clk), .RN(n3219), .Q(\R_len[1][3] ), 
        .QN(n545) );
  DFFRX1 \R_len_reg[4][3]  ( .D(n940), .CK(clk), .RN(n3223), .Q(\R_len[4][3] ), 
        .QN(n575) );
  DFFRX1 \R_len_reg[1][2]  ( .D(n969), .CK(clk), .RN(n3219), .Q(\R_len[1][2] ), 
        .QN(n546) );
  DFFRX1 \R_len_reg[4][2]  ( .D(n939), .CK(clk), .RN(n3221), .Q(\R_len[4][2] ), 
        .QN(n576) );
  DFFRX1 \R_len_reg[5][1]  ( .D(n928), .CK(clk), .RN(n3215), .Q(\R_len[5][1] ), 
        .QN(n587) );
  DFFRX1 \R_len_reg[2][4]  ( .D(n961), .CK(clk), .RN(n3288), .Q(\R_len[2][4] ), 
        .QN(n554) );
  DFFRX1 \R_len_reg[2][3]  ( .D(n960), .CK(clk), .RN(n3288), .Q(\R_len[2][3] ), 
        .QN(n555) );
  DFFRX1 \R_len_reg[5][3]  ( .D(n930), .CK(clk), .RN(n3215), .Q(\R_len[5][3] ), 
        .QN(n585) );
  DFFRX1 \R_len_reg[2][2]  ( .D(n959), .CK(clk), .RN(n3288), .Q(\R_len[2][2] ), 
        .QN(n556) );
  DFFRX1 \R_len_reg[5][2]  ( .D(n929), .CK(clk), .RN(n3215), .Q(\R_len[5][2] ), 
        .QN(n586) );
  DFFRX1 \R_len_reg[0][1]  ( .D(n978), .CK(clk), .RN(n3216), .Q(\R_len[0][1] ), 
        .QN(n537) );
  DFFRX1 \R_len_reg[3][1]  ( .D(n948), .CK(clk), .RN(n3224), .Q(\R_len[3][1] ), 
        .QN(n567) );
  DFFRX1 \R_len_reg[0][4]  ( .D(n981), .CK(clk), .RN(n3216), .Q(\R_len[0][4] ), 
        .QN(n534) );
  DFFRX1 \R_len_reg[3][4]  ( .D(n951), .CK(clk), .RN(n3224), .Q(\R_len[3][4] ), 
        .QN(n564) );
  DFFRX1 \R_len_reg[0][3]  ( .D(n980), .CK(clk), .RN(n3224), .Q(\R_len[0][3] ), 
        .QN(n535) );
  DFFRX1 \R_len_reg[3][3]  ( .D(n950), .CK(clk), .RN(n3224), .Q(\R_len[3][3] ), 
        .QN(n565) );
  DFFRX1 \R_len_reg[0][2]  ( .D(n979), .CK(clk), .RN(n3220), .Q(\R_len[0][2] ), 
        .QN(n536) );
  DFFRX1 \R_len_reg[3][2]  ( .D(n949), .CK(clk), .RN(n3224), .Q(\R_len[3][2] ), 
        .QN(n566) );
  DFFRX1 \fstate_reg[0]  ( .D(N2173), .CK(clk), .RN(n3288), .Q(n2974), .QN(
        n806) );
  DFFRX4 \idx2_reg[2]  ( .D(n1014), .CK(clk), .RN(n3219), .Q(idx2[2]), .QN(
        n800) );
  DFFRX4 \idx2_reg[0]  ( .D(n1016), .CK(clk), .RN(n3221), .Q(idx2[0]), .QN(
        n802) );
  INVX6 U2707 ( .A(n98), .Y(n3319) );
  NAND2X1 U2708 ( .A(n3178), .B(n3177), .Y(N1401) );
  AOI222XL U2709 ( .A0(\R_len[5][1] ), .A1(n2985), .B0(\R_len[3][1] ), .B1(
        n3197), .C0(\R_len[4][1] ), .C1(n3196), .Y(n3178) );
  NOR2X1 U2710 ( .A(n799), .B(n797), .Y(n3007) );
  NOR2BX4 U2726 ( .AN(n3020), .B(idx0[1]), .Y(n3061) );
  NOR3XL U2728 ( .A(n796), .B(n794), .C(idx0[1]), .Y(n434) );
  NOR2X6 U2735 ( .A(n799), .B(idx1[2]), .Y(n3069) );
  NOR2X1 U2740 ( .A(idx0[2]), .B(idx0[0]), .Y(n3019) );
  OAI211X4 U2741 ( .A0(n711), .A1(n3277), .B0(n498), .C0(n499), .Y(
        mul_srcA1[9]) );
  AND3X4 U2742 ( .A(n800), .B(n802), .C(idx2[1]), .Y(n3204) );
  AND2X4 U2744 ( .A(n3134), .B(n801), .Y(n3013) );
  OAI211X1 U2746 ( .A0(n718), .A1(n3277), .B0(n512), .C0(n513), .Y(
        mul_srcA1[2]) );
  AOI222X1 U2747 ( .A0(N785), .A1(n3319), .B0(N699), .B1(n2951), .C0(N758), 
        .C1(n3228), .Y(n513) );
  OAI21X1 U2748 ( .A0(n3343), .A1(n3208), .B0(n491), .Y(mul_srcA2[6]) );
  OAI21X2 U2749 ( .A0(n3338), .A1(n3208), .B0(n496), .Y(mul_srcA2[1]) );
  OAI21XL U2750 ( .A0(n3337), .A1(n3208), .B0(n497), .Y(mul_srcA2[0]) );
  CLKBUFX8 U2754 ( .A(n388), .Y(n2951) );
  AOI222XL U2755 ( .A0(\xCoor[2][3] ), .A1(n2970), .B0(\xCoor[0][3] ), .B1(
        n3065), .C0(\xCoor[1][3] ), .C1(n3061), .Y(n3047) );
  AOI222XL U2760 ( .A0(N959), .A1(n3319), .B0(N862), .B1(n2951), .C0(N921), 
        .C1(n3229), .Y(n487) );
  AOI222X1 U2762 ( .A0(\yCoor[2][1] ), .A1(n3204), .B0(\yCoor[0][1] ), .B1(
        n3202), .C0(\yCoor[1][1] ), .C1(n3199), .Y(n3137) );
  AND2X2 U2764 ( .A(n803), .B(n2976), .Y(n420) );
  AOI222XL U2766 ( .A0(\R_len[2][2] ), .A1(n2995), .B0(\R_len[0][2] ), .B1(
        n2940), .C0(\R_len[1][2] ), .C1(n2943), .Y(n3114) );
  AOI22X1 U2767 ( .A0(N969), .A1(n3319), .B0(N942), .B1(n3278), .Y(n484) );
  OAI2BB1X2 U2768 ( .A0N(n3430), .A1N(n3324), .B0(n455), .Y(n3002) );
  OAI2BB1X2 U2769 ( .A0N(N1830), .A1N(n3324), .B0(n465), .Y(mul_srcB2[0]) );
  OAI2BB1XL U2771 ( .A0N(n3442), .A1N(n3324), .B0(n457), .Y(mul_srcB2[8]) );
  NOR2X6 U2772 ( .A(n802), .B(n800), .Y(n2985) );
  NOR2BX1 U2773 ( .AN(n802), .B(n800), .Y(n3193) );
  NAND3XL U2774 ( .A(idx2[0]), .B(n801), .C(n800), .Y(n374) );
  NAND3XL U2775 ( .A(idx2[2]), .B(n801), .C(n802), .Y(n327) );
  AND2XL U2776 ( .A(n105), .B(n520), .Y(n423) );
  AOI21XL U2777 ( .A0(n3287), .A1(n3286), .B0(acc[22]), .Y(N2178) );
  MX2XL U2778 ( .A(rootOutRound[3]), .B(rootOutRound_reg[3]), .S0(n391), .Y(
        n750) );
  OAI21X1 U2779 ( .A0(n3341), .A1(n421), .B0(n493), .Y(mul_srcA2[4]) );
  NAND2X2 U2783 ( .A(n484), .B(n485), .Y(mul_srcB1[10]) );
  INVX12 U2785 ( .A(n2946), .Y(valid) );
  OAI2BB1X2 U2786 ( .A0N(N1825), .A1N(n3324), .B0(n460), .Y(mul_srcB2[5]) );
  NOR3X1 U2787 ( .A(n3206), .B(n2976), .C(n803), .Y(n2952) );
  NAND3XL U2789 ( .A(n775), .B(n773), .C(n774), .Y(n3285) );
  CLKMX2X2 U2790 ( .A(rootOutRound_reg[9]), .B(n2997), .S0(n3325), .Y(n732) );
  MX2X1 U2791 ( .A(n2947), .B(n104), .S0(n102), .Y(n807) );
  OAI211X4 U2796 ( .A0(n716), .A1(n3277), .B0(n508), .C0(n509), .Y(
        mul_srcA1[4]) );
  AO22XL U2801 ( .A0(n3278), .A1(rootOutRound[6]), .B0(n3277), .B1(
        tempOfRoot1[6]), .Y(n740) );
  AO22X2 U2809 ( .A0(N625), .A1(n3279), .B0(N602), .B1(n3280), .Y(
        outterProduct[19]) );
  AO22X4 U2811 ( .A0(N622), .A1(n3279), .B0(N599), .B1(n3280), .Y(
        outterProduct[16]) );
  AO22X4 U2812 ( .A0(N623), .A1(n3279), .B0(N600), .B1(n3280), .Y(
        outterProduct[17]) );
  NAND2X4 U2816 ( .A(n476), .B(n477), .Y(mul_srcB1[4]) );
  AOI222X4 U2817 ( .A0(N963), .A1(n3319), .B0(N866), .B1(n2951), .C0(N925), 
        .C1(n3229), .Y(n477) );
  AOI222X1 U2819 ( .A0(N792), .A1(n3319), .B0(N706), .B1(n2951), .C0(N765), 
        .C1(n3229), .Y(n499) );
  OAI2BB1X1 U2820 ( .A0N(n3434), .A1N(n3225), .B0(n459), .Y(mul_srcB2[6]) );
  OAI2BB1X1 U2821 ( .A0N(n3405), .A1N(n3225), .B0(n463), .Y(mul_srcB2[2]) );
  NOR2X1 U2822 ( .A(n796), .B(idx0[2]), .Y(n3020) );
  BUFX2 U2823 ( .A(mulResult2[5]), .Y(n2962) );
  NAND2X2 U2827 ( .A(n3158), .B(n3157), .Y(N1604) );
  CLKBUFX3 U2829 ( .A(mulResult1[12]), .Y(n2966) );
  CLKBUFX3 U2830 ( .A(mulResult1[14]), .Y(n2959) );
  BUFX2 U2831 ( .A(mulResult1[4]), .Y(n2994) );
  CLKBUFX3 U2832 ( .A(mulResult1[15]), .Y(n2969) );
  CLKBUFX3 U2835 ( .A(n456), .Y(n3228) );
  CLKBUFX3 U2837 ( .A(rootOutRound[9]), .Y(n2997) );
  AOI222X1 U2840 ( .A0(\yCoor[5][1] ), .A1(n2992), .B0(\yCoor[3][1] ), .B1(
        n3012), .C0(\yCoor[4][1] ), .C1(n3378), .Y(n3073) );
  NOR2X4 U2841 ( .A(n796), .B(n794), .Y(n2956) );
  AND2X2 U2842 ( .A(n104), .B(n3205), .Y(n3016) );
  INVX3 U2843 ( .A(n3208), .Y(n3324) );
  NAND2X2 U2845 ( .A(n3119), .B(n3118), .Y(n2958) );
  NAND2X2 U2851 ( .A(n3022), .B(n3021), .Y(N1148) );
  OAI211X4 U2855 ( .A0(n710), .A1(n3277), .B0(n516), .C0(n517), .Y(
        mul_srcA1[10]) );
  OAI21X1 U2859 ( .A0(n3339), .A1(n3208), .B0(n495), .Y(mul_srcA2[2]) );
  AO22X4 U2861 ( .A0(N1088), .A1(n3228), .B0(N1029), .B1(n2951), .Y(
        mul_srcA2[10]) );
  OAI21X4 U2862 ( .A0(n3342), .A1(n3208), .B0(n492), .Y(mul_srcA2[5]) );
  AOI222X1 U2867 ( .A0(N961), .A1(n3319), .B0(N864), .B1(n2951), .C0(N923), 
        .C1(n3229), .Y(n481) );
  AOI222X1 U2869 ( .A0(N790), .A1(n3319), .B0(N704), .B1(n2951), .C0(N763), 
        .C1(n3229), .Y(n503) );
  AO22X1 U2871 ( .A0(N606), .A1(n3279), .B0(N583), .B1(n3005), .Y(
        outterProduct[0]) );
  CLKBUFX3 U2872 ( .A(mul_srcB2[8]), .Y(n3000) );
  AOI222XL U2879 ( .A0(\xCoor[5][2] ), .A1(n2985), .B0(\xCoor[3][2] ), .B1(
        n3014), .C0(\xCoor[4][2] ), .C1(n3196), .Y(n3160) );
  CLKINVX1 U2880 ( .A(n389), .Y(n3358) );
  NAND2X1 U2881 ( .A(n3142), .B(n3141), .Y(N1805) );
  AOI222XL U2882 ( .A0(\xCoor[5][3] ), .A1(n2985), .B0(\xCoor[3][3] ), .B1(
        n3197), .C0(\xCoor[4][3] ), .C1(n3196), .Y(n3162) );
  BUFX2 U2883 ( .A(mulResult1[0]), .Y(n2996) );
  AO22X1 U2884 ( .A0(N624), .A1(n3279), .B0(N601), .B1(n3280), .Y(
        outterProduct[18]) );
  NAND2X1 U2885 ( .A(n803), .B(n805), .Y(n523) );
  NAND2X1 U2886 ( .A(n2952), .B(n804), .Y(n520) );
  NAND2X2 U2888 ( .A(n3095), .B(n3094), .Y(N902) );
  NAND2X2 U2889 ( .A(n104), .B(n3206), .Y(n98) );
  NAND2X2 U2890 ( .A(n3125), .B(n3124), .Y(N1417) );
  AOI222XL U2891 ( .A0(\R_len[5][7] ), .A1(n2992), .B0(\R_len[3][7] ), .B1(
        n3130), .C0(\R_len[4][7] ), .C1(n3378), .Y(n3125) );
  AOI222XL U2892 ( .A0(\R_len[2][7] ), .A1(n2995), .B0(\R_len[0][7] ), .B1(
        n2940), .C0(\R_len[1][7] ), .C1(n2943), .Y(n3124) );
  NAND2X2 U2893 ( .A(n3123), .B(n3122), .Y(N1418) );
  AOI222XL U2894 ( .A0(\R_len[5][6] ), .A1(n2992), .B0(\R_len[3][6] ), .B1(
        n3130), .C0(\R_len[4][6] ), .C1(n3378), .Y(n3123) );
  OAI211X1 U2895 ( .A0(n797), .A1(n798), .B0(n451), .C0(n3357), .Y(n449) );
  NAND2X2 U2899 ( .A(n3103), .B(n3102), .Y(N898) );
  AOI22X1 U2902 ( .A0(N872), .A1(n2951), .B0(N931), .B1(n3229), .Y(n485) );
  AOI22X1 U2903 ( .A0(N707), .A1(n2951), .B0(N766), .B1(n3229), .Y(n517) );
  INVX4 U2904 ( .A(n3005), .Y(n3279) );
  CLKINVX1 U2906 ( .A(n2975), .Y(n2980) );
  INVX1 U2907 ( .A(n2975), .Y(n2979) );
  NAND3X1 U2908 ( .A(n386), .B(n3206), .C(n3237), .Y(n3008) );
  NAND3X1 U2909 ( .A(n349), .B(n2974), .C(n3260), .Y(n3006) );
  AND2X2 U2911 ( .A(n3121), .B(n3120), .Y(n2975) );
  CLKINVX1 U2915 ( .A(N1605), .Y(n3337) );
  CLKBUFX6 U2916 ( .A(n456), .Y(n3229) );
  OAI32XL U2917 ( .A0(n350), .A1(n798), .A2(n799), .B0(n314), .B1(n349), .Y(
        n146) );
  INVX4 U2918 ( .A(n3278), .Y(n3277) );
  INVX3 U2919 ( .A(n391), .Y(n3325) );
  NAND2X2 U2921 ( .A(n480), .B(n481), .Y(mul_srcB1[2]) );
  AOI222X1 U2923 ( .A0(N786), .A1(n3319), .B0(N700), .B1(n388), .C0(N759), 
        .C1(n3229), .Y(n511) );
  AOI222X1 U2924 ( .A0(N791), .A1(n3319), .B0(N705), .B1(n2951), .C0(N764), 
        .C1(n3229), .Y(n501) );
  NOR2BX4 U2927 ( .AN(n3134), .B(n801), .Y(n3014) );
  NAND2X4 U2928 ( .A(n472), .B(n473), .Y(mul_srcB1[6]) );
  AOI222XL U2933 ( .A0(\R_len[2][0] ), .A1(n3203), .B0(\R_len[0][0] ), .B1(
        n3202), .C0(\R_len[1][0] ), .C1(n3199), .Y(n3175) );
  AOI222X1 U2939 ( .A0(N787), .A1(n3319), .B0(N701), .B1(n2951), .C0(N760), 
        .C1(n3229), .Y(n509) );
  AOI222X1 U2940 ( .A0(N788), .A1(n3319), .B0(N702), .B1(n2951), .C0(N761), 
        .C1(n3229), .Y(n507) );
  OAI211X2 U2941 ( .A0(n713), .A1(n3277), .B0(n502), .C0(n503), .Y(
        mul_srcA1[7]) );
  OAI211X4 U2942 ( .A0(n717), .A1(n3277), .B0(n510), .C0(n511), .Y(
        mul_srcA1[3]) );
  AOI222X1 U2946 ( .A0(N962), .A1(n3319), .B0(N865), .B1(n2951), .C0(N924), 
        .C1(n3229), .Y(n479) );
  AOI222XL U2947 ( .A0(\R_len[5][0] ), .A1(n2985), .B0(\R_len[3][0] ), .B1(
        n3197), .C0(\R_len[4][0] ), .C1(n3196), .Y(n3176) );
  BUFX2 U2952 ( .A(N1423), .Y(n2993) );
  OAI211X4 U2955 ( .A0(n715), .A1(n3277), .B0(n506), .C0(n507), .Y(
        mul_srcA1[5]) );
  NAND2X2 U2958 ( .A(n474), .B(n475), .Y(mul_srcB1[5]) );
  OAI211X4 U2959 ( .A0(n719), .A1(n3277), .B0(n514), .C0(n515), .Y(
        mul_srcA1[1]) );
  NAND2X2 U2961 ( .A(n478), .B(n479), .Y(mul_srcB1[3]) );
  AOI222X1 U2962 ( .A0(\xCoor[5][1] ), .A1(n2956), .B0(\xCoor[3][1] ), .B1(
        n3060), .C0(\xCoor[4][1] ), .C1(n3059), .Y(n3044) );
  NAND2X2 U2963 ( .A(n470), .B(n471), .Y(mul_srcB1[7]) );
  NAND2X2 U2964 ( .A(n3117), .B(n3116), .Y(N1421) );
  OAI2BB1X2 U2965 ( .A0N(N1827), .A1N(n3225), .B0(n462), .Y(mul_srcB2[3]) );
  NAND2X2 U2966 ( .A(n3077), .B(n3076), .Y(N1827) );
  NAND2X2 U2967 ( .A(n3115), .B(n3114), .Y(N1422) );
  AOI22X1 U2970 ( .A0(n3320), .A1(tempOfRoot1[4]), .B0(n3464), .B1(n3324), .Y(
        n508) );
  AOI22X1 U2972 ( .A0(n3320), .A1(tempOfRoot1[5]), .B0(n3458), .B1(n3324), .Y(
        n506) );
  OAI2BB1X2 U2973 ( .A0N(N1823), .A1N(n3225), .B0(n458), .Y(mul_srcB2[7]) );
  NAND2X2 U2974 ( .A(n3085), .B(n3084), .Y(N1823) );
  AOI22X1 U2975 ( .A0(n3320), .A1(tempOfRoot1[3]), .B0(n3461), .B1(n3324), .Y(
        n510) );
  AOI22X1 U2977 ( .A0(n3320), .A1(tempOfRoot1[6]), .B0(n3449), .B1(n3324), .Y(
        n504) );
  AOI22X1 U2979 ( .A0(n3320), .A1(tempOfRoot1[7]), .B0(n3467), .B1(n3324), .Y(
        n502) );
  NAND2X2 U2980 ( .A(n3127), .B(n3126), .Y(N1416) );
  NAND3XL U2981 ( .A(valid), .B(n3361), .C(N2178), .Y(n3377) );
  INVX12 U2982 ( .A(n3377), .Y(is_inside) );
  AOI22X1 U2983 ( .A0(n3320), .A1(tempOfRoot1[2]), .B0(n3452), .B1(n3324), .Y(
        n512) );
  AOI22X1 U2984 ( .A0(n3320), .A1(tempOfRoot1[8]), .B0(n3454), .B1(n3324), .Y(
        n500) );
  NAND2X2 U2985 ( .A(n3129), .B(n3128), .Y(N1415) );
  AOI22X1 U2986 ( .A0(n3320), .A1(tempOfRoot1[1]), .B0(N903), .B1(n3324), .Y(
        n514) );
  AOI22X1 U2987 ( .A0(n3320), .A1(tempOfRoot1[9]), .B0(n3471), .B1(n3324), .Y(
        n498) );
  INVXL U2988 ( .A(n3205), .Y(n2999) );
  OAI2BB1X1 U2990 ( .A0N(N1829), .A1N(n3225), .B0(n464), .Y(mul_srcB2[1]) );
  AOI222XL U2991 ( .A0(\R_len[2][6] ), .A1(n2995), .B0(\R_len[0][6] ), .B1(
        n2940), .C0(\R_len[1][6] ), .C1(n2943), .Y(n3122) );
  OR2X1 U2994 ( .A(n3346), .B(n3208), .Y(n3003) );
  AOI22X2 U2995 ( .A0(N1028), .A1(n2951), .B0(N1087), .B1(n3229), .Y(n488) );
  NAND2X2 U2996 ( .A(n3073), .B(n3072), .Y(N1829) );
  AO22X4 U2997 ( .A0(N626), .A1(n3279), .B0(N603), .B1(n3280), .Y(
        outterProduct[20]) );
  OR2X1 U3000 ( .A(n3320), .B(n3226), .Y(n3005) );
  NOR3BXL U3001 ( .AN(n3261), .B(n3205), .C(n349), .Y(n148) );
  OAI2BB1XL U3002 ( .A0N(outterProduct[22]), .A1N(n389), .B0(n105), .Y(n315)
         );
  NAND2XL U3003 ( .A(n3205), .B(n3260), .Y(n150) );
  CLKBUFX3 U3004 ( .A(n392), .Y(n3230) );
  INVX1 U3005 ( .A(n3410), .Y(n3339) );
  CLKINVX2 U3006 ( .A(N1600), .Y(n3342) );
  INVX1 U3008 ( .A(n3391), .Y(n3345) );
  CLKINVX2 U3009 ( .A(n3421), .Y(n3344) );
  INVX1 U3010 ( .A(N1596), .Y(n3346) );
  OAI22XL U3011 ( .A0(n314), .A1(n374), .B0(n375), .B1(n350), .Y(n184) );
  NOR3BXL U3012 ( .AN(n3268), .B(n3205), .C(n327), .Y(n135) );
  NOR3BXL U3013 ( .AN(n3245), .B(n3205), .C(n374), .Y(n187) );
  NOR3BXL U3014 ( .AN(n3238), .B(n3205), .C(n386), .Y(n200) );
  OAI2BB2XL U3015 ( .B0(n314), .B1(n3326), .A0N(n315), .A1N(n316), .Y(n109) );
  INVX1 U3017 ( .A(n312), .Y(n3326) );
  NAND2XL U3018 ( .A(n2952), .B(n3230), .Y(n3009) );
  INVX1 U3019 ( .A(N1393), .Y(n3356) );
  INVX1 U3020 ( .A(N1395), .Y(n3354) );
  NAND3XL U3021 ( .A(n3277), .B(n391), .C(n525), .Y(N2173) );
  AOI22XL U3022 ( .A0(n316), .A1(n526), .B0(n524), .B1(n2951), .Y(n525) );
  OAI211XL U3023 ( .A0(n3205), .A1(n522), .B0(n3208), .C0(n3277), .Y(N2174) );
  AOI2BB1XL U3024 ( .A0N(n523), .A1N(n524), .B0(n3228), .Y(n522) );
  NAND4BXL U3025 ( .AN(n3228), .B(n521), .C(n422), .D(n3277), .Y(N2175) );
  NAND2XL U3026 ( .A(n3320), .B(n3357), .Y(n521) );
  NAND3XL U3029 ( .A(n3205), .B(n804), .C(n420), .Y(n421) );
  AO22XL U3030 ( .A0(n2997), .A1(n3278), .B0(n3277), .B1(tempOfRoot1[9]), .Y(
        n731) );
  NOR2XL U3031 ( .A(n523), .B(n804), .Y(n456) );
  OAI21XL U3032 ( .A0(n314), .A1(n327), .B0(n328), .Y(n132) );
  NAND4BXL U3033 ( .AN(n797), .B(n799), .C(n798), .D(n315), .Y(n328) );
  AO22XL U3034 ( .A0(N627), .A1(n3279), .B0(N604), .B1(n3280), .Y(
        outterProduct[21]) );
  NOR2X1 U3035 ( .A(n375), .B(n797), .Y(n316) );
  NAND2XL U3036 ( .A(n798), .B(idx1[0]), .Y(n375) );
  NOR3X1 U3037 ( .A(n802), .B(n800), .C(idx2[1]), .Y(n312) );
  OAI32XL U3039 ( .A0(n3321), .A1(n802), .A2(idx2[1]), .B0(n801), .B1(n440), 
        .Y(n1015) );
  NAND3XL U3040 ( .A(n804), .B(n805), .C(n3205), .Y(n453) );
  NAND3XL U3041 ( .A(n804), .B(n2999), .C(n420), .Y(n422) );
  NAND3X1 U3042 ( .A(n802), .B(n801), .C(n800), .Y(n386) );
  OAI21XL U3043 ( .A0(n800), .A1(n801), .B0(n3326), .Y(n444) );
  CLKBUFX3 U3044 ( .A(n3325), .Y(n3226) );
  BUFX2 U3045 ( .A(n173), .Y(n3248) );
  BUFX2 U3046 ( .A(n173), .Y(n3249) );
  BUFX2 U3047 ( .A(n201), .Y(n3233) );
  BUFX2 U3048 ( .A(n201), .Y(n3234) );
  AO22X1 U3050 ( .A0(N619), .A1(n3279), .B0(N596), .B1(n3005), .Y(
        outterProduct[13]) );
  AO22X1 U3051 ( .A0(N620), .A1(n3279), .B0(N597), .B1(n3280), .Y(
        outterProduct[14]) );
  AO22X1 U3052 ( .A0(N621), .A1(n3279), .B0(N598), .B1(n3280), .Y(
        outterProduct[15]) );
  AO22X1 U3053 ( .A0(N617), .A1(n3279), .B0(N594), .B1(n3005), .Y(
        outterProduct[11]) );
  AO22X1 U3054 ( .A0(N618), .A1(n3279), .B0(N595), .B1(n3280), .Y(
        outterProduct[12]) );
  AO22X1 U3055 ( .A0(N614), .A1(n3279), .B0(N591), .B1(n3280), .Y(
        outterProduct[8]) );
  AO22X1 U3056 ( .A0(N615), .A1(n3279), .B0(N592), .B1(n3005), .Y(
        outterProduct[9]) );
  AO22X1 U3057 ( .A0(N616), .A1(n3279), .B0(N593), .B1(n3280), .Y(
        outterProduct[10]) );
  AO22X1 U3058 ( .A0(N611), .A1(n3279), .B0(N588), .B1(n3280), .Y(
        outterProduct[5]) );
  AO22X1 U3059 ( .A0(N612), .A1(n3279), .B0(N589), .B1(n3280), .Y(
        outterProduct[6]) );
  AO22X1 U3060 ( .A0(N613), .A1(n3279), .B0(N590), .B1(n3280), .Y(
        outterProduct[7]) );
  AO22X1 U3061 ( .A0(N610), .A1(n3279), .B0(N587), .B1(n3280), .Y(
        outterProduct[4]) );
  AO22X1 U3062 ( .A0(N608), .A1(n3279), .B0(N585), .B1(n3280), .Y(
        outterProduct[2]) );
  CLKBUFX3 U3063 ( .A(n148), .Y(n3259) );
  NAND2X1 U3064 ( .A(n2951), .B(outterProduct[22]), .Y(n314) );
  CLKBUFX3 U3065 ( .A(n186), .Y(n3243) );
  CLKBUFX3 U3066 ( .A(n111), .Y(n3272) );
  BUFX2 U3067 ( .A(n148), .Y(n3258) );
  BUFX2 U3068 ( .A(n3006), .Y(n3263) );
  BUFX2 U3069 ( .A(n150), .Y(n3256) );
  CLKBUFX3 U3070 ( .A(n150), .Y(n3257) );
  BUFX2 U3071 ( .A(n107), .Y(n3276) );
  NOR2X1 U3072 ( .A(n3358), .B(n3205), .Y(n388) );
  CLKBUFX3 U3073 ( .A(n3016), .Y(n3278) );
  AO22X1 U3074 ( .A0(N609), .A1(n3279), .B0(N586), .B1(n3280), .Y(
        outterProduct[3]) );
  AO22X1 U3075 ( .A0(N607), .A1(n3279), .B0(N584), .B1(n3280), .Y(
        outterProduct[1]) );
  NAND2X1 U3076 ( .A(n3205), .B(n3228), .Y(n391) );
  CLKBUFX3 U3077 ( .A(n3005), .Y(n3280) );
  NAND2X1 U3078 ( .A(n3205), .B(n3253), .Y(n173) );
  AO22XL U3079 ( .A0(N628), .A1(n3279), .B0(N605), .B1(n3280), .Y(
        outterProduct[22]) );
  BUFX2 U3080 ( .A(n3250), .Y(n3251) );
  CLKBUFX3 U3081 ( .A(n200), .Y(n3236) );
  NAND2X1 U3082 ( .A(n3205), .B(n3237), .Y(n201) );
  AND2X2 U3083 ( .A(n3244), .B(n806), .Y(n186) );
  AND2X2 U3084 ( .A(n3273), .B(n3205), .Y(n111) );
  BUFX2 U3085 ( .A(n187), .Y(n3241) );
  CLKBUFX3 U3086 ( .A(n187), .Y(n3242) );
  BUFX2 U3087 ( .A(n3264), .Y(n3265) );
  CLKBUFX3 U3088 ( .A(n200), .Y(n3235) );
  BUFX2 U3089 ( .A(n3006), .Y(n3262) );
  BUFX2 U3090 ( .A(n3008), .Y(n3240) );
  BUFX2 U3091 ( .A(n183), .Y(n3247) );
  CLKBUFX3 U3092 ( .A(n169), .Y(n3254) );
  CLKBUFX3 U3093 ( .A(n131), .Y(n3270) );
  BUFX2 U3094 ( .A(n107), .Y(n3275) );
  CLKBUFX3 U3095 ( .A(n134), .Y(n3266) );
  CLKBUFX3 U3096 ( .A(n3224), .Y(n3217) );
  CLKBUFX3 U3098 ( .A(n3223), .Y(n3219) );
  CLKBUFX3 U3099 ( .A(n3215), .Y(n3220) );
  CLKBUFX3 U3100 ( .A(n3215), .Y(n3221) );
  CLKBUFX3 U3101 ( .A(n3324), .Y(n3225) );
  CLKBUFX3 U3102 ( .A(n3252), .Y(n3253) );
  BUFX2 U3103 ( .A(n198), .Y(n3238) );
  NAND3X1 U3104 ( .A(n3273), .B(n2974), .C(n3326), .Y(n107) );
  AND2X2 U3105 ( .A(n3267), .B(n806), .Y(n134) );
  CLKBUFX3 U3106 ( .A(n198), .Y(n3237) );
  CLKBUFX3 U3107 ( .A(n184), .Y(n3244) );
  CLKBUFX3 U3108 ( .A(n109), .Y(n3273) );
  BUFX2 U3109 ( .A(n184), .Y(n3245) );
  BUFX2 U3110 ( .A(n3008), .Y(n3239) );
  BUFX2 U3111 ( .A(n169), .Y(n3255) );
  CLKBUFX3 U3112 ( .A(n131), .Y(n3269) );
  CLKBUFX3 U3113 ( .A(n112), .Y(n3271) );
  CLKBUFX3 U3114 ( .A(n135), .Y(n3264) );
  BUFX2 U3115 ( .A(n183), .Y(n3246) );
  CLKBUFX3 U3116 ( .A(n109), .Y(n3274) );
  NAND2X1 U3117 ( .A(n389), .B(n3205), .Y(n105) );
  OAI31X1 U3118 ( .A0(n3357), .A1(n3358), .A2(n3326), .B0(n105), .Y(n429) );
  NAND2X1 U3121 ( .A(n3230), .B(n3206), .Y(n3210) );
  INVXL U3122 ( .A(n441), .Y(n3322) );
  INVX1 U3123 ( .A(n437), .Y(n3321) );
  CLKINVX2 U3124 ( .A(n3009), .Y(n3214) );
  CLKINVX2 U3125 ( .A(n3009), .Y(n3213) );
  BUFX2 U3126 ( .A(n392), .Y(n3231) );
  CLKBUFX3 U3127 ( .A(n3215), .Y(n3222) );
  CLKBUFX3 U3128 ( .A(n3216), .Y(n3224) );
  CLKBUFX3 U3129 ( .A(n3216), .Y(n3223) );
  AOI22X1 U3130 ( .A0(N1020), .A1(n388), .B0(N1079), .B1(n3229), .Y(n496) );
  AOI22X1 U3132 ( .A0(N1151), .A1(n388), .B0(N1210), .B1(n3228), .Y(n463) );
  AOI22X1 U3133 ( .A0(N1152), .A1(n2951), .B0(N1211), .B1(n3228), .Y(n462) );
  OAI2BB1X1 U3134 ( .A0N(n3445), .A1N(n3225), .B0(n461), .Y(mul_srcB2[4]) );
  AOI22X1 U3135 ( .A0(N1153), .A1(n2951), .B0(N1212), .B1(n3228), .Y(n461) );
  AOI22X1 U3136 ( .A0(N1155), .A1(n2951), .B0(N1214), .B1(n3228), .Y(n459) );
  AOI22X1 U3137 ( .A0(N1150), .A1(n388), .B0(N1209), .B1(n3228), .Y(n464) );
  AOI22X1 U3138 ( .A0(N1154), .A1(n2951), .B0(N1213), .B1(n3228), .Y(n460) );
  AOI22X1 U3139 ( .A0(N1023), .A1(n2951), .B0(N1082), .B1(n3229), .Y(n493) );
  AOI22X1 U3141 ( .A0(N1024), .A1(n2951), .B0(N1083), .B1(n3229), .Y(n492) );
  OAI21X2 U3143 ( .A0(n3344), .A1(n3208), .B0(n490), .Y(mul_srcA2[7]) );
  AOI22X1 U3144 ( .A0(N1026), .A1(n2951), .B0(N1085), .B1(n3229), .Y(n490) );
  AOI22X1 U3145 ( .A0(N1149), .A1(n2951), .B0(N1208), .B1(n3228), .Y(n465) );
  AOI22X1 U3146 ( .A0(N1156), .A1(n2951), .B0(N1215), .B1(n3228), .Y(n458) );
  AOI22X1 U3147 ( .A0(N1157), .A1(n2951), .B0(N1216), .B1(n3228), .Y(n457) );
  AOI22X1 U3148 ( .A0(N1158), .A1(n2951), .B0(N1217), .B1(n3228), .Y(n455) );
  AOI22X1 U3149 ( .A0(N1025), .A1(n2951), .B0(N1084), .B1(n3229), .Y(n491) );
  AOI22X1 U3150 ( .A0(N1027), .A1(n2951), .B0(N1086), .B1(n3229), .Y(n489) );
  INVX3 U3152 ( .A(n3417), .Y(n3340) );
  NOR2X1 U3154 ( .A(n523), .B(n2977), .Y(n389) );
  AND2X2 U3155 ( .A(n420), .B(n2977), .Y(n104) );
  INVX4 U3156 ( .A(n520), .Y(n3320) );
  BUFX2 U3157 ( .A(n146), .Y(n3261) );
  CLKBUFX3 U3159 ( .A(n172), .Y(n3250) );
  NAND3XL U3160 ( .A(n3267), .B(n2974), .C(n327), .Y(n131) );
  NAND3X1 U3161 ( .A(n374), .B(n2999), .C(n3244), .Y(n183) );
  AND3X2 U3162 ( .A(n3273), .B(n2974), .C(n312), .Y(n112) );
  CLKBUFX3 U3163 ( .A(n146), .Y(n3260) );
  CLKBUFX3 U3164 ( .A(n132), .Y(n3267) );
  CLKBUFX3 U3165 ( .A(n132), .Y(n3268) );
  NAND2XL U3167 ( .A(n105), .B(n106), .Y(n102) );
  OAI21XL U3168 ( .A0(mul_srcB1[10]), .A1(mul_srcA1[10]), .B0(n104), .Y(n106)
         );
  INVX1 U3169 ( .A(N1808), .Y(n3327) );
  INVX1 U3170 ( .A(n3400), .Y(n3336) );
  INVX1 U3171 ( .A(n3424), .Y(n3335) );
  INVX1 U3172 ( .A(N1801), .Y(n3334) );
  INVX1 U3173 ( .A(n3427), .Y(n3333) );
  INVX1 U3174 ( .A(N1803), .Y(n3332) );
  INVX1 U3175 ( .A(N1804), .Y(n3331) );
  INVX1 U3176 ( .A(N1805), .Y(n3330) );
  INVX1 U3177 ( .A(N1806), .Y(n3329) );
  INVX1 U3178 ( .A(N1807), .Y(n3328) );
  INVX1 U3179 ( .A(N1402), .Y(n3347) );
  INVX1 U3180 ( .A(N1394), .Y(n3355) );
  INVX1 U3181 ( .A(N1396), .Y(n3353) );
  INVX1 U3182 ( .A(N1397), .Y(n3352) );
  INVX1 U3183 ( .A(N1398), .Y(n3351) );
  INVX1 U3184 ( .A(N1399), .Y(n3350) );
  INVX1 U3185 ( .A(N1400), .Y(n3349) );
  INVX1 U3186 ( .A(N1401), .Y(n3348) );
  NAND2BX1 U3187 ( .AN(n361), .B(idx2[0]), .Y(n349) );
  OAI2BB2XL U3188 ( .B0(n375), .B1(n449), .A0N(n452), .A1N(n2978), .Y(n1019)
         );
  OAI21XL U3189 ( .A0(idx1[0]), .A1(n449), .B0(n451), .Y(n452) );
  OAI21X1 U3190 ( .A0(n445), .A1(n2977), .B0(n105), .Y(n441) );
  NAND3BX1 U3191 ( .AN(n428), .B(n429), .C(idx0[0]), .Y(n425) );
  AND3X1 U3194 ( .A(n3205), .B(n3230), .C(n420), .Y(n394) );
  NOR3XL U3195 ( .A(n3322), .B(n445), .C(n444), .Y(n437) );
  NOR2XL U3196 ( .A(n443), .B(n2952), .Y(n445) );
  INVX1 U3197 ( .A(n316), .Y(n3357) );
  NAND3XL U3198 ( .A(n3208), .B(n422), .C(n423), .Y(n392) );
  OA21XL U3199 ( .A0(n428), .A1(idx0[0]), .B0(n429), .Y(n424) );
  OAI21XL U3200 ( .A0(n386), .A1(n3208), .B0(n423), .Y(n526) );
  NAND3XL U3201 ( .A(n316), .B(n312), .C(n434), .Y(n524) );
  OAI21XL U3202 ( .A0(n3357), .A1(n520), .B0(n98), .Y(N2176) );
  CLKBUFX3 U3203 ( .A(n3288), .Y(n3215) );
  CLKBUFX3 U3204 ( .A(n3288), .Y(n3216) );
  OAI2BB2XL U3205 ( .B0(n713), .B1(n3325), .A0N(N1287), .A1N(n3325), .Y(n764)
         );
  OAI2BB2XL U3206 ( .B0(n714), .B1(n3325), .A0N(N1286), .A1N(n3226), .Y(n765)
         );
  OAI2BB2XL U3207 ( .B0(n715), .B1(n3325), .A0N(N1285), .A1N(n3226), .Y(n766)
         );
  AOI22XL U3209 ( .A0(n3320), .A1(tempOfRoot1[0]), .B0(N904), .B1(n3324), .Y(
        n518) );
  AOI222XL U3210 ( .A0(N934), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[2]), 
        .C0(n3324), .C1(N1806), .Y(n480) );
  AOI222XL U3211 ( .A0(N935), .A1(n3016), .B0(n3320), .B1(tempOfRoot2[3]), 
        .C0(n3225), .C1(N1805), .Y(n478) );
  AOI222XL U3212 ( .A0(N936), .A1(n3016), .B0(n3320), .B1(tempOfRoot2[4]), 
        .C0(n3225), .C1(n3402), .Y(n476) );
  AOI222XL U3213 ( .A0(N938), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[6]), 
        .C0(n3225), .C1(n3428), .Y(n472) );
  AOI222XL U3214 ( .A0(N939), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[7]), 
        .C0(n3225), .C1(n3394), .Y(n470) );
  AOI222XL U3215 ( .A0(N937), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[5]), 
        .C0(n3225), .C1(n3386), .Y(n474) );
  NAND2XL U3216 ( .A(n482), .B(n483), .Y(mul_srcB1[1]) );
  AOI222XL U3217 ( .A0(N933), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[1]), 
        .C0(n3324), .C1(N1807), .Y(n482) );
  AOI222XL U3218 ( .A0(N960), .A1(n3319), .B0(N863), .B1(n2951), .C0(N922), 
        .C1(n3229), .Y(n483) );
  OAI2BB2XL U3219 ( .B0(n709), .B1(n3325), .A0N(N1280), .A1N(n3325), .Y(n760)
         );
  OAI2BB2XL U3220 ( .B0(n716), .B1(n3325), .A0N(N1284), .A1N(n3226), .Y(n767)
         );
  OAI2BB2XL U3221 ( .B0(n719), .B1(n3325), .A0N(N1281), .A1N(n3226), .Y(n770)
         );
  OAI2BB2XL U3222 ( .B0(n717), .B1(n3226), .A0N(N1283), .A1N(n3226), .Y(n768)
         );
  OAI2BB2XL U3223 ( .B0(n718), .B1(n3226), .A0N(N1282), .A1N(n3226), .Y(n769)
         );
  OAI2BB2XL U3224 ( .B0(n3226), .B1(n728), .A0N(n3325), .A1N(rootOutRound[8]), 
        .Y(n735) );
  OAI2BB2XL U3225 ( .B0(n3226), .B1(n727), .A0N(n3325), .A1N(rootOutRound[7]), 
        .Y(n738) );
  OAI2BB2XL U3226 ( .B0(n3226), .B1(n726), .A0N(n3325), .A1N(rootOutRound[6]), 
        .Y(n741) );
  OAI2BB2XL U3227 ( .B0(n3226), .B1(n725), .A0N(n3325), .A1N(rootOutRound[5]), 
        .Y(n744) );
  OAI2BB2XL U3228 ( .B0(n3226), .B1(n724), .A0N(n3325), .A1N(rootOutRound[4]), 
        .Y(n747) );
  AOI222XL U3230 ( .A0(N932), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[0]), 
        .C0(n3324), .C1(N1808), .Y(n486) );
  AO22X1 U3231 ( .A0(n3319), .A1(rootOutRound[8]), .B0(n98), .B1(
        tempOfRoot2[8]), .Y(n733) );
  AO22X1 U3232 ( .A0(n3319), .A1(rootOutRound[7]), .B0(n98), .B1(
        tempOfRoot2[7]), .Y(n736) );
  AO22X1 U3233 ( .A0(n3319), .A1(rootOutRound[6]), .B0(n98), .B1(
        tempOfRoot2[6]), .Y(n739) );
  AO22X1 U3234 ( .A0(n3319), .A1(rootOutRound[5]), .B0(n98), .B1(
        tempOfRoot2[5]), .Y(n742) );
  AO22X1 U3235 ( .A0(n3319), .A1(rootOutRound[4]), .B0(n98), .B1(
        tempOfRoot2[4]), .Y(n745) );
  AO22X1 U3236 ( .A0(n3319), .A1(rootOutRound[3]), .B0(n98), .B1(
        tempOfRoot2[3]), .Y(n748) );
  AO22X1 U3237 ( .A0(n3278), .A1(rootOutRound[8]), .B0(n3277), .B1(
        tempOfRoot1[8]), .Y(n734) );
  AO22X1 U3238 ( .A0(n3278), .A1(rootOutRound[7]), .B0(n3277), .B1(
        tempOfRoot1[7]), .Y(n737) );
  AO22X1 U3239 ( .A0(n3278), .A1(rootOutRound[5]), .B0(n3277), .B1(
        tempOfRoot1[5]), .Y(n743) );
  AO22X1 U3240 ( .A0(n3278), .A1(rootOutRound[4]), .B0(n3277), .B1(
        tempOfRoot1[4]), .Y(n746) );
  AO22X1 U3241 ( .A0(n3278), .A1(rootOutRound[3]), .B0(n3277), .B1(
        tempOfRoot1[3]), .Y(n749) );
  AOI222XL U3242 ( .A0(N940), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[8]), 
        .C0(n3225), .C1(n3425), .Y(n468) );
  OAI2BB2XL U3245 ( .B0(n3226), .B1(n722), .A0N(n3325), .A1N(rootOutRound[2]), 
        .Y(n753) );
  OAI2BB2XL U3246 ( .B0(n3226), .B1(n721), .A0N(n3325), .A1N(rootOutRound[1]), 
        .Y(n756) );
  OAI2BB2XL U3247 ( .B0(n3226), .B1(n720), .A0N(n3325), .A1N(rootOutRound[0]), 
        .Y(n759) );
  AO22X1 U3249 ( .A0(n3319), .A1(rootOutRound[1]), .B0(n98), .B1(
        tempOfRoot2[1]), .Y(n754) );
  AO22X1 U3250 ( .A0(n3319), .A1(rootOutRound[0]), .B0(n98), .B1(
        tempOfRoot2[0]), .Y(n757) );
  AO22X1 U3251 ( .A0(n3278), .A1(rootOutRound[2]), .B0(n3277), .B1(
        tempOfRoot1[2]), .Y(n752) );
  AO22X1 U3252 ( .A0(n3278), .A1(rootOutRound[1]), .B0(n3277), .B1(
        tempOfRoot1[1]), .Y(n755) );
  AO22X1 U3253 ( .A0(n3278), .A1(rootOutRound[0]), .B0(n3277), .B1(
        tempOfRoot1[0]), .Y(n758) );
  OAI221XL U3254 ( .A0(n3240), .A1(n3337), .B0(n3237), .B1(n588), .C0(n290), 
        .Y(n927) );
  AOI2BB2X1 U3255 ( .B0(N904), .B1(n3236), .A0N(n3234), .A1N(n3298), .Y(n290)
         );
  OAI221XL U3256 ( .A0(n3254), .A1(n3337), .B0(n3253), .B1(n608), .C0(n270), 
        .Y(n907) );
  AOI2BB2X1 U3257 ( .B0(N904), .B1(n3250), .A0N(n3249), .A1N(n3298), .Y(n270)
         );
  OAI221XL U3258 ( .A0(n3263), .A1(n3337), .B0(n3260), .B1(n618), .C0(n259), 
        .Y(n897) );
  AOI2BB2X1 U3259 ( .B0(N904), .B1(n3259), .A0N(n3257), .A1N(n3298), .Y(n259)
         );
  OAI221XL U3260 ( .A0(n3276), .A1(n3336), .B0(n3274), .B1(n699), .C0(n128), 
        .Y(n816) );
  AOI22XL U3261 ( .A0(Y[9]), .A1(n111), .B0(n3430), .B1(n3271), .Y(n128) );
  OAI221XL U3262 ( .A0(n3276), .A1(n3335), .B0(n3274), .B1(n700), .C0(n126), 
        .Y(n815) );
  AOI22XL U3263 ( .A0(Y[8]), .A1(n111), .B0(n3440), .B1(n112), .Y(n126) );
  OAI221XL U3264 ( .A0(n3276), .A1(n3334), .B0(n3274), .B1(n701), .C0(n124), 
        .Y(n814) );
  AOI22XL U3265 ( .A0(Y[7]), .A1(n111), .B0(n3432), .B1(n3271), .Y(n124) );
  OAI221XL U3266 ( .A0(n3276), .A1(n3333), .B0(n3274), .B1(n702), .C0(n122), 
        .Y(n813) );
  AOI22XL U3267 ( .A0(Y[6]), .A1(n111), .B0(n3435), .B1(n3271), .Y(n122) );
  OAI221XL U3268 ( .A0(n3275), .A1(n3332), .B0(n3274), .B1(n703), .C0(n120), 
        .Y(n812) );
  AOI22XL U3269 ( .A0(Y[5]), .A1(n111), .B0(n3437), .B1(n3271), .Y(n120) );
  OAI221XL U3270 ( .A0(n107), .A1(n3331), .B0(n3274), .B1(n704), .C0(n118), 
        .Y(n811) );
  AOI22XL U3271 ( .A0(Y[4]), .A1(n3272), .B0(n3446), .B1(n3271), .Y(n118) );
  OAI221XL U3272 ( .A0(n107), .A1(n3330), .B0(n3274), .B1(n705), .C0(n116), 
        .Y(n810) );
  AOI22XL U3273 ( .A0(Y[3]), .A1(n111), .B0(n3444), .B1(n3271), .Y(n116) );
  OAI221XL U3274 ( .A0(n3276), .A1(n3329), .B0(n3273), .B1(n706), .C0(n114), 
        .Y(n809) );
  AOI22XL U3275 ( .A0(Y[2]), .A1(n111), .B0(n3406), .B1(n3271), .Y(n114) );
  OAI221XL U3276 ( .A0(n3275), .A1(n3328), .B0(n3273), .B1(n707), .C0(n110), 
        .Y(n808) );
  AOI22XL U3277 ( .A0(Y[1]), .A1(n111), .B0(N1829), .B1(n3271), .Y(n110) );
  OAI221XL U3278 ( .A0(n3239), .A1(n3356), .B0(n529), .B1(n3237), .C0(n384), 
        .Y(n986) );
  AOI2BB2X1 U3279 ( .B0(N1415), .B1(n3236), .A0N(n201), .A1N(n3309), .Y(n384)
         );
  OAI221XL U3280 ( .A0(n3008), .A1(n3355), .B0(n530), .B1(n3237), .C0(n383), 
        .Y(n985) );
  AOI2BB2X1 U3281 ( .B0(N1416), .B1(n3235), .A0N(n201), .A1N(n3310), .Y(n383)
         );
  OAI221XL U3282 ( .A0(n3240), .A1(n3354), .B0(n531), .B1(n3237), .C0(n382), 
        .Y(n984) );
  AOI2BB2X1 U3283 ( .B0(N1417), .B1(n3236), .A0N(n3234), .A1N(n3311), .Y(n382)
         );
  OAI221XL U3284 ( .A0(n3240), .A1(n3353), .B0(n532), .B1(n3237), .C0(n381), 
        .Y(n983) );
  AOI2BB2X1 U3285 ( .B0(N1418), .B1(n3236), .A0N(n3234), .A1N(n3312), .Y(n381)
         );
  OAI221XL U3286 ( .A0(n3240), .A1(n3352), .B0(n533), .B1(n3237), .C0(n380), 
        .Y(n982) );
  AOI2BB2X1 U3287 ( .B0(n2980), .B1(n3236), .A0N(n3234), .A1N(n3313), .Y(n380)
         );
  OAI221XL U3288 ( .A0(n3240), .A1(n3351), .B0(n534), .B1(n3237), .C0(n379), 
        .Y(n981) );
  AOI2BB2X1 U3289 ( .B0(n2958), .B1(n3236), .A0N(n3234), .A1N(n3314), .Y(n379)
         );
  OAI221XL U3290 ( .A0(n3240), .A1(n3350), .B0(n535), .B1(n3237), .C0(n378), 
        .Y(n980) );
  AOI2BB2X1 U3291 ( .B0(N1421), .B1(n3236), .A0N(n3234), .A1N(n3315), .Y(n378)
         );
  OAI221XL U3292 ( .A0(n3240), .A1(n3349), .B0(n536), .B1(n3237), .C0(n377), 
        .Y(n979) );
  AOI2BB2X1 U3293 ( .B0(N1422), .B1(n3236), .A0N(n3234), .A1N(n3316), .Y(n377)
         );
  OAI221XL U3294 ( .A0(n3240), .A1(n3348), .B0(n537), .B1(n3237), .C0(n376), 
        .Y(n978) );
  AOI2BB2X1 U3295 ( .B0(n2993), .B1(n3236), .A0N(n3234), .A1N(n3317), .Y(n376)
         );
  OAI221XL U3296 ( .A0(n3254), .A1(n3356), .B0(n549), .B1(n3253), .C0(n359), 
        .Y(n966) );
  AOI2BB2X1 U3297 ( .B0(N1415), .B1(n3250), .A0N(n173), .A1N(n3309), .Y(n359)
         );
  OAI221XL U3298 ( .A0(n3254), .A1(n3355), .B0(n550), .B1(n3253), .C0(n358), 
        .Y(n965) );
  AOI2BB2X1 U3299 ( .B0(N1416), .B1(n3250), .A0N(n173), .A1N(n3310), .Y(n358)
         );
  OAI221XL U3300 ( .A0(n3254), .A1(n3354), .B0(n551), .B1(n3253), .C0(n357), 
        .Y(n964) );
  AOI2BB2X1 U3301 ( .B0(N1417), .B1(n3250), .A0N(n3248), .A1N(n3311), .Y(n357)
         );
  OAI221XL U3302 ( .A0(n3254), .A1(n3353), .B0(n552), .B1(n3253), .C0(n356), 
        .Y(n963) );
  AOI2BB2X1 U3303 ( .B0(N1418), .B1(n3250), .A0N(n3249), .A1N(n3312), .Y(n356)
         );
  OAI221XL U3304 ( .A0(n3254), .A1(n3352), .B0(n553), .B1(n3253), .C0(n355), 
        .Y(n962) );
  AOI2BB2X1 U3305 ( .B0(n2979), .B1(n3250), .A0N(n3249), .A1N(n3313), .Y(n355)
         );
  OAI221XL U3306 ( .A0(n3254), .A1(n3351), .B0(n554), .B1(n3253), .C0(n354), 
        .Y(n961) );
  AOI2BB2X1 U3307 ( .B0(n2958), .B1(n3250), .A0N(n3249), .A1N(n3314), .Y(n354)
         );
  OAI221XL U3308 ( .A0(n3254), .A1(n3350), .B0(n555), .B1(n3253), .C0(n353), 
        .Y(n960) );
  AOI2BB2X1 U3309 ( .B0(N1421), .B1(n3250), .A0N(n3249), .A1N(n3315), .Y(n353)
         );
  OAI221XL U3310 ( .A0(n3254), .A1(n3349), .B0(n556), .B1(n3253), .C0(n352), 
        .Y(n959) );
  AOI2BB2X1 U3311 ( .B0(N1422), .B1(n3250), .A0N(n3249), .A1N(n3316), .Y(n352)
         );
  OAI221XL U3312 ( .A0(n3254), .A1(n3348), .B0(n557), .B1(n3253), .C0(n351), 
        .Y(n958) );
  AOI2BB2X1 U3313 ( .B0(n2993), .B1(n3250), .A0N(n3249), .A1N(n3317), .Y(n351)
         );
  OAI221XL U3314 ( .A0(n3262), .A1(n3356), .B0(n559), .B1(n3260), .C0(n345), 
        .Y(n956) );
  AOI2BB2X1 U3315 ( .B0(N1415), .B1(n3258), .A0N(n3256), .A1N(n3309), .Y(n345)
         );
  OAI221XL U3316 ( .A0(n3006), .A1(n3355), .B0(n560), .B1(n3260), .C0(n343), 
        .Y(n955) );
  AOI2BB2X1 U3317 ( .B0(N1416), .B1(n3259), .A0N(n3257), .A1N(n3310), .Y(n343)
         );
  OAI221XL U3318 ( .A0(n3263), .A1(n3354), .B0(n561), .B1(n3260), .C0(n341), 
        .Y(n954) );
  AOI2BB2X1 U3319 ( .B0(N1417), .B1(n3259), .A0N(n3256), .A1N(n3311), .Y(n341)
         );
  OAI221XL U3320 ( .A0(n3263), .A1(n3353), .B0(n562), .B1(n3260), .C0(n339), 
        .Y(n953) );
  AOI2BB2X1 U3321 ( .B0(N1418), .B1(n3259), .A0N(n3257), .A1N(n3312), .Y(n339)
         );
  OAI221XL U3322 ( .A0(n3263), .A1(n3352), .B0(n563), .B1(n3260), .C0(n337), 
        .Y(n952) );
  AOI2BB2X1 U3323 ( .B0(n2979), .B1(n3259), .A0N(n3257), .A1N(n3313), .Y(n337)
         );
  OAI221XL U3324 ( .A0(n3263), .A1(n3351), .B0(n564), .B1(n3260), .C0(n335), 
        .Y(n951) );
  AOI2BB2X1 U3325 ( .B0(n2958), .B1(n3259), .A0N(n3257), .A1N(n3314), .Y(n335)
         );
  OAI221XL U3326 ( .A0(n3263), .A1(n3350), .B0(n565), .B1(n3260), .C0(n333), 
        .Y(n950) );
  AOI2BB2X1 U3327 ( .B0(N1421), .B1(n3259), .A0N(n3257), .A1N(n3315), .Y(n333)
         );
  OAI221XL U3328 ( .A0(n3263), .A1(n3349), .B0(n566), .B1(n3260), .C0(n331), 
        .Y(n949) );
  AOI2BB2X1 U3329 ( .B0(N1422), .B1(n3259), .A0N(n3257), .A1N(n3316), .Y(n331)
         );
  OAI221XL U3330 ( .A0(n3263), .A1(n3348), .B0(n567), .B1(n3260), .C0(n329), 
        .Y(n948) );
  AOI2BB2X1 U3331 ( .B0(n2993), .B1(n3259), .A0N(n3257), .A1N(n3317), .Y(n329)
         );
  OAI221XL U3332 ( .A0(n3008), .A1(n3347), .B0(n528), .B1(n3237), .C0(n385), 
        .Y(n987) );
  AOI2BB2X1 U3333 ( .B0(N1424), .B1(n3235), .A0N(n3233), .A1N(n3318), .Y(n385)
         );
  OAI221XL U3334 ( .A0(n3254), .A1(n3347), .B0(n548), .B1(n3253), .C0(n360), 
        .Y(n967) );
  AOI2BB2X1 U3335 ( .B0(N1424), .B1(n3250), .A0N(n3249), .A1N(n3318), .Y(n360)
         );
  OAI221XL U3336 ( .A0(n3006), .A1(n3347), .B0(n558), .B1(n3260), .C0(n347), 
        .Y(n957) );
  AOI2BB2X1 U3337 ( .B0(N1424), .B1(n3259), .A0N(n3257), .A1N(n3318), .Y(n347)
         );
  OAI221XL U3338 ( .A0(n3240), .A1(n3346), .B0(n3237), .B1(n589), .C0(n289), 
        .Y(n926) );
  OAI221XL U3340 ( .A0(n3240), .A1(n3345), .B0(n3237), .B1(n590), .C0(n288), 
        .Y(n925) );
  AOI2BB2XL U3341 ( .B0(n3455), .B1(n3236), .A0N(n3234), .A1N(n3290), .Y(n288)
         );
  OAI221XL U3342 ( .A0(n3240), .A1(n3344), .B0(n3237), .B1(n591), .C0(n287), 
        .Y(n924) );
  OAI221XL U3344 ( .A0(n3240), .A1(n3343), .B0(n3237), .B1(n592), .C0(n286), 
        .Y(n923) );
  AOI2BB2XL U3345 ( .B0(N898), .B1(n3236), .A0N(n3234), .A1N(n3292), .Y(n286)
         );
  OAI221XL U3346 ( .A0(n3240), .A1(n3342), .B0(n3238), .B1(n593), .C0(n285), 
        .Y(n922) );
  AOI2BB2XL U3347 ( .B0(n3458), .B1(n3236), .A0N(n3234), .A1N(n3293), .Y(n285)
         );
  OAI221XL U3348 ( .A0(n3240), .A1(n3341), .B0(n3238), .B1(n594), .C0(n284), 
        .Y(n921) );
  AOI2BB2XL U3349 ( .B0(n3464), .B1(n3236), .A0N(n3234), .A1N(n3294), .Y(n284)
         );
  OAI221XL U3350 ( .A0(n3239), .A1(n3340), .B0(n3238), .B1(n595), .C0(n283), 
        .Y(n920) );
  AOI2BB2X1 U3351 ( .B0(n3460), .B1(n3235), .A0N(n3233), .A1N(n3295), .Y(n283)
         );
  OAI221XL U3352 ( .A0(n3239), .A1(n3339), .B0(n3238), .B1(n596), .C0(n282), 
        .Y(n919) );
  AOI2BB2X1 U3353 ( .B0(N902), .B1(n3235), .A0N(n3233), .A1N(n3296), .Y(n282)
         );
  OAI221XL U3354 ( .A0(n3239), .A1(n3338), .B0(n3238), .B1(n597), .C0(n281), 
        .Y(n918) );
  AOI2BB2X1 U3355 ( .B0(N903), .B1(n3235), .A0N(n3233), .A1N(n3297), .Y(n281)
         );
  OAI221XL U3356 ( .A0(n3327), .A1(n3239), .B0(n3238), .B1(n648), .C0(n210), 
        .Y(n867) );
  AOI2BB2X1 U3357 ( .B0(n3235), .B1(n3004), .A0N(n3308), .A1N(n3233), .Y(n210)
         );
  OAI221XL U3358 ( .A0(n3336), .A1(n3239), .B0(n3238), .B1(n649), .C0(n209), 
        .Y(n866) );
  AOI2BB2XL U3359 ( .B0(n3235), .B1(n3430), .A0N(n3299), .A1N(n3233), .Y(n209)
         );
  OAI221XL U3360 ( .A0(n3335), .A1(n3239), .B0(n3238), .B1(n650), .C0(n208), 
        .Y(n865) );
  AOI2BB2XL U3361 ( .B0(n3235), .B1(n3441), .A0N(n3300), .A1N(n3233), .Y(n208)
         );
  OAI221XL U3362 ( .A0(n3334), .A1(n3239), .B0(n3238), .B1(n651), .C0(n207), 
        .Y(n864) );
  AOI2BB2XL U3363 ( .B0(n3235), .B1(N1823), .A0N(n3301), .A1N(n3233), .Y(n207)
         );
  OAI221XL U3364 ( .A0(n3333), .A1(n3239), .B0(n3238), .B1(n652), .C0(n206), 
        .Y(n863) );
  AOI2BB2XL U3365 ( .B0(n3235), .B1(n3434), .A0N(n3302), .A1N(n3233), .Y(n206)
         );
  OAI221XL U3366 ( .A0(n3332), .A1(n3239), .B0(n3238), .B1(n653), .C0(n205), 
        .Y(n862) );
  AOI2BB2XL U3367 ( .B0(n3235), .B1(n3438), .A0N(n3303), .A1N(n3233), .Y(n205)
         );
  OAI221XL U3368 ( .A0(n3331), .A1(n3239), .B0(n3238), .B1(n654), .C0(n204), 
        .Y(n861) );
  AOI2BB2X1 U3369 ( .B0(n3235), .B1(n3447), .A0N(n3304), .A1N(n3233), .Y(n204)
         );
  OAI221XL U3370 ( .A0(n3330), .A1(n3239), .B0(n3238), .B1(n655), .C0(n203), 
        .Y(n860) );
  AOI2BB2X1 U3371 ( .B0(n3235), .B1(N1827), .A0N(n3305), .A1N(n3233), .Y(n203)
         );
  OAI221XL U3372 ( .A0(n3329), .A1(n3239), .B0(n3237), .B1(n656), .C0(n202), 
        .Y(n859) );
  AOI2BB2X1 U3373 ( .B0(n3235), .B1(n3407), .A0N(n3306), .A1N(n3233), .Y(n202)
         );
  OAI221XL U3374 ( .A0(n3328), .A1(n3239), .B0(n3237), .B1(n657), .C0(n199), 
        .Y(n858) );
  AOI2BB2X1 U3375 ( .B0(n3235), .B1(N1829), .A0N(n3307), .A1N(n3233), .Y(n199)
         );
  OAI221XL U3376 ( .A0(n3246), .A1(n3347), .B0(n538), .B1(n3244), .C0(n373), 
        .Y(n977) );
  AOI22XL U3377 ( .A0(R[0]), .A1(n186), .B0(N1424), .B1(n3241), .Y(n373) );
  OAI221XL U3378 ( .A0(n3247), .A1(n3356), .B0(n539), .B1(n3244), .C0(n372), 
        .Y(n976) );
  AOI22XL U3379 ( .A0(R[9]), .A1(n3243), .B0(N1415), .B1(n3242), .Y(n372) );
  OAI221XL U3380 ( .A0(n183), .A1(n3355), .B0(n540), .B1(n3244), .C0(n371), 
        .Y(n975) );
  AOI22XL U3381 ( .A0(R[8]), .A1(n186), .B0(N1416), .B1(n3242), .Y(n371) );
  OAI221XL U3382 ( .A0(n183), .A1(n3354), .B0(n541), .B1(n3244), .C0(n370), 
        .Y(n974) );
  AOI22XL U3383 ( .A0(R[7]), .A1(n186), .B0(N1417), .B1(n3242), .Y(n370) );
  OAI221XL U3384 ( .A0(n3247), .A1(n3353), .B0(n542), .B1(n3244), .C0(n369), 
        .Y(n973) );
  AOI22XL U3385 ( .A0(R[6]), .A1(n186), .B0(N1418), .B1(n3242), .Y(n369) );
  OAI221XL U3386 ( .A0(n3247), .A1(n3352), .B0(n543), .B1(n3244), .C0(n368), 
        .Y(n972) );
  AOI22XL U3387 ( .A0(R[5]), .A1(n186), .B0(n2980), .B1(n3242), .Y(n368) );
  OAI221XL U3388 ( .A0(n3247), .A1(n3351), .B0(n544), .B1(n3244), .C0(n367), 
        .Y(n971) );
  AOI22XL U3389 ( .A0(R[4]), .A1(n186), .B0(n2958), .B1(n3242), .Y(n367) );
  OAI221XL U3390 ( .A0(n3247), .A1(n3350), .B0(n545), .B1(n3244), .C0(n366), 
        .Y(n970) );
  AOI22XL U3391 ( .A0(R[3]), .A1(n186), .B0(N1421), .B1(n3242), .Y(n366) );
  OAI221XL U3392 ( .A0(n3247), .A1(n3349), .B0(n546), .B1(n3244), .C0(n365), 
        .Y(n969) );
  AOI22XL U3393 ( .A0(R[2]), .A1(n186), .B0(N1422), .B1(n3242), .Y(n365) );
  OAI221XL U3394 ( .A0(n3247), .A1(n3348), .B0(n547), .B1(n3244), .C0(n364), 
        .Y(n968) );
  AOI22XL U3395 ( .A0(R[1]), .A1(n186), .B0(n2993), .B1(n3242), .Y(n364) );
  OAI221XL U3396 ( .A0(n3247), .A1(n3337), .B0(n3244), .B1(n598), .C0(n280), 
        .Y(n917) );
  AOI22XL U3397 ( .A0(X[0]), .A1(n3243), .B0(N904), .B1(n3242), .Y(n280) );
  OAI221XL U3398 ( .A0(n3247), .A1(n3346), .B0(n3244), .B1(n599), .C0(n279), 
        .Y(n916) );
  AOI22XL U3399 ( .A0(X[9]), .A1(n186), .B0(n3471), .B1(n3242), .Y(n279) );
  OAI221XL U3400 ( .A0(n3247), .A1(n3345), .B0(n3244), .B1(n600), .C0(n278), 
        .Y(n915) );
  AOI22XL U3401 ( .A0(X[8]), .A1(n186), .B0(n3455), .B1(n3242), .Y(n278) );
  OAI221XL U3402 ( .A0(n3247), .A1(n3344), .B0(n3244), .B1(n601), .C0(n277), 
        .Y(n914) );
  AOI22XL U3403 ( .A0(X[7]), .A1(n3243), .B0(n3467), .B1(n3242), .Y(n277) );
  OAI221XL U3404 ( .A0(n3247), .A1(n3343), .B0(n3244), .B1(n602), .C0(n276), 
        .Y(n913) );
  AOI22XL U3405 ( .A0(X[6]), .A1(n186), .B0(n3449), .B1(n3242), .Y(n276) );
  OAI221XL U3406 ( .A0(n3247), .A1(n3342), .B0(n3245), .B1(n603), .C0(n275), 
        .Y(n912) );
  AOI22XL U3407 ( .A0(X[5]), .A1(n3243), .B0(n3458), .B1(n3242), .Y(n275) );
  OAI221XL U3408 ( .A0(n3247), .A1(n3341), .B0(n3245), .B1(n604), .C0(n274), 
        .Y(n911) );
  AOI22XL U3409 ( .A0(X[4]), .A1(n186), .B0(n3464), .B1(n3242), .Y(n274) );
  OAI221XL U3410 ( .A0(n3246), .A1(n3340), .B0(n3245), .B1(n605), .C0(n273), 
        .Y(n910) );
  AOI22XL U3411 ( .A0(X[3]), .A1(n3243), .B0(n3461), .B1(n3241), .Y(n273) );
  OAI221XL U3412 ( .A0(n3246), .A1(n3339), .B0(n3245), .B1(n606), .C0(n272), 
        .Y(n909) );
  AOI22XL U3413 ( .A0(X[2]), .A1(n3243), .B0(n3452), .B1(n3241), .Y(n272) );
  OAI221XL U3414 ( .A0(n3246), .A1(n3338), .B0(n3245), .B1(n607), .C0(n271), 
        .Y(n908) );
  AOI22XL U3415 ( .A0(X[1]), .A1(n3243), .B0(N903), .B1(n3241), .Y(n271) );
  OAI221XL U3416 ( .A0(n3327), .A1(n3246), .B0(n3245), .B1(n658), .C0(n196), 
        .Y(n857) );
  AOI22XL U3417 ( .A0(n3243), .A1(Y[0]), .B0(n3241), .B1(n3004), .Y(n196) );
  OAI221XL U3418 ( .A0(n3336), .A1(n3246), .B0(n3245), .B1(n659), .C0(n195), 
        .Y(n856) );
  AOI22XL U3419 ( .A0(n3243), .A1(Y[9]), .B0(n3241), .B1(N1821), .Y(n195) );
  OAI221XL U3420 ( .A0(n3335), .A1(n3246), .B0(n3245), .B1(n660), .C0(n194), 
        .Y(n855) );
  AOI22XL U3421 ( .A0(n3243), .A1(Y[8]), .B0(n3241), .B1(n3441), .Y(n194) );
  OAI221XL U3422 ( .A0(n3334), .A1(n3246), .B0(n3245), .B1(n661), .C0(n193), 
        .Y(n854) );
  AOI22XL U3423 ( .A0(n3243), .A1(Y[7]), .B0(n3241), .B1(n3432), .Y(n193) );
  OAI221XL U3424 ( .A0(n3333), .A1(n3246), .B0(n3245), .B1(n662), .C0(n192), 
        .Y(n853) );
  AOI22XL U3425 ( .A0(n3243), .A1(Y[6]), .B0(n3241), .B1(n3435), .Y(n192) );
  OAI221XL U3426 ( .A0(n3332), .A1(n3246), .B0(n3245), .B1(n663), .C0(n191), 
        .Y(n852) );
  AOI22XL U3427 ( .A0(n3243), .A1(Y[5]), .B0(n3241), .B1(n3438), .Y(n191) );
  OAI221XL U3428 ( .A0(n3331), .A1(n3246), .B0(n3245), .B1(n664), .C0(n190), 
        .Y(n851) );
  AOI22XL U3429 ( .A0(n3243), .A1(Y[4]), .B0(n3241), .B1(n3446), .Y(n190) );
  OAI221XL U3430 ( .A0(n3330), .A1(n3246), .B0(n3245), .B1(n665), .C0(n189), 
        .Y(n850) );
  AOI22XL U3431 ( .A0(n3243), .A1(Y[3]), .B0(n3241), .B1(n3444), .Y(n189) );
  OAI221XL U3432 ( .A0(n3329), .A1(n3246), .B0(n3244), .B1(n666), .C0(n188), 
        .Y(n849) );
  AOI22XL U3433 ( .A0(n3243), .A1(Y[2]), .B0(n3241), .B1(n3407), .Y(n188) );
  OAI221XL U3434 ( .A0(n3328), .A1(n3246), .B0(n3244), .B1(n667), .C0(n185), 
        .Y(n848) );
  AOI22XL U3435 ( .A0(n3243), .A1(Y[1]), .B0(n3241), .B1(N1829), .Y(n185) );
  OAI221XL U3436 ( .A0(n3254), .A1(n3346), .B0(n3253), .B1(n609), .C0(n269), 
        .Y(n906) );
  AOI2BB2XL U3437 ( .B0(n3471), .B1(n3250), .A0N(n3249), .A1N(n3289), .Y(n269)
         );
  OAI221XL U3438 ( .A0(n3254), .A1(n3345), .B0(n3253), .B1(n610), .C0(n268), 
        .Y(n905) );
  AOI2BB2XL U3439 ( .B0(n3455), .B1(n3250), .A0N(n3249), .A1N(n3290), .Y(n268)
         );
  OAI221XL U3440 ( .A0(n3254), .A1(n3344), .B0(n3252), .B1(n611), .C0(n267), 
        .Y(n904) );
  AOI2BB2XL U3441 ( .B0(N897), .B1(n3250), .A0N(n3249), .A1N(n3291), .Y(n267)
         );
  OAI221XL U3442 ( .A0(n3254), .A1(n3343), .B0(n3252), .B1(n612), .C0(n266), 
        .Y(n903) );
  AOI2BB2XL U3443 ( .B0(N898), .B1(n3250), .A0N(n3249), .A1N(n3292), .Y(n266)
         );
  OAI221XL U3444 ( .A0(n3254), .A1(n3342), .B0(n3252), .B1(n613), .C0(n265), 
        .Y(n902) );
  AOI2BB2XL U3445 ( .B0(n3457), .B1(n3251), .A0N(n3249), .A1N(n3293), .Y(n265)
         );
  OAI221XL U3446 ( .A0(n3254), .A1(n3341), .B0(n3252), .B1(n614), .C0(n264), 
        .Y(n901) );
  AOI2BB2X1 U3447 ( .B0(n3463), .B1(n3250), .A0N(n3249), .A1N(n3294), .Y(n264)
         );
  OAI221XL U3448 ( .A0(n3255), .A1(n3340), .B0(n3252), .B1(n615), .C0(n263), 
        .Y(n900) );
  AOI2BB2XL U3449 ( .B0(n3461), .B1(n3251), .A0N(n3248), .A1N(n3295), .Y(n263)
         );
  OAI221XL U3450 ( .A0(n3255), .A1(n3339), .B0(n3252), .B1(n616), .C0(n262), 
        .Y(n899) );
  AOI2BB2XL U3451 ( .B0(N902), .B1(n3251), .A0N(n3248), .A1N(n3296), .Y(n262)
         );
  OAI221XL U3452 ( .A0(n3255), .A1(n3338), .B0(n3252), .B1(n617), .C0(n261), 
        .Y(n898) );
  AOI2BB2X1 U3453 ( .B0(N903), .B1(n3251), .A0N(n3248), .A1N(n3297), .Y(n261)
         );
  OAI221XL U3454 ( .A0(n3327), .A1(n3255), .B0(n3252), .B1(n668), .C0(n182), 
        .Y(n847) );
  AOI2BB2X1 U3455 ( .B0(n3251), .B1(n3004), .A0N(n3308), .A1N(n3248), .Y(n182)
         );
  OAI221XL U3456 ( .A0(n3336), .A1(n3255), .B0(n3253), .B1(n669), .C0(n181), 
        .Y(n846) );
  AOI2BB2XL U3457 ( .B0(n3251), .B1(n3430), .A0N(n3299), .A1N(n3248), .Y(n181)
         );
  OAI221XL U3458 ( .A0(n3335), .A1(n3255), .B0(n3252), .B1(n670), .C0(n180), 
        .Y(n845) );
  AOI2BB2XL U3459 ( .B0(n3251), .B1(n3442), .A0N(n3300), .A1N(n3248), .Y(n180)
         );
  OAI221XL U3460 ( .A0(n3334), .A1(n3255), .B0(n3252), .B1(n671), .C0(n179), 
        .Y(n844) );
  AOI2BB2XL U3461 ( .B0(n3251), .B1(N1823), .A0N(n3301), .A1N(n3248), .Y(n179)
         );
  OAI221XL U3462 ( .A0(n3333), .A1(n3255), .B0(n3253), .B1(n672), .C0(n178), 
        .Y(n843) );
  AOI2BB2XL U3463 ( .B0(n3251), .B1(n3434), .A0N(n3302), .A1N(n3248), .Y(n178)
         );
  OAI221XL U3464 ( .A0(n3332), .A1(n3255), .B0(n3252), .B1(n673), .C0(n177), 
        .Y(n842) );
  AOI2BB2XL U3465 ( .B0(n3251), .B1(n3437), .A0N(n3303), .A1N(n3248), .Y(n177)
         );
  OAI221XL U3466 ( .A0(n3331), .A1(n3255), .B0(n3252), .B1(n674), .C0(n176), 
        .Y(n841) );
  AOI2BB2X1 U3467 ( .B0(n3251), .B1(n3447), .A0N(n3304), .A1N(n3248), .Y(n176)
         );
  OAI221XL U3468 ( .A0(n3330), .A1(n3255), .B0(n3252), .B1(n675), .C0(n175), 
        .Y(n840) );
  AOI2BB2XL U3469 ( .B0(n3251), .B1(N1827), .A0N(n3305), .A1N(n3248), .Y(n175)
         );
  OAI221XL U3470 ( .A0(n3329), .A1(n3255), .B0(n3252), .B1(n676), .C0(n174), 
        .Y(n839) );
  AOI2BB2XL U3471 ( .B0(n3251), .B1(n3406), .A0N(n3306), .A1N(n3248), .Y(n174)
         );
  OAI221XL U3472 ( .A0(n3328), .A1(n3255), .B0(n3252), .B1(n677), .C0(n171), 
        .Y(n838) );
  AOI2BB2XL U3473 ( .B0(n3251), .B1(N1829), .A0N(n3307), .A1N(n3248), .Y(n171)
         );
  OAI221XL U3474 ( .A0(n3263), .A1(n3346), .B0(n3260), .B1(n619), .C0(n257), 
        .Y(n896) );
  AOI2BB2X1 U3475 ( .B0(n3470), .B1(n3259), .A0N(n3257), .A1N(n3289), .Y(n257)
         );
  OAI221XL U3476 ( .A0(n3263), .A1(n3345), .B0(n3260), .B1(n620), .C0(n255), 
        .Y(n895) );
  AOI2BB2XL U3477 ( .B0(n3454), .B1(n3259), .A0N(n3257), .A1N(n3290), .Y(n255)
         );
  OAI221XL U3478 ( .A0(n3263), .A1(n3344), .B0(n3260), .B1(n621), .C0(n253), 
        .Y(n894) );
  AOI2BB2X1 U3479 ( .B0(n3467), .B1(n3259), .A0N(n3257), .A1N(n3291), .Y(n253)
         );
  OAI221XL U3480 ( .A0(n3263), .A1(n3343), .B0(n3260), .B1(n622), .C0(n251), 
        .Y(n893) );
  AOI2BB2X1 U3481 ( .B0(n3449), .B1(n3259), .A0N(n3257), .A1N(n3292), .Y(n251)
         );
  OAI221XL U3482 ( .A0(n3263), .A1(n3342), .B0(n3261), .B1(n623), .C0(n249), 
        .Y(n892) );
  AOI2BB2X1 U3483 ( .B0(n3457), .B1(n3259), .A0N(n3257), .A1N(n3293), .Y(n249)
         );
  OAI221XL U3484 ( .A0(n3263), .A1(n3341), .B0(n3261), .B1(n624), .C0(n247), 
        .Y(n891) );
  AOI2BB2X1 U3485 ( .B0(n3463), .B1(n3259), .A0N(n3257), .A1N(n3294), .Y(n247)
         );
  OAI221XL U3486 ( .A0(n3262), .A1(n3340), .B0(n3261), .B1(n625), .C0(n245), 
        .Y(n890) );
  AOI2BB2XL U3487 ( .B0(n3460), .B1(n3258), .A0N(n3256), .A1N(n3295), .Y(n245)
         );
  OAI221XL U3488 ( .A0(n3262), .A1(n3339), .B0(n3261), .B1(n626), .C0(n243), 
        .Y(n889) );
  AOI2BB2XL U3489 ( .B0(n3452), .B1(n3258), .A0N(n3256), .A1N(n3296), .Y(n243)
         );
  OAI221XL U3490 ( .A0(n3262), .A1(n3338), .B0(n3261), .B1(n627), .C0(n241), 
        .Y(n888) );
  AOI2BB2X1 U3491 ( .B0(N903), .B1(n3258), .A0N(n3256), .A1N(n3297), .Y(n241)
         );
  OAI221XL U3492 ( .A0(n3327), .A1(n3262), .B0(n3261), .B1(n678), .C0(n167), 
        .Y(n837) );
  AOI2BB2X1 U3493 ( .B0(n3258), .B1(n3004), .A0N(n3308), .A1N(n3256), .Y(n167)
         );
  OAI221XL U3494 ( .A0(n3336), .A1(n3262), .B0(n3261), .B1(n679), .C0(n165), 
        .Y(n836) );
  AOI2BB2XL U3495 ( .B0(n3258), .B1(n3430), .A0N(n3299), .A1N(n3256), .Y(n165)
         );
  OAI221XL U3496 ( .A0(n3335), .A1(n3262), .B0(n3261), .B1(n680), .C0(n163), 
        .Y(n835) );
  AOI2BB2XL U3497 ( .B0(n3258), .B1(n3440), .A0N(n3300), .A1N(n3256), .Y(n163)
         );
  OAI221XL U3498 ( .A0(n3334), .A1(n3262), .B0(n3261), .B1(n681), .C0(n161), 
        .Y(n834) );
  AOI2BB2XL U3499 ( .B0(n3258), .B1(n3432), .A0N(n3301), .A1N(n3256), .Y(n161)
         );
  OAI221XL U3500 ( .A0(n3333), .A1(n3262), .B0(n3261), .B1(n682), .C0(n159), 
        .Y(n833) );
  AOI2BB2XL U3501 ( .B0(n3258), .B1(n3435), .A0N(n3302), .A1N(n3256), .Y(n159)
         );
  OAI221XL U3502 ( .A0(n3332), .A1(n3262), .B0(n3261), .B1(n683), .C0(n157), 
        .Y(n832) );
  AOI2BB2XL U3503 ( .B0(n3258), .B1(N1825), .A0N(n3303), .A1N(n3256), .Y(n157)
         );
  OAI221XL U3504 ( .A0(n3331), .A1(n3262), .B0(n3261), .B1(n684), .C0(n155), 
        .Y(n831) );
  AOI2BB2XL U3505 ( .B0(n3258), .B1(n3447), .A0N(n3304), .A1N(n3256), .Y(n155)
         );
  OAI221XL U3506 ( .A0(n3330), .A1(n3262), .B0(n3261), .B1(n685), .C0(n153), 
        .Y(n830) );
  AOI2BB2XL U3507 ( .B0(n3258), .B1(n3444), .A0N(n3305), .A1N(n3256), .Y(n153)
         );
  OAI221XL U3508 ( .A0(n3329), .A1(n3262), .B0(n3260), .B1(n686), .C0(n151), 
        .Y(n829) );
  AOI2BB2XL U3509 ( .B0(n3258), .B1(n3407), .A0N(n3306), .A1N(n3256), .Y(n151)
         );
  OAI221XL U3510 ( .A0(n3328), .A1(n3262), .B0(n3260), .B1(n687), .C0(n147), 
        .Y(n828) );
  AOI2BB2XL U3511 ( .B0(n3258), .B1(N1829), .A0N(n3307), .A1N(n3256), .Y(n147)
         );
  OAI221XL U3512 ( .A0(n3269), .A1(n3347), .B0(n568), .B1(n3267), .C0(n326), 
        .Y(n947) );
  AOI22XL U3513 ( .A0(R[0]), .A1(n3266), .B0(N1424), .B1(n3264), .Y(n326) );
  OAI221XL U3514 ( .A0(n3270), .A1(n3356), .B0(n569), .B1(n3267), .C0(n325), 
        .Y(n946) );
  AOI22XL U3515 ( .A0(R[9]), .A1(n3266), .B0(N1415), .B1(n3265), .Y(n325) );
  OAI221XL U3516 ( .A0(n3269), .A1(n3355), .B0(n570), .B1(n3267), .C0(n324), 
        .Y(n945) );
  AOI22XL U3517 ( .A0(R[8]), .A1(n3266), .B0(N1416), .B1(n3264), .Y(n324) );
  OAI221XL U3518 ( .A0(n3270), .A1(n3354), .B0(n571), .B1(n3267), .C0(n323), 
        .Y(n944) );
  AOI22XL U3519 ( .A0(R[7]), .A1(n3266), .B0(N1417), .B1(n3264), .Y(n323) );
  OAI221XL U3520 ( .A0(n3270), .A1(n3353), .B0(n572), .B1(n3267), .C0(n322), 
        .Y(n943) );
  AOI22XL U3521 ( .A0(R[6]), .A1(n134), .B0(N1418), .B1(n3265), .Y(n322) );
  OAI221XL U3522 ( .A0(n3270), .A1(n3352), .B0(n573), .B1(n3267), .C0(n321), 
        .Y(n942) );
  AOI22XL U3523 ( .A0(R[5]), .A1(n134), .B0(n2979), .B1(n3265), .Y(n321) );
  OAI221XL U3524 ( .A0(n3270), .A1(n3351), .B0(n574), .B1(n3267), .C0(n320), 
        .Y(n941) );
  AOI22XL U3525 ( .A0(R[4]), .A1(n134), .B0(n2958), .B1(n3265), .Y(n320) );
  OAI221XL U3526 ( .A0(n3270), .A1(n3350), .B0(n575), .B1(n3267), .C0(n319), 
        .Y(n940) );
  AOI22XL U3527 ( .A0(R[3]), .A1(n134), .B0(N1421), .B1(n3265), .Y(n319) );
  OAI221XL U3528 ( .A0(n3270), .A1(n3349), .B0(n576), .B1(n3267), .C0(n318), 
        .Y(n939) );
  AOI22XL U3529 ( .A0(R[2]), .A1(n134), .B0(N1422), .B1(n3265), .Y(n318) );
  OAI221XL U3530 ( .A0(n3270), .A1(n3348), .B0(n577), .B1(n3267), .C0(n317), 
        .Y(n938) );
  AOI22XL U3531 ( .A0(R[1]), .A1(n134), .B0(n2993), .B1(n3265), .Y(n317) );
  OAI221XL U3532 ( .A0(n3270), .A1(n3337), .B0(n3267), .B1(n628), .C0(n240), 
        .Y(n887) );
  AOI22XL U3533 ( .A0(X[0]), .A1(n3266), .B0(N904), .B1(n3265), .Y(n240) );
  OAI221XL U3534 ( .A0(n3270), .A1(n3346), .B0(n3267), .B1(n629), .C0(n239), 
        .Y(n886) );
  AOI22XL U3535 ( .A0(X[9]), .A1(n134), .B0(n3470), .B1(n3265), .Y(n239) );
  OAI221XL U3536 ( .A0(n3270), .A1(n3345), .B0(n3267), .B1(n630), .C0(n238), 
        .Y(n885) );
  AOI22XL U3537 ( .A0(X[8]), .A1(n134), .B0(n3454), .B1(n3265), .Y(n238) );
  OAI221XL U3538 ( .A0(n3270), .A1(n3344), .B0(n3267), .B1(n631), .C0(n237), 
        .Y(n884) );
  AOI22XL U3539 ( .A0(X[7]), .A1(n3266), .B0(N897), .B1(n3265), .Y(n237) );
  OAI221XL U3540 ( .A0(n3270), .A1(n3343), .B0(n3268), .B1(n632), .C0(n236), 
        .Y(n883) );
  AOI22XL U3541 ( .A0(X[6]), .A1(n134), .B0(n3449), .B1(n3265), .Y(n236) );
  OAI221XL U3542 ( .A0(n3270), .A1(n3342), .B0(n3268), .B1(n633), .C0(n235), 
        .Y(n882) );
  AOI22XL U3543 ( .A0(X[5]), .A1(n3266), .B0(n3458), .B1(n3265), .Y(n235) );
  OAI221XL U3544 ( .A0(n3270), .A1(n3341), .B0(n3268), .B1(n634), .C0(n234), 
        .Y(n881) );
  AOI22XL U3545 ( .A0(X[4]), .A1(n134), .B0(n3464), .B1(n3265), .Y(n234) );
  OAI221XL U3546 ( .A0(n3269), .A1(n3340), .B0(n3268), .B1(n635), .C0(n233), 
        .Y(n880) );
  AOI22XL U3547 ( .A0(X[3]), .A1(n134), .B0(n3461), .B1(n3264), .Y(n233) );
  OAI221XL U3548 ( .A0(n3269), .A1(n3339), .B0(n3268), .B1(n636), .C0(n232), 
        .Y(n879) );
  AOI22XL U3549 ( .A0(X[2]), .A1(n3266), .B0(N902), .B1(n3264), .Y(n232) );
  OAI221XL U3550 ( .A0(n3269), .A1(n3338), .B0(n3268), .B1(n637), .C0(n231), 
        .Y(n878) );
  AOI22XL U3551 ( .A0(X[1]), .A1(n134), .B0(N903), .B1(n3264), .Y(n231) );
  OAI221XL U3552 ( .A0(n3327), .A1(n3269), .B0(n3268), .B1(n688), .C0(n144), 
        .Y(n827) );
  AOI22XL U3553 ( .A0(n134), .A1(Y[0]), .B0(n3264), .B1(n3004), .Y(n144) );
  OAI221XL U3554 ( .A0(n3336), .A1(n3269), .B0(n3268), .B1(n689), .C0(n143), 
        .Y(n826) );
  AOI22XL U3555 ( .A0(n3266), .A1(Y[9]), .B0(n3264), .B1(n3430), .Y(n143) );
  OAI221XL U3556 ( .A0(n3335), .A1(n3269), .B0(n3268), .B1(n690), .C0(n142), 
        .Y(n825) );
  AOI22XL U3557 ( .A0(n3266), .A1(Y[8]), .B0(n3264), .B1(n3442), .Y(n142) );
  OAI221XL U3558 ( .A0(n3334), .A1(n3269), .B0(n3268), .B1(n691), .C0(n141), 
        .Y(n824) );
  AOI22XL U3559 ( .A0(n3266), .A1(Y[7]), .B0(n3264), .B1(N1823), .Y(n141) );
  OAI221XL U3560 ( .A0(n3333), .A1(n3269), .B0(n3268), .B1(n692), .C0(n140), 
        .Y(n823) );
  AOI22XL U3561 ( .A0(n3266), .A1(Y[6]), .B0(n3264), .B1(n3434), .Y(n140) );
  OAI221XL U3562 ( .A0(n3332), .A1(n3269), .B0(n3268), .B1(n693), .C0(n139), 
        .Y(n822) );
  AOI22XL U3563 ( .A0(n3266), .A1(Y[5]), .B0(n3264), .B1(N1825), .Y(n139) );
  OAI221XL U3564 ( .A0(n3331), .A1(n3269), .B0(n3268), .B1(n694), .C0(n138), 
        .Y(n821) );
  AOI22XL U3565 ( .A0(n3266), .A1(Y[4]), .B0(n3264), .B1(n3445), .Y(n138) );
  OAI221XL U3566 ( .A0(n3330), .A1(n3269), .B0(n3268), .B1(n695), .C0(n137), 
        .Y(n820) );
  AOI22XL U3567 ( .A0(n3266), .A1(Y[3]), .B0(n3264), .B1(N1827), .Y(n137) );
  OAI221XL U3568 ( .A0(n3329), .A1(n3269), .B0(n3267), .B1(n696), .C0(n136), 
        .Y(n819) );
  AOI22XL U3569 ( .A0(n3266), .A1(Y[2]), .B0(n135), .B1(n3407), .Y(n136) );
  OAI221XL U3570 ( .A0(n3328), .A1(n3269), .B0(n3267), .B1(n697), .C0(n133), 
        .Y(n818) );
  AOI22XL U3571 ( .A0(n3266), .A1(Y[1]), .B0(n3264), .B1(N1829), .Y(n133) );
  OAI221XL U3572 ( .A0(n3275), .A1(n3347), .B0(n578), .B1(n3273), .C0(n310), 
        .Y(n937) );
  AOI22XL U3573 ( .A0(R[0]), .A1(n3272), .B0(N1424), .B1(n112), .Y(n310) );
  OAI221XL U3574 ( .A0(n3275), .A1(n3356), .B0(n579), .B1(n3273), .C0(n308), 
        .Y(n936) );
  AOI22XL U3575 ( .A0(R[9]), .A1(n3272), .B0(N1415), .B1(n112), .Y(n308) );
  OAI221XL U3576 ( .A0(n3275), .A1(n3355), .B0(n580), .B1(n3273), .C0(n306), 
        .Y(n935) );
  AOI22XL U3577 ( .A0(R[8]), .A1(n3272), .B0(N1416), .B1(n3271), .Y(n306) );
  OAI221XL U3578 ( .A0(n3275), .A1(n3354), .B0(n581), .B1(n3273), .C0(n304), 
        .Y(n934) );
  AOI22XL U3579 ( .A0(R[7]), .A1(n3272), .B0(N1417), .B1(n112), .Y(n304) );
  OAI221XL U3580 ( .A0(n3275), .A1(n3353), .B0(n582), .B1(n3273), .C0(n302), 
        .Y(n933) );
  AOI22XL U3581 ( .A0(R[6]), .A1(n3272), .B0(N1418), .B1(n112), .Y(n302) );
  OAI221XL U3582 ( .A0(n3275), .A1(n3352), .B0(n583), .B1(n3273), .C0(n300), 
        .Y(n932) );
  AOI22XL U3583 ( .A0(R[5]), .A1(n3272), .B0(n2980), .B1(n112), .Y(n300) );
  OAI221XL U3584 ( .A0(n3275), .A1(n3351), .B0(n584), .B1(n3273), .C0(n298), 
        .Y(n931) );
  AOI22XL U3585 ( .A0(R[4]), .A1(n3272), .B0(n2958), .B1(n112), .Y(n298) );
  OAI221XL U3586 ( .A0(n3275), .A1(n3350), .B0(n585), .B1(n3273), .C0(n296), 
        .Y(n930) );
  AOI22XL U3587 ( .A0(R[3]), .A1(n3272), .B0(N1421), .B1(n3271), .Y(n296) );
  OAI221XL U3588 ( .A0(n3275), .A1(n3349), .B0(n586), .B1(n3273), .C0(n294), 
        .Y(n929) );
  AOI22XL U3589 ( .A0(R[2]), .A1(n3272), .B0(N1422), .B1(n3271), .Y(n294) );
  OAI221XL U3590 ( .A0(n3275), .A1(n3348), .B0(n587), .B1(n3273), .C0(n292), 
        .Y(n928) );
  AOI22XL U3591 ( .A0(R[1]), .A1(n3272), .B0(n2993), .B1(n3271), .Y(n292) );
  OAI221XL U3592 ( .A0(n3275), .A1(n3337), .B0(n3273), .B1(n638), .C0(n230), 
        .Y(n877) );
  AOI22XL U3593 ( .A0(X[0]), .A1(n3272), .B0(N904), .B1(n3271), .Y(n230) );
  OAI221XL U3594 ( .A0(n3275), .A1(n3346), .B0(n3273), .B1(n639), .C0(n228), 
        .Y(n876) );
  AOI22XL U3595 ( .A0(X[9]), .A1(n3272), .B0(n3470), .B1(n112), .Y(n228) );
  OAI221XL U3596 ( .A0(n3276), .A1(n3345), .B0(n3273), .B1(n640), .C0(n226), 
        .Y(n875) );
  AOI22XL U3597 ( .A0(X[8]), .A1(n3272), .B0(n3454), .B1(n3271), .Y(n226) );
  OAI221XL U3598 ( .A0(n3276), .A1(n3344), .B0(n3274), .B1(n641), .C0(n224), 
        .Y(n874) );
  AOI22XL U3599 ( .A0(X[7]), .A1(n111), .B0(n3467), .B1(n112), .Y(n224) );
  OAI221XL U3600 ( .A0(n3276), .A1(n3343), .B0(n3274), .B1(n642), .C0(n222), 
        .Y(n873) );
  AOI22XL U3601 ( .A0(X[6]), .A1(n111), .B0(N898), .B1(n3271), .Y(n222) );
  OAI221XL U3602 ( .A0(n3276), .A1(n3342), .B0(n3274), .B1(n643), .C0(n220), 
        .Y(n872) );
  AOI22XL U3603 ( .A0(X[5]), .A1(n3272), .B0(n3457), .B1(n112), .Y(n220) );
  OAI221XL U3604 ( .A0(n3276), .A1(n3341), .B0(n3274), .B1(n644), .C0(n218), 
        .Y(n871) );
  AOI22XL U3605 ( .A0(X[4]), .A1(n111), .B0(n3463), .B1(n3271), .Y(n218) );
  OAI221XL U3606 ( .A0(n3276), .A1(n3340), .B0(n3274), .B1(n645), .C0(n216), 
        .Y(n870) );
  AOI22XL U3607 ( .A0(X[3]), .A1(n3272), .B0(n3460), .B1(n112), .Y(n216) );
  OAI221XL U3608 ( .A0(n3276), .A1(n3339), .B0(n3274), .B1(n646), .C0(n214), 
        .Y(n869) );
  AOI22XL U3609 ( .A0(X[2]), .A1(n111), .B0(n3452), .B1(n3271), .Y(n214) );
  OAI221XL U3610 ( .A0(n3276), .A1(n3338), .B0(n3274), .B1(n647), .C0(n212), 
        .Y(n868) );
  AOI22XL U3611 ( .A0(X[1]), .A1(n3272), .B0(N903), .B1(n112), .Y(n212) );
  OAI221XL U3612 ( .A0(n3276), .A1(n3327), .B0(n3274), .B1(n698), .C0(n130), 
        .Y(n817) );
  AOI22XL U3613 ( .A0(Y[0]), .A1(n111), .B0(n3004), .B1(n112), .Y(n130) );
  INVXL U3614 ( .A(R[0]), .Y(n3318) );
  INVXL U3615 ( .A(R[9]), .Y(n3309) );
  INVXL U3616 ( .A(R[8]), .Y(n3310) );
  INVXL U3617 ( .A(R[7]), .Y(n3311) );
  INVXL U3618 ( .A(R[6]), .Y(n3312) );
  INVXL U3619 ( .A(R[5]), .Y(n3313) );
  INVXL U3620 ( .A(R[4]), .Y(n3314) );
  INVXL U3621 ( .A(R[3]), .Y(n3315) );
  INVXL U3622 ( .A(R[2]), .Y(n3316) );
  INVXL U3623 ( .A(R[1]), .Y(n3317) );
  INVXL U3624 ( .A(X[0]), .Y(n3298) );
  INVXL U3625 ( .A(X[9]), .Y(n3289) );
  INVXL U3626 ( .A(X[8]), .Y(n3290) );
  INVXL U3627 ( .A(X[7]), .Y(n3291) );
  INVXL U3628 ( .A(X[6]), .Y(n3292) );
  INVXL U3629 ( .A(X[5]), .Y(n3293) );
  INVXL U3630 ( .A(X[4]), .Y(n3294) );
  INVXL U3631 ( .A(X[3]), .Y(n3295) );
  INVXL U3632 ( .A(X[2]), .Y(n3296) );
  INVXL U3633 ( .A(X[1]), .Y(n3297) );
  INVXL U3634 ( .A(Y[0]), .Y(n3308) );
  INVXL U3635 ( .A(Y[9]), .Y(n3299) );
  INVXL U3636 ( .A(Y[8]), .Y(n3300) );
  INVXL U3637 ( .A(Y[7]), .Y(n3301) );
  INVXL U3638 ( .A(Y[6]), .Y(n3302) );
  INVXL U3639 ( .A(Y[5]), .Y(n3303) );
  INVXL U3640 ( .A(Y[4]), .Y(n3304) );
  INVXL U3641 ( .A(Y[3]), .Y(n3305) );
  INVXL U3642 ( .A(Y[2]), .Y(n3306) );
  INVXL U3643 ( .A(Y[1]), .Y(n3307) );
  NAND2X1 U3644 ( .A(n797), .B(n315), .Y(n350) );
  OAI221XL U3645 ( .A0(n772), .A1(n3209), .B0(n773), .B1(n3230), .C0(n397), 
        .Y(n989) );
  AOI22XL U3646 ( .A0(N1324), .A1(n3212), .B0(N1347), .B1(n3214), .Y(n397) );
  OAI21XL U3647 ( .A0(n772), .A1(n3230), .B0(n393), .Y(n988) );
  AOI22XL U3648 ( .A0(N1325), .A1(n3212), .B0(N1348), .B1(n3213), .Y(n393) );
  OAI221XL U3649 ( .A0(n773), .A1(n3210), .B0(n774), .B1(n3230), .C0(n398), 
        .Y(n990) );
  AOI22XL U3650 ( .A0(N1323), .A1(n394), .B0(N1346), .B1(n3214), .Y(n398) );
  OAI221XL U3651 ( .A0(n775), .A1(n3209), .B0(n776), .B1(n3230), .C0(n400), 
        .Y(n992) );
  AOI22XL U3652 ( .A0(N1321), .A1(n3212), .B0(N1344), .B1(n3213), .Y(n400) );
  OAI221XL U3653 ( .A0(n774), .A1(n3209), .B0(n775), .B1(n3230), .C0(n399), 
        .Y(n991) );
  AOI22XL U3654 ( .A0(N1322), .A1(n3212), .B0(N1345), .B1(n3213), .Y(n399) );
  OAI221XL U3655 ( .A0(n778), .A1(n3209), .B0(n779), .B1(n3230), .C0(n403), 
        .Y(n995) );
  AOI22XL U3656 ( .A0(N1318), .A1(n3212), .B0(N1341), .B1(n3214), .Y(n403) );
  OAI221XL U3657 ( .A0(n777), .A1(n3209), .B0(n778), .B1(n3230), .C0(n402), 
        .Y(n994) );
  AOI22XL U3658 ( .A0(N1319), .A1(n3212), .B0(N1342), .B1(n3214), .Y(n402) );
  OAI221XL U3659 ( .A0(n776), .A1(n3210), .B0(n777), .B1(n3230), .C0(n401), 
        .Y(n993) );
  AOI22XL U3660 ( .A0(N1320), .A1(n394), .B0(N1343), .B1(n3214), .Y(n401) );
  OAI221XL U3661 ( .A0(n780), .A1(n3209), .B0(n781), .B1(n3230), .C0(n405), 
        .Y(n997) );
  AOI22XL U3662 ( .A0(N1316), .A1(n3212), .B0(N1339), .B1(n3213), .Y(n405) );
  OAI221XL U3663 ( .A0(n779), .A1(n3210), .B0(n780), .B1(n3230), .C0(n404), 
        .Y(n996) );
  AOI22XL U3664 ( .A0(N1317), .A1(n394), .B0(N1340), .B1(n3213), .Y(n404) );
  OAI221XL U3665 ( .A0(n781), .A1(n3209), .B0(n782), .B1(n3230), .C0(n406), 
        .Y(n998) );
  AOI22XL U3666 ( .A0(N1315), .A1(n3212), .B0(N1338), .B1(n3214), .Y(n406) );
  OAI221XL U3667 ( .A0(n782), .A1(n3210), .B0(n783), .B1(n3231), .C0(n407), 
        .Y(n999) );
  AOI22XL U3668 ( .A0(N1314), .A1(n394), .B0(N1337), .B1(n3214), .Y(n407) );
  OAI221XL U3669 ( .A0(n784), .A1(n3209), .B0(n785), .B1(n3231), .C0(n409), 
        .Y(n1001) );
  AOI22XL U3670 ( .A0(N1312), .A1(n3212), .B0(N1335), .B1(n3213), .Y(n409) );
  OAI221XL U3671 ( .A0(n783), .A1(n3209), .B0(n784), .B1(n3231), .C0(n408), 
        .Y(n1000) );
  AOI22XL U3672 ( .A0(N1313), .A1(n3212), .B0(N1336), .B1(n3214), .Y(n408) );
  OAI221XL U3673 ( .A0(n786), .A1(n3209), .B0(n787), .B1(n3231), .C0(n411), 
        .Y(n1003) );
  AOI22XL U3674 ( .A0(N1310), .A1(n3212), .B0(N1333), .B1(n3214), .Y(n411) );
  OAI221XL U3675 ( .A0(n785), .A1(n3210), .B0(n786), .B1(n3231), .C0(n410), 
        .Y(n1002) );
  AOI22XL U3676 ( .A0(N1311), .A1(n394), .B0(N1334), .B1(n3213), .Y(n410) );
  OAI221XL U3677 ( .A0(n787), .A1(n3209), .B0(n788), .B1(n3231), .C0(n412), 
        .Y(n1004) );
  AOI22XL U3678 ( .A0(N1309), .A1(n3212), .B0(N1332), .B1(n3213), .Y(n412) );
  OAI221XL U3679 ( .A0(n788), .A1(n3210), .B0(n789), .B1(n3231), .C0(n413), 
        .Y(n1005) );
  AOI22XL U3680 ( .A0(N1308), .A1(n394), .B0(N1331), .B1(n3213), .Y(n413) );
  OAI221XL U3681 ( .A0(n789), .A1(n3209), .B0(n790), .B1(n3231), .C0(n414), 
        .Y(n1006) );
  AOI22XL U3682 ( .A0(N1307), .A1(n3212), .B0(N1330), .B1(n3213), .Y(n414) );
  OAI221XL U3683 ( .A0(n792), .A1(n3209), .B0(n793), .B1(n3231), .C0(n417), 
        .Y(n1009) );
  AOI22XL U3684 ( .A0(N1304), .A1(n3212), .B0(N1327), .B1(n3213), .Y(n417) );
  OAI221XL U3685 ( .A0(n790), .A1(n3209), .B0(n791), .B1(n3231), .C0(n415), 
        .Y(n1007) );
  AOI22XL U3686 ( .A0(N1306), .A1(n3212), .B0(N1329), .B1(n3214), .Y(n415) );
  OAI221XL U3687 ( .A0(n791), .A1(n3210), .B0(n792), .B1(n3231), .C0(n416), 
        .Y(n1008) );
  AOI22XL U3688 ( .A0(N1305), .A1(n394), .B0(N1328), .B1(n3214), .Y(n416) );
  OAI221XL U3689 ( .A0(n793), .A1(n3209), .B0(n527), .B1(n3230), .C0(n418), 
        .Y(n1010) );
  AOI22XL U3690 ( .A0(N1303), .A1(n3212), .B0(N1326), .B1(n3213), .Y(n418) );
  OAI211X1 U3691 ( .A0(n3358), .A1(n3326), .B0(n453), .C0(n3208), .Y(n451) );
  OAI31XL U3692 ( .A0(n449), .A1(n798), .A2(n799), .B0(n450), .Y(n1017) );
  AO21X1 U3693 ( .A0(n449), .A1(n451), .B0(n797), .Y(n450) );
  NAND2X1 U3694 ( .A(n800), .B(idx2[1]), .Y(n361) );
  OAI32XL U3695 ( .A0(idx0[0]), .A1(n3323), .A2(n428), .B0(n796), .B1(n429), 
        .Y(n1012) );
  INVXL U3696 ( .A(n429), .Y(n3323) );
  OA21XL U3697 ( .A0(n3321), .A1(idx2[0]), .B0(n441), .Y(n440) );
  OAI221XL U3698 ( .A0(idx2[0]), .A1(n3321), .B0(n802), .B1(n441), .C0(n442), 
        .Y(n1016) );
  NAND4XL U3699 ( .A(n443), .B(n316), .C(n444), .D(n441), .Y(n442) );
  OAI22XL U3700 ( .A0(n799), .A1(n451), .B0(idx1[0]), .B1(n449), .Y(n1018) );
  OAI22XL U3701 ( .A0(n349), .A1(n3321), .B0(n800), .B1(n436), .Y(n1014) );
  NOR2XL U3702 ( .A(n437), .B(n3322), .Y(n436) );
  OAI22XL U3703 ( .A0(n794), .A1(n424), .B0(n795), .B1(n425), .Y(n1011) );
  OAI22XL U3704 ( .A0(n795), .A1(n424), .B0(idx0[1]), .B1(n425), .Y(n1013) );
  NOR2XL U3705 ( .A(n3017), .B(n3018), .Y(n443) );
  OAI211X1 U3706 ( .A0(n795), .A1(n794), .B0(n3360), .C0(n2974), .Y(n428) );
  INVXL U3707 ( .A(n434), .Y(n3360) );
  AOI222XL U3708 ( .A0(\yCoor[5][2] ), .A1(n2956), .B0(\yCoor[3][2] ), .B1(
        n3060), .C0(\yCoor[4][2] ), .C1(n3059), .Y(n3026) );
  NAND2X1 U3709 ( .A(n3026), .B(n3025), .Y(N1146) );
  AOI222XL U3710 ( .A0(\yCoor[5][3] ), .A1(n2956), .B0(\yCoor[3][3] ), .B1(
        n3060), .C0(\yCoor[4][3] ), .C1(n3059), .Y(n3028) );
  AOI222XL U3711 ( .A0(\yCoor[2][3] ), .A1(n2970), .B0(\yCoor[0][3] ), .B1(
        n3065), .C0(\yCoor[1][3] ), .C1(n3061), .Y(n3027) );
  NAND2X1 U3712 ( .A(n3028), .B(n3027), .Y(N1145) );
  AOI222XL U3713 ( .A0(\yCoor[5][4] ), .A1(n2956), .B0(\yCoor[3][4] ), .B1(
        n3060), .C0(\yCoor[4][4] ), .C1(n3059), .Y(n3030) );
  AOI222XL U3714 ( .A0(\yCoor[2][4] ), .A1(n2970), .B0(\yCoor[0][4] ), .B1(
        n3065), .C0(\yCoor[1][4] ), .C1(n3061), .Y(n3029) );
  NAND2X1 U3715 ( .A(n3030), .B(n3029), .Y(N1144) );
  AOI222XL U3716 ( .A0(\yCoor[5][5] ), .A1(n2956), .B0(\yCoor[3][5] ), .B1(
        n3060), .C0(\yCoor[4][5] ), .C1(n3059), .Y(n3032) );
  AOI222XL U3717 ( .A0(\yCoor[2][5] ), .A1(n2970), .B0(\yCoor[0][5] ), .B1(
        n3065), .C0(\yCoor[1][5] ), .C1(n3061), .Y(n3031) );
  NAND2X1 U3718 ( .A(n3032), .B(n3031), .Y(N1143) );
  AOI222XL U3719 ( .A0(\yCoor[5][6] ), .A1(n2956), .B0(\yCoor[3][6] ), .B1(
        n3060), .C0(\yCoor[4][6] ), .C1(n3059), .Y(n3034) );
  AOI222XL U3720 ( .A0(\yCoor[2][6] ), .A1(n2970), .B0(\yCoor[0][6] ), .B1(
        n3065), .C0(\yCoor[1][6] ), .C1(n3061), .Y(n3033) );
  AOI222XL U3722 ( .A0(\yCoor[5][7] ), .A1(n2956), .B0(\yCoor[3][7] ), .B1(
        n3060), .C0(\yCoor[4][7] ), .C1(n3059), .Y(n3036) );
  AOI222XL U3723 ( .A0(\yCoor[2][7] ), .A1(n2970), .B0(\yCoor[0][7] ), .B1(
        n3065), .C0(\yCoor[1][7] ), .C1(n3061), .Y(n3035) );
  AOI222XL U3725 ( .A0(\yCoor[5][8] ), .A1(n2956), .B0(\yCoor[3][8] ), .B1(
        n3060), .C0(\yCoor[4][8] ), .C1(n3059), .Y(n3038) );
  AOI222XL U3726 ( .A0(\yCoor[2][8] ), .A1(n2970), .B0(\yCoor[0][8] ), .B1(
        n3065), .C0(\yCoor[1][8] ), .C1(n3061), .Y(n3037) );
  AOI222XL U3728 ( .A0(\yCoor[5][9] ), .A1(n2956), .B0(\yCoor[3][9] ), .B1(
        n3060), .C0(\yCoor[4][9] ), .C1(n3059), .Y(n3040) );
  AOI222XL U3729 ( .A0(\yCoor[2][9] ), .A1(n2970), .B0(\yCoor[0][9] ), .B1(
        n3065), .C0(\yCoor[1][9] ), .C1(n3061), .Y(n3039) );
  NAND2X1 U3730 ( .A(n3040), .B(n3039), .Y(N1139) );
  AOI222XL U3731 ( .A0(\xCoor[5][2] ), .A1(n2956), .B0(\xCoor[3][2] ), .B1(
        n3060), .C0(\xCoor[4][2] ), .C1(n3059), .Y(n3046) );
  NAND2X1 U3732 ( .A(n3046), .B(n3045), .Y(N1016) );
  AOI222XL U3733 ( .A0(\xCoor[5][3] ), .A1(n2956), .B0(\xCoor[3][3] ), .B1(
        n3060), .C0(\xCoor[4][3] ), .C1(n3059), .Y(n3048) );
  NAND2X1 U3734 ( .A(n3048), .B(n3047), .Y(N1015) );
  AOI222XL U3735 ( .A0(\xCoor[5][4] ), .A1(n2956), .B0(\xCoor[3][4] ), .B1(
        n3060), .C0(\xCoor[4][4] ), .C1(n3059), .Y(n3050) );
  AOI222XL U3736 ( .A0(\xCoor[2][4] ), .A1(n2970), .B0(\xCoor[0][4] ), .B1(
        n3065), .C0(\xCoor[1][4] ), .C1(n3061), .Y(n3049) );
  AOI222XL U3738 ( .A0(\xCoor[5][5] ), .A1(n2956), .B0(\xCoor[3][5] ), .B1(
        n3060), .C0(\xCoor[4][5] ), .C1(n3059), .Y(n3052) );
  AOI222XL U3739 ( .A0(\xCoor[2][5] ), .A1(n2970), .B0(\xCoor[0][5] ), .B1(
        n3065), .C0(\xCoor[1][5] ), .C1(n3061), .Y(n3051) );
  NAND2X1 U3740 ( .A(n3052), .B(n3051), .Y(N1013) );
  AOI222XL U3741 ( .A0(\xCoor[5][6] ), .A1(n2956), .B0(\xCoor[3][6] ), .B1(
        n3060), .C0(\xCoor[4][6] ), .C1(n3059), .Y(n3054) );
  AOI222XL U3742 ( .A0(\xCoor[2][6] ), .A1(n2970), .B0(\xCoor[0][6] ), .B1(
        n3065), .C0(\xCoor[1][6] ), .C1(n3061), .Y(n3053) );
  NAND2X1 U3743 ( .A(n3054), .B(n3053), .Y(N1012) );
  AOI222XL U3744 ( .A0(\xCoor[5][7] ), .A1(n2956), .B0(\xCoor[3][7] ), .B1(
        n3060), .C0(\xCoor[4][7] ), .C1(n3059), .Y(n3056) );
  AOI222XL U3745 ( .A0(\xCoor[2][7] ), .A1(n2970), .B0(\xCoor[0][7] ), .B1(
        n3065), .C0(\xCoor[1][7] ), .C1(n3061), .Y(n3055) );
  NAND2X1 U3746 ( .A(n3056), .B(n3055), .Y(N1011) );
  AOI222XL U3747 ( .A0(\xCoor[5][8] ), .A1(n2956), .B0(\xCoor[3][8] ), .B1(
        n3060), .C0(\xCoor[4][8] ), .C1(n3059), .Y(n3058) );
  AOI222XL U3748 ( .A0(\xCoor[2][8] ), .A1(n2970), .B0(\xCoor[0][8] ), .B1(
        n3065), .C0(\xCoor[1][8] ), .C1(n3061), .Y(n3057) );
  NAND2X1 U3749 ( .A(n3058), .B(n3057), .Y(N1010) );
  AOI222XL U3750 ( .A0(\xCoor[5][9] ), .A1(n2956), .B0(\xCoor[3][9] ), .B1(
        n3060), .C0(\xCoor[4][9] ), .C1(n3059), .Y(n3063) );
  AOI222XL U3751 ( .A0(\xCoor[2][9] ), .A1(n2970), .B0(\xCoor[0][9] ), .B1(
        n3065), .C0(\xCoor[1][9] ), .C1(n3061), .Y(n3062) );
  NAND2X1 U3752 ( .A(n3063), .B(n3062), .Y(N1009) );
  AOI222XL U3753 ( .A0(\yCoor[5][2] ), .A1(n2992), .B0(\yCoor[3][2] ), .B1(
        n3012), .C0(\yCoor[4][2] ), .C1(n3378), .Y(n3075) );
  AOI222XL U3754 ( .A0(\yCoor[5][3] ), .A1(n2992), .B0(\yCoor[3][3] ), .B1(
        n3012), .C0(\yCoor[4][3] ), .C1(n3378), .Y(n3077) );
  AOI222XL U3755 ( .A0(\yCoor[2][3] ), .A1(n2995), .B0(\yCoor[0][3] ), .B1(
        n2940), .C0(\yCoor[1][3] ), .C1(n2943), .Y(n3076) );
  AOI222XL U3756 ( .A0(\yCoor[5][4] ), .A1(n2992), .B0(\yCoor[3][4] ), .B1(
        n3012), .C0(\yCoor[4][4] ), .C1(n3378), .Y(n3079) );
  AOI222XL U3757 ( .A0(\yCoor[2][4] ), .A1(n2995), .B0(\yCoor[0][4] ), .B1(
        n2940), .C0(\yCoor[1][4] ), .C1(n2943), .Y(n3078) );
  AOI222XL U3759 ( .A0(\yCoor[5][5] ), .A1(n2992), .B0(\yCoor[3][5] ), .B1(
        n3012), .C0(\yCoor[4][5] ), .C1(n3378), .Y(n3081) );
  AOI222XL U3760 ( .A0(\yCoor[2][5] ), .A1(n2995), .B0(\yCoor[0][5] ), .B1(
        n2940), .C0(\yCoor[1][5] ), .C1(n2943), .Y(n3080) );
  AOI222XL U3761 ( .A0(\yCoor[5][6] ), .A1(n2992), .B0(\yCoor[3][6] ), .B1(
        n3012), .C0(\yCoor[4][6] ), .C1(n3378), .Y(n3083) );
  AOI222XL U3762 ( .A0(\yCoor[2][6] ), .A1(n2995), .B0(\yCoor[0][6] ), .B1(
        n2940), .C0(\yCoor[1][6] ), .C1(n2943), .Y(n3082) );
  AOI222XL U3763 ( .A0(\yCoor[5][7] ), .A1(n2992), .B0(\yCoor[3][7] ), .B1(
        n3012), .C0(\yCoor[4][7] ), .C1(n3378), .Y(n3085) );
  AOI222XL U3764 ( .A0(\yCoor[2][7] ), .A1(n2995), .B0(\yCoor[0][7] ), .B1(
        n2940), .C0(\yCoor[1][7] ), .C1(n2943), .Y(n3084) );
  AOI222XL U3765 ( .A0(\yCoor[5][8] ), .A1(n2992), .B0(\yCoor[3][8] ), .B1(
        n3012), .C0(\yCoor[4][8] ), .C1(n3378), .Y(n3087) );
  AOI222XL U3766 ( .A0(\yCoor[2][8] ), .A1(n2995), .B0(\yCoor[0][8] ), .B1(
        n2940), .C0(\yCoor[1][8] ), .C1(n2943), .Y(n3086) );
  AOI222XL U3767 ( .A0(\yCoor[5][9] ), .A1(n2992), .B0(\yCoor[3][9] ), .B1(
        n3012), .C0(\yCoor[4][9] ), .C1(n3378), .Y(n3089) );
  AOI222XL U3768 ( .A0(\yCoor[2][9] ), .A1(n2995), .B0(\yCoor[0][9] ), .B1(
        n2940), .C0(\yCoor[1][9] ), .C1(n2943), .Y(n3088) );
  AOI222XL U3769 ( .A0(\xCoor[5][2] ), .A1(n2992), .B0(\xCoor[3][2] ), .B1(
        n3012), .C0(\xCoor[4][2] ), .C1(n3378), .Y(n3095) );
  AOI222XL U3770 ( .A0(\xCoor[5][3] ), .A1(n2992), .B0(\xCoor[3][3] ), .B1(
        n3130), .C0(\xCoor[4][3] ), .C1(n3378), .Y(n3097) );
  AOI222XL U3771 ( .A0(\xCoor[2][3] ), .A1(n2995), .B0(\xCoor[0][3] ), .B1(
        n2940), .C0(\xCoor[1][3] ), .C1(n2943), .Y(n3096) );
  AOI222XL U3772 ( .A0(\xCoor[5][4] ), .A1(n2992), .B0(\xCoor[3][4] ), .B1(
        n3130), .C0(\xCoor[4][4] ), .C1(n3378), .Y(n3099) );
  AOI222XL U3773 ( .A0(\xCoor[2][4] ), .A1(n2995), .B0(\xCoor[0][4] ), .B1(
        n2940), .C0(\xCoor[1][4] ), .C1(n2943), .Y(n3098) );
  AOI222XL U3774 ( .A0(\xCoor[5][5] ), .A1(n2992), .B0(\xCoor[3][5] ), .B1(
        n3130), .C0(\xCoor[4][5] ), .C1(n3378), .Y(n3101) );
  AOI222XL U3775 ( .A0(\xCoor[2][5] ), .A1(n2995), .B0(\xCoor[0][5] ), .B1(
        n2940), .C0(\xCoor[1][5] ), .C1(n2943), .Y(n3100) );
  AOI222XL U3776 ( .A0(\xCoor[5][6] ), .A1(n2992), .B0(\xCoor[3][6] ), .B1(
        n3130), .C0(\xCoor[4][6] ), .C1(n3378), .Y(n3103) );
  AOI222XL U3777 ( .A0(\xCoor[2][6] ), .A1(n2995), .B0(\xCoor[0][6] ), .B1(
        n2940), .C0(\xCoor[1][6] ), .C1(n2943), .Y(n3102) );
  AOI222XL U3778 ( .A0(\xCoor[5][7] ), .A1(n2992), .B0(\xCoor[3][7] ), .B1(
        n3130), .C0(\xCoor[4][7] ), .C1(n3378), .Y(n3105) );
  AOI222XL U3779 ( .A0(\xCoor[2][7] ), .A1(n2995), .B0(\xCoor[0][7] ), .B1(
        n2940), .C0(\xCoor[1][7] ), .C1(n2943), .Y(n3104) );
  AOI222XL U3780 ( .A0(\xCoor[5][8] ), .A1(n2992), .B0(\xCoor[3][8] ), .B1(
        n3130), .C0(\xCoor[4][8] ), .C1(n3378), .Y(n3107) );
  AOI222XL U3781 ( .A0(\xCoor[2][8] ), .A1(n2995), .B0(\xCoor[0][8] ), .B1(
        n2940), .C0(\xCoor[1][8] ), .C1(n2943), .Y(n3106) );
  AOI222XL U3782 ( .A0(\xCoor[5][9] ), .A1(n2992), .B0(\xCoor[3][9] ), .B1(
        n3130), .C0(\xCoor[4][9] ), .C1(n3378), .Y(n3109) );
  AOI222XL U3783 ( .A0(\xCoor[2][9] ), .A1(n2995), .B0(\xCoor[0][9] ), .B1(
        n2940), .C0(\xCoor[1][9] ), .C1(n2943), .Y(n3108) );
  AOI222XL U3784 ( .A0(\R_len[5][2] ), .A1(n2992), .B0(\R_len[3][2] ), .B1(
        n3130), .C0(\R_len[4][2] ), .C1(n3378), .Y(n3115) );
  AOI222XL U3785 ( .A0(\R_len[5][3] ), .A1(n2992), .B0(\R_len[3][3] ), .B1(
        n3130), .C0(\R_len[4][3] ), .C1(n3378), .Y(n3117) );
  AOI222XL U3786 ( .A0(\R_len[2][3] ), .A1(n2995), .B0(\R_len[0][3] ), .B1(
        n2940), .C0(\R_len[1][3] ), .C1(n2943), .Y(n3116) );
  AOI222XL U3787 ( .A0(\R_len[5][4] ), .A1(n2992), .B0(\R_len[3][4] ), .B1(
        n3130), .C0(\R_len[4][4] ), .C1(n3378), .Y(n3119) );
  AOI222XL U3788 ( .A0(\R_len[2][4] ), .A1(n2995), .B0(\R_len[0][4] ), .B1(
        n2940), .C0(\R_len[1][4] ), .C1(n2943), .Y(n3118) );
  AOI222XL U3789 ( .A0(\R_len[5][5] ), .A1(n2992), .B0(\R_len[3][5] ), .B1(
        n3130), .C0(\R_len[4][5] ), .C1(n3378), .Y(n3121) );
  AOI222XL U3790 ( .A0(\R_len[2][5] ), .A1(n2995), .B0(\R_len[0][5] ), .B1(
        n2940), .C0(\R_len[1][5] ), .C1(n2943), .Y(n3120) );
  AOI222XL U3791 ( .A0(\R_len[5][8] ), .A1(n2992), .B0(\R_len[3][8] ), .B1(
        n3130), .C0(\R_len[4][8] ), .C1(n3378), .Y(n3127) );
  AOI222XL U3792 ( .A0(\R_len[2][8] ), .A1(n2995), .B0(\R_len[0][8] ), .B1(
        n2940), .C0(\R_len[1][8] ), .C1(n2943), .Y(n3126) );
  AOI222XL U3793 ( .A0(\R_len[5][9] ), .A1(n2992), .B0(\R_len[3][9] ), .B1(
        n3130), .C0(\R_len[4][9] ), .C1(n3378), .Y(n3129) );
  AOI222XL U3794 ( .A0(\R_len[2][9] ), .A1(n2995), .B0(\R_len[0][9] ), .B1(
        n2940), .C0(\R_len[1][9] ), .C1(n2943), .Y(n3128) );
  AOI222XL U3795 ( .A0(\yCoor[5][3] ), .A1(n2985), .B0(\yCoor[3][3] ), .B1(
        n3014), .C0(\yCoor[4][3] ), .C1(n3196), .Y(n3142) );
  AOI222XL U3796 ( .A0(\yCoor[2][3] ), .A1(n3204), .B0(\yCoor[0][3] ), .B1(
        n3015), .C0(\yCoor[1][3] ), .C1(n3199), .Y(n3141) );
  AOI222XL U3797 ( .A0(\yCoor[5][4] ), .A1(n2985), .B0(\yCoor[3][4] ), .B1(
        n3014), .C0(\yCoor[4][4] ), .C1(n3196), .Y(n3144) );
  AOI222XL U3798 ( .A0(\yCoor[2][4] ), .A1(n3204), .B0(\yCoor[0][4] ), .B1(
        n3202), .C0(\yCoor[1][4] ), .C1(n3199), .Y(n3143) );
  AOI222XL U3800 ( .A0(\yCoor[5][5] ), .A1(n2985), .B0(\yCoor[3][5] ), .B1(
        n3014), .C0(\yCoor[4][5] ), .C1(n3196), .Y(n3146) );
  AOI222XL U3801 ( .A0(\yCoor[2][5] ), .A1(n3204), .B0(\yCoor[0][5] ), .B1(
        n3202), .C0(\yCoor[1][5] ), .C1(n3199), .Y(n3145) );
  AOI222XL U3803 ( .A0(\yCoor[5][6] ), .A1(n2985), .B0(\yCoor[3][6] ), .B1(
        n3197), .C0(\yCoor[4][6] ), .C1(n3196), .Y(n3148) );
  AOI222XL U3804 ( .A0(\yCoor[2][6] ), .A1(n3204), .B0(\yCoor[0][6] ), .B1(
        n3015), .C0(\yCoor[1][6] ), .C1(n3199), .Y(n3147) );
  AOI222XL U3806 ( .A0(\yCoor[5][7] ), .A1(n2985), .B0(\yCoor[3][7] ), .B1(
        n3197), .C0(\yCoor[4][7] ), .C1(n3196), .Y(n3150) );
  AOI222XL U3807 ( .A0(\yCoor[2][7] ), .A1(n3204), .B0(\yCoor[0][7] ), .B1(
        n3202), .C0(\yCoor[1][7] ), .C1(n3199), .Y(n3149) );
  AOI222XL U3809 ( .A0(\yCoor[5][8] ), .A1(n2985), .B0(\yCoor[3][8] ), .B1(
        n3197), .C0(\yCoor[4][8] ), .C1(n3196), .Y(n3152) );
  AOI222XL U3810 ( .A0(\yCoor[2][8] ), .A1(n3204), .B0(\yCoor[0][8] ), .B1(
        n3015), .C0(\yCoor[1][8] ), .C1(n3199), .Y(n3151) );
  AOI222XL U3812 ( .A0(\yCoor[5][9] ), .A1(n2985), .B0(\yCoor[3][9] ), .B1(
        n3197), .C0(\yCoor[4][9] ), .C1(n3196), .Y(n3154) );
  AOI222XL U3813 ( .A0(\yCoor[2][9] ), .A1(n3204), .B0(\yCoor[0][9] ), .B1(
        n3202), .C0(\yCoor[1][9] ), .C1(n3199), .Y(n3153) );
  NAND2X1 U3814 ( .A(n3154), .B(n3153), .Y(N1799) );
  AOI222XL U3815 ( .A0(\xCoor[2][2] ), .A1(n3204), .B0(\xCoor[0][2] ), .B1(
        n3015), .C0(\xCoor[1][2] ), .C1(n3199), .Y(n3159) );
  AOI222XL U3816 ( .A0(\xCoor[2][3] ), .A1(n3203), .B0(\xCoor[0][3] ), .B1(
        n3202), .C0(\xCoor[1][3] ), .C1(n3199), .Y(n3161) );
  AOI222XL U3817 ( .A0(\xCoor[5][4] ), .A1(n2985), .B0(\xCoor[3][4] ), .B1(
        n3197), .C0(\xCoor[4][4] ), .C1(n3196), .Y(n3164) );
  AOI222XL U3818 ( .A0(\xCoor[2][4] ), .A1(n3204), .B0(\xCoor[0][4] ), .B1(
        n3202), .C0(\xCoor[1][4] ), .C1(n3199), .Y(n3163) );
  NAND2X1 U3819 ( .A(n3164), .B(n3163), .Y(N1601) );
  AOI222XL U3820 ( .A0(\xCoor[5][5] ), .A1(n2985), .B0(\xCoor[3][5] ), .B1(
        n3197), .C0(\xCoor[4][5] ), .C1(n3196), .Y(n3166) );
  AOI222XL U3821 ( .A0(\xCoor[2][5] ), .A1(n3204), .B0(\xCoor[0][5] ), .B1(
        n3202), .C0(\xCoor[1][5] ), .C1(n3199), .Y(n3165) );
  NAND2X1 U3822 ( .A(n3166), .B(n3165), .Y(N1600) );
  AOI222XL U3823 ( .A0(\xCoor[5][6] ), .A1(n2985), .B0(\xCoor[3][6] ), .B1(
        n3197), .C0(\xCoor[4][6] ), .C1(n3196), .Y(n3168) );
  AOI222XL U3824 ( .A0(\xCoor[2][6] ), .A1(n3204), .B0(\xCoor[0][6] ), .B1(
        n3202), .C0(\xCoor[1][6] ), .C1(n3013), .Y(n3167) );
  AOI222XL U3826 ( .A0(\xCoor[5][7] ), .A1(n2985), .B0(\xCoor[3][7] ), .B1(
        n3197), .C0(\xCoor[4][7] ), .C1(n3196), .Y(n3170) );
  AOI222XL U3827 ( .A0(\xCoor[2][7] ), .A1(n3204), .B0(\xCoor[0][7] ), .B1(
        n3202), .C0(\xCoor[1][7] ), .C1(n3013), .Y(n3169) );
  AOI222XL U3829 ( .A0(\xCoor[5][8] ), .A1(n2985), .B0(\xCoor[3][8] ), .B1(
        n3197), .C0(\xCoor[4][8] ), .C1(n3196), .Y(n3172) );
  AOI222XL U3830 ( .A0(\xCoor[2][8] ), .A1(n3204), .B0(\xCoor[0][8] ), .B1(
        n3202), .C0(\xCoor[1][8] ), .C1(n3013), .Y(n3171) );
  AOI222XL U3832 ( .A0(\xCoor[5][9] ), .A1(n2985), .B0(\xCoor[3][9] ), .B1(
        n3197), .C0(\xCoor[4][9] ), .C1(n3196), .Y(n3174) );
  AOI222XL U3833 ( .A0(\xCoor[2][9] ), .A1(n3204), .B0(\xCoor[0][9] ), .B1(
        n3202), .C0(\xCoor[1][9] ), .C1(n3013), .Y(n3173) );
  NAND2X1 U3834 ( .A(n3174), .B(n3173), .Y(N1596) );
  AOI222XL U3835 ( .A0(\R_len[5][2] ), .A1(n2985), .B0(\R_len[3][2] ), .B1(
        n3197), .C0(\R_len[4][2] ), .C1(n3196), .Y(n3180) );
  NAND2X1 U3836 ( .A(n3180), .B(n3179), .Y(N1400) );
  AOI222XL U3837 ( .A0(\R_len[5][3] ), .A1(n2985), .B0(\R_len[3][3] ), .B1(
        n3197), .C0(\R_len[4][3] ), .C1(n3196), .Y(n3182) );
  NAND2X1 U3838 ( .A(n3182), .B(n3181), .Y(N1399) );
  AOI222XL U3839 ( .A0(\R_len[5][4] ), .A1(n2985), .B0(\R_len[3][4] ), .B1(
        n3197), .C0(\R_len[4][4] ), .C1(n3196), .Y(n3184) );
  AOI222XL U3840 ( .A0(\R_len[2][4] ), .A1(n3204), .B0(\R_len[0][4] ), .B1(
        n3202), .C0(\R_len[1][4] ), .C1(n3013), .Y(n3183) );
  NAND2X1 U3841 ( .A(n3184), .B(n3183), .Y(N1398) );
  AOI222XL U3842 ( .A0(\R_len[5][5] ), .A1(n2985), .B0(\R_len[3][5] ), .B1(
        n3197), .C0(\R_len[4][5] ), .C1(n3196), .Y(n3186) );
  AOI222XL U3843 ( .A0(\R_len[2][5] ), .A1(n3204), .B0(\R_len[0][5] ), .B1(
        n3202), .C0(\R_len[1][5] ), .C1(n3013), .Y(n3185) );
  NAND2X1 U3844 ( .A(n3186), .B(n3185), .Y(N1397) );
  AOI222XL U3845 ( .A0(\R_len[5][6] ), .A1(n2985), .B0(\R_len[3][6] ), .B1(
        n3197), .C0(\R_len[4][6] ), .C1(n3196), .Y(n3188) );
  AOI222XL U3846 ( .A0(\R_len[2][6] ), .A1(n3203), .B0(\R_len[0][6] ), .B1(
        n3202), .C0(\R_len[1][6] ), .C1(n3013), .Y(n3187) );
  NAND2X1 U3847 ( .A(n3188), .B(n3187), .Y(N1396) );
  AOI222XL U3848 ( .A0(\R_len[5][7] ), .A1(n2985), .B0(\R_len[3][7] ), .B1(
        n3197), .C0(\R_len[4][7] ), .C1(n3196), .Y(n3190) );
  AOI222XL U3849 ( .A0(\R_len[2][7] ), .A1(n3203), .B0(\R_len[0][7] ), .B1(
        n3202), .C0(\R_len[1][7] ), .C1(n3013), .Y(n3189) );
  NAND2X1 U3850 ( .A(n3190), .B(n3189), .Y(N1395) );
  AOI222XL U3851 ( .A0(\R_len[5][8] ), .A1(n2985), .B0(\R_len[3][8] ), .B1(
        n3197), .C0(\R_len[4][8] ), .C1(n3196), .Y(n3192) );
  AOI222XL U3852 ( .A0(\R_len[2][8] ), .A1(n3203), .B0(\R_len[0][8] ), .B1(
        n3202), .C0(\R_len[1][8] ), .C1(n3013), .Y(n3191) );
  NAND2X1 U3853 ( .A(n3192), .B(n3191), .Y(N1394) );
  AOI222XL U3854 ( .A0(\R_len[5][9] ), .A1(n2985), .B0(\R_len[3][9] ), .B1(
        n3197), .C0(\R_len[4][9] ), .C1(n3196), .Y(n3195) );
  AOI222XL U3855 ( .A0(\R_len[2][9] ), .A1(n3203), .B0(\R_len[0][9] ), .B1(
        n3202), .C0(\R_len[1][9] ), .C1(n3013), .Y(n3194) );
  NAND2X1 U3856 ( .A(n3195), .B(n3194), .Y(N1393) );
  NOR4XL U3857 ( .A(acc[12]), .B(acc[11]), .C(acc[10]), .D(acc[0]), .Y(n3284)
         );
  NOR4XL U3858 ( .A(acc[1]), .B(acc[15]), .C(acc[14]), .D(acc[13]), .Y(n3283)
         );
  NOR4XL U3859 ( .A(acc[5]), .B(acc[4]), .C(acc[3]), .D(acc[2]), .Y(n3282) );
  NOR4XL U3860 ( .A(acc[9]), .B(acc[8]), .C(acc[7]), .D(acc[6]), .Y(n3281) );
  AND4X1 U3861 ( .A(n3284), .B(n3283), .C(n3282), .D(n3281), .Y(n3287) );
  NOR4XL U3862 ( .A(n3285), .B(acc[18]), .C(acc[16]), .D(acc[17]), .Y(n3286)
         );
  geofence_DW01_inc_0 add_90 ( .A(rootOut[10:0]), .SUM({rootOutRound, 
        SYNOPSYS_UNCONNECTED__0}) );
  geofence_DW_sqrt_0 SQRT ( .a({outterProduct[20:0], 1'b0, 1'b0}), .root({
        SYNOPSYS_UNCONNECTED__1, rootOut[10:0]}) );
  geofence_DW01_sub_2 sub_77 ( .A({mulResult1[21], mulResult1[21:16], n2969, 
        n2959, mulResult1[13], n2966, mulResult1[11:5], n2994, mulResult1[3:1], 
        n2996}), .B({mulResult2[21], mulResult2[21:6], n2962, mulResult2[4:0]}), .CI(1'b0), .DIFF({N628, N627, N626, N625, N624, N623, N622, N621, N620, N619, 
        N618, N617, N616, N615, N614, N613, N612, N611, N610, N609, N608, N607, 
        N606}) );
  geofence_DW01_add_0 add_77 ( .A({mulResult1[21], mulResult1[21:16], n2969, 
        n2959, mulResult1[13], n2966, mulResult1[11:5], n2994, mulResult1[3:1], 
        n2996}), .B({mulResult2[21], mulResult2[21:6], n2962, mulResult2[4:0]}), .CI(1'b0), .SUM({N605, N604, N603, N602, N601, N600, N599, N598, N597, N596, 
        N595, N594, N593, N592, N591, N590, N589, N588, N587, N586, N585, N584, 
        N583}) );
  geofence_DW01_sub_5 sub_130 ( .A({1'b0, N1821, N1822, N1823, n3434, n3437, 
        n3445, N1827, n3406, N1829, N1830}), .B({1'b0, N1799, N1800, n3394, 
        n3427, n3386, n3402, N1805, N1806, N1807, N1808}), .CI(1'b0), .DIFF({
        N1088, N1087, N1086, N1085, N1084, N1083, N1082, N1081, N1080, N1079, 
        N1078}) );
  geofence_DW01_sub_8 sub_117 ( .A({S[10:8], n3404, S[6:5], n3392, S[3:0]}), 
        .B({1'b0, rootOutRound_reg}), .CI(1'b0), .DIFF({N942, N941, N940, N939, 
        N938, N937, N936, N935, N934, N933, N932}) );
  geofence_DW01_add_1 add_0_root_add_0_root_add_158_S2_2 ( .A({1'b0, n3373, 
        n3372, n3371, n3370, n3369, n3368, n3367, n3366, n3365, n3364, n3363}), 
        .B({1'b0, 1'b0, n2997, rootOutRound[8:0]}), .CI(1'b0), .SUM({N1290, 
        N1289, N1288, N1287, N1286, N1285, N1284, N1283, N1282, N1281, N1280, 
        SYNOPSYS_UNCONNECTED__2}) );
  geofence_DW_mult_tc_0 mult_76 ( .a(mul_srcA2), .b({mul_srcB2[10], n3002, 
        n3000, mul_srcB2[7:0]}), .product(mulResult2) );
  geofence_DW_mult_tc_1 mult_75 ( .a(mul_srcA1), .b(mul_srcB1), .product(
        mulResult1) );
  geofence_DW01_add_6 add_1_root_add_0_root_add_158_S2_2 ( .A({1'b0, 1'b0, 
        N1393, N1394, N1395, N1396, N1397, N1398, N1399, N1400, N1401, N1402}), 
        .B({1'b0, 1'b0, N1415, N1416, N1417, N1418, n2979, n2958, N1421, N1422, 
        n2993, N1424}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__3, n3373, n3372, 
        n3371, n3370, n3369, n3368, n3367, n3366, n3365, n3364, n3363}) );
  geofence_DW01_sub_15 sub_100 ( .A({1'b0, n3469, n3454, n3466, N898, n3456, 
        n3463, n3460, n3451, N903, N904}), .B({1'b0, N1009, N1010, N1011, 
        N1012, N1013, N1014, N1015, N1016, N1017, N1018}), .CI(1'b0), .DIFF({
        N707, N706, N705, N704, N703, N702, N701, N700, N699, N698, N697}) );
  geofence_DW01_sub_17 sub_102 ( .A({1'b0, n3471, N896, n3467, N898, n3458, 
        n3464, N901, N902, N903, N904}), .B({1'b0, n3414, n3391, N1598, n3397, 
        n3422, n3412, N1602, N1603, N1604, N1605}), .CI(1'b0), .DIFF({N766, 
        N765, N764, N763, N762, N761, N760, N759, N758, N757, N756}) );
  geofence_DW01_sub_19 sub_104 ( .A({S[10:6], n3388, S[4], n3383, S[2:0]}), 
        .B({1'b0, N1415, N1416, N1417, N1418, n2980, n2958, N1421, N1422, 
        N1423, N1424}), .CI(1'b0), .DIFF({N793, N792, N791, N790, N789, N788, 
        N787, N786, N785, N784, N783}) );
  geofence_DW01_sub_21 sub_114 ( .A({1'b0, N1799, n3425, n3395, n3428, n3387, 
        n3403, N1805, N1806, N1807, N1808}), .B({1'b0, N1139, N1140, N1141, 
        N1142, N1143, N1144, N1145, N1146, N1147, N1148}), .CI(1'b0), .DIFF({
        N872, N871, N870, N869, N868, N867, N866, N865, N864, N863, N862}) );
  geofence_DW01_sub_23 sub_116 ( .A({1'b0, n3470, n3455, n3467, n3449, n3457, 
        n3462, n3461, n3452, N903, N904}), .B({1'b0, n3415, N1597, n3421, 
        N1599, n3422, n3412, n3417, n3410, N1604, N1605}), .CI(1'b0), .DIFF({
        N931, N930, N929, N928, N927, N926, N925, N924, N923, N922, N921}) );
  geofence_DW01_sub_25 sub_118 ( .A({S[10:8], n3404, S[6:4], n3383, n3384, 
        S[1:0]}), .B({1'b0, N1393, N1394, N1395, N1396, N1397, N1398, N1399, 
        N1400, N1401, N1402}), .CI(1'b0), .DIFF({N969, N968, N967, N966, N965, 
        N964, N963, N962, N961, N960, N959}) );
  geofence_DW01_sub_27 sub_128 ( .A({1'b0, N1596, n3390, n3420, n3398, N1600, 
        N1601, n3418, n3409, N1604, N1605}), .B({1'b0, N1009, N1010, N1011, 
        N1012, N1013, N1014, N1015, N1016, N1017, N1018}), .CI(1'b0), .DIFF({
        N1029, N1028, N1027, N1026, N1025, N1024, N1023, N1022, N1021, N1020, 
        N1019}) );
  geofence_DW01_sub_29 sub_139 ( .A({1'b0, n3430, n3441, N1823, n3435, N1825, 
        n3446, N1827, n3407, N1829, n3004}), .B({1'b0, N1139, N1140, N1141, 
        N1142, N1143, N1144, N1145, N1146, N1147, N1148}), .CI(1'b0), .DIFF({
        N1159, N1158, N1157, N1156, N1155, N1154, N1153, N1152, N1151, N1150, 
        N1149}) );
  geofence_DW01_sub_31 sub_141 ( .A({1'b0, n3430, n3440, n3432, N1824, n3438, 
        n3447, n3444, n3405, N1829, n3004}), .B({1'b0, n3400, n3424, N1801, 
        N1802, N1803, N1804, N1805, N1806, N1807, N1808}), .CI(1'b0), .DIFF({
        N1218, N1217, N1216, N1215, N1214, N1213, N1212, N1211, N1210, N1209, 
        N1208}) );
  geofence_DW01_sub_33 sub_185 ( .A(acc), .B(outterProduct), .CI(1'b0), .DIFF(
        {N1325, N1324, N1323, N1322, N1321, N1320, N1319, N1318, N1317, N1316, 
        N1315, N1314, N1313, N1312, N1311, N1310, N1309, N1308, N1307, N1306, 
        N1305, N1304, N1303}) );
  geofence_DW01_sub_35 sub_187 ( .A(acc), .B({mulResult1[21], 
        mulResult1[21:16], n2969, n2959, mulResult1[13], n2966, 
        mulResult1[11:5], n2994, mulResult1[3:1], n2996}), .CI(1'b0), .DIFF({
        N1348, N1347, N1346, N1345, N1344, N1343, N1342, N1341, N1340, N1339, 
        N1338, N1337, N1336, N1335, N1334, N1333, N1332, N1331, N1330, N1329, 
        N1328, N1327, N1326}) );
  DFFRX2 \S_reg[10]  ( .D(n761), .CK(clk), .RN(n3288), .Q(S[10]), .QN(n710) );
  DFFSRX2 \idx1_reg[0]  ( .D(n1018), .CK(clk), .SN(1'b1), .RN(n3288), .Q(
        idx1[0]), .QN(n799) );
  DFFRX2 \idx1_reg[2]  ( .D(n1017), .CK(clk), .RN(n3288), .Q(idx1[2]), .QN(
        n797) );
  DFFRX1 \idx0_reg[0]  ( .D(n1012), .CK(clk), .RN(n3221), .Q(idx0[0]), .QN(
        n796) );
  DFFRX1 \xCoor_reg[4][4]  ( .D(n881), .CK(clk), .RN(n3288), .Q(\xCoor[4][4] ), 
        .QN(n634) );
  DFFRX1 \yCoor_reg[4][5]  ( .D(n822), .CK(clk), .RN(n3288), .Q(\yCoor[4][5] ), 
        .QN(n693) );
  DFFRX1 \R_len_reg[0][0]  ( .D(n987), .CK(clk), .RN(n3288), .Q(\R_len[0][0] ), 
        .QN(n528) );
  DFFRX1 \R_len_reg[2][1]  ( .D(n958), .CK(clk), .RN(n3288), .Q(\R_len[2][1] ), 
        .QN(n557) );
  DFFRX1 \idx0_reg[2]  ( .D(n1011), .CK(clk), .RN(n3221), .Q(idx0[2]), .QN(
        n794) );
  DFFSRX1 \yCoor_reg[4][4]  ( .D(n821), .CK(clk), .SN(1'b1), .RN(n3288), .Q(
        \yCoor[4][4] ), .QN(n694) );
  DFFRX2 \idx2_reg[1]  ( .D(n1015), .CK(clk), .RN(n3221), .Q(idx2[1]), .QN(
        n801) );
  DFFRX2 \idx1_reg[1]  ( .D(n1019), .CK(clk), .RN(n3217), .Q(n2978), .QN(n798)
         );
  DFFRX1 \idx0_reg[1]  ( .D(n1013), .CK(clk), .RN(n3221), .Q(idx0[1]), .QN(
        n795) );
  AND2X4 U2739 ( .A(n3019), .B(n795), .Y(n3065) );
  AND2X4 U2725 ( .A(n3019), .B(idx0[1]), .Y(n2970) );
  AND2X4 U2727 ( .A(n3020), .B(idx0[1]), .Y(n3060) );
  AND2X2 U2716 ( .A(n797), .B(n799), .Y(n3068) );
  AOI222X1 U2858 ( .A0(\xCoor[2][1] ), .A1(n2970), .B0(\xCoor[0][1] ), .B1(
        n3065), .C0(\xCoor[1][1] ), .C1(n3061), .Y(n3043) );
  BUFX16 U2818 ( .A(n3015), .Y(n3202) );
  CLKBUFX6 U2752 ( .A(n3193), .Y(n3196) );
  BUFX16 U2935 ( .A(n3013), .Y(n3199) );
  AND2X2 U2712 ( .A(n3068), .B(n798), .Y(n3011) );
  AOI222XL U2956 ( .A0(\xCoor[2][0] ), .A1(n2970), .B0(\xCoor[0][0] ), .B1(
        n3065), .C0(\xCoor[1][0] ), .C1(n3061), .Y(n3041) );
  NAND2X2 U2857 ( .A(n3044), .B(n3043), .Y(N1017) );
  AND2X6 U2715 ( .A(n3068), .B(n2978), .Y(n2995) );
  BUFX16 U2711 ( .A(n3011), .Y(n2940) );
  NAND2X1 U2993 ( .A(n3042), .B(n3041), .Y(N1018) );
  BUFX16 U2745 ( .A(n3014), .Y(n3197) );
  AOI222XL U2828 ( .A0(\xCoor[5][1] ), .A1(n2985), .B0(\xCoor[3][1] ), .B1(
        n3014), .C0(\xCoor[4][1] ), .C1(n3196), .Y(n3158) );
  AOI222XL U2957 ( .A0(\xCoor[2][1] ), .A1(n3204), .B0(\xCoor[0][1] ), .B1(
        n3202), .C0(\xCoor[1][1] ), .C1(n3199), .Y(n3157) );
  AOI222XL U2934 ( .A0(\xCoor[5][0] ), .A1(n2992), .B0(\xCoor[3][0] ), .B1(
        n3012), .C0(\xCoor[4][0] ), .C1(n3378), .Y(n3091) );
  AOI222XL U2929 ( .A0(\R_len[5][1] ), .A1(n2992), .B0(\R_len[3][1] ), .B1(
        n3130), .C0(\R_len[4][1] ), .C1(n3378), .Y(n3113) );
  AOI222X1 U2865 ( .A0(\yCoor[5][0] ), .A1(n2992), .B0(\yCoor[3][0] ), .B1(
        n3012), .C0(\yCoor[4][0] ), .C1(n3378), .Y(n3071) );
  AOI222XL U2797 ( .A0(\xCoor[2][2] ), .A1(n2970), .B0(\xCoor[0][2] ), .B1(
        n3065), .C0(\xCoor[1][2] ), .C1(n3061), .Y(n3045) );
  AOI222X1 U2724 ( .A0(\xCoor[5][1] ), .A1(n2992), .B0(\xCoor[3][1] ), .B1(
        n3012), .C0(\xCoor[4][1] ), .C1(n3378), .Y(n3093) );
  AOI222X1 U2951 ( .A0(\R_len[5][0] ), .A1(n2992), .B0(\R_len[3][0] ), .B1(
        n3130), .C0(\R_len[4][0] ), .C1(n3378), .Y(n3111) );
  AOI222X1 U2950 ( .A0(\R_len[2][0] ), .A1(n2995), .B0(\R_len[0][0] ), .B1(
        n2940), .C0(\R_len[1][0] ), .C1(n2943), .Y(n3110) );
  AOI222XL U2757 ( .A0(\yCoor[2][0] ), .A1(n2970), .B0(\yCoor[0][0] ), .B1(
        n3065), .C0(\yCoor[1][0] ), .C1(n3061), .Y(n3021) );
  AOI222XL U2802 ( .A0(\R_len[2][1] ), .A1(n2995), .B0(\R_len[0][1] ), .B1(
        n2940), .C0(\R_len[1][1] ), .C1(n2943), .Y(n3112) );
  NAND2X1 U2810 ( .A(n3071), .B(n3070), .Y(N1830) );
  NAND2X4 U2723 ( .A(n3093), .B(n3092), .Y(N903) );
  AOI222XL U2848 ( .A0(\yCoor[2][0] ), .A1(n3204), .B0(\yCoor[0][0] ), .B1(
        n3202), .C0(\yCoor[1][0] ), .C1(n3199), .Y(n3135) );
  DFFSRX1 \yCoor_reg[1][4]  ( .D(n851), .CK(clk), .SN(1'b1), .RN(n3288), .Q(
        \yCoor[1][4] ), .QN(n664) );
  AOI222X1 U2926 ( .A0(\yCoor[2][1] ), .A1(n2995), .B0(\yCoor[0][1] ), .B1(
        n2940), .C0(\yCoor[1][1] ), .C1(n2943), .Y(n3072) );
  AOI222XL U2813 ( .A0(\yCoor[5][2] ), .A1(n2985), .B0(\yCoor[3][2] ), .B1(
        n3014), .C0(\yCoor[4][2] ), .C1(n3196), .Y(n3140) );
  AOI222XL U2847 ( .A0(\yCoor[5][0] ), .A1(n2985), .B0(\yCoor[3][0] ), .B1(
        n3014), .C0(\yCoor[4][0] ), .C1(n3196), .Y(n3136) );
  NAND2X1 U2853 ( .A(n3024), .B(n3023), .Y(N1147) );
  AOI222X1 U2953 ( .A0(\yCoor[5][1] ), .A1(n2985), .B0(\yCoor[3][1] ), .B1(
        n3014), .C0(\yCoor[4][1] ), .C1(n3196), .Y(n3138) );
  AOI222XL U2803 ( .A0(\yCoor[2][2] ), .A1(n2995), .B0(\yCoor[0][2] ), .B1(
        n2940), .C0(\yCoor[1][2] ), .C1(n2943), .Y(n3074) );
  AOI222XL U2731 ( .A0(\R_len[2][1] ), .A1(n3204), .B0(\R_len[0][1] ), .B1(
        n3202), .C0(\R_len[1][1] ), .C1(n3199), .Y(n3177) );
  NAND2X2 U2936 ( .A(n3138), .B(n3137), .Y(N1807) );
  CLKBUFX3 U2770 ( .A(N1830), .Y(n3004) );
  NAND2X2 U2846 ( .A(n3136), .B(n3135), .Y(N1808) );
  NAND2X1 U2863 ( .A(n3140), .B(n3139), .Y(N1806) );
  AOI222XL U2734 ( .A0(\R_len[2][3] ), .A1(n3204), .B0(\R_len[0][3] ), .B1(
        n3202), .C0(\R_len[1][3] ), .C1(n3013), .Y(n3181) );
  AOI222XL U2732 ( .A0(\R_len[2][2] ), .A1(n3204), .B0(\R_len[0][2] ), .B1(
        n3202), .C0(\R_len[1][2] ), .C1(n3013), .Y(n3179) );
  INVX3 U2844 ( .A(n2974), .Y(n3205) );
  BUFX4 U2705 ( .A(n421), .Y(n3208) );
  AOI222XL U2849 ( .A0(N784), .A1(n3319), .B0(N698), .B1(n2951), .C0(N757), 
        .C1(n3228), .Y(n515) );
  NAND2XL U2836 ( .A(n3109), .B(n3108), .Y(N895) );
  OAI211X1 U2943 ( .A0(n709), .A1(n3277), .B0(n518), .C0(n519), .Y(
        mul_srcA1[0]) );
  OAI21X2 U2860 ( .A0(n3340), .A1(n3208), .B0(n494), .Y(mul_srcA2[3]) );
  AOI222XL U2718 ( .A0(N789), .A1(n3319), .B0(N703), .B1(n2951), .C0(N762), 
        .C1(n3229), .Y(n505) );
  OAI211X1 U2717 ( .A0(n714), .A1(n3277), .B0(n504), .C0(n505), .Y(
        mul_srcA1[6]) );
  AOI222XL U2954 ( .A0(N964), .A1(n3319), .B0(N867), .B1(n2951), .C0(N926), 
        .C1(n3229), .Y(n475) );
  CLKINVX1 U2920 ( .A(n3397), .Y(n3343) );
  AOI222X1 U2960 ( .A0(N965), .A1(n3319), .B0(N868), .B1(n2951), .C0(N927), 
        .C1(n3229), .Y(n473) );
  OAI211X1 U2938 ( .A0(n712), .A1(n3277), .B0(n500), .C0(n501), .Y(
        mul_srcA1[8]) );
  AOI222XL U2866 ( .A0(N966), .A1(n3319), .B0(N869), .B1(n2951), .C0(N928), 
        .C1(n3228), .Y(n471) );
  NAND2X1 U2868 ( .A(n3001), .B(n489), .Y(mul_srcA2[8]) );
  NAND2XL U2737 ( .A(N793), .B(n3319), .Y(n516) );
  AOI222X1 U2713 ( .A0(N968), .A1(n3319), .B0(N871), .B1(n2951), .C0(N930), 
        .C1(n3229), .Y(n467) );
  NAND2X2 U2703 ( .A(n466), .B(n467), .Y(mul_srcB1[9]) );
  AO22X1 U2736 ( .A0(N1218), .A1(n3228), .B0(N1159), .B1(n2951), .Y(
        mul_srcB2[10]) );
  BUFX12 U2930 ( .A(n3012), .Y(n3130) );
  AOI222XL U2733 ( .A0(\xCoor[2][0] ), .A1(n3204), .B0(\xCoor[0][0] ), .B1(
        n3202), .C0(\xCoor[1][0] ), .C1(n3199), .Y(n3155) );
  BUFX6 U2948 ( .A(n3007), .Y(n2992) );
  AOI222XL U2854 ( .A0(\xCoor[5][0] ), .A1(n2985), .B0(\xCoor[3][0] ), .B1(
        n3014), .C0(\xCoor[4][0] ), .C1(n3196), .Y(n3156) );
  AOI222X1 U2864 ( .A0(\yCoor[2][0] ), .A1(n2995), .B0(\yCoor[0][0] ), .B1(
        n2940), .C0(\yCoor[1][0] ), .C1(n2943), .Y(n3070) );
  NAND2X1 U2761 ( .A(n3156), .B(n3155), .Y(N1605) );
  AOI222XL U2925 ( .A0(\xCoor[2][1] ), .A1(n2995), .B0(\xCoor[0][1] ), .B1(
        n2940), .C0(\xCoor[1][1] ), .C1(n2943), .Y(n3092) );
  NAND2X2 U2949 ( .A(n3111), .B(n3110), .Y(N1424) );
  NAND2X2 U2706 ( .A(n3091), .B(n3090), .Y(N904) );
  DFFRX1 \S_reg[8]  ( .D(n763), .CK(clk), .RN(n3219), .Q(S[8]), .QN(n712) );
  AOI222XL U2992 ( .A0(N967), .A1(n3319), .B0(N870), .B1(n2951), .C0(N929), 
        .C1(n3229), .Y(n469) );
  AOI222XL U2704 ( .A0(N941), .A1(n3278), .B0(n3320), .B1(tempOfRoot2[9]), 
        .C0(n3225), .C1(N1799), .Y(n466) );
  OR2X1 U2714 ( .A(n3345), .B(n3208), .Y(n3001) );
  CLKINVX1 U2719 ( .A(n3468), .Y(n3470) );
  CLKINVX1 U2720 ( .A(n3468), .Y(n3471) );
  CLKINVX1 U2721 ( .A(n3448), .Y(n3449) );
  CLKINVX1 U2722 ( .A(n3453), .Y(n3454) );
  CLKINVX1 U2729 ( .A(n3433), .Y(n3435) );
  CLKINVX1 U2730 ( .A(n3381), .Y(n3457) );
  CLKINVX1 U2738 ( .A(n3381), .Y(n3458) );
  NOR2BX4 U2743 ( .AN(n3069), .B(n798), .Y(n3012) );
  CLKINVX1 U2751 ( .A(n3431), .Y(n3432) );
  CLKINVX1 U2753 ( .A(n3380), .Y(n3463) );
  AND2X2 U2756 ( .A(n3133), .B(n801), .Y(n3015) );
  AOI222XL U2758 ( .A0(\yCoor[2][1] ), .A1(n2970), .B0(\yCoor[0][1] ), .B1(
        n3065), .C0(\yCoor[1][1] ), .C1(n3061), .Y(n3023) );
  AOI222XL U2759 ( .A0(\yCoor[2][2] ), .A1(n2970), .B0(\yCoor[0][2] ), .B1(
        n3065), .C0(\yCoor[1][2] ), .C1(n3061), .Y(n3025) );
  NAND2XL U2763 ( .A(n3050), .B(n3049), .Y(N1014) );
  AOI222XL U2765 ( .A0(\xCoor[5][0] ), .A1(n2956), .B0(\xCoor[3][0] ), .B1(
        n3060), .C0(\xCoor[4][0] ), .C1(n3059), .Y(n3042) );
  NAND2XL U2780 ( .A(n3034), .B(n3033), .Y(N1142) );
  AOI22XL U2781 ( .A0(N1022), .A1(n2951), .B0(N1081), .B1(n3229), .Y(n494) );
  AOI22XL U2782 ( .A0(N1021), .A1(n2951), .B0(N1080), .B1(n3229), .Y(n495) );
  NAND2XL U2784 ( .A(n3036), .B(n3035), .Y(N1141) );
  AOI22XL U2788 ( .A0(N1019), .A1(n2951), .B0(N1078), .B1(n3229), .Y(n497) );
  NAND2XL U2792 ( .A(n3038), .B(n3037), .Y(N1140) );
  NAND2X4 U2793 ( .A(n3003), .B(n488), .Y(mul_srcA2[9]) );
  AOI222XL U2794 ( .A0(N783), .A1(n3319), .B0(N697), .B1(n2951), .C0(N756), 
        .C1(n3228), .Y(n519) );
  NAND2X1 U2795 ( .A(n468), .B(n469), .Y(mul_srcB1[8]) );
  NAND2XL U2798 ( .A(n486), .B(n487), .Y(mul_srcB1[0]) );
  NOR2XL U2799 ( .A(idx2[2]), .B(idx2[0]), .Y(n3133) );
  AND2X1 U2800 ( .A(idx2[0]), .B(n800), .Y(n3134) );
  BUFX2 U2804 ( .A(n3204), .Y(n3203) );
  XOR2X1 U2805 ( .A(n2976), .B(n3205), .Y(n3018) );
  NAND2XL U2806 ( .A(n3113), .B(n3112), .Y(N1423) );
  AOI222XL U2807 ( .A0(\xCoor[2][0] ), .A1(n2995), .B0(\xCoor[0][0] ), .B1(
        n2940), .C0(\xCoor[1][0] ), .C1(n2943), .Y(n3090) );
  AOI222XL U2808 ( .A0(\yCoor[2][2] ), .A1(n3204), .B0(\yCoor[0][2] ), .B1(
        n3202), .C0(\yCoor[1][2] ), .C1(n3199), .Y(n3139) );
  AOI222XL U2814 ( .A0(\xCoor[2][2] ), .A1(n2995), .B0(\xCoor[0][2] ), .B1(
        n2940), .C0(\xCoor[1][2] ), .C1(n2943), .Y(n3094) );
  INVX1 U2815 ( .A(n3459), .Y(n3460) );
  NAND2X1 U2824 ( .A(n3176), .B(n3175), .Y(N1402) );
  AOI2BB2X1 U2825 ( .B0(N897), .B1(n3236), .A0N(n3234), .A1N(n3291), .Y(n287)
         );
  AOI2BB2X1 U2826 ( .B0(n3471), .B1(n3236), .A0N(n3234), .A1N(n3289), .Y(n289)
         );
  INVX2 U2833 ( .A(N1604), .Y(n3338) );
  INVX1 U2834 ( .A(N1601), .Y(n3341) );
  NAND4XL U2838 ( .A(n3017), .B(n2999), .C(n805), .D(n804), .Y(n2946) );
  OAI2BB2XL U2839 ( .B0(n710), .B1(n3226), .A0N(N1290), .A1N(n3325), .Y(n761)
         );
  AO22XL U2850 ( .A0(n3319), .A1(n2997), .B0(n98), .B1(tempOfRoot2[9]), .Y(
        n730) );
  AO22XL U2852 ( .A0(n3319), .A1(rootOutRound[2]), .B0(n98), .B1(
        tempOfRoot2[2]), .Y(n751) );
  NOR2X6 U2856 ( .A(n797), .B(idx1[0]), .Y(n3378) );
  INVX1 U2870 ( .A(n806), .Y(n3206) );
  NAND2XL U2873 ( .A(n3162), .B(n3161), .Y(N1602) );
  NAND2XL U2874 ( .A(n3172), .B(n3171), .Y(N1597) );
  NAND2XL U2875 ( .A(n3168), .B(n3167), .Y(N1599) );
  NAND2XL U2876 ( .A(n3170), .B(n3169), .Y(N1598) );
  NAND2XL U2877 ( .A(n3150), .B(n3149), .Y(N1801) );
  INVXL U2878 ( .A(N1601), .Y(n3411) );
  INVXL U2887 ( .A(N1596), .Y(n3413) );
  NAND2XL U2896 ( .A(n3144), .B(n3143), .Y(N1804) );
  NAND2XL U2897 ( .A(n3146), .B(n3145), .Y(N1803) );
  NAND2XL U2898 ( .A(n3152), .B(n3151), .Y(N1800) );
  INVXL U2900 ( .A(N1800), .Y(n3423) );
  NAND2XL U2901 ( .A(n3160), .B(n3159), .Y(N1603) );
  NAND2XL U2905 ( .A(n3148), .B(n3147), .Y(N1802) );
  INVX6 U2910 ( .A(n3475), .Y(n2943) );
  AND2X1 U2912 ( .A(n3079), .B(n3078), .Y(n3379) );
  AND2X1 U2913 ( .A(n3099), .B(n3098), .Y(n3380) );
  NAND2X1 U2914 ( .A(n3097), .B(n3096), .Y(N901) );
  AND2X1 U2922 ( .A(n3101), .B(n3100), .Y(n3381) );
  INVXL U2931 ( .A(N1825), .Y(n3436) );
  NAND2X1 U2932 ( .A(n3081), .B(n3080), .Y(N1825) );
  NAND2X1 U2937 ( .A(n3083), .B(n3082), .Y(N1824) );
  INVXL U2944 ( .A(N1822), .Y(n3439) );
  NAND2XL U2945 ( .A(n3087), .B(n3086), .Y(N1822) );
  NAND2X1 U2968 ( .A(n3105), .B(n3104), .Y(N897) );
  NAND2XL U2969 ( .A(n3089), .B(n3088), .Y(N1821) );
  NAND2X1 U2971 ( .A(n3107), .B(n3106), .Y(N896) );
  AND2X1 U2976 ( .A(n3075), .B(n3074), .Y(n3382) );
  INVX1 U2978 ( .A(n717), .Y(n3383) );
  INVXL U2989 ( .A(n718), .Y(n3384) );
  INVXL U2998 ( .A(N1803), .Y(n3385) );
  INVXL U2999 ( .A(n3385), .Y(n3386) );
  INVXL U3007 ( .A(n3385), .Y(n3387) );
  INVXL U3016 ( .A(n715), .Y(n3388) );
  INVXL U3027 ( .A(N1597), .Y(n3389) );
  INVXL U3028 ( .A(n3389), .Y(n3390) );
  INVXL U3038 ( .A(n3389), .Y(n3391) );
  INVXL U3049 ( .A(n716), .Y(n3392) );
  INVXL U3097 ( .A(N1801), .Y(n3393) );
  INVXL U3119 ( .A(n3393), .Y(n3394) );
  INVXL U3120 ( .A(n3393), .Y(n3395) );
  INVXL U3131 ( .A(N1599), .Y(n3396) );
  INVXL U3140 ( .A(n3396), .Y(n3397) );
  INVXL U3142 ( .A(n3396), .Y(n3398) );
  INVXL U3151 ( .A(N1799), .Y(n3399) );
  INVXL U3153 ( .A(n3399), .Y(n3400) );
  INVXL U3158 ( .A(N1804), .Y(n3401) );
  INVXL U3166 ( .A(n3401), .Y(n3402) );
  INVXL U3192 ( .A(n3401), .Y(n3403) );
  OAI2BB2XL U3193 ( .B0(n712), .B1(n3226), .A0N(N1288), .A1N(n3325), .Y(n763)
         );
  INVX1 U3208 ( .A(n713), .Y(n3404) );
  INVXL U3229 ( .A(n3382), .Y(n3405) );
  INVXL U3243 ( .A(n3382), .Y(n3406) );
  INVX1 U3244 ( .A(n3382), .Y(n3407) );
  INVXL U3248 ( .A(N1603), .Y(n3408) );
  INVX1 U3339 ( .A(n3408), .Y(n3409) );
  INVXL U3343 ( .A(n3408), .Y(n3410) );
  INVXL U3721 ( .A(n3411), .Y(n3412) );
  INVXL U3724 ( .A(n3413), .Y(n3414) );
  INVXL U3727 ( .A(n3413), .Y(n3415) );
  INVXL U3737 ( .A(N1602), .Y(n3416) );
  INVXL U3758 ( .A(n3416), .Y(n3417) );
  INVX1 U3799 ( .A(n3416), .Y(n3418) );
  INVXL U3802 ( .A(N1598), .Y(n3419) );
  INVX1 U3805 ( .A(n3419), .Y(n3420) );
  INVXL U3808 ( .A(n3419), .Y(n3421) );
  INVXL U3811 ( .A(n3342), .Y(n3422) );
  NAND2X4 U3825 ( .A(n3230), .B(n3206), .Y(n3209) );
  INVXL U3828 ( .A(n3423), .Y(n3424) );
  INVX1 U3831 ( .A(n3423), .Y(n3425) );
  INVXL U3867 ( .A(N1802), .Y(n3426) );
  INVXL U3868 ( .A(n3426), .Y(n3427) );
  INVX1 U3869 ( .A(n3426), .Y(n3428) );
  INVXL U3870 ( .A(N1821), .Y(n3429) );
  INVX2 U3871 ( .A(n3429), .Y(n3430) );
  INVXL U3872 ( .A(N1823), .Y(n3431) );
  INVXL U3873 ( .A(N1824), .Y(n3433) );
  INVX1 U3874 ( .A(n3433), .Y(n3434) );
  AND3X4 U3875 ( .A(n3205), .B(n3230), .C(n420), .Y(n3212) );
  INVXL U3876 ( .A(n3436), .Y(n3437) );
  INVX1 U3877 ( .A(n3436), .Y(n3438) );
  INVX1 U3878 ( .A(n3439), .Y(n3440) );
  INVX1 U3879 ( .A(n3439), .Y(n3441) );
  INVXL U3880 ( .A(n3439), .Y(n3442) );
  INVXL U3881 ( .A(N1827), .Y(n3443) );
  INVX1 U3882 ( .A(n3443), .Y(n3444) );
  INVXL U3883 ( .A(n3379), .Y(n3445) );
  INVX1 U3884 ( .A(n3379), .Y(n3446) );
  INVX1 U3885 ( .A(n3379), .Y(n3447) );
  INVXL U3886 ( .A(N898), .Y(n3448) );
  INVXL U3887 ( .A(N902), .Y(n3450) );
  INVX1 U3888 ( .A(n3450), .Y(n3451) );
  INVX1 U3889 ( .A(n3450), .Y(n3452) );
  INVXL U3890 ( .A(N896), .Y(n3453) );
  INVX1 U3891 ( .A(n3453), .Y(n3455) );
  INVXL U3892 ( .A(n3381), .Y(n3456) );
  INVXL U3893 ( .A(N901), .Y(n3459) );
  INVX1 U3894 ( .A(n3459), .Y(n3461) );
  INVXL U3895 ( .A(n3380), .Y(n3462) );
  CLKINVX2 U3896 ( .A(n3380), .Y(n3464) );
  INVXL U3897 ( .A(N897), .Y(n3465) );
  INVXL U3898 ( .A(n3465), .Y(n3466) );
  INVX2 U3899 ( .A(n3465), .Y(n3467) );
  INVXL U3900 ( .A(N895), .Y(n3468) );
  INVXL U3901 ( .A(n3468), .Y(n3469) );
  AOI222XL U3902 ( .A0(\yCoor[5][1] ), .A1(n2956), .B0(\yCoor[3][1] ), .B1(
        n3060), .C0(\yCoor[4][1] ), .C1(n3059), .Y(n3024) );
  AOI222XL U3903 ( .A0(\yCoor[5][0] ), .A1(n2956), .B0(\yCoor[3][0] ), .B1(
        n3060), .C0(\yCoor[4][0] ), .C1(n3059), .Y(n3022) );
  NOR2X4 U3904 ( .A(n794), .B(idx0[0]), .Y(n3059) );
  NOR4BX1 U3905 ( .AN(n3252), .B(n361), .C(idx2[0]), .D(n3205), .Y(n172) );
  OAI211XL U3906 ( .A0(idx2[0]), .A1(n361), .B0(n3252), .C0(n3206), .Y(n169)
         );
  OAI33X4 U3907 ( .A0(idx2[0]), .A1(n361), .A2(n314), .B0(n350), .B1(n798), 
        .B2(idx1[0]), .Y(n3252) );
  INVX20 U3908 ( .A(reset), .Y(n3288) );
  OAI2BB2X4 U3912 ( .B0(n711), .B1(n3226), .A0N(N1289), .A1N(n3325), .Y(n762)
         );
  NAND2X2 U3913 ( .A(n3069), .B(n798), .Y(n3475) );
  OAI32XL U3914 ( .A0(n350), .A1(n2978), .A2(idx1[0]), .B0(n314), .B1(n386), 
        .Y(n198) );
endmodule

