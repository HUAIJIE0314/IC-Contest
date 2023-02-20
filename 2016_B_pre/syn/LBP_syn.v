/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06
// Date      : Mon Feb 20 10:19:46 2023
/////////////////////////////////////////////////////////////


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, N150, N151,
         N152, N153, N154, N155, N156, N157, N158, N159, N160, N161, N162,
         N163, N187, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, \intadd_0/CI ,
         \intadd_0/SUM[4] , \intadd_0/SUM[3] , \intadd_0/SUM[2] ,
         \intadd_0/SUM[1] , \intadd_0/SUM[0] , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , \DP_OP_46J1_123_504/n35 ,
         \DP_OP_45J1_122_504/n37 , \DP_OP_45J1_122_504/n33 , n120, n121, n123,
         n124, n125, n126, n127, n128, n134, n136, n139, n141, n143, n145,
         n147, n149, n151, n153, n155, n157, n159, n161, n163, n165, n167,
         n169, n171, n175, n182, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n380, n381, n382, n383;
  wire   [7:0] center;
  wire   [2:0] fstate;
  wire   [7:0] weight;
  wire   [2:0] counter;
  assign lbp_addr[9] = \DP_OP_46J1_123_504/n35 ;
  assign lbp_addr[4] = \DP_OP_45J1_122_504/n37 ;
  assign lbp_addr[0] = \DP_OP_45J1_122_504/n33 ;

  DFFRX1 \weight_reg[0]  ( .D(n110), .CK(clk), .RN(n254), .Q(weight[0]), .QN(
        n374) );
  DFFRX1 \weight_reg[1]  ( .D(n109), .CK(clk), .RN(n254), .Q(weight[1]), .QN(
        n356) );
  DFFRX1 \weight_reg[2]  ( .D(n108), .CK(clk), .RN(n254), .Q(weight[2]), .QN(
        n359) );
  DFFRX1 \weight_reg[3]  ( .D(n107), .CK(clk), .RN(n254), .Q(weight[3]), .QN(
        n375) );
  DFFRX1 \weight_reg[4]  ( .D(n106), .CK(clk), .RN(n254), .Q(weight[4]), .QN(
        n360) );
  DFFRX1 \weight_reg[5]  ( .D(n105), .CK(clk), .RN(n254), .Q(weight[5]), .QN(
        n376) );
  DFFRX1 \weight_reg[6]  ( .D(n104), .CK(clk), .RN(n254), .Q(weight[6]), .QN(
        n361) );
  DFFRX1 \weight_reg[7]  ( .D(n103), .CK(clk), .RN(n254), .Q(weight[7]), .QN(
        n377) );
  DFFRX1 \center_reg[0]  ( .D(n88), .CK(clk), .RN(n254), .Q(center[0]) );
  DFFRX1 \center_reg[7]  ( .D(n87), .CK(clk), .RN(n254), .Q(center[7]) );
  DFFRX1 \center_reg[6]  ( .D(n86), .CK(clk), .RN(n254), .Q(center[6]), .QN(
        n184) );
  DFFRX1 \center_reg[5]  ( .D(n85), .CK(clk), .RN(n254), .Q(n353), .QN(n371)
         );
  DFFRX1 \center_reg[4]  ( .D(n84), .CK(clk), .RN(n254), .Q(center[4]) );
  DFFRX1 \center_reg[3]  ( .D(n83), .CK(clk), .RN(n254), .Q(center[3]), .QN(
        n368) );
  DFFRX1 \center_reg[2]  ( .D(n82), .CK(clk), .RN(n254), .Q(center[2]) );
  DFFRX1 \center_reg[1]  ( .D(n81), .CK(clk), .RN(n254), .QN(n367) );
  DFFRX1 \counter_reg[1]  ( .D(n80), .CK(clk), .RN(n254), .Q(counter[1]), .QN(
        n372) );
  DFFRX1 \counter_reg[0]  ( .D(n79), .CK(clk), .RN(n254), .Q(counter[0]) );
  DFFRX1 \counter_reg[2]  ( .D(n78), .CK(clk), .RN(n254), .Q(counter[2]), .QN(
        n364) );
  DFFRX1 \fstate_reg[0]  ( .D(n118), .CK(clk), .RN(n254), .Q(fstate[0]), .QN(
        n380) );
  DFFRX1 \fstate_reg[2]  ( .D(N187), .CK(clk), .RN(n254), .Q(fstate[2]), .QN(
        n382) );
  DFFRX1 \coorX_reg[4]  ( .D(n91), .CK(clk), .RN(n254), .QN(n370) );
  DFFRX1 \coorY_reg[2]  ( .D(n114), .CK(clk), .RN(n254), .QN(n369) );
  DFFRX1 \fstate_reg[1]  ( .D(n121), .CK(clk), .RN(n254), .Q(fstate[1]), .QN(
        n381) );
  DFFSX1 \coorX_reg[0]  ( .D(n77), .CK(clk), .SN(n254), .Q(n395), .QN(n373) );
  DFFRX1 \coorY_reg[6]  ( .D(n117), .CK(clk), .RN(n254), .Q(n384), .QN(n363)
         );
  DFFRX1 \coorX_reg[6]  ( .D(n89), .CK(clk), .RN(n254), .Q(n390), .QN(n352) );
  DFFRX2 \coorX_reg[5]  ( .D(n90), .CK(clk), .RN(n254), .Q(n391), .QN(n355) );
  DFFRX2 \coorY_reg[5]  ( .D(n111), .CK(clk), .RN(n254), .Q(n385), .QN(n354)
         );
  DFFRX2 \coorY_reg[1]  ( .D(n115), .CK(clk), .RN(n254), .Q(n388), .QN(n357)
         );
  DFFRX2 \coorX_reg[1]  ( .D(n94), .CK(clk), .RN(n254), .Q(n394), .QN(n358) );
  ADDFXL \intadd_0/U4  ( .A(weight[4]), .B(n399), .CI(\intadd_0/n4 ), .CO(
        \intadd_0/n3 ), .S(\intadd_0/SUM[2] ) );
  ADDFXL \intadd_0/U5  ( .A(weight[3]), .B(n400), .CI(\intadd_0/n5 ), .CO(
        \intadd_0/n4 ), .S(\intadd_0/SUM[1] ) );
  ADDFXL \intadd_0/U3  ( .A(weight[5]), .B(n398), .CI(\intadd_0/n3 ), .CO(
        \intadd_0/n2 ), .S(\intadd_0/SUM[3] ) );
  ADDFXL \intadd_0/U6  ( .A(weight[2]), .B(n401), .CI(\intadd_0/CI ), .CO(
        \intadd_0/n5 ), .S(\intadd_0/SUM[0] ) );
  ADDFXL \intadd_0/U2  ( .A(weight[6]), .B(n397), .CI(\intadd_0/n2 ), .CO(
        \intadd_0/n1 ), .S(\intadd_0/SUM[4] ) );
  DFFRX1 \coorX_reg[3]  ( .D(n92), .CK(clk), .RN(n254), .Q(n392), .QN(n182) );
  DFFRX1 \coorY_reg[4]  ( .D(n112), .CK(clk), .RN(n254), .Q(n386), .QN(n366)
         );
  DFFRX1 \lbp_data_reg[7]  ( .D(n95), .CK(clk), .RN(n254), .Q(n396), .QN(n175)
         );
  DFFRX1 \lbp_data_reg[3]  ( .D(n99), .CK(clk), .RN(n254), .Q(n400), .QN(n171)
         );
  DFFRX1 \lbp_data_reg[2]  ( .D(n100), .CK(clk), .RN(n254), .Q(n401), .QN(n169) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n97), .CK(clk), .RN(n254), .Q(n398), .QN(n167)
         );
  DFFRX1 \lbp_data_reg[4]  ( .D(n98), .CK(clk), .RN(n254), .Q(n399), .QN(n165)
         );
  DFFRX1 \lbp_data_reg[6]  ( .D(n96), .CK(clk), .RN(n254), .Q(n397), .QN(n163)
         );
  DFFRX1 \coorY_reg[3]  ( .D(n113), .CK(clk), .RN(n254), .Q(n387), .QN(n161)
         );
  TLATX1 \gray_addr_reg[13]  ( .G(gray_req), .D(N163), .QN(n159) );
  TLATX1 \gray_addr_reg[12]  ( .G(gray_req), .D(N162), .QN(n157) );
  TLATX1 \gray_addr_reg[9]  ( .G(gray_req), .D(N159), .QN(n155) );
  TLATX1 \gray_addr_reg[8]  ( .G(gray_req), .D(N158), .QN(n153) );
  TLATX1 \gray_addr_reg[7]  ( .G(gray_req), .D(N157), .QN(n151) );
  TLATX1 \gray_addr_reg[6]  ( .G(gray_req), .D(N156), .QN(n149) );
  TLATX1 \gray_addr_reg[5]  ( .G(gray_req), .D(N155), .QN(n147) );
  TLATX1 \gray_addr_reg[4]  ( .G(gray_req), .D(N154), .QN(n145) );
  TLATX1 \gray_addr_reg[2]  ( .G(gray_req), .D(N152), .QN(n143) );
  TLATX1 \gray_addr_reg[1]  ( .G(gray_req), .D(N151), .QN(n141) );
  TLATX1 \gray_addr_reg[0]  ( .G(gray_req), .D(N150), .QN(n139) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n101), .CK(clk), .RN(n254), .Q(n402), .QN(n365) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n102), .CK(clk), .RN(n254), .Q(n403), .QN(n136) );
  DFFSX2 \coorY_reg[0]  ( .D(n116), .CK(clk), .SN(n254), .Q(n389), .QN(n378)
         );
  DFFRX1 \coorX_reg[2]  ( .D(n93), .CK(clk), .RN(n254), .Q(n393), .QN(n362) );
  TLATX1 \gray_addr_reg[11]  ( .G(gray_req), .D(N161), .QN(n128) );
  TLATX1 \gray_addr_reg[10]  ( .G(gray_req), .D(N160), .QN(n127) );
  TLATX1 \gray_addr_reg[3]  ( .G(gray_req), .D(N153), .QN(n126) );
  CLKINVX1 U142 ( .A(n383), .Y(n120) );
  BUFX2 U143 ( .A(n217), .Y(n383) );
  CLKINVX2 U144 ( .A(n120), .Y(n121) );
  INVX20 U145 ( .A(n120), .Y(gray_req) );
  AOI21XL U146 ( .A0(n225), .A1(center[2]), .B0(n343), .Y(n227) );
  INVXL U147 ( .A(gray_data[4]), .Y(n228) );
  INVXL U148 ( .A(gray_data[5]), .Y(n231) );
  NAND2XL U149 ( .A(n231), .B(n353), .Y(n232) );
  NAND2XL U150 ( .A(n403), .B(n237), .Y(n238) );
  CLKINVX2 U151 ( .A(n250), .Y(n240) );
  INVX8 U152 ( .A(reset), .Y(n254) );
  ACHCINX2 U153 ( .CIN(n234), .A(gray_data[6]), .B(n184), .CO(n236) );
  NAND2X2 U154 ( .A(n233), .B(n232), .Y(n234) );
  AO21X2 U155 ( .A0(gray_data[5]), .A1(n371), .B0(n230), .Y(n233) );
  OAI211X2 U156 ( .A0(n345), .A1(counter[1]), .B0(n210), .C0(counter[2]), .Y(
        n207) );
  OAI2BB1X1 U157 ( .A0N(n367), .A1N(gray_data[1]), .B0(center[0]), .Y(n223) );
  NAND2X1 U158 ( .A(n215), .B(n252), .Y(n250) );
  OAI21X2 U159 ( .A0(n220), .A1(n198), .B0(n210), .Y(n199) );
  AND2X1 U160 ( .A(n218), .B(n388), .Y(n321) );
  INVX2 U161 ( .A(lbp_valid), .Y(n188) );
  AND2X1 U162 ( .A(n219), .B(n392), .Y(n244) );
  AND2X1 U163 ( .A(n219), .B(n394), .Y(n330) );
  INVX2 U164 ( .A(n215), .Y(n341) );
  AND2X1 U165 ( .A(n219), .B(lbp_addr[2]), .Y(n333) );
  AND2X1 U166 ( .A(n218), .B(n387), .Y(n247) );
  NOR2X1 U167 ( .A(fstate[2]), .B(n216), .Y(n346) );
  INVX1 U168 ( .A(n393), .Y(n134) );
  INVX1 U169 ( .A(gray_data[2]), .Y(n343) );
  OAI22X1 U170 ( .A0(gray_data[0]), .A1(n223), .B0(gray_data[1]), .B1(n367), 
        .Y(n225) );
  NOR2BX1 U171 ( .AN(\DP_OP_45J1_122_504/n37 ), .B(n307), .Y(n312) );
  NAND2X1 U172 ( .A(fstate[1]), .B(n380), .Y(n216) );
  NOR2X1 U173 ( .A(fstate[1]), .B(n380), .Y(n214) );
  NAND2XL U174 ( .A(n218), .B(n389), .Y(n319) );
  AND2X1 U175 ( .A(n218), .B(n386), .Y(n324) );
  AND2X1 U176 ( .A(n219), .B(n391), .Y(n339) );
  AND2X1 U177 ( .A(n218), .B(n385), .Y(n327) );
  AND2X1 U178 ( .A(n218), .B(\DP_OP_46J1_123_504/n35 ), .Y(n297) );
  AND2X1 U179 ( .A(n219), .B(\DP_OP_45J1_122_504/n37 ), .Y(n336) );
  INVX16 U180 ( .A(n123), .Y(lbp_valid) );
  XOR2X1 U181 ( .A(n187), .B(n186), .Y(n190) );
  AOI2BB2X1 U182 ( .B0(n192), .B1(n363), .A0N(n192), .A1N(n195), .Y(n117) );
  XNOR2X1 U183 ( .A(n124), .B(n194), .Y(n195) );
  AND2X1 U184 ( .A(n222), .B(lbp_valid), .Y(N187) );
  NAND3X1 U185 ( .A(n382), .B(fstate[0]), .C(fstate[1]), .Y(n123) );
  NAND2XL U186 ( .A(n384), .B(n218), .Y(n124) );
  NAND3XL U187 ( .A(n380), .B(n381), .C(fstate[2]), .Y(n125) );
  NOR2X1 U188 ( .A(n362), .B(n271), .Y(n291) );
  NOR2X1 U189 ( .A(\DP_OP_45J1_122_504/n37 ), .B(n292), .Y(n315) );
  NOR2X1 U190 ( .A(lbp_addr[11]), .B(n285), .Y(n303) );
  NOR4X1 U191 ( .A(\DP_OP_46J1_123_504/n35 ), .B(lbp_addr[8]), .C(lbp_addr[7]), 
        .D(lbp_addr[10]), .Y(n257) );
  NOR2X2 U192 ( .A(n216), .B(n208), .Y(n300) );
  AO21X1 U193 ( .A0(n301), .A1(n277), .B0(n278), .Y(n258) );
  INVX1 U194 ( .A(n207), .Y(n301) );
  NAND2X1 U195 ( .A(n403), .B(weight[0]), .Y(n253) );
  CLKINVX1 U196 ( .A(n252), .Y(n242) );
  AOI211X4 U197 ( .A0(n364), .A1(n197), .B0(n216), .C0(n196), .Y(n310) );
  NOR2XL U198 ( .A(\DP_OP_45J1_122_504/n33 ), .B(n219), .Y(n191) );
  NOR4X1 U199 ( .A(lbp_addr[2]), .B(lbp_addr[1]), .C(\DP_OP_45J1_122_504/n33 ), 
        .D(lbp_addr[3]), .Y(n274) );
  BUFX16 U200 ( .A(n395), .Y(\DP_OP_45J1_122_504/n33 ) );
  INVX12 U201 ( .A(n126), .Y(gray_addr[3]) );
  INVX12 U202 ( .A(n127), .Y(gray_addr[10]) );
  INVX12 U203 ( .A(n128), .Y(gray_addr[11]) );
  INVX12 U204 ( .A(n125), .Y(finish) );
  INVX16 U205 ( .A(n134), .Y(lbp_addr[2]) );
  INVX16 U206 ( .A(n378), .Y(lbp_addr[7]) );
  INVX16 U207 ( .A(n369), .Y(\DP_OP_46J1_123_504/n35 ) );
  INVX16 U208 ( .A(n370), .Y(\DP_OP_45J1_122_504/n37 ) );
  NAND2X1 U209 ( .A(n345), .B(counter[1]), .Y(n347) );
  AOI31X1 U210 ( .A0(n210), .A1(n209), .A2(n208), .B0(n214), .Y(n255) );
  AOI21X1 U211 ( .A0(n210), .A1(n203), .B0(n214), .Y(n272) );
  INVX1 U212 ( .A(n216), .Y(n210) );
  NOR4X1 U213 ( .A(\DP_OP_45J1_122_504/n33 ), .B(n389), .C(n219), .D(n218), 
        .Y(n222) );
  INVX12 U214 ( .A(n136), .Y(lbp_data[0]) );
  INVX12 U215 ( .A(n365), .Y(lbp_data[1]) );
  INVX12 U216 ( .A(n139), .Y(gray_addr[0]) );
  INVX12 U217 ( .A(n141), .Y(gray_addr[1]) );
  INVX12 U218 ( .A(n143), .Y(gray_addr[2]) );
  INVX12 U219 ( .A(n145), .Y(gray_addr[4]) );
  INVX12 U220 ( .A(n147), .Y(gray_addr[5]) );
  INVX12 U221 ( .A(n149), .Y(gray_addr[6]) );
  INVX12 U222 ( .A(n151), .Y(gray_addr[7]) );
  INVX12 U223 ( .A(n153), .Y(gray_addr[8]) );
  INVX12 U224 ( .A(n155), .Y(gray_addr[9]) );
  INVX12 U225 ( .A(n157), .Y(gray_addr[12]) );
  INVX12 U226 ( .A(n159), .Y(gray_addr[13]) );
  INVX16 U227 ( .A(n161), .Y(lbp_addr[10]) );
  NAND3X2 U228 ( .A(\DP_OP_46J1_123_504/n35 ), .B(n387), .C(n193), .Y(n218) );
  INVX12 U229 ( .A(n163), .Y(lbp_data[6]) );
  INVX12 U230 ( .A(n165), .Y(lbp_data[4]) );
  INVX12 U231 ( .A(n167), .Y(lbp_data[5]) );
  INVX12 U232 ( .A(n169), .Y(lbp_data[2]) );
  INVX12 U233 ( .A(n171), .Y(lbp_data[3]) );
  INVX16 U234 ( .A(n355), .Y(lbp_addr[5]) );
  INVX16 U235 ( .A(n354), .Y(lbp_addr[12]) );
  INVX12 U236 ( .A(n175), .Y(lbp_data[7]) );
  INVX12 U237 ( .A(n352), .Y(lbp_addr[6]) );
  AOI32XL U238 ( .A0(n318), .A1(n390), .A2(n314), .B0(n313), .B1(n352), .Y(
        N156) );
  INVX16 U239 ( .A(n357), .Y(lbp_addr[8]) );
  AOI21XL U240 ( .A0(lbp_addr[8]), .A1(n300), .B0(n262), .Y(n283) );
  INVX16 U241 ( .A(n358), .Y(lbp_addr[1]) );
  AOI21XL U242 ( .A0(lbp_addr[1]), .A1(n310), .B0(n266), .Y(n290) );
  INVX16 U243 ( .A(n366), .Y(lbp_addr[11]) );
  AOI21XL U244 ( .A0(lbp_addr[11]), .A1(n258), .B0(n303), .Y(n259) );
  INVX12 U245 ( .A(n363), .Y(lbp_addr[13]) );
  AOI32XL U246 ( .A0(n306), .A1(lbp_addr[13]), .A2(n305), .B0(n304), .B1(n363), 
        .Y(N163) );
  INVX16 U247 ( .A(n182), .Y(lbp_addr[3]) );
  NAND3X2 U248 ( .A(n392), .B(\DP_OP_45J1_122_504/n37 ), .C(n185), .Y(n219) );
  INVXL U249 ( .A(gray_data[6]), .Y(n342) );
  INVXL U250 ( .A(gray_data[3]), .Y(n224) );
  OAI22XL U251 ( .A0(n225), .A1(center[2]), .B0(center[3]), .B1(n224), .Y(n226) );
  OAI22XL U252 ( .A0(n227), .A1(n226), .B0(gray_data[3]), .B1(n368), .Y(n229)
         );
  NAND2BX1 U253 ( .AN(n352), .B(n219), .Y(n187) );
  NAND2BX1 U254 ( .AN(n352), .B(n188), .Y(n189) );
  OAI21XL U255 ( .A0(n190), .A1(n188), .B0(n189), .Y(n89) );
  NOR4XL U256 ( .A(n362), .B(n358), .C(n352), .D(n355), .Y(n185) );
  NAND2XL U257 ( .A(n219), .B(\DP_OP_45J1_122_504/n33 ), .Y(n351) );
  INVXL U258 ( .A(n351), .Y(n329) );
  NAND2X2 U259 ( .A(lbp_valid), .B(n191), .Y(n192) );
  NOR4XL U260 ( .A(n357), .B(n363), .C(n354), .D(n366), .Y(n193) );
  INVXL U261 ( .A(n319), .Y(n320) );
  BUFX2 U262 ( .A(counter[0]), .Y(n345) );
  AND2X1 U263 ( .A(n345), .B(n372), .Y(n197) );
  OAI22XL U264 ( .A0(n345), .A1(n372), .B0(n364), .B1(n197), .Y(n196) );
  INVXL U265 ( .A(n310), .Y(n273) );
  NOR2XL U266 ( .A(n347), .B(n364), .Y(n220) );
  NOR2XL U267 ( .A(n372), .B(n364), .Y(n200) );
  AOI211XL U268 ( .A0(n372), .A1(n364), .B0(n345), .C0(n200), .Y(n198) );
  NAND2XL U269 ( .A(n345), .B(n364), .Y(n202) );
  INVXL U270 ( .A(n200), .Y(n201) );
  OAI22XL U271 ( .A0(counter[1]), .A1(n202), .B0(n345), .B1(n201), .Y(n203) );
  AOI32XL U272 ( .A0(n273), .A1(n373), .A2(n199), .B0(\DP_OP_45J1_122_504/n33 ), .B1(n272), .Y(N150) );
  NAND3XL U273 ( .A(n310), .B(n358), .C(n373), .Y(n268) );
  NOR2XL U274 ( .A(\DP_OP_45J1_122_504/n33 ), .B(n199), .Y(n204) );
  OAI21XL U275 ( .A0(n273), .A1(n373), .B0(n272), .Y(n266) );
  OAI21XL U276 ( .A0(n204), .A1(n266), .B0(lbp_addr[1]), .Y(n206) );
  INVXL U277 ( .A(n199), .Y(n311) );
  NAND3XL U278 ( .A(\DP_OP_45J1_122_504/n33 ), .B(n311), .C(n358), .Y(n205) );
  NAND3XL U279 ( .A(n268), .B(n206), .C(n205), .Y(N151) );
  NAND2XL U280 ( .A(n347), .B(n364), .Y(n208) );
  INVXL U281 ( .A(n300), .Y(n256) );
  OAI21XL U282 ( .A0(n345), .A1(counter[1]), .B0(counter[2]), .Y(n209) );
  AOI32XL U283 ( .A0(n256), .A1(n378), .A2(n207), .B0(lbp_addr[7]), .B1(n255), 
        .Y(N157) );
  NAND3XL U284 ( .A(n300), .B(n357), .C(n378), .Y(n260) );
  NOR2XL U285 ( .A(lbp_addr[7]), .B(n207), .Y(n211) );
  OAI21XL U286 ( .A0(n256), .A1(n378), .B0(n255), .Y(n262) );
  OAI21XL U287 ( .A0(n211), .A1(n262), .B0(lbp_addr[8]), .Y(n213) );
  NAND3XL U288 ( .A(lbp_addr[7]), .B(n301), .C(n357), .Y(n212) );
  NAND3XL U289 ( .A(n260), .B(n213), .C(n212), .Y(N158) );
  NAND2X2 U290 ( .A(n214), .B(n382), .Y(n215) );
  CLKINVX2 U291 ( .A(n346), .Y(n348) );
  NAND2X1 U292 ( .A(n215), .B(n348), .Y(n217) );
  NAND2XL U293 ( .A(n346), .B(n220), .Y(n349) );
  NAND4XL U294 ( .A(gray_ready), .B(n382), .C(n380), .D(n381), .Y(n221) );
  OAI211XL U295 ( .A0(n222), .A1(n188), .B0(n349), .C0(n221), .Y(n118) );
  AOI222XL U296 ( .A0(center[4]), .A1(n229), .B0(center[4]), .B1(n228), .C0(
        n229), .C1(n228), .Y(n230) );
  OAI2BB1X1 U297 ( .A0N(gray_data[7]), .A1N(n236), .B0(center[7]), .Y(n235) );
  OAI211X4 U298 ( .A0(gray_data[7]), .A1(n236), .B0(n346), .C0(n235), .Y(n252)
         );
  OAI21XL U299 ( .A0(n252), .A1(weight[0]), .B0(n250), .Y(n237) );
  OAI31XL U300 ( .A0(n403), .A1(n252), .A2(n374), .B0(n238), .Y(n102) );
  AO22X1 U301 ( .A0(n242), .A1(\intadd_0/SUM[0] ), .B0(n240), .B1(n401), .Y(
        n100) );
  AO22X1 U302 ( .A0(n242), .A1(\intadd_0/SUM[3] ), .B0(n240), .B1(n398), .Y(
        n97) );
  AO22X1 U303 ( .A0(n242), .A1(\intadd_0/SUM[1] ), .B0(n240), .B1(n400), .Y(
        n99) );
  AO22X1 U304 ( .A0(n242), .A1(\intadd_0/SUM[2] ), .B0(n240), .B1(n399), .Y(
        n98) );
  AO22X1 U305 ( .A0(n242), .A1(\intadd_0/SUM[4] ), .B0(n240), .B1(n397), .Y(
        n96) );
  AOI2BB2X1 U306 ( .B0(\intadd_0/n1 ), .B1(weight[7]), .A0N(\intadd_0/n1 ), 
        .A1N(weight[7]), .Y(n239) );
  AOI2BB2X1 U307 ( .B0(n396), .B1(n239), .A0N(n396), .A1N(n239), .Y(n241) );
  AO22X1 U308 ( .A0(n242), .A1(n241), .B0(n240), .B1(n396), .Y(n95) );
  ADDHXL U309 ( .A(n244), .B(n243), .CO(n335), .S(n245) );
  AO22X1 U310 ( .A0(lbp_valid), .A1(n245), .B0(n188), .B1(n392), .Y(n92) );
  INVXL U311 ( .A(n192), .Y(n299) );
  ADDHXL U312 ( .A(n247), .B(n246), .CO(n323), .S(n248) );
  AO22X1 U313 ( .A0(n299), .A1(n248), .B0(n192), .B1(n387), .Y(n113) );
  OAI22XL U314 ( .A0(weight[1]), .A1(n365), .B0(n356), .B1(n402), .Y(n249) );
  AOI2BB2X1 U315 ( .B0(n249), .B1(n253), .A0N(n249), .A1N(n253), .Y(n251) );
  OAI22XL U316 ( .A0(n252), .A1(n251), .B0(n250), .B1(n365), .Y(n101) );
  AOI222XL U317 ( .A0(n253), .A1(n356), .B0(n253), .B1(n365), .C0(n356), .C1(
        n365), .Y(\intadd_0/CI ) );
  NOR2XL U318 ( .A(n357), .B(n378), .Y(n263) );
  NAND2XL U319 ( .A(\DP_OP_46J1_123_504/n35 ), .B(n263), .Y(n286) );
  INVXL U320 ( .A(n286), .Y(n284) );
  NAND2XL U321 ( .A(lbp_addr[10]), .B(n284), .Y(n277) );
  OAI21XL U322 ( .A0(n257), .A1(n256), .B0(n255), .Y(n278) );
  NAND2XL U323 ( .A(n300), .B(n257), .Y(n285) );
  OAI31XL U324 ( .A0(lbp_addr[11]), .A1(n207), .A2(n277), .B0(n259), .Y(N161)
         );
  OAI2BB1XL U325 ( .A0N(n263), .A1N(n301), .B0(n260), .Y(n261) );
  INVXL U326 ( .A(n261), .Y(n265) );
  OAI21XL U327 ( .A0(n263), .A1(n207), .B0(n283), .Y(n264) );
  OAI2BB2XL U328 ( .B0(\DP_OP_46J1_123_504/n35 ), .B1(n265), .A0N(
        \DP_OP_46J1_123_504/n35 ), .A1N(n264), .Y(N159) );
  NOR2XL U329 ( .A(n358), .B(n373), .Y(n267) );
  OAI21XL U330 ( .A0(n267), .A1(n199), .B0(n290), .Y(n270) );
  INVXL U331 ( .A(n267), .Y(n271) );
  OAI21XL U332 ( .A0(n271), .A1(n199), .B0(n268), .Y(n269) );
  AO22X1 U333 ( .A0(lbp_addr[2]), .A1(n270), .B0(n362), .B1(n269), .Y(N152) );
  NAND2XL U334 ( .A(lbp_addr[3]), .B(n291), .Y(n307) );
  OAI21XL U335 ( .A0(n274), .A1(n273), .B0(n272), .Y(n308) );
  AO21X1 U336 ( .A0(n311), .A1(n307), .B0(n308), .Y(n275) );
  NAND2XL U337 ( .A(n310), .B(n274), .Y(n292) );
  AOI21XL U338 ( .A0(\DP_OP_45J1_122_504/n37 ), .A1(n275), .B0(n315), .Y(n276)
         );
  OAI31XL U339 ( .A0(\DP_OP_45J1_122_504/n37 ), .A1(n199), .A2(n307), .B0(n276), .Y(N154) );
  NOR2XL U340 ( .A(n366), .B(n277), .Y(n280) );
  NOR2XL U341 ( .A(n280), .B(n207), .Y(n279) );
  AOI211XL U342 ( .A0(n300), .A1(lbp_addr[11]), .B0(n279), .C0(n278), .Y(n306)
         );
  NOR2BX1 U343 ( .AN(n280), .B(n207), .Y(n302) );
  OAI21XL U344 ( .A0(n302), .A1(n303), .B0(n354), .Y(n281) );
  OAI21XL U345 ( .A0(n306), .A1(n354), .B0(n281), .Y(N162) );
  NAND2XL U346 ( .A(\DP_OP_46J1_123_504/n35 ), .B(n300), .Y(n282) );
  OAI211XL U347 ( .A0(n284), .A1(n207), .B0(n283), .C0(n282), .Y(n288) );
  OAI31XL U348 ( .A0(lbp_addr[10]), .A1(n207), .A2(n286), .B0(n285), .Y(n287)
         );
  AO21X1 U349 ( .A0(lbp_addr[10]), .A1(n288), .B0(n287), .Y(N160) );
  NAND2XL U350 ( .A(lbp_addr[2]), .B(n310), .Y(n289) );
  OAI211XL U351 ( .A0(n291), .A1(n199), .B0(n290), .C0(n289), .Y(n295) );
  INVXL U352 ( .A(n291), .Y(n293) );
  OAI31XL U353 ( .A0(lbp_addr[3]), .A1(n199), .A2(n293), .B0(n292), .Y(n294)
         );
  AO21X1 U354 ( .A0(lbp_addr[3]), .A1(n295), .B0(n294), .Y(N153) );
  ADDHXL U355 ( .A(n297), .B(n296), .CO(n246), .S(n298) );
  OA22X1 U356 ( .A0(n299), .A1(\DP_OP_46J1_123_504/n35 ), .B0(n192), .B1(n298), 
        .Y(n114) );
  OAI22XL U357 ( .A0(lbp_addr[12]), .A1(n301), .B0(n354), .B1(n300), .Y(n305)
         );
  OAI22XL U358 ( .A0(lbp_addr[12]), .A1(n303), .B0(n354), .B1(n302), .Y(n304)
         );
  NOR2XL U359 ( .A(n312), .B(n199), .Y(n309) );
  AOI211XL U360 ( .A0(n310), .A1(\DP_OP_45J1_122_504/n37 ), .B0(n309), .C0(
        n308), .Y(n318) );
  OAI22XL U361 ( .A0(lbp_addr[5]), .A1(n311), .B0(n355), .B1(n310), .Y(n314)
         );
  NOR2BX1 U362 ( .AN(n312), .B(n199), .Y(n316) );
  OAI22XL U363 ( .A0(lbp_addr[5]), .A1(n315), .B0(n355), .B1(n316), .Y(n313)
         );
  OAI21XL U364 ( .A0(n316), .A1(n315), .B0(n355), .Y(n317) );
  OAI21XL U365 ( .A0(n318), .A1(n355), .B0(n317), .Y(N155) );
  AOI2BB2X1 U366 ( .B0(n192), .B1(n378), .A0N(n192), .A1N(n319), .Y(n116) );
  ADDHXL U367 ( .A(n321), .B(n320), .CO(n296), .S(n322) );
  AOI2BB2X1 U368 ( .B0(n192), .B1(n357), .A0N(n192), .A1N(n322), .Y(n115) );
  ADDHXL U369 ( .A(n324), .B(n323), .CO(n326), .S(n325) );
  AOI2BB2X1 U370 ( .B0(n192), .B1(n366), .A0N(n192), .A1N(n325), .Y(n112) );
  ADDHXL U371 ( .A(n327), .B(n326), .CO(n194), .S(n328) );
  AOI2BB2X1 U372 ( .B0(n192), .B1(n354), .A0N(n192), .A1N(n328), .Y(n111) );
  OAI21XL U373 ( .A0(n346), .A1(n374), .B0(n215), .Y(n110) );
  OAI22XL U374 ( .A0(n348), .A1(n374), .B0(n356), .B1(n121), .Y(n109) );
  OAI22XL U375 ( .A0(n348), .A1(n356), .B0(n121), .B1(n359), .Y(n108) );
  OAI22XL U376 ( .A0(n348), .A1(n359), .B0(n121), .B1(n375), .Y(n107) );
  OAI22XL U377 ( .A0(n348), .A1(n375), .B0(n121), .B1(n360), .Y(n106) );
  OAI22XL U378 ( .A0(n348), .A1(n360), .B0(n121), .B1(n376), .Y(n105) );
  OAI22XL U379 ( .A0(n348), .A1(n376), .B0(n121), .B1(n361), .Y(n104) );
  OAI22XL U380 ( .A0(n348), .A1(n361), .B0(n377), .B1(n121), .Y(n103) );
  ADDHXL U381 ( .A(n330), .B(n329), .CO(n332), .S(n331) );
  AOI2BB2X1 U382 ( .B0(n188), .B1(n358), .A0N(n188), .A1N(n331), .Y(n94) );
  ADDHXL U383 ( .A(n333), .B(n332), .CO(n243), .S(n334) );
  AOI2BB2X1 U384 ( .B0(n188), .B1(n362), .A0N(n188), .A1N(n334), .Y(n93) );
  ADDHXL U385 ( .A(n336), .B(n335), .CO(n338), .S(n337) );
  OA22X1 U386 ( .A0(lbp_valid), .A1(\DP_OP_45J1_122_504/n37 ), .B0(n188), .B1(
        n337), .Y(n91) );
  ADDHXL U387 ( .A(n339), .B(n338), .CO(n186), .S(n340) );
  AOI2BB2X1 U388 ( .B0(n188), .B1(n355), .A0N(n188), .A1N(n340), .Y(n90) );
  AO22X1 U389 ( .A0(n341), .A1(gray_data[0]), .B0(n215), .B1(center[0]), .Y(
        n88) );
  AO22X1 U390 ( .A0(n341), .A1(gray_data[7]), .B0(n215), .B1(center[7]), .Y(
        n87) );
  AOI2BB2X1 U391 ( .B0(n341), .B1(n342), .A0N(n341), .A1N(center[6]), .Y(n86)
         );
  AO22X1 U392 ( .A0(n215), .A1(n353), .B0(n341), .B1(gray_data[5]), .Y(n85) );
  AO22X1 U393 ( .A0(n341), .A1(gray_data[4]), .B0(n215), .B1(center[4]), .Y(
        n84) );
  AO22X1 U394 ( .A0(n215), .A1(center[3]), .B0(n341), .B1(gray_data[3]), .Y(
        n83) );
  AOI2BB2X1 U395 ( .B0(n341), .B1(n343), .A0N(n341), .A1N(center[2]), .Y(n82)
         );
  AOI2BB2X1 U396 ( .B0(n215), .B1(n367), .A0N(n215), .A1N(gray_data[1]), .Y(
        n81) );
  NAND2XL U397 ( .A(n346), .B(n345), .Y(n344) );
  AOI2BB2X1 U398 ( .B0(n372), .B1(n344), .A0N(n348), .A1N(n347), .Y(n80) );
  OA21XL U399 ( .A0(n346), .A1(n345), .B0(n344), .Y(n79) );
  NOR2XL U400 ( .A(n348), .B(n347), .Y(n350) );
  OA21XL U401 ( .A0(counter[2]), .A1(n350), .B0(n349), .Y(n78) );
  AOI2BB2X1 U402 ( .B0(n188), .B1(n373), .A0N(n188), .A1N(n351), .Y(n77) );
endmodule

