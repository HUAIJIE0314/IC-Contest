/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06
// Date      : Sun Feb 19 23:00:31 2023
/////////////////////////////////////////////////////////////


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, N171, N172,
         N173, N174, N175, N176, N177, N178, N179, N180, N181, N182, N183,
         N184, N207, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, \intadd_0/CI ,
         \intadd_0/SUM[4] , \intadd_0/SUM[3] , \intadd_0/SUM[2] ,
         \intadd_0/SUM[1] , \intadd_0/SUM[0] , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , \DP_OP_46J1_123_504/n35 ,
         \DP_OP_45J1_122_504/n37 , n132, n133, n135, n136, n137, n138, n139,
         n140, n145, n147, n150, n152, n154, n156, n158, n160, n162, n164,
         n166, n168, n170, n172, n174, n176, n178, n180, n184, n191, n193,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n401, n402, n403;
  wire   [7:0] center;
  wire   [2:0] fstate;
  wire   [7:0] weight;
  wire   [3:0] counter;
  assign lbp_addr[9] = \DP_OP_46J1_123_504/n35 ;
  assign lbp_addr[4] = \DP_OP_45J1_122_504/n37 ;

  DFFRX1 \weight_reg[0]  ( .D(n122), .CK(clk), .RN(n272), .Q(weight[0]), .QN(
        n392) );
  DFFRX1 \weight_reg[1]  ( .D(n121), .CK(clk), .RN(n272), .Q(weight[1]), .QN(
        n374) );
  DFFRX1 \weight_reg[2]  ( .D(n120), .CK(clk), .RN(n272), .Q(weight[2]), .QN(
        n379) );
  DFFRX1 \weight_reg[3]  ( .D(n119), .CK(clk), .RN(n272), .Q(weight[3]), .QN(
        n393) );
  DFFRX1 \weight_reg[4]  ( .D(n118), .CK(clk), .RN(n272), .Q(weight[4]), .QN(
        n380) );
  DFFRX1 \weight_reg[5]  ( .D(n117), .CK(clk), .RN(n272), .Q(weight[5]), .QN(
        n394) );
  DFFRX1 \weight_reg[6]  ( .D(n116), .CK(clk), .RN(n272), .Q(weight[6]), .QN(
        n381) );
  DFFRX1 \weight_reg[7]  ( .D(n115), .CK(clk), .RN(n272), .Q(weight[7]), .QN(
        n396) );
  DFFRX1 \center_reg[0]  ( .D(n100), .CK(clk), .RN(n272), .Q(center[0]) );
  DFFRX1 \center_reg[7]  ( .D(n99), .CK(clk), .RN(n272), .Q(center[7]) );
  DFFRX1 \center_reg[6]  ( .D(n98), .CK(clk), .RN(n272), .Q(center[6]), .QN(
        n195) );
  DFFRX1 \center_reg[5]  ( .D(n97), .CK(clk), .RN(n272), .Q(n371), .QN(n390)
         );
  DFFRX1 \center_reg[4]  ( .D(n96), .CK(clk), .RN(n272), .Q(center[4]) );
  DFFRX1 \center_reg[3]  ( .D(n95), .CK(clk), .RN(n272), .Q(center[3]), .QN(
        n387) );
  DFFRX1 \center_reg[2]  ( .D(n94), .CK(clk), .RN(n272), .Q(center[2]) );
  DFFRX1 \center_reg[1]  ( .D(n93), .CK(clk), .RN(n272), .QN(n386) );
  DFFRX1 \counter_reg[1]  ( .D(n92), .CK(clk), .RN(n272), .Q(counter[1]), .QN(
        n397) );
  DFFRX1 \counter_reg[3]  ( .D(n91), .CK(clk), .RN(n272), .Q(counter[3]), .QN(
        n391) );
  DFFRX1 \counter_reg[0]  ( .D(n90), .CK(clk), .RN(n272), .Q(counter[0]), .QN(
        n378) );
  DFFRX1 \counter_reg[2]  ( .D(n89), .CK(clk), .RN(n272), .Q(counter[2]), .QN(
        n383) );
  DFFRX1 \fstate_reg[0]  ( .D(n130), .CK(clk), .RN(n272), .Q(n377), .QN(n401)
         );
  DFFRX1 \fstate_reg[2]  ( .D(N207), .CK(clk), .RN(n272), .Q(fstate[2]), .QN(
        n403) );
  DFFRX1 \coorX_reg[4]  ( .D(n103), .CK(clk), .RN(n272), .QN(n389) );
  DFFRX1 \coorY_reg[2]  ( .D(n126), .CK(clk), .RN(n272), .QN(n388) );
  DFFRX1 \fstate_reg[1]  ( .D(n133), .CK(clk), .RN(n272), .Q(fstate[1]), .QN(
        n402) );
  DFFRX1 \coorY_reg[6]  ( .D(n129), .CK(clk), .RN(n272), .Q(n404), .QN(n382)
         );
  DFFRX2 \coorY_reg[5]  ( .D(n123), .CK(clk), .RN(n272), .Q(n405), .QN(n372)
         );
  DFFRX2 \coorY_reg[1]  ( .D(n127), .CK(clk), .RN(n272), .Q(n408), .QN(n375)
         );
  DFFRX2 \coorX_reg[1]  ( .D(n106), .CK(clk), .RN(n272), .Q(n414), .QN(n373)
         );
  DFFRX2 \coorX_reg[5]  ( .D(n102), .CK(clk), .RN(n272), .Q(n411), .QN(n196)
         );
  ADDFXL \intadd_0/U3  ( .A(weight[5]), .B(n418), .CI(\intadd_0/n3 ), .CO(
        \intadd_0/n2 ), .S(\intadd_0/SUM[3] ) );
  ADDFXL \intadd_0/U5  ( .A(weight[3]), .B(n420), .CI(\intadd_0/n5 ), .CO(
        \intadd_0/n4 ), .S(\intadd_0/SUM[1] ) );
  ADDFXL \intadd_0/U6  ( .A(weight[2]), .B(n421), .CI(\intadd_0/CI ), .CO(
        \intadd_0/n5 ), .S(\intadd_0/SUM[0] ) );
  ADDFXL \intadd_0/U4  ( .A(weight[4]), .B(n419), .CI(\intadd_0/n4 ), .CO(
        \intadd_0/n3 ), .S(\intadd_0/SUM[2] ) );
  ADDFXL \intadd_0/U2  ( .A(weight[6]), .B(n417), .CI(\intadd_0/n2 ), .CO(
        \intadd_0/n1 ), .S(\intadd_0/SUM[4] ) );
  DFFRX1 \coorY_reg[3]  ( .D(n125), .CK(clk), .RN(n272), .Q(n407), .QN(n193)
         );
  DFFRX1 \coorX_reg[3]  ( .D(n104), .CK(clk), .RN(n272), .Q(n412), .QN(n191)
         );
  DFFRX1 \coorY_reg[4]  ( .D(n124), .CK(clk), .RN(n272), .Q(n406), .QN(n385)
         );
  DFFRX1 \lbp_data_reg[7]  ( .D(n107), .CK(clk), .RN(n272), .Q(n416), .QN(n184) );
  DFFRX1 \lbp_data_reg[3]  ( .D(n111), .CK(clk), .RN(n272), .Q(n420), .QN(n180) );
  DFFRX1 \lbp_data_reg[2]  ( .D(n112), .CK(clk), .RN(n272), .Q(n421), .QN(n178) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n109), .CK(clk), .RN(n272), .Q(n418), .QN(n176) );
  DFFRX1 \lbp_data_reg[4]  ( .D(n110), .CK(clk), .RN(n272), .Q(n419), .QN(n174) );
  DFFRX1 \lbp_data_reg[6]  ( .D(n108), .CK(clk), .RN(n272), .Q(n417), .QN(n172) );
  TLATX1 \gray_addr_reg[13]  ( .G(gray_req), .D(N184), .QN(n170) );
  TLATX1 \gray_addr_reg[12]  ( .G(gray_req), .D(N183), .QN(n168) );
  TLATX1 \gray_addr_reg[9]  ( .G(gray_req), .D(N180), .QN(n166) );
  TLATX1 \gray_addr_reg[8]  ( .G(gray_req), .D(N179), .QN(n164) );
  TLATX1 \gray_addr_reg[7]  ( .G(gray_req), .D(N178), .QN(n162) );
  TLATX1 \gray_addr_reg[6]  ( .G(gray_req), .D(N177), .QN(n160) );
  TLATX1 \gray_addr_reg[5]  ( .G(gray_req), .D(N176), .QN(n158) );
  TLATX1 \gray_addr_reg[4]  ( .G(gray_req), .D(N175), .QN(n156) );
  TLATX1 \gray_addr_reg[2]  ( .G(gray_req), .D(N173), .QN(n154) );
  TLATX1 \gray_addr_reg[1]  ( .G(gray_req), .D(N172), .QN(n152) );
  TLATX1 \gray_addr_reg[0]  ( .G(gray_req), .D(N171), .QN(n150) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n113), .CK(clk), .RN(n272), .Q(n422), .QN(n384) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n114), .CK(clk), .RN(n272), .Q(n423), .QN(n147) );
  DFFSX2 \coorX_reg[0]  ( .D(n88), .CK(clk), .SN(n272), .Q(n415), .QN(n398) );
  DFFRX1 \coorX_reg[2]  ( .D(n105), .CK(clk), .RN(n272), .Q(n413), .QN(n376)
         );
  DFFSX2 \coorY_reg[0]  ( .D(n128), .CK(clk), .SN(n272), .Q(n409), .QN(n395)
         );
  TLATX1 \gray_addr_reg[11]  ( .G(gray_req), .D(N182), .QN(n140) );
  TLATX1 \gray_addr_reg[10]  ( .G(gray_req), .D(N181), .QN(n139) );
  TLATX1 \gray_addr_reg[3]  ( .G(gray_req), .D(N174), .QN(n138) );
  DFFRX1 \coorX_reg[6]  ( .D(n101), .CK(clk), .RN(n272), .Q(n410), .QN(n370)
         );
  CLKINVX1 U154 ( .A(n270), .Y(n259) );
  INVX1 U155 ( .A(n268), .Y(n257) );
  CLKINVX1 U156 ( .A(n135), .Y(n132) );
  BUFX2 U157 ( .A(n230), .Y(n135) );
  CLKINVX2 U158 ( .A(n132), .Y(n133) );
  INVX20 U159 ( .A(n132), .Y(gray_req) );
  INVXL U160 ( .A(gray_data[3]), .Y(n238) );
  AOI21XL U161 ( .A0(n239), .A1(center[2]), .B0(n358), .Y(n241) );
  INVXL U162 ( .A(gray_data[4]), .Y(n242) );
  INVXL U163 ( .A(gray_data[5]), .Y(n245) );
  NAND2XL U164 ( .A(n245), .B(n371), .Y(n246) );
  NOR2XL U165 ( .A(n415), .B(n202), .Y(n231) );
  NAND2XL U166 ( .A(n423), .B(n251), .Y(n252) );
  INVXL U167 ( .A(gray_data[2]), .Y(n358) );
  NAND2X1 U168 ( .A(n247), .B(n246), .Y(n248) );
  AO21X1 U169 ( .A0(gray_data[5]), .A1(n390), .B0(n244), .Y(n247) );
  OAI22X1 U170 ( .A0(n241), .A1(n240), .B0(gray_data[3]), .B1(n387), .Y(n243)
         );
  INVX8 U171 ( .A(reset), .Y(n272) );
  ACHCINX2 U172 ( .CIN(n248), .A(gray_data[6]), .B(n195), .CO(n250) );
  OAI2BB1X1 U173 ( .A0N(n386), .A1N(gray_data[1]), .B0(center[0]), .Y(n237) );
  NAND2X1 U174 ( .A(n228), .B(n270), .Y(n268) );
  AOI21X2 U175 ( .A0(n219), .A1(n218), .B0(n217), .Y(n220) );
  AND2X1 U176 ( .A(n232), .B(n408), .Y(n336) );
  AND2X1 U177 ( .A(n202), .B(n414), .Y(n345) );
  AND2X1 U178 ( .A(n202), .B(n412), .Y(n261) );
  INVX2 U179 ( .A(n228), .Y(n356) );
  INVX2 U180 ( .A(n364), .Y(n362) );
  AND2X1 U181 ( .A(n232), .B(n407), .Y(n254) );
  INVX1 U182 ( .A(n413), .Y(n145) );
  OAI22X1 U183 ( .A0(gray_data[0]), .A1(n237), .B0(gray_data[1]), .B1(n386), 
        .Y(n239) );
  NOR2BX1 U184 ( .AN(\DP_OP_45J1_122_504/n37 ), .B(n321), .Y(n327) );
  NAND2X1 U185 ( .A(fstate[1]), .B(n401), .Y(n229) );
  NOR2X1 U186 ( .A(fstate[1]), .B(n401), .Y(n227) );
  NAND2XL U187 ( .A(n202), .B(n415), .Y(n368) );
  NOR2BX1 U188 ( .AN(n327), .B(n326), .Y(n331) );
  NOR4XL U189 ( .A(n376), .B(n373), .C(n370), .D(n196), .Y(n197) );
  AND2X1 U190 ( .A(n232), .B(n406), .Y(n339) );
  AND2X1 U191 ( .A(n202), .B(n411), .Y(n354) );
  INVXL U192 ( .A(n368), .Y(n344) );
  INVXL U193 ( .A(n334), .Y(n335) );
  AND2X1 U194 ( .A(n232), .B(n405), .Y(n342) );
  AND2X1 U195 ( .A(n232), .B(\DP_OP_46J1_123_504/n35 ), .Y(n264) );
  NOR2X2 U196 ( .A(fstate[2]), .B(n229), .Y(n364) );
  OAI21XL U197 ( .A0(n201), .A1(n369), .B0(n200), .Y(n101) );
  NAND2BX1 U198 ( .AN(n370), .B(n369), .Y(n200) );
  XOR2X1 U199 ( .A(n199), .B(n198), .Y(n201) );
  NAND2BX1 U200 ( .AN(n370), .B(n202), .Y(n199) );
  AOI2BB2X1 U201 ( .B0(n203), .B1(n382), .A0N(n203), .A1N(n206), .Y(n129) );
  XNOR2X1 U202 ( .A(n136), .B(n205), .Y(n206) );
  NAND2XL U203 ( .A(n404), .B(n232), .Y(n136) );
  NAND3XL U204 ( .A(n401), .B(n402), .C(fstate[2]), .Y(n137) );
  NOR2X1 U205 ( .A(n376), .B(n291), .Y(n303) );
  NOR2X1 U206 ( .A(\DP_OP_45J1_122_504/n37 ), .B(n307), .Y(n330) );
  NOR2X1 U207 ( .A(lbp_addr[11]), .B(n285), .Y(n317) );
  NOR4X1 U208 ( .A(lbp_addr[2]), .B(lbp_addr[1]), .C(lbp_addr[0]), .D(
        lbp_addr[3]), .Y(n306) );
  NOR4X1 U209 ( .A(\DP_OP_46J1_123_504/n35 ), .B(lbp_addr[8]), .C(lbp_addr[7]), 
        .D(lbp_addr[10]), .Y(n280) );
  NOR3X1 U210 ( .A(counter[0]), .B(counter[1]), .C(counter[2]), .Y(n210) );
  NOR2BX2 U211 ( .AN(n218), .B(n207), .Y(n324) );
  AO21X1 U212 ( .A0(n315), .A1(n313), .B0(n310), .Y(n311) );
  INVX1 U213 ( .A(n220), .Y(n315) );
  NAND3X1 U214 ( .A(n359), .B(n383), .C(n218), .Y(n290) );
  NAND2X1 U215 ( .A(n423), .B(weight[0]), .Y(n271) );
  INVX12 U216 ( .A(n138), .Y(gray_addr[3]) );
  INVX12 U217 ( .A(n139), .Y(gray_addr[10]) );
  INVX12 U218 ( .A(n140), .Y(gray_addr[11]) );
  INVXL U219 ( .A(n326), .Y(n325) );
  AOI31X2 U220 ( .A0(n218), .A1(n209), .A2(n208), .B0(n217), .Y(n326) );
  INVX12 U221 ( .A(n137), .Y(finish) );
  INVX16 U222 ( .A(n395), .Y(lbp_addr[7]) );
  INVX16 U223 ( .A(n369), .Y(lbp_valid) );
  INVX16 U224 ( .A(n145), .Y(lbp_addr[2]) );
  INVX16 U225 ( .A(n398), .Y(lbp_addr[0]) );
  INVX16 U226 ( .A(n388), .Y(\DP_OP_46J1_123_504/n35 ) );
  INVX16 U227 ( .A(n389), .Y(\DP_OP_45J1_122_504/n37 ) );
  AOI221X1 U228 ( .A0(n366), .A1(n223), .B0(n222), .B1(n223), .C0(n227), .Y(
        n289) );
  NOR2X1 U229 ( .A(counter[2]), .B(n359), .Y(n366) );
  INVX12 U230 ( .A(n147), .Y(lbp_data[0]) );
  INVX12 U231 ( .A(n384), .Y(lbp_data[1]) );
  INVX12 U232 ( .A(n150), .Y(gray_addr[0]) );
  INVX12 U233 ( .A(n152), .Y(gray_addr[1]) );
  INVX12 U234 ( .A(n154), .Y(gray_addr[2]) );
  INVX12 U235 ( .A(n156), .Y(gray_addr[4]) );
  INVX12 U236 ( .A(n158), .Y(gray_addr[5]) );
  INVX12 U237 ( .A(n160), .Y(gray_addr[6]) );
  INVX12 U238 ( .A(n162), .Y(gray_addr[7]) );
  INVX12 U239 ( .A(n164), .Y(gray_addr[8]) );
  INVX12 U240 ( .A(n166), .Y(gray_addr[9]) );
  INVX12 U241 ( .A(n168), .Y(gray_addr[12]) );
  INVX12 U242 ( .A(n170), .Y(gray_addr[13]) );
  INVX12 U243 ( .A(n172), .Y(lbp_data[6]) );
  INVX12 U244 ( .A(n174), .Y(lbp_data[4]) );
  INVX12 U245 ( .A(n176), .Y(lbp_data[5]) );
  INVX12 U246 ( .A(n178), .Y(lbp_data[2]) );
  INVX12 U247 ( .A(n180), .Y(lbp_data[3]) );
  INVX16 U248 ( .A(n372), .Y(lbp_addr[12]) );
  INVX16 U249 ( .A(n196), .Y(lbp_addr[5]) );
  INVX12 U250 ( .A(n184), .Y(lbp_data[7]) );
  INVX12 U251 ( .A(n370), .Y(lbp_addr[6]) );
  AOI32XL U252 ( .A0(n333), .A1(n410), .A2(n329), .B0(n328), .B1(n370), .Y(
        N177) );
  INVX16 U253 ( .A(n375), .Y(lbp_addr[8]) );
  AOI21XL U254 ( .A0(lbp_addr[8]), .A1(n314), .B0(n282), .Y(n299) );
  INVX16 U255 ( .A(n373), .Y(lbp_addr[1]) );
  AOI21XL U256 ( .A0(lbp_addr[1]), .A1(n324), .B0(n273), .Y(n293) );
  INVX16 U257 ( .A(n385), .Y(lbp_addr[11]) );
  AOI21XL U258 ( .A0(lbp_addr[11]), .A1(n311), .B0(n317), .Y(n312) );
  INVX12 U259 ( .A(n382), .Y(lbp_addr[13]) );
  AOI32XL U260 ( .A0(n320), .A1(lbp_addr[13]), .A2(n319), .B0(n318), .B1(n382), 
        .Y(N184) );
  INVX16 U261 ( .A(n191), .Y(lbp_addr[3]) );
  INVX16 U262 ( .A(n193), .Y(lbp_addr[10]) );
  NAND2XL U263 ( .A(lbp_addr[10]), .B(n284), .Y(n313) );
  NAND2XL U264 ( .A(n228), .B(n362), .Y(n230) );
  INVXL U265 ( .A(gray_data[6]), .Y(n357) );
  OAI22XL U266 ( .A0(n239), .A1(center[2]), .B0(center[3]), .B1(n238), .Y(n240) );
  NOR2BX1 U267 ( .AN(n279), .B(n220), .Y(n316) );
  ADDHXL U268 ( .A(n336), .B(n335), .CO(n263), .S(n337) );
  NAND3X2 U269 ( .A(n412), .B(\DP_OP_45J1_122_504/n37 ), .C(n197), .Y(n202) );
  AND2X1 U270 ( .A(n202), .B(\DP_OP_45J1_122_504/n37 ), .Y(n351) );
  AND2X1 U271 ( .A(n202), .B(lbp_addr[2]), .Y(n348) );
  NAND3X4 U272 ( .A(n403), .B(n377), .C(fstate[1]), .Y(n369) );
  NAND2X2 U273 ( .A(lbp_valid), .B(n231), .Y(n203) );
  NOR4XL U274 ( .A(n375), .B(n382), .C(n372), .D(n385), .Y(n204) );
  NAND3X2 U275 ( .A(\DP_OP_46J1_123_504/n35 ), .B(n407), .C(n204), .Y(n232) );
  NAND2XL U276 ( .A(n232), .B(n409), .Y(n334) );
  NOR2X1 U277 ( .A(counter[3]), .B(n229), .Y(n218) );
  NOR2XL U278 ( .A(n397), .B(n383), .Y(n219) );
  NAND2X1 U279 ( .A(counter[0]), .B(counter[1]), .Y(n359) );
  AOI211XL U280 ( .A0(n219), .A1(n378), .B0(n210), .C0(n366), .Y(n207) );
  NAND3XL U281 ( .A(n324), .B(n373), .C(n398), .Y(n275) );
  OAI21XL U282 ( .A0(n378), .A1(n383), .B0(n397), .Y(n209) );
  OAI21XL U283 ( .A0(counter[0]), .A1(counter[2]), .B0(counter[1]), .Y(n208)
         );
  NAND2XL U284 ( .A(counter[3]), .B(n210), .Y(n236) );
  NOR2XL U285 ( .A(n229), .B(n236), .Y(n217) );
  NOR2XL U286 ( .A(lbp_addr[0]), .B(n326), .Y(n214) );
  INVXL U287 ( .A(n324), .Y(n305) );
  NOR2XL U288 ( .A(n359), .B(n383), .Y(n361) );
  INVXL U289 ( .A(n209), .Y(n212) );
  INVXL U290 ( .A(n210), .Y(n211) );
  OAI31XL U291 ( .A0(counter[3]), .A1(n361), .A2(n212), .B0(n211), .Y(n213) );
  AOI2BB1X1 U292 ( .A0N(n229), .A1N(n213), .B0(n227), .Y(n304) );
  OAI21XL U293 ( .A0(n305), .A1(n398), .B0(n304), .Y(n273) );
  OAI21XL U294 ( .A0(n214), .A1(n273), .B0(lbp_addr[1]), .Y(n216) );
  NAND3XL U295 ( .A(lbp_addr[0]), .B(n373), .C(n325), .Y(n215) );
  NAND3XL U296 ( .A(n275), .B(n216), .C(n215), .Y(N172) );
  INVX1 U297 ( .A(n290), .Y(n314) );
  NAND3XL U298 ( .A(n314), .B(n375), .C(n395), .Y(n297) );
  NOR2XL U299 ( .A(lbp_addr[7]), .B(n220), .Y(n224) );
  INVXL U300 ( .A(n229), .Y(n223) );
  NOR2XL U301 ( .A(counter[0]), .B(counter[1]), .Y(n221) );
  OAI22XL U302 ( .A0(counter[1]), .A1(n383), .B0(n221), .B1(n391), .Y(n222) );
  OAI21XL U303 ( .A0(n290), .A1(n395), .B0(n289), .Y(n282) );
  OAI21XL U304 ( .A0(n224), .A1(n282), .B0(lbp_addr[8]), .Y(n226) );
  NAND3XL U305 ( .A(lbp_addr[7]), .B(n375), .C(n315), .Y(n225) );
  NAND3XL U306 ( .A(n297), .B(n226), .C(n225), .Y(N179) );
  AOI32XL U307 ( .A0(n326), .A1(n398), .A2(n305), .B0(lbp_addr[0]), .B1(n304), 
        .Y(N171) );
  NAND2X2 U308 ( .A(n227), .B(n403), .Y(n228) );
  NAND3BX1 U309 ( .AN(n232), .B(n231), .C(n395), .Y(n233) );
  NOR2XL U310 ( .A(n369), .B(n233), .Y(N207) );
  NAND2XL U311 ( .A(lbp_valid), .B(n233), .Y(n235) );
  NAND4XL U312 ( .A(gray_ready), .B(n403), .C(n401), .D(n402), .Y(n234) );
  OAI211XL U313 ( .A0(n236), .A1(n362), .B0(n235), .C0(n234), .Y(n130) );
  AOI222XL U314 ( .A0(center[4]), .A1(n243), .B0(center[4]), .B1(n242), .C0(
        n243), .C1(n242), .Y(n244) );
  OAI2BB1X1 U315 ( .A0N(gray_data[7]), .A1N(n250), .B0(center[7]), .Y(n249) );
  OAI211X4 U316 ( .A0(gray_data[7]), .A1(n250), .B0(n364), .C0(n249), .Y(n270)
         );
  OAI21XL U317 ( .A0(n270), .A1(weight[0]), .B0(n268), .Y(n251) );
  OAI31XL U318 ( .A0(n423), .A1(n270), .A2(n392), .B0(n252), .Y(n114) );
  INVXL U319 ( .A(n203), .Y(n266) );
  ADDHXL U320 ( .A(n254), .B(n253), .CO(n338), .S(n255) );
  AO22X1 U321 ( .A0(n266), .A1(n255), .B0(n203), .B1(n407), .Y(n125) );
  AO22X1 U322 ( .A0(n259), .A1(\intadd_0/SUM[2] ), .B0(n257), .B1(n419), .Y(
        n110) );
  AO22X1 U323 ( .A0(n259), .A1(\intadd_0/SUM[4] ), .B0(n257), .B1(n417), .Y(
        n108) );
  AO22X1 U324 ( .A0(n259), .A1(\intadd_0/SUM[0] ), .B0(n257), .B1(n421), .Y(
        n112) );
  AO22X1 U325 ( .A0(n259), .A1(\intadd_0/SUM[1] ), .B0(n257), .B1(n420), .Y(
        n111) );
  AO22X1 U326 ( .A0(n259), .A1(\intadd_0/SUM[3] ), .B0(n257), .B1(n418), .Y(
        n109) );
  AOI2BB2X1 U327 ( .B0(\intadd_0/n1 ), .B1(weight[7]), .A0N(\intadd_0/n1 ), 
        .A1N(weight[7]), .Y(n256) );
  AOI2BB2X1 U328 ( .B0(n416), .B1(n256), .A0N(n416), .A1N(n256), .Y(n258) );
  AO22X1 U329 ( .A0(n259), .A1(n258), .B0(n257), .B1(n416), .Y(n107) );
  ADDHXL U330 ( .A(n261), .B(n260), .CO(n350), .S(n262) );
  AO22X1 U331 ( .A0(lbp_valid), .A1(n262), .B0(n369), .B1(n412), .Y(n104) );
  ADDHXL U332 ( .A(n264), .B(n263), .CO(n253), .S(n265) );
  OA22X1 U333 ( .A0(n266), .A1(\DP_OP_46J1_123_504/n35 ), .B0(n203), .B1(n265), 
        .Y(n126) );
  OAI22XL U334 ( .A0(weight[1]), .A1(n384), .B0(n374), .B1(n422), .Y(n267) );
  AOI2BB2X1 U335 ( .B0(n267), .B1(n271), .A0N(n267), .A1N(n271), .Y(n269) );
  OAI22XL U336 ( .A0(n270), .A1(n269), .B0(n268), .B1(n384), .Y(n113) );
  AOI222XL U337 ( .A0(n271), .A1(n374), .B0(n271), .B1(n384), .C0(n374), .C1(
        n384), .Y(\intadd_0/CI ) );
  NOR2XL U338 ( .A(n373), .B(n398), .Y(n274) );
  OAI21XL U339 ( .A0(n326), .A1(n274), .B0(n293), .Y(n277) );
  INVXL U340 ( .A(n274), .Y(n291) );
  OAI21XL U341 ( .A0(n326), .A1(n291), .B0(n275), .Y(n276) );
  AO22X1 U342 ( .A0(lbp_addr[2]), .A1(n277), .B0(n376), .B1(n276), .Y(N173) );
  NOR2XL U343 ( .A(n375), .B(n395), .Y(n300) );
  NAND2XL U344 ( .A(\DP_OP_46J1_123_504/n35 ), .B(n300), .Y(n286) );
  INVXL U345 ( .A(n286), .Y(n284) );
  NOR2XL U346 ( .A(n385), .B(n313), .Y(n279) );
  NOR2XL U347 ( .A(n220), .B(n279), .Y(n278) );
  OAI21XL U348 ( .A0(n280), .A1(n290), .B0(n289), .Y(n310) );
  AOI211XL U349 ( .A0(n314), .A1(lbp_addr[11]), .B0(n278), .C0(n310), .Y(n320)
         );
  NAND2XL U350 ( .A(n314), .B(n280), .Y(n285) );
  OAI21XL U351 ( .A0(n316), .A1(n317), .B0(n372), .Y(n281) );
  OAI21XL U352 ( .A0(n320), .A1(n372), .B0(n281), .Y(N183) );
  NAND2XL U353 ( .A(\DP_OP_46J1_123_504/n35 ), .B(n314), .Y(n283) );
  OAI211XL U354 ( .A0(n220), .A1(n284), .B0(n299), .C0(n283), .Y(n288) );
  OAI31XL U355 ( .A0(n220), .A1(lbp_addr[10]), .A2(n286), .B0(n285), .Y(n287)
         );
  AO21X1 U356 ( .A0(lbp_addr[10]), .A1(n288), .B0(n287), .Y(N181) );
  AOI32XL U357 ( .A0(n220), .A1(n395), .A2(n290), .B0(lbp_addr[7]), .B1(n289), 
        .Y(N178) );
  NAND2XL U358 ( .A(lbp_addr[2]), .B(n324), .Y(n292) );
  OAI211XL U359 ( .A0(n326), .A1(n303), .B0(n293), .C0(n292), .Y(n296) );
  INVXL U360 ( .A(n303), .Y(n294) );
  NAND2XL U361 ( .A(n324), .B(n306), .Y(n307) );
  OAI31XL U362 ( .A0(n326), .A1(lbp_addr[3]), .A2(n294), .B0(n307), .Y(n295)
         );
  AO21X1 U363 ( .A0(lbp_addr[3]), .A1(n296), .B0(n295), .Y(N174) );
  OAI2BB1XL U364 ( .A0N(n315), .A1N(n300), .B0(n297), .Y(n298) );
  INVXL U365 ( .A(n298), .Y(n302) );
  OAI21XL U366 ( .A0(n220), .A1(n300), .B0(n299), .Y(n301) );
  OAI2BB2XL U367 ( .B0(\DP_OP_46J1_123_504/n35 ), .B1(n302), .A0N(
        \DP_OP_46J1_123_504/n35 ), .A1N(n301), .Y(N180) );
  NAND2XL U368 ( .A(lbp_addr[3]), .B(n303), .Y(n321) );
  OAI21XL U369 ( .A0(n306), .A1(n305), .B0(n304), .Y(n322) );
  AO21X1 U370 ( .A0(n325), .A1(n321), .B0(n322), .Y(n308) );
  AOI21XL U371 ( .A0(\DP_OP_45J1_122_504/n37 ), .A1(n308), .B0(n330), .Y(n309)
         );
  OAI31XL U372 ( .A0(n326), .A1(\DP_OP_45J1_122_504/n37 ), .A2(n321), .B0(n309), .Y(N175) );
  OAI31XL U373 ( .A0(n220), .A1(lbp_addr[11]), .A2(n313), .B0(n312), .Y(N182)
         );
  OAI22XL U374 ( .A0(lbp_addr[12]), .A1(n315), .B0(n372), .B1(n314), .Y(n319)
         );
  OAI22XL U375 ( .A0(lbp_addr[12]), .A1(n317), .B0(n372), .B1(n316), .Y(n318)
         );
  NOR2XL U376 ( .A(n326), .B(n327), .Y(n323) );
  AOI211XL U377 ( .A0(n324), .A1(\DP_OP_45J1_122_504/n37 ), .B0(n323), .C0(
        n322), .Y(n333) );
  OAI22XL U378 ( .A0(lbp_addr[5]), .A1(n325), .B0(n196), .B1(n324), .Y(n329)
         );
  OAI22XL U379 ( .A0(lbp_addr[5]), .A1(n330), .B0(n196), .B1(n331), .Y(n328)
         );
  OAI21XL U380 ( .A0(n331), .A1(n330), .B0(n196), .Y(n332) );
  OAI21XL U381 ( .A0(n333), .A1(n196), .B0(n332), .Y(N176) );
  AOI2BB2X1 U382 ( .B0(n203), .B1(n395), .A0N(n203), .A1N(n334), .Y(n128) );
  AOI2BB2X1 U383 ( .B0(n203), .B1(n375), .A0N(n203), .A1N(n337), .Y(n127) );
  ADDHXL U384 ( .A(n339), .B(n338), .CO(n341), .S(n340) );
  AOI2BB2X1 U385 ( .B0(n203), .B1(n385), .A0N(n203), .A1N(n340), .Y(n124) );
  ADDHXL U386 ( .A(n342), .B(n341), .CO(n205), .S(n343) );
  AOI2BB2X1 U387 ( .B0(n203), .B1(n372), .A0N(n203), .A1N(n343), .Y(n123) );
  OAI21XL U388 ( .A0(n364), .A1(n392), .B0(n228), .Y(n122) );
  OAI22XL U389 ( .A0(n362), .A1(n392), .B0(n374), .B1(n133), .Y(n121) );
  OAI22XL U390 ( .A0(n362), .A1(n374), .B0(n133), .B1(n379), .Y(n120) );
  OAI22XL U391 ( .A0(n362), .A1(n379), .B0(n133), .B1(n393), .Y(n119) );
  OAI22XL U392 ( .A0(n362), .A1(n393), .B0(n133), .B1(n380), .Y(n118) );
  OAI22XL U393 ( .A0(n362), .A1(n380), .B0(n133), .B1(n394), .Y(n117) );
  OAI22XL U394 ( .A0(n362), .A1(n394), .B0(n133), .B1(n381), .Y(n116) );
  OAI22XL U395 ( .A0(n362), .A1(n381), .B0(n396), .B1(n133), .Y(n115) );
  ADDHXL U396 ( .A(n345), .B(n344), .CO(n347), .S(n346) );
  AOI2BB2X1 U397 ( .B0(n369), .B1(n373), .A0N(n369), .A1N(n346), .Y(n106) );
  ADDHXL U398 ( .A(n348), .B(n347), .CO(n260), .S(n349) );
  AOI2BB2X1 U399 ( .B0(n369), .B1(n376), .A0N(n369), .A1N(n349), .Y(n105) );
  ADDHXL U400 ( .A(n351), .B(n350), .CO(n353), .S(n352) );
  OA22X1 U401 ( .A0(lbp_valid), .A1(\DP_OP_45J1_122_504/n37 ), .B0(n369), .B1(
        n352), .Y(n103) );
  ADDHXL U402 ( .A(n354), .B(n353), .CO(n198), .S(n355) );
  AOI2BB2X1 U403 ( .B0(n369), .B1(n196), .A0N(n369), .A1N(n355), .Y(n102) );
  AO22X1 U404 ( .A0(n356), .A1(gray_data[0]), .B0(n228), .B1(center[0]), .Y(
        n100) );
  AO22X1 U405 ( .A0(n356), .A1(gray_data[7]), .B0(n228), .B1(center[7]), .Y(
        n99) );
  AOI2BB2X1 U406 ( .B0(n356), .B1(n357), .A0N(n356), .A1N(center[6]), .Y(n98)
         );
  AO22X1 U407 ( .A0(n228), .A1(n371), .B0(n356), .B1(gray_data[5]), .Y(n97) );
  AO22X1 U408 ( .A0(n356), .A1(gray_data[4]), .B0(n228), .B1(center[4]), .Y(
        n96) );
  AO22X1 U409 ( .A0(n228), .A1(center[3]), .B0(n356), .B1(gray_data[3]), .Y(
        n95) );
  AOI2BB2X1 U410 ( .B0(n356), .B1(n358), .A0N(n356), .A1N(center[2]), .Y(n94)
         );
  AOI2BB2X1 U411 ( .B0(n228), .B1(n386), .A0N(n228), .A1N(gray_data[1]), .Y(
        n93) );
  NOR2XL U412 ( .A(n362), .B(n378), .Y(n360) );
  OAI2BB1XL U413 ( .A0N(n391), .A1N(n359), .B0(n364), .Y(n367) );
  OA21XL U414 ( .A0(counter[1]), .A1(n360), .B0(n367), .Y(n92) );
  NOR2XL U415 ( .A(counter[3]), .B(n362), .Y(n365) );
  AO22X1 U416 ( .A0(counter[3]), .A1(n362), .B0(n365), .B1(n361), .Y(n91) );
  OAI211XL U417 ( .A0(n366), .A1(n378), .B0(n364), .C0(n391), .Y(n363) );
  OAI21XL U418 ( .A0(n364), .A1(n378), .B0(n363), .Y(n90) );
  AO22X1 U419 ( .A0(counter[2]), .A1(n367), .B0(n366), .B1(n365), .Y(n89) );
  AOI2BB2X1 U420 ( .B0(n369), .B1(n398), .A0N(n369), .A1N(n368), .Y(n88) );
endmodule

