/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06
// Date      : Sun Feb 19 23:18:24 2023
/////////////////////////////////////////////////////////////


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   N769, N770, N771, N772, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n209, n210, n211, n212,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551;
  wire   [3:0] fstate;
  wire   [3:0] counter;
  wire   [7:0] minimum;

  DFFRX1 \minimum_reg[0]  ( .D(n183), .CK(clk), .RN(reset), .Q(minimum[0]) );
  DFFSX1 \counter_reg[0]  ( .D(n200), .CK(clk), .SN(reset), .Q(counter[0]), 
        .QN(n533) );
  DFFSX1 \counter_reg[1]  ( .D(n199), .CK(clk), .SN(reset), .Q(counter[1]), 
        .QN(n526) );
  DFFSX1 \counter_reg[3]  ( .D(n201), .CK(clk), .SN(reset), .Q(counter[3]), 
        .QN(n531) );
  DFFSX1 \counter_reg[2]  ( .D(n198), .CK(clk), .SN(reset), .Q(counter[2]), 
        .QN(n218) );
  DFFRX1 \minimum_reg[6]  ( .D(n181), .CK(clk), .RN(reset), .Q(minimum[6]), 
        .QN(n523) );
  DFFRX1 \minimum_reg[7]  ( .D(n182), .CK(clk), .RN(reset), .Q(minimum[7]), 
        .QN(n525) );
  DFFRX1 \minimum_reg[5]  ( .D(n180), .CK(clk), .RN(reset), .Q(minimum[5]), 
        .QN(n521) );
  DFFRX1 \minimum_reg[2]  ( .D(n177), .CK(clk), .RN(n550), .Q(minimum[2]), 
        .QN(n529) );
  DFFRX1 \minimum_reg[4]  ( .D(n179), .CK(clk), .RN(reset), .Q(minimum[4]), 
        .QN(n522) );
  DFFRX1 \minimum_reg[3]  ( .D(n178), .CK(clk), .RN(n550), .Q(minimum[3]), 
        .QN(n528) );
  DFFRX1 \minimum_reg[1]  ( .D(n176), .CK(clk), .RN(n550), .Q(minimum[1]), 
        .QN(n527) );
  DFFRX1 \sti_addr_reg[0]  ( .D(n175), .CK(clk), .RN(n550), .QN(n209) );
  DFFRX1 \res_addr_reg[2]  ( .D(n195), .CK(clk), .RN(n551), .QN(n545) );
  DFFRX1 \res_addr_reg[6]  ( .D(n191), .CK(clk), .RN(n551), .QN(n544) );
  DFFRX1 \res_addr_reg[3]  ( .D(n194), .CK(clk), .RN(n551), .QN(n538) );
  DFFRX1 \res_addr_reg[5]  ( .D(n192), .CK(clk), .RN(n551), .QN(n537) );
  DFFRX1 \fstate_reg[2]  ( .D(N771), .CK(clk), .RN(n551), .Q(fstate[2]), .QN(
        n519) );
  DFFRX1 \fstate_reg[1]  ( .D(N770), .CK(clk), .RN(n551), .Q(fstate[1]), .QN(
        n520) );
  DFFRX1 \fstate_reg[0]  ( .D(N769), .CK(clk), .RN(n551), .Q(fstate[0]), .QN(
        n518) );
  DFFRX2 \res_addr_reg[4]  ( .D(n193), .CK(clk), .RN(n551), .Q(res_addr[4]), 
        .QN(n541) );
  DFFRX2 \res_addr_reg[7]  ( .D(n190), .CK(clk), .RN(n551), .Q(res_addr[7]), 
        .QN(n536) );
  DFFRX2 \res_addr_reg[1]  ( .D(n196), .CK(clk), .RN(n551), .Q(res_addr[1]), 
        .QN(n539) );
  DFFRX2 \sti_addr_reg[2]  ( .D(n167), .CK(clk), .RN(n551), .Q(sti_addr[2]) );
  DFFRX2 \res_addr_reg[10]  ( .D(n187), .CK(clk), .RN(reset), .Q(res_addr[10]), 
        .QN(n547) );
  DFFRX2 \fstate_reg[3]  ( .D(N772), .CK(clk), .RN(reset), .Q(fstate[3]), .QN(
        n524) );
  DFFRX2 \sti_addr_reg[9]  ( .D(n174), .CK(clk), .RN(n550), .Q(sti_addr[9]) );
  DFFRX2 \sti_addr_reg[3]  ( .D(n168), .CK(clk), .RN(n550), .Q(sti_addr[3]) );
  DFFRX2 \sti_addr_reg[5]  ( .D(n170), .CK(clk), .RN(n550), .Q(sti_addr[5]) );
  DFFRX2 \sti_addr_reg[7]  ( .D(n172), .CK(clk), .RN(n550), .Q(sti_addr[7]) );
  DFFRX2 \sti_addr_reg[1]  ( .D(n166), .CK(clk), .RN(n550), .Q(sti_addr[1]), 
        .QN(n530) );
  DFFRX2 \sti_addr_reg[4]  ( .D(n169), .CK(clk), .RN(n550), .Q(sti_addr[4]), 
        .QN(n532) );
  DFFRX2 \sti_addr_reg[6]  ( .D(n171), .CK(clk), .RN(reset), .Q(sti_addr[6]), 
        .QN(n534) );
  DFFRX2 \sti_addr_reg[8]  ( .D(n173), .CK(clk), .RN(n550), .Q(sti_addr[8]), 
        .QN(n535) );
  DFFRX2 \res_addr_reg[9]  ( .D(n188), .CK(clk), .RN(reset), .Q(res_addr[9]), 
        .QN(n540) );
  DFFRX2 \res_addr_reg[8]  ( .D(n189), .CK(clk), .RN(reset), .Q(res_addr[8]), 
        .QN(n542) );
  DFFRX2 \res_addr_reg[13]  ( .D(n184), .CK(clk), .RN(n551), .Q(res_addr[13]), 
        .QN(n549) );
  DFFRX2 \res_addr_reg[11]  ( .D(n186), .CK(clk), .RN(reset), .Q(res_addr[11]), 
        .QN(n543) );
  DFFRX2 \res_addr_reg[12]  ( .D(n185), .CK(clk), .RN(reset), .Q(res_addr[12]), 
        .QN(n548) );
  DFFRX2 \res_addr_reg[0]  ( .D(n197), .CK(clk), .RN(n551), .Q(res_addr[0]), 
        .QN(n546) );
  OAI211X1 U226 ( .A0(n443), .A1(n540), .B0(n361), .C0(n441), .Y(n188) );
  INVX4 U227 ( .A(n512), .Y(n509) );
  CLKINVX1 U228 ( .A(n427), .Y(n416) );
  AOI21X1 U229 ( .A0(n415), .A1(n414), .B0(n413), .Y(n424) );
  NAND2X1 U230 ( .A(n410), .B(n414), .Y(n421) );
  NOR2X1 U231 ( .A(n409), .B(n408), .Y(n414) );
  NAND2X1 U232 ( .A(n355), .B(res_addr[2]), .Y(n348) );
  AOI2BB2X1 U233 ( .B0(n462), .B1(res_di[7]), .A0N(n462), .A1N(res_di[7]), .Y(
        n484) );
  NAND2X1 U234 ( .A(n488), .B(n308), .Y(n354) );
  NAND2X1 U235 ( .A(n452), .B(n299), .Y(n488) );
  ADDHXL U236 ( .A(res_di[3]), .B(n464), .CO(n473), .S(n470) );
  NOR2X1 U237 ( .A(res_di[1]), .B(res_di[2]), .Y(n242) );
  NOR2X1 U238 ( .A(res_di[0]), .B(res_di[7]), .Y(n240) );
  ADDHX1 U239 ( .A(res_di[1]), .B(res_di[0]), .CO(n467), .S(n465) );
  INVXL U240 ( .A(n321), .Y(n307) );
  NAND2XL U241 ( .A(n218), .B(n268), .Y(n321) );
  NAND2XL U242 ( .A(n435), .B(res_addr[0]), .Y(n330) );
  NAND2XL U243 ( .A(n435), .B(res_addr[12]), .Y(n432) );
  INVXL U244 ( .A(n328), .Y(n319) );
  NAND2XL U245 ( .A(n355), .B(res_addr[3]), .Y(n349) );
  XOR2X1 U246 ( .A(n310), .B(n435), .Y(n334) );
  NAND2XL U247 ( .A(n391), .B(n412), .Y(n392) );
  NAND2XL U248 ( .A(n381), .B(n380), .Y(n382) );
  XNOR2X1 U249 ( .A(n393), .B(n392), .Y(n394) );
  NAND2XL U250 ( .A(n295), .B(n524), .Y(n314) );
  NOR2XL U251 ( .A(n282), .B(fstate[3]), .Y(n221) );
  INVXL U252 ( .A(n470), .Y(n498) );
  AND2X1 U253 ( .A(n286), .B(n221), .Y(n278) );
  OAI211XL U254 ( .A0(n443), .A1(n546), .B0(n317), .C0(n441), .Y(n197) );
  INVXL U255 ( .A(n423), .Y(n210) );
  NAND2X4 U256 ( .A(n492), .B(n524), .Y(n512) );
  NAND3X2 U257 ( .A(n487), .B(n486), .C(n485), .Y(n489) );
  NAND2X1 U258 ( .A(n340), .B(n349), .Y(n341) );
  NAND2X1 U259 ( .A(n339), .B(n348), .Y(n335) );
  NAND2X1 U260 ( .A(n380), .B(n376), .Y(n350) );
  INVX1 U261 ( .A(n345), .Y(n340) );
  INVX1 U262 ( .A(n396), .Y(n390) );
  INVX1 U263 ( .A(n388), .Y(n389) );
  NAND2X1 U264 ( .A(n435), .B(res_addr[11]), .Y(n422) );
  CLKINVX1 U265 ( .A(n484), .Y(n508) );
  OAI211X1 U266 ( .A0(n443), .A1(n549), .B0(n442), .C0(n441), .Y(n184) );
  OAI211X1 U267 ( .A0(n443), .A1(n543), .B0(n420), .C0(n441), .Y(n186) );
  AOI22X1 U268 ( .A0(n513), .A1(res_di[0]), .B0(minimum[0]), .B1(n512), .Y(
        n514) );
  XNOR2X1 U269 ( .A(n438), .B(n437), .Y(n440) );
  XNOR2X1 U270 ( .A(n383), .B(n382), .Y(n384) );
  OAI211X1 U271 ( .A0(n443), .A1(n545), .B0(n337), .C0(n441), .Y(n195) );
  XNOR2X1 U272 ( .A(n359), .B(n358), .Y(n360) );
  XNOR2X1 U273 ( .A(n418), .B(n417), .Y(n419) );
  XNOR2X1 U274 ( .A(n366), .B(n365), .Y(n367) );
  XOR2X1 U275 ( .A(n416), .B(n405), .Y(n406) );
  OAI211X1 U276 ( .A0(n443), .A1(n539), .B0(n327), .C0(n441), .Y(n196) );
  NAND2X1 U277 ( .A(n364), .B(n363), .Y(n365) );
  NAND2X1 U278 ( .A(n210), .B(n422), .Y(n417) );
  NAND2X1 U279 ( .A(n404), .B(n403), .Y(n405) );
  NAND2X1 U280 ( .A(n372), .B(n376), .Y(n373) );
  NAND2X1 U281 ( .A(n428), .B(n432), .Y(n429) );
  NAND2X1 U282 ( .A(n397), .B(n396), .Y(n398) );
  INVX1 U283 ( .A(n377), .Y(n372) );
  NAND2X1 U284 ( .A(n387), .B(n388), .Y(n358) );
  NAND2X1 U285 ( .A(n219), .B(n436), .Y(n437) );
  INVX1 U286 ( .A(n433), .Y(n428) );
  INVX1 U287 ( .A(n408), .Y(n391) );
  NOR2X1 U288 ( .A(n435), .B(res_addr[0]), .Y(n328) );
  INVX3 U289 ( .A(n278), .Y(n222) );
  NOR2X1 U290 ( .A(n435), .B(res_addr[11]), .Y(n423) );
  OR2X1 U291 ( .A(n435), .B(res_addr[13]), .Y(n219) );
  NOR2X1 U292 ( .A(n435), .B(res_addr[8]), .Y(n386) );
  NOR2X1 U293 ( .A(n435), .B(res_addr[12]), .Y(n433) );
  NOR2X1 U294 ( .A(n435), .B(res_addr[9]), .Y(n357) );
  INVX1 U295 ( .A(n354), .Y(n305) );
  NOR2X1 U296 ( .A(n521), .B(n476), .Y(n478) );
  NOR2X1 U297 ( .A(fstate[1]), .B(fstate[3]), .Y(n284) );
  OAI211X1 U298 ( .A0(n443), .A1(n548), .B0(n431), .C0(n441), .Y(n185) );
  OAI211X1 U299 ( .A0(n443), .A1(n538), .B0(n344), .C0(n441), .Y(n194) );
  NAND2X1 U300 ( .A(n430), .B(n439), .Y(n431) );
  OAI211X1 U301 ( .A0(n443), .A1(n541), .B0(n375), .C0(n441), .Y(n193) );
  NAND2X1 U302 ( .A(n343), .B(n439), .Y(n344) );
  NAND2X1 U303 ( .A(n374), .B(n439), .Y(n375) );
  NAND2X1 U304 ( .A(n336), .B(n439), .Y(n337) );
  OAI21X1 U305 ( .A0(n416), .A1(n421), .B0(n424), .Y(n418) );
  OAI21X1 U306 ( .A0(n416), .A1(n402), .B0(n403), .Y(n366) );
  OAI211X2 U307 ( .A0(n491), .A1(n490), .B0(n489), .C0(n488), .Y(n492) );
  NOR2X1 U308 ( .A(n421), .B(n423), .Y(n426) );
  NAND2X1 U309 ( .A(n326), .B(n439), .Y(n327) );
  OAI21X1 U310 ( .A0(n424), .A1(n423), .B0(n422), .Y(n425) );
  AOI21X1 U311 ( .A0(n371), .A1(n339), .B0(n338), .Y(n342) );
  NAND2X1 U312 ( .A(n316), .B(n439), .Y(n317) );
  NAND2X1 U313 ( .A(n370), .B(n347), .Y(n352) );
  INVX1 U314 ( .A(n346), .Y(n339) );
  NOR2X1 U315 ( .A(n331), .B(n328), .Y(n333) );
  INVX1 U316 ( .A(n379), .Y(n381) );
  INVX1 U317 ( .A(n402), .Y(n404) );
  NAND2X1 U318 ( .A(n349), .B(n348), .Y(n369) );
  INVX1 U319 ( .A(n362), .Y(n364) );
  NAND2X1 U320 ( .A(n355), .B(res_addr[4]), .Y(n376) );
  NAND2X1 U321 ( .A(n281), .B(sti_addr[7]), .Y(n280) );
  INVX1 U322 ( .A(n386), .Y(n397) );
  NAND2X1 U323 ( .A(n261), .B(sti_addr[5]), .Y(n260) );
  OAI211X1 U324 ( .A0(fstate[2]), .A1(n520), .B0(n294), .C0(n493), .Y(n295) );
  INVX1 U325 ( .A(n476), .Y(n503) );
  INVX1 U326 ( .A(n485), .Y(n282) );
  NAND3X1 U327 ( .A(sti_addr[2]), .B(n517), .C(sti_addr[3]), .Y(n259) );
  INVX1 U328 ( .A(n445), .Y(n299) );
  NAND2X1 U329 ( .A(n302), .B(n301), .Y(n312) );
  NOR2X1 U330 ( .A(n298), .B(n297), .Y(n303) );
  INVX1 U331 ( .A(n306), .Y(n451) );
  INVX1 U332 ( .A(n298), .Y(n291) );
  NAND2X1 U333 ( .A(n298), .B(n264), .Y(n450) );
  INVX2 U334 ( .A(n444), .Y(done) );
  NAND2X1 U335 ( .A(sti_rd), .B(sti_addr[0]), .Y(n238) );
  NOR2X1 U336 ( .A(n519), .B(fstate[0]), .Y(n220) );
  INVX2 U337 ( .A(n209), .Y(sti_addr[0]) );
  NOR2X1 U338 ( .A(n518), .B(n519), .Y(n285) );
  NOR2X1 U339 ( .A(n390), .B(n389), .Y(n411) );
  XOR2X1 U340 ( .A(n399), .B(n398), .Y(n400) );
  AOI21X1 U341 ( .A0(n427), .A1(n410), .B0(n415), .Y(n399) );
  AOI21X1 U342 ( .A0(n427), .A1(n426), .B0(n425), .Y(n434) );
  OAI21X2 U343 ( .A0(n353), .A1(n352), .B0(n351), .Y(n427) );
  NAND2X1 U344 ( .A(n355), .B(res_addr[5]), .Y(n380) );
  XOR2X4 U345 ( .A(n435), .B(n322), .Y(n355) );
  NOR2X1 U346 ( .A(n377), .B(n379), .Y(n347) );
  AOI21X1 U347 ( .A0(n371), .A1(n370), .B0(n369), .Y(n378) );
  INVX3 U348 ( .A(n353), .Y(n371) );
  NOR2XL U349 ( .A(n528), .B(n470), .Y(n472) );
  AOI211XL U350 ( .A0(n286), .A1(sti_di[4]), .B0(n274), .C0(n273), .Y(n275) );
  NOR2X1 U351 ( .A(n530), .B(n238), .Y(n517) );
  INVXL U352 ( .A(n452), .Y(n455) );
  NOR2XL U353 ( .A(n488), .B(n447), .Y(n449) );
  INVXL U354 ( .A(sti_di[10]), .Y(n271) );
  OAI21X1 U355 ( .A0(n362), .A1(n403), .B0(n363), .Y(n415) );
  NOR2X1 U356 ( .A(n362), .B(n402), .Y(n410) );
  NAND2X1 U357 ( .A(n397), .B(n387), .Y(n409) );
  XOR2X1 U358 ( .A(n354), .B(n435), .Y(n356) );
  NOR2X1 U359 ( .A(n356), .B(res_addr[7]), .Y(n362) );
  NOR2X1 U360 ( .A(n346), .B(n345), .Y(n370) );
  NOR2X1 U361 ( .A(n355), .B(res_addr[5]), .Y(n379) );
  NOR2X1 U362 ( .A(n355), .B(res_addr[4]), .Y(n377) );
  NOR2X1 U363 ( .A(n355), .B(res_addr[3]), .Y(n345) );
  NOR2X1 U364 ( .A(n355), .B(res_addr[6]), .Y(n402) );
  NOR2X1 U365 ( .A(n355), .B(res_addr[2]), .Y(n346) );
  AOI21X1 U366 ( .A0(n334), .A1(n333), .B0(n332), .Y(n353) );
  OAI21XL U367 ( .A0(n331), .A1(n330), .B0(n329), .Y(n332) );
  INVXL U368 ( .A(n300), .Y(n302) );
  NOR2XL U369 ( .A(n291), .B(counter[3]), .Y(n292) );
  INVXL U370 ( .A(n491), .Y(n255) );
  OAI21X1 U371 ( .A0(minimum[7]), .A1(n508), .B0(n482), .Y(n483) );
  OAI21X1 U372 ( .A0(n434), .A1(n433), .B0(n432), .Y(n438) );
  NAND2X1 U373 ( .A(n435), .B(res_addr[9]), .Y(n388) );
  OAI21X1 U374 ( .A0(n399), .A1(n386), .B0(n396), .Y(n359) );
  OAI21X1 U375 ( .A0(n399), .A1(n409), .B0(n411), .Y(n393) );
  NAND2XL U376 ( .A(n323), .B(n329), .Y(n324) );
  OAI21XL U377 ( .A0(n378), .A1(n377), .B0(n376), .Y(n383) );
  INVXL U378 ( .A(n348), .Y(n338) );
  NAND2X1 U379 ( .A(n355), .B(res_addr[6]), .Y(n403) );
  INVXL U380 ( .A(n465), .Y(n494) );
  ADDHX1 U381 ( .A(res_di[4]), .B(n473), .CO(n463), .S(n500) );
  BUFX2 U382 ( .A(counter[2]), .Y(n296) );
  OAI31XL U383 ( .A0(n277), .A1(n276), .A2(n533), .B0(n275), .Y(n279) );
  AOI211XL U384 ( .A0(n486), .A1(sti_di[3]), .B0(n526), .C0(n263), .Y(n277) );
  AOI211XL U385 ( .A0(n486), .A1(sti_di[1]), .B0(counter[1]), .C0(n266), .Y(
        n276) );
  XNOR2X1 U386 ( .A(n334), .B(n311), .Y(n316) );
  XOR2X1 U387 ( .A(n434), .B(n429), .Y(n430) );
  AND2X1 U388 ( .A(sti_addr[2]), .B(n517), .Y(n258) );
  XOR2X1 U389 ( .A(n325), .B(n324), .Y(n326) );
  AOI21XL U390 ( .A0(n334), .A1(n319), .B0(n318), .Y(n325) );
  XOR2X1 U391 ( .A(n378), .B(n373), .Y(n374) );
  AOI211XL U392 ( .A0(n459), .A1(n458), .B0(n457), .C0(n456), .Y(n460) );
  AOI211XL U393 ( .A0(n451), .A1(n450), .B0(n449), .C0(n448), .Y(n461) );
  AOI211XL U394 ( .A0(n459), .A1(n490), .B0(n256), .C0(n456), .Y(n257) );
  NOR2XL U395 ( .A(n452), .B(n454), .Y(n290) );
  XOR2X1 U396 ( .A(n342), .B(n341), .Y(n343) );
  XNOR2X1 U397 ( .A(n371), .B(n335), .Y(n336) );
  OAI222XL U398 ( .A0(n511), .A1(n495), .B0(n527), .B1(n509), .C0(n494), .C1(
        n515), .Y(n176) );
  INVXL U399 ( .A(res_di[1]), .Y(n495) );
  OAI222XL U400 ( .A0(n511), .A1(n499), .B0(n528), .B1(n509), .C0(n498), .C1(
        n515), .Y(n178) );
  INVXL U401 ( .A(res_di[3]), .Y(n499) );
  OAI222XL U402 ( .A0(n511), .A1(n502), .B0(n522), .B1(n509), .C0(n501), .C1(
        n515), .Y(n179) );
  INVXL U403 ( .A(res_di[4]), .Y(n502) );
  INVXL U404 ( .A(n500), .Y(n501) );
  OAI222XL U405 ( .A0(n511), .A1(n497), .B0(n529), .B1(n509), .C0(n211), .C1(
        n515), .Y(n177) );
  OAI222XL U406 ( .A0(n511), .A1(n504), .B0(n521), .B1(n509), .C0(n503), .C1(
        n515), .Y(n180) );
  INVXL U407 ( .A(res_di[5]), .Y(n504) );
  INVXL U408 ( .A(res_di[7]), .Y(n510) );
  OAI222XL U409 ( .A0(n511), .A1(n507), .B0(n523), .B1(n509), .C0(n506), .C1(
        n515), .Y(n181) );
  INVXL U410 ( .A(res_di[6]), .Y(n507) );
  INVXL U411 ( .A(n505), .Y(n506) );
  OAI21XL U412 ( .A0(res_di[0]), .A1(n515), .B0(n514), .Y(n183) );
  OAI22X4 U413 ( .A0(n452), .A1(n445), .B0(n303), .B1(n306), .Y(n313) );
  NOR2X4 U414 ( .A(n355), .B(res_addr[1]), .Y(n331) );
  OAI21X1 U415 ( .A0(fstate[1]), .A1(n255), .B0(n524), .Y(n236) );
  CLKINVX1 U416 ( .A(n357), .Y(n387) );
  CLKINVX1 U417 ( .A(n496), .Y(n211) );
  CLKINVX1 U418 ( .A(n211), .Y(n212) );
  CLKBUFX3 U419 ( .A(reset), .Y(n551) );
  NAND2X4 U420 ( .A(n285), .B(n284), .Y(n441) );
  NAND2X1 U421 ( .A(n435), .B(res_addr[8]), .Y(n396) );
  INVX3 U422 ( .A(n544), .Y(res_addr[6]) );
  INVX3 U423 ( .A(n545), .Y(res_addr[2]) );
  INVX3 U424 ( .A(n538), .Y(res_addr[3]) );
  INVX3 U425 ( .A(n537), .Y(res_addr[5]) );
  NAND2BX2 U426 ( .AN(n459), .B(n222), .Y(res_wr) );
  NOR4X4 U427 ( .A(fstate[1]), .B(fstate[3]), .C(fstate[2]), .D(n518), .Y(
        sti_rd) );
  NAND2XL U428 ( .A(n319), .B(n330), .Y(n311) );
  INVXL U429 ( .A(n330), .Y(n318) );
  NOR2X1 U430 ( .A(n435), .B(res_addr[10]), .Y(n408) );
  NAND2X1 U431 ( .A(n355), .B(res_addr[1]), .Y(n329) );
  NAND2X1 U432 ( .A(n356), .B(res_addr[7]), .Y(n363) );
  NAND2XL U433 ( .A(n435), .B(res_addr[13]), .Y(n436) );
  NAND2XL U434 ( .A(n435), .B(res_addr[10]), .Y(n412) );
  NOR2XL U435 ( .A(n527), .B(n465), .Y(n466) );
  OAI22XL U436 ( .A0(n466), .A1(res_di[0]), .B0(minimum[1]), .B1(n494), .Y(
        n469) );
  OAI22XL U437 ( .A0(n478), .A1(n477), .B0(minimum[5]), .B1(n503), .Y(n481) );
  NAND2XL U438 ( .A(n412), .B(n411), .Y(n413) );
  AOI32XL U439 ( .A0(n298), .A1(n218), .A2(sti_di[8]), .B0(n296), .B1(n269), 
        .Y(n270) );
  INVXL U440 ( .A(n331), .Y(n323) );
  NOR2XL U441 ( .A(res_addr[1]), .B(res_addr[13]), .Y(n249) );
  OAI211XL U442 ( .A0(n298), .A1(n301), .B0(n229), .C0(n228), .Y(n233) );
  INVXL U443 ( .A(res_di[2]), .Y(n497) );
  NAND2XL U444 ( .A(n233), .B(n296), .Y(n230) );
  OAI211XL U445 ( .A0(n290), .A1(n453), .B0(n441), .C0(n289), .Y(N771) );
  OAI222XL U446 ( .A0(n511), .A1(n510), .B0(n525), .B1(n509), .C0(n508), .C1(
        n515), .Y(n182) );
  NOR2X1 U447 ( .A(n259), .B(n532), .Y(n261) );
  NOR2X1 U448 ( .A(n260), .B(n534), .Y(n281) );
  NOR2X1 U449 ( .A(n280), .B(n535), .Y(n516) );
  AOI21XL U450 ( .A0(n280), .A1(n535), .B0(n516), .Y(n173) );
  NAND4XL U451 ( .A(n520), .B(n519), .C(n518), .D(fstate[3]), .Y(n444) );
  NOR2X1 U452 ( .A(n520), .B(fstate[0]), .Y(n293) );
  NAND2X1 U453 ( .A(n293), .B(n519), .Y(n301) );
  NOR2X1 U454 ( .A(n301), .B(fstate[3]), .Y(n459) );
  NOR2X2 U455 ( .A(counter[0]), .B(counter[1]), .Y(n298) );
  NOR2X1 U456 ( .A(counter[3]), .B(n218), .Y(n264) );
  CLKINVX1 U457 ( .A(n450), .Y(n286) );
  NAND2X1 U458 ( .A(n285), .B(fstate[1]), .Y(n306) );
  NAND2X1 U459 ( .A(n520), .B(n220), .Y(n491) );
  NAND2X2 U460 ( .A(n306), .B(n491), .Y(n485) );
  AOI21XL U461 ( .A0(n530), .A1(n238), .B0(n517), .Y(n166) );
  AOI21XL U462 ( .A0(n260), .A1(n534), .B0(n281), .Y(n171) );
  BUFX2 U463 ( .A(reset), .Y(n550) );
  NOR2X2 U464 ( .A(n222), .B(n522), .Y(res_do[4]) );
  NOR2X2 U465 ( .A(n222), .B(n528), .Y(res_do[3]) );
  NOR2X2 U466 ( .A(n222), .B(n521), .Y(res_do[5]) );
  NOR2X2 U467 ( .A(n222), .B(n523), .Y(res_do[6]) );
  NOR2X2 U468 ( .A(n222), .B(n527), .Y(res_do[1]) );
  NOR2X2 U469 ( .A(n222), .B(n529), .Y(res_do[2]) );
  NOR2X2 U470 ( .A(n222), .B(n525), .Y(res_do[7]) );
  NAND2XL U471 ( .A(counter[1]), .B(counter[0]), .Y(n227) );
  OA21XL U472 ( .A0(n236), .A1(n291), .B0(n227), .Y(n224) );
  CLKINVX1 U473 ( .A(n236), .Y(n229) );
  NOR2BX1 U474 ( .AN(counter[1]), .B(counter[0]), .Y(n268) );
  AOI31XL U475 ( .A0(counter[0]), .A1(n229), .A2(n526), .B0(n268), .Y(n223) );
  OAI222XL U476 ( .A0(n301), .A1(n224), .B0(n526), .B1(n229), .C0(n223), .C1(
        n282), .Y(n199) );
  INVXL U477 ( .A(n301), .Y(n234) );
  OAI211XL U478 ( .A0(n485), .A1(n234), .B0(n533), .C0(n229), .Y(n225) );
  OAI21XL U479 ( .A0(n533), .A1(n229), .B0(n225), .Y(n200) );
  NOR2XL U480 ( .A(n282), .B(n227), .Y(n232) );
  NOR2XL U481 ( .A(n291), .B(n301), .Y(n226) );
  OAI21XL U482 ( .A0(n232), .A1(n226), .B0(n229), .Y(n231) );
  NAND2XL U483 ( .A(n485), .B(n227), .Y(n228) );
  OAI21XL U484 ( .A0(n231), .A1(n296), .B0(n230), .Y(n198) );
  NOR2X1 U485 ( .A(n296), .B(counter[3]), .Y(n486) );
  NAND2X1 U486 ( .A(n298), .B(n486), .Y(n490) );
  AOI2BB2X1 U487 ( .B0(n264), .B1(n232), .A0N(n490), .A1N(n301), .Y(n237) );
  AOI221XL U488 ( .A0(n234), .A1(n296), .B0(n485), .B1(n218), .C0(n233), .Y(
        n235) );
  OAI22XL U489 ( .A0(n237), .A1(n236), .B0(n235), .B1(n531), .Y(n201) );
  OA21XL U490 ( .A0(sti_rd), .A1(sti_addr[0]), .B0(n238), .Y(n175) );
  NOR2X1 U491 ( .A(res_di[3]), .B(res_di[4]), .Y(n241) );
  NOR2X1 U492 ( .A(res_di[5]), .B(res_di[6]), .Y(n239) );
  NAND4X4 U493 ( .A(n242), .B(n241), .C(n240), .D(n239), .Y(n452) );
  NAND2XL U494 ( .A(res_addr[11]), .B(res_addr[0]), .Y(n244) );
  NAND2XL U495 ( .A(res_addr[10]), .B(res_addr[12]), .Y(n243) );
  NOR2XL U496 ( .A(n244), .B(n243), .Y(n245) );
  NAND3XL U497 ( .A(n245), .B(res_addr[1]), .C(res_addr[13]), .Y(n248) );
  NAND4XL U498 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[7]), .D(
        res_addr[6]), .Y(n247) );
  NAND4XL U499 ( .A(res_addr[4]), .B(res_addr[3]), .C(res_addr[5]), .D(
        res_addr[2]), .Y(n246) );
  NOR3X1 U500 ( .A(n248), .B(n247), .C(n246), .Y(n454) );
  NOR3X1 U501 ( .A(n520), .B(n518), .C(fstate[2]), .Y(n300) );
  NAND2X1 U502 ( .A(n300), .B(n524), .Y(n453) );
  NOR2XL U503 ( .A(fstate[1]), .B(n518), .Y(n253) );
  NOR4XL U504 ( .A(res_addr[11]), .B(res_addr[0]), .C(res_addr[10]), .D(
        res_addr[12]), .Y(n252) );
  NOR4XL U505 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[7]), .D(
        res_addr[6]), .Y(n251) );
  NOR4XL U506 ( .A(res_addr[4]), .B(res_addr[3]), .C(res_addr[5]), .D(
        res_addr[2]), .Y(n250) );
  AND4X1 U507 ( .A(n252), .B(n251), .C(n250), .D(n249), .Y(n447) );
  NAND2X1 U508 ( .A(n293), .B(fstate[2]), .Y(n445) );
  OAI21XL U509 ( .A0(n447), .A1(n445), .B0(n306), .Y(n288) );
  OA21XL U510 ( .A0(n253), .A1(n288), .B0(n524), .Y(n256) );
  NOR2XL U511 ( .A(fstate[3]), .B(n450), .Y(n254) );
  AO22X1 U512 ( .A0(n459), .A1(n454), .B0(n255), .B1(n254), .Y(n456) );
  OAI31XL U513 ( .A0(n452), .A1(n454), .A2(n453), .B0(n257), .Y(N770) );
  OA21XL U514 ( .A0(n258), .A1(sti_addr[3]), .B0(n259), .Y(n168) );
  AOI21XL U515 ( .A0(n259), .A1(n532), .B0(n261), .Y(n169) );
  OA21XL U516 ( .A0(n261), .A1(sti_addr[5]), .B0(n260), .Y(n170) );
  OAI22XL U517 ( .A0(n296), .A1(sti_di[11]), .B0(n218), .B1(sti_di[15]), .Y(
        n262) );
  OAI2BB2XL U518 ( .B0(n531), .B1(n262), .A0N(n264), .A1N(sti_di[7]), .Y(n263)
         );
  OAI22XL U519 ( .A0(n296), .A1(sti_di[9]), .B0(n218), .B1(sti_di[13]), .Y(
        n265) );
  OAI2BB2XL U520 ( .B0(n531), .B1(n265), .A0N(n264), .A1N(sti_di[5]), .Y(n266)
         );
  OAI22XL U521 ( .A0(n296), .A1(sti_di[2]), .B0(n218), .B1(sti_di[6]), .Y(n267) );
  NOR3BX1 U522 ( .AN(n268), .B(counter[3]), .C(n267), .Y(n274) );
  AO22X1 U523 ( .A0(n298), .A1(sti_di[12]), .B0(n268), .B1(sti_di[14]), .Y(
        n269) );
  OAI21XL U524 ( .A0(n321), .A1(n271), .B0(n270), .Y(n272) );
  INVXL U525 ( .A(n490), .Y(n458) );
  AO22X1 U526 ( .A0(counter[3]), .A1(n272), .B0(n458), .B1(sti_di[0]), .Y(n273) );
  AO22X2 U527 ( .A0(n279), .A1(n459), .B0(minimum[0]), .B1(n278), .Y(res_do[0]) );
  OA21XL U528 ( .A0(n281), .A1(sti_addr[7]), .B0(n280), .Y(n172) );
  OA21XL U529 ( .A0(n282), .A1(n286), .B0(n445), .Y(n283) );
  OAI21X2 U530 ( .A0(fstate[3]), .A1(n283), .B0(n453), .Y(res_rd) );
  NOR2XL U531 ( .A(n286), .B(n491), .Y(n287) );
  OAI21XL U532 ( .A0(n288), .A1(n287), .B0(n524), .Y(n289) );
  OAI21XL U533 ( .A0(n292), .A1(n486), .B0(n485), .Y(n294) );
  CLKINVX1 U534 ( .A(n293), .Y(n493) );
  INVX3 U535 ( .A(n314), .Y(n443) );
  NOR2BX1 U536 ( .AN(counter[0]), .B(n296), .Y(n297) );
  INVX3 U537 ( .A(n313), .Y(n309) );
  NAND2X2 U538 ( .A(n452), .B(n300), .Y(n308) );
  NOR2BX1 U539 ( .AN(n303), .B(n312), .Y(n304) );
  NAND3X1 U540 ( .A(n309), .B(n305), .C(n304), .Y(n310) );
  NAND2X1 U541 ( .A(n307), .B(n451), .Y(n320) );
  NAND3X8 U542 ( .A(n309), .B(n308), .C(n320), .Y(n435) );
  NOR4X1 U543 ( .A(n354), .B(n313), .C(n485), .D(n312), .Y(n315) );
  NOR2X4 U544 ( .A(n315), .B(n314), .Y(n439) );
  OAI21XL U545 ( .A0(n321), .A1(n491), .B0(n320), .Y(n322) );
  NOR2X1 U546 ( .A(n369), .B(n350), .Y(n351) );
  NAND2X1 U547 ( .A(n360), .B(n439), .Y(n361) );
  NAND2X1 U548 ( .A(n367), .B(n439), .Y(n368) );
  OAI211X1 U549 ( .A0(n443), .A1(n536), .B0(n368), .C0(n441), .Y(n190) );
  NAND2X1 U550 ( .A(n384), .B(n439), .Y(n385) );
  OAI211X1 U551 ( .A0(n443), .A1(n537), .B0(n385), .C0(n441), .Y(n192) );
  NAND2X1 U552 ( .A(n394), .B(n439), .Y(n395) );
  OAI211X1 U553 ( .A0(n443), .A1(n547), .B0(n395), .C0(n441), .Y(n187) );
  NAND2X1 U554 ( .A(n400), .B(n439), .Y(n401) );
  OAI211X1 U555 ( .A0(n443), .A1(n542), .B0(n401), .C0(n441), .Y(n189) );
  NAND2X1 U556 ( .A(n406), .B(n439), .Y(n407) );
  OAI211X1 U557 ( .A0(n443), .A1(n544), .B0(n407), .C0(n441), .Y(n191) );
  NAND2X1 U558 ( .A(n419), .B(n439), .Y(n420) );
  NAND2X1 U559 ( .A(n440), .B(n439), .Y(n442) );
  INVXL U560 ( .A(n447), .Y(n446) );
  OAI31XL U561 ( .A0(n446), .A1(fstate[3]), .A2(n445), .B0(n444), .Y(N772) );
  NOR3XL U562 ( .A(fstate[1]), .B(fstate[2]), .C(fstate[0]), .Y(n448) );
  AOI2BB1X1 U563 ( .A0N(n455), .A1N(n454), .B0(n453), .Y(n457) );
  OAI21XL U564 ( .A0(n461), .A1(fstate[3]), .B0(n460), .Y(N769) );
  ADDHX1 U565 ( .A(res_di[5]), .B(n463), .CO(n479), .S(n476) );
  ADDHXL U566 ( .A(res_di[2]), .B(n467), .CO(n464), .S(n496) );
  NOR2BX1 U567 ( .AN(n212), .B(minimum[2]), .Y(n468) );
  OAI22X1 U568 ( .A0(n469), .A1(n468), .B0(n212), .B1(n529), .Y(n471) );
  OAI22X1 U569 ( .A0(n472), .A1(n471), .B0(minimum[3]), .B1(n498), .Y(n475) );
  NOR2BX1 U570 ( .AN(n500), .B(minimum[4]), .Y(n474) );
  OAI22X1 U571 ( .A0(n475), .A1(n474), .B0(n500), .B1(n522), .Y(n477) );
  ADDHX1 U572 ( .A(res_di[6]), .B(n479), .CO(n462), .S(n505) );
  NOR2BX1 U573 ( .AN(n505), .B(minimum[6]), .Y(n480) );
  OAI22X1 U574 ( .A0(n481), .A1(n480), .B0(n505), .B1(n523), .Y(n482) );
  OAI21X2 U575 ( .A0(n484), .A1(n525), .B0(n483), .Y(n487) );
  NOR2X2 U576 ( .A(n512), .B(n493), .Y(n513) );
  INVX3 U577 ( .A(n513), .Y(n511) );
  NAND2X4 U578 ( .A(n509), .B(n493), .Y(n515) );
  AOI2BB2X1 U579 ( .B0(n516), .B1(sti_addr[9]), .A0N(n516), .A1N(sti_addr[9]), 
        .Y(n174) );
  AOI2BB2X1 U580 ( .B0(sti_addr[2]), .B1(n517), .A0N(sti_addr[2]), .A1N(n517), 
        .Y(n167) );
endmodule

