/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03-SP1-1
// Date      : Fri Mar  8 23:43:59 2024
/////////////////////////////////////////////////////////////


module setNumber_6 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n2, n5, n6, n7, n8, n9, n16, n17, n18;

  INVXL U8 ( .A(self_value[1]), .Y(n6) );
  NAND2X1 U11 ( .A(n18), .B(n6), .Y(number_o[1]) );
  CLKINVX1 U16 ( .A(self_value[2]), .Y(n5) );
  NAND2BXL U18 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  AND2X2 U3 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  OAI32X1 U5 ( .A0(n8), .A1(P1_value[1]), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  INVXL U2 ( .A(n7), .Y(n2) );
  OAI2BB1XL U4 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  OAI31XL U9 ( .A0(n9), .A1(P1_value[0]), .A2(n8), .B0(n2), .Y(n17) );
  AND2X2 U10 ( .A(n17), .B(n16), .Y(n18) );
  NAND2X2 U7 ( .A(n18), .B(n5), .Y(number_o[2]) );
  NOR3X1 U6 ( .A(P1_i[2]), .B(P1_i[1]), .C(P1_i[0]), .Y(n16) );
endmodule


module setNumber_5 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n1, n2, n3, n5, n6, n7, n8, n9, n17, n18, n19;

  INVXL U2 ( .A(self_value[1]), .Y(n6) );
  OAI2BB1X1 U4 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  OAI31X2 U5 ( .A0(n9), .A1(P1_value[0]), .A2(n8), .B0(n2), .Y(n17) );
  OAI32X2 U6 ( .A0(n8), .A1(P1_value[1]), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  AND2X4 U7 ( .A(n17), .B(n19), .Y(n18) );
  NAND2X4 U8 ( .A(n18), .B(n5), .Y(number_o[2]) );
  NAND2X1 U9 ( .A(n18), .B(n6), .Y(number_o[1]) );
  INVX3 U10 ( .A(n7), .Y(n2) );
  INVX1 U11 ( .A(P1_i[2]), .Y(n1) );
  INVX1 U13 ( .A(self_value[2]), .Y(n5) );
  INVXL U18 ( .A(P1_i[1]), .Y(n3) );
  AND2X4 U3 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  NAND2BX1 U12 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  AND2X1 U14 ( .A(n1), .B(n3), .Y(n19) );
endmodule


module setNumber_4 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n16, n17, n18;

  AND2X4 U4 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  OAI32X1 U6 ( .A0(n8), .A1(P1_value[1]), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  OAI31X2 U9 ( .A0(n9), .A1(P1_value[0]), .A2(n8), .B0(n2), .Y(n17) );
  OAI2BB1XL U12 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  NAND2BX1 U15 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  CLKINVX1 U16 ( .A(self_value[1]), .Y(n6) );
  CLKINVX1 U17 ( .A(self_value[2]), .Y(n5) );
  INVXL U18 ( .A(P1_i[1]), .Y(n3) );
  INVX1 U5 ( .A(n7), .Y(n2) );
  AND2X6 U8 ( .A(n17), .B(n16), .Y(n18) );
  NAND2X1 U2 ( .A(n18), .B(n6), .Y(number_o[1]) );
  NAND2X4 U3 ( .A(n18), .B(n5), .Y(number_o[2]) );
  OAI21XL U7 ( .A0(P1_i[0]), .A1(P1_i[2]), .B0(n10), .Y(n16) );
  NAND2XL U10 ( .A(n4), .B(n3), .Y(n10) );
  INVXL U11 ( .A(P1_i[2]), .Y(n4) );
endmodule


module setNumber_3 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n2, n5, n6, n7, n8, n9, n16, n17, n18;

  OAI31X2 U10 ( .A0(P1_value[0]), .A1(n9), .A2(n8), .B0(n2), .Y(n17) );
  CLKAND2X8 U2 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  NAND2X4 U3 ( .A(n18), .B(n5), .Y(number_o[2]) );
  OAI2BB1X1 U4 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  OAI32X2 U5 ( .A0(P1_value[1]), .A1(n8), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  AND2X4 U7 ( .A(n17), .B(n16), .Y(n18) );
  INVX3 U8 ( .A(n7), .Y(n2) );
  NAND2BX1 U9 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  NAND2X1 U14 ( .A(n18), .B(n6), .Y(number_o[1]) );
  CLKINVX1 U16 ( .A(self_value[2]), .Y(n5) );
  CLKINVX1 U17 ( .A(self_value[1]), .Y(n6) );
  INVX1 U6 ( .A(P1_i[2]), .Y(n16) );
endmodule


module setNumber_2 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n2, n5, n6, n7, n8, n9, n16, n17, n18;

  OAI31X2 U10 ( .A0(n9), .A1(P1_value[0]), .A2(n8), .B0(n2), .Y(n17) );
  NAND2X4 U3 ( .A(n18), .B(n5), .Y(number_o[2]) );
  OAI32X2 U4 ( .A0(n8), .A1(P1_value[1]), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  CLKAND2X3 U6 ( .A(n16), .B(n17), .Y(n18) );
  NAND2X1 U8 ( .A(n18), .B(n6), .Y(number_o[1]) );
  INVX3 U9 ( .A(n7), .Y(n2) );
  NAND2BX1 U16 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  CLKINVX1 U17 ( .A(self_value[2]), .Y(n5) );
  CLKINVX1 U18 ( .A(self_value[1]), .Y(n6) );
  OAI2BB1X1 U2 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  AND2X4 U5 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  OAI21XL U7 ( .A0(P1_i[1]), .A1(P1_i[0]), .B0(P1_i[2]), .Y(n16) );
endmodule


module setNumber_1 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n17, n18, n19;

  AND2X8 U5 ( .A(n17), .B(n19), .Y(n18) );
  AND2X4 U2 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  NAND2X4 U3 ( .A(n18), .B(n5), .Y(number_o[2]) );
  NAND2BX1 U4 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  NAND2X1 U8 ( .A(n18), .B(n6), .Y(number_o[1]) );
  OAI31X4 U9 ( .A0(n9), .A1(P1_value[0]), .A2(n8), .B0(n2), .Y(n17) );
  CLKINVX1 U12 ( .A(P1_i[2]), .Y(n4) );
  OAI2BB1X1 U15 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  CLKINVX1 U16 ( .A(self_value[2]), .Y(n5) );
  INVXL U18 ( .A(P1_i[1]), .Y(n3) );
  INVX3 U6 ( .A(n7), .Y(n2) );
  OAI32X1 U7 ( .A0(n8), .A1(P1_value[1]), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  OR2X1 U10 ( .A(n3), .B(n4), .Y(n19) );
  INVXL U11 ( .A(self_value[1]), .Y(n6) );
endmodule


module setNumber_0 ( selfIdx, self_value, P1_i, P1_value, number_o );
  input [2:0] selfIdx;
  input [2:0] self_value;
  input [2:0] P1_i;
  input [2:0] P1_value;
  output [2:0] number_o;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n16, n17, n18;

  OAI31X2 U10 ( .A0(n9), .A1(P1_value[0]), .A2(n8), .B0(n2), .Y(n17) );
  NAND2X4 U2 ( .A(n18), .B(n5), .Y(number_o[2]) );
  NAND2X1 U3 ( .A(n18), .B(n6), .Y(number_o[1]) );
  AND2X4 U4 ( .A(n17), .B(n16), .Y(n18) );
  AND2X2 U6 ( .A(P1_value[2]), .B(n5), .Y(n8) );
  OAI32X2 U8 ( .A0(n8), .A1(P1_value[1]), .A2(n6), .B0(n5), .B1(P1_value[2]), 
        .Y(n7) );
  INVX1 U11 ( .A(self_value[2]), .Y(n5) );
  CLKINVX1 U13 ( .A(P1_i[1]), .Y(n3) );
  OAI2BB1X1 U16 ( .A0N(n6), .A1N(P1_value[1]), .B0(self_value[0]), .Y(n9) );
  NAND2BX1 U17 ( .AN(self_value[0]), .B(n18), .Y(number_o[0]) );
  CLKINVX1 U18 ( .A(self_value[1]), .Y(n6) );
  INVX1 U7 ( .A(n7), .Y(n2) );
  INVXL U5 ( .A(P1_i[2]), .Y(n4) );
  NOR2XL U9 ( .A(n3), .B(n4), .Y(n10) );
  NAND2XL U12 ( .A(P1_i[0]), .B(n10), .Y(n16) );
endmodule


module sort2_21 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n13, n4, n7, n9;
  assign n4 = in2[2];

  INVX3 U4 ( .A(n13), .Y(out1[2]) );
  CLKINVX1 U13 ( .A(in2[1]), .Y(n9) );
  INVX3 U1 ( .A(n9), .Y(out1[1]) );
  CLKINVX1 U2 ( .A(n7), .Y(out1[0]) );
  INVX1 U3 ( .A(n4), .Y(n13) );
  INVXL U5 ( .A(in2[0]), .Y(n7) );
endmodule


module sort2_20 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n3, n5, n6, n7, n8, n9, n10, n11, n17, n18, n19, n20, n21, n22, n23,
         n24;

  INVX3 U2 ( .A(in1[2]), .Y(n17) );
  NAND2X4 U4 ( .A(n17), .B(n6), .Y(n7) );
  NAND2X1 U5 ( .A(n24), .B(in1[2]), .Y(n23) );
  INVX3 U10 ( .A(n23), .Y(out1[2]) );
  AND2X2 U13 ( .A(n3), .B(n21), .Y(n5) );
  OR2X1 U15 ( .A(in2[2]), .B(n17), .Y(n3) );
  NAND3X2 U17 ( .A(n24), .B(n19), .C(in1[1]), .Y(n21) );
  INVXL U18 ( .A(in1[0]), .Y(n9) );
  OAI22X4 U19 ( .A0(n11), .A1(n22), .B0(n10), .B1(n19), .Y(out1[1]) );
  INVX3 U20 ( .A(in2[1]), .Y(n19) );
  CLKINVX1 U21 ( .A(in1[1]), .Y(n11) );
  CLKINVX1 U22 ( .A(in2[0]), .Y(n18) );
  CLKINVX4 U12 ( .A(in2[2]), .Y(n6) );
  NAND2X2 U16 ( .A(in1[2]), .B(in2[2]), .Y(n8) );
  NAND2X6 U8 ( .A(n7), .B(n8), .Y(n24) );
  OAI22XL U1 ( .A0(n9), .A1(n22), .B0(n10), .B1(n18), .Y(out1[0]) );
  NAND2X6 U3 ( .A(n5), .B(n20), .Y(n22) );
  OAI211X4 U6 ( .A0(in1[1]), .A1(n19), .B0(n24), .C0(in1[0]), .Y(n20) );
  INVX6 U7 ( .A(n22), .Y(n10) );
endmodule


module sort2_19 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n14, n15;

  OAI22X4 U6 ( .A0(n5), .A1(n11), .B0(n4), .B1(n8), .Y(out1[1]) );
  CLKINVX1 U2 ( .A(n14), .Y(out1[2]) );
  OAI22X2 U3 ( .A0(n3), .A1(n11), .B0(n4), .B1(n7), .Y(out1[0]) );
  OAI211X2 U8 ( .A0(in1[1]), .A1(n8), .B0(n15), .C0(in1[0]), .Y(n9) );
  INVX3 U9 ( .A(in2[1]), .Y(n8) );
  XOR2X4 U10 ( .A(n6), .B(in2[2]), .Y(n15) );
  INVXL U11 ( .A(in1[1]), .Y(n5) );
  CLKINVX1 U12 ( .A(in1[0]), .Y(n3) );
  CLKINVX1 U13 ( .A(in2[0]), .Y(n7) );
  NAND2X1 U16 ( .A(n15), .B(in1[2]), .Y(n14) );
  NAND3X2 U18 ( .A(n15), .B(n8), .C(in1[1]), .Y(n10) );
  INVX3 U4 ( .A(in1[2]), .Y(n6) );
  INVX6 U1 ( .A(n11), .Y(n4) );
  OAI211X4 U5 ( .A0(in2[2]), .A1(n6), .B0(n10), .C0(n9), .Y(n11) );
endmodule


module sort2_18 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n17, n18, n19, n20, n21;

  CLKINVX1 U2 ( .A(in1[2]), .Y(n9) );
  OAI21X2 U4 ( .A0(n1), .A1(n19), .B0(n5), .Y(out1[1]) );
  CLKINVX1 U5 ( .A(in1[1]), .Y(n1) );
  NAND2BX2 U6 ( .AN(n11), .B(n19), .Y(n5) );
  MXI2X1 U7 ( .A(n8), .B(n10), .S0(n19), .Y(out1[0]) );
  NAND2X2 U11 ( .A(in1[2]), .B(in2[2]), .Y(n7) );
  NAND3X2 U12 ( .A(n21), .B(n11), .C(in1[1]), .Y(n18) );
  NAND2X1 U13 ( .A(n21), .B(in1[2]), .Y(n20) );
  OA21X4 U14 ( .A0(in1[1]), .A1(n11), .B0(n21), .Y(n2) );
  OA21X4 U17 ( .A0(in2[2]), .A1(n9), .B0(n18), .Y(n4) );
  INVX3 U18 ( .A(in2[1]), .Y(n11) );
  CLKINVX1 U20 ( .A(in1[0]), .Y(n8) );
  NAND2X6 U19 ( .A(n6), .B(n7), .Y(n21) );
  NAND2X2 U15 ( .A(n2), .B(in1[0]), .Y(n17) );
  NAND2X6 U16 ( .A(n4), .B(n17), .Y(n19) );
  CLKINVX1 U1 ( .A(n20), .Y(out1[2]) );
  OR2X4 U8 ( .A(in1[2]), .B(in2[2]), .Y(n6) );
  INVXL U3 ( .A(in2[0]), .Y(n10) );
endmodule


module sort2_14 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n2, n3, n4, n5, n6, n7, n9, n10, n11, n17, n18, n19, n20, n21, n22,
         n24;

  OAI211X2 U9 ( .A0(in1[1]), .A1(n19), .B0(n24), .C0(in1[0]), .Y(n20) );
  OR2X1 U3 ( .A(n9), .B(n22), .Y(n3) );
  CLKINVX1 U4 ( .A(in1[2]), .Y(n17) );
  OR2X1 U5 ( .A(n18), .B(n10), .Y(n4) );
  OAI21X4 U6 ( .A0(in1[2]), .A1(in2[2]), .B0(n7), .Y(n24) );
  NAND2X2 U7 ( .A(in1[2]), .B(in2[2]), .Y(n7) );
  INVX4 U10 ( .A(n22), .Y(n10) );
  CLKAND2X3 U11 ( .A(n24), .B(n19), .Y(n2) );
  OR2X4 U14 ( .A(n11), .B(n22), .Y(n5) );
  NAND2X4 U17 ( .A(n3), .B(n4), .Y(out1[0]) );
  OR2X4 U18 ( .A(n10), .B(n19), .Y(n6) );
  INVXL U21 ( .A(in1[0]), .Y(n9) );
  OAI211X2 U22 ( .A0(in2[2]), .A1(n17), .B0(n21), .C0(n20), .Y(n22) );
  INVXL U23 ( .A(in1[1]), .Y(n11) );
  INVX1 U24 ( .A(in2[0]), .Y(n18) );
  INVX6 U19 ( .A(in2[1]), .Y(n19) );
  NAND2X6 U1 ( .A(n5), .B(n6), .Y(out1[1]) );
  AND2X1 U2 ( .A(n24), .B(in1[2]), .Y(out1[2]) );
  NAND2X4 U8 ( .A(n2), .B(in1[1]), .Y(n21) );
endmodule


module sort2_13 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n17, n18, n19, n20, n21;

  OAI211X2 U9 ( .A0(in1[1]), .A1(n11), .B0(n21), .C0(in1[0]), .Y(n17) );
  AND2X2 U3 ( .A(in1[1]), .B(n21), .Y(n1) );
  INVXL U6 ( .A(in1[0]), .Y(n6) );
  XOR2X4 U7 ( .A(n9), .B(in2[2]), .Y(n21) );
  INVX3 U14 ( .A(n20), .Y(out1[2]) );
  OAI22X4 U16 ( .A0(n8), .A1(n19), .B0(n7), .B1(n5), .Y(out1[1]) );
  NAND2X1 U17 ( .A(n21), .B(in1[2]), .Y(n20) );
  CLKINVX1 U18 ( .A(in2[0]), .Y(n10) );
  INVXL U20 ( .A(in1[1]), .Y(n8) );
  CLKINVX1 U2 ( .A(in1[2]), .Y(n9) );
  INVX3 U11 ( .A(in2[1]), .Y(n11) );
  BUFX4 U8 ( .A(n11), .Y(n5) );
  NAND2X1 U1 ( .A(n2), .B(n3), .Y(out1[0]) );
  OR2X1 U4 ( .A(n6), .B(n19), .Y(n2) );
  OR2X1 U5 ( .A(n7), .B(n10), .Y(n3) );
  INVX8 U10 ( .A(n19), .Y(n7) );
  OAI211X4 U12 ( .A0(in2[2]), .A1(n9), .B0(n18), .C0(n17), .Y(n19) );
  NAND2X4 U13 ( .A(n1), .B(n5), .Y(n18) );
endmodule


module sort2_12 ( in1, in2, out1, out2 );
  input [2:0] in1;
  input [2:0] in2;
  output [2:0] out1;
  output [2:0] out2;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n17, n18, n19, n20, n22;

  INVX12 U2 ( .A(n20), .Y(n8) );
  NAND2X4 U3 ( .A(n4), .B(n5), .Y(n22) );
  NAND2X1 U4 ( .A(in1[2]), .B(in2[2]), .Y(n5) );
  NAND2BX1 U8 ( .AN(in1[2]), .B(n3), .Y(n4) );
  NAND2X8 U9 ( .A(n6), .B(n18), .Y(n20) );
  NAND2X4 U10 ( .A(n2), .B(in1[0]), .Y(n18) );
  CLKINVX1 U11 ( .A(in1[1]), .Y(n9) );
  CLKINVX1 U12 ( .A(in1[2]), .Y(n10) );
  NAND3X2 U13 ( .A(n22), .B(n17), .C(in1[1]), .Y(n19) );
  CLKINVX1 U14 ( .A(in2[0]), .Y(n11) );
  OA21X4 U15 ( .A0(in1[1]), .A1(n17), .B0(n22), .Y(n2) );
  CLKINVX1 U16 ( .A(in1[0]), .Y(n7) );
  CLKINVX1 U17 ( .A(in2[2]), .Y(n3) );
  OA21X4 U19 ( .A0(in2[2]), .A1(n10), .B0(n19), .Y(n6) );
  OAI22X4 U20 ( .A0(n7), .A1(n20), .B0(n8), .B1(n11), .Y(out1[0]) );
  OAI22X4 U21 ( .A0(n9), .A1(n20), .B0(n17), .B1(n8), .Y(out1[1]) );
  INVX8 U1 ( .A(in2[1]), .Y(n17) );
  AND2X2 U5 ( .A(n22), .B(in1[2]), .Y(out1[2]) );
endmodule


module sort4_2 ( in1, in2, in3, in4, out1, out2, out3, out4 );
  input [2:0] in1;
  input [2:0] in2;
  input [2:0] in3;
  input [2:0] in4;
  output [2:0] out1;
  output [2:0] out2;
  output [2:0] out3;
  output [2:0] out4;

  wire   [2:0] stage1_1;
  wire   [2:0] stage1_3;

  sort2_14 S1_1 ( .in1(in1), .in2(in2), .out1(stage1_1) );
  sort2_13 S1_2 ( .in1(in3), .in2(in4), .out1(stage1_3) );
  sort2_12 S2_1 ( .in1(stage1_1), .in2(stage1_3), .out1(out1) );
endmodule


module sort8 ( in1, in2, in3, in4, in5, in6, in7, in8, out1, out2, out3, out4, 
        out5, out6, out7, out8 );
  input [2:0] in1;
  input [2:0] in2;
  input [2:0] in3;
  input [2:0] in4;
  input [2:0] in5;
  input [2:0] in6;
  input [2:0] in7;
  input [2:0] in8;
  output [2:0] out1;
  output [2:0] out2;
  output [2:0] out3;
  output [2:0] out4;
  output [2:0] out5;
  output [2:0] out6;
  output [2:0] out7;
  output [2:0] out8;

  wire   [2:0] stage1_1;
  wire   [2:0] stage1_3;
  wire   [2:0] stage1_5;
  wire   [2:0] stage1_7;

  sort2_21 S1_1 ( .in1({1'b1, 1'b1, 1'b1}), .in2(in2), .out1(stage1_1) );
  sort2_20 S1_2 ( .in1(in3), .in2(in4), .out1(stage1_3) );
  sort2_19 S1_3 ( .in1(in5), .in2(in6), .out1(stage1_5) );
  sort2_18 S1_4 ( .in1(in7), .in2(in8), .out1(stage1_7) );
  sort4_2 S2_1 ( .in1(stage1_1), .in2(stage1_3), .in3(stage1_5), .in4(stage1_7), .out1(out1) );
endmodule


module JAM_DW01_add_2 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n44, n46, n47, n48,
         n49, n50, n89, n90;
  assign n13 = A[7];

  AOI21X4 U37 ( .A0(n40), .A1(n32), .B0(n33), .Y(n1) );
  OAI21X4 U52 ( .A0(n41), .A1(n44), .B0(n42), .Y(n40) );
  NAND2X2 U56 ( .A(A[1]), .B(B[1]), .Y(n42) );
  NOR2X4 U55 ( .A(A[1]), .B(B[1]), .Y(n41) );
  NOR2X4 U48 ( .A(A[2]), .B(B[2]), .Y(n37) );
  NAND2X4 U61 ( .A(A[0]), .B(B[0]), .Y(n44) );
  NAND2X1 U29 ( .A(A[5]), .B(B[5]), .Y(n28) );
  NAND2X2 U46 ( .A(n49), .B(n38), .Y(n6) );
  NAND2X1 U35 ( .A(A[4]), .B(B[4]), .Y(n31) );
  NAND2X2 U53 ( .A(n50), .B(n42), .Y(n7) );
  NOR2X2 U28 ( .A(A[5]), .B(B[5]), .Y(n27) );
  NOR2X4 U42 ( .A(A[3]), .B(B[3]), .Y(n34) );
  NOR2X1 U24 ( .A(n30), .B(n27), .Y(n25) );
  NOR2X2 U38 ( .A(n37), .B(n34), .Y(n32) );
  XOR2X4 U50 ( .A(n7), .B(n44), .Y(SUM[1]) );
  OAI21X2 U39 ( .A0(n34), .A1(n38), .B0(n35), .Y(n33) );
  NAND2X1 U32 ( .A(n47), .B(n31), .Y(n4) );
  NAND2X1 U40 ( .A(n48), .B(n35), .Y(n5) );
  NAND2X1 U19 ( .A(A[6]), .B(B[6]), .Y(n21) );
  OAI21X1 U45 ( .A0(n39), .A1(n37), .B0(n38), .Y(n36) );
  NAND2X1 U16 ( .A(n90), .B(n21), .Y(n2) );
  XNOR2X2 U36 ( .A(n36), .B(n5), .Y(SUM[3]) );
  OAI21X1 U21 ( .A0(n1), .A1(n23), .B0(n24), .Y(n22) );
  NAND2X1 U26 ( .A(n46), .B(n28), .Y(n3) );
  XNOR2X2 U10 ( .A(n22), .B(n2), .Y(SUM[6]) );
  AOI21XL U13 ( .A0(n26), .A1(n90), .B0(n19), .Y(n17) );
  OAI21XL U31 ( .A0(n1), .A1(n30), .B0(n31), .Y(n29) );
  XNOR2X1 U20 ( .A(n29), .B(n3), .Y(SUM[5]) );
  OAI21X1 U11 ( .A0(n1), .A1(n16), .B0(n17), .Y(n15) );
  NAND2X2 U7 ( .A(n15), .B(n13), .Y(n12) );
  XOR2X1 U3 ( .A(n12), .B(n11), .Y(SUM[8]) );
  NOR2XL U4 ( .A(n12), .B(n11), .Y(n10) );
  NAND2X2 U49 ( .A(A[2]), .B(B[2]), .Y(n38) );
  NAND2X1 U43 ( .A(A[3]), .B(B[3]), .Y(n35) );
  XOR2X2 U44 ( .A(n39), .B(n6), .Y(SUM[2]) );
  OAI21X1 U25 ( .A0(n27), .A1(n31), .B0(n28), .Y(n26) );
  XNOR2X1 U6 ( .A(n15), .B(n14), .Y(SUM[7]) );
  CLKINVX1 U65 ( .A(A[8]), .Y(n11) );
  OR2X1 U66 ( .A(A[6]), .B(B[6]), .Y(n90) );
  INVXL U67 ( .A(n30), .Y(n47) );
  OR2X1 U68 ( .A(A[0]), .B(B[0]), .Y(n89) );
  INVX1 U69 ( .A(n37), .Y(n49) );
  INVX1 U70 ( .A(n27), .Y(n46) );
  INVX1 U71 ( .A(n21), .Y(n19) );
  INVX1 U72 ( .A(n26), .Y(n24) );
  INVX1 U73 ( .A(n25), .Y(n23) );
  CLKINVX1 U74 ( .A(n34), .Y(n48) );
  INVX2 U75 ( .A(n41), .Y(n50) );
  NAND2XL U76 ( .A(n25), .B(n90), .Y(n16) );
  NOR2X2 U77 ( .A(A[4]), .B(B[4]), .Y(n30) );
  INVXL U78 ( .A(n13), .Y(n14) );
  XOR2X1 U79 ( .A(n1), .B(n4), .Y(SUM[4]) );
  XNOR2X1 U80 ( .A(n10), .B(n9), .Y(SUM[9]) );
  AND2X1 U81 ( .A(n89), .B(n44), .Y(SUM[0]) );
  CLKINVX1 U82 ( .A(A[9]), .Y(n9) );
  INVX4 U83 ( .A(n40), .Y(n39) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [8:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N65, N66, N67, N68, N69, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, \arr[7][2] , \arr[7][1] ,
         \arr[7][0] , \arr[6][2] , \arr[6][1] , \arr[6][0] , \arr[5][2] ,
         \arr[5][1] , \arr[5][0] , \arr[4][2] , \arr[4][1] , \arr[4][0] ,
         \arr[3][2] , \arr[3][1] , \arr[3][0] , \arr[2][2] , \arr[2][1] ,
         \arr[2][0] , \arr[1][2] , \arr[1][1] , \arr[1][0] , \arr[0][2] ,
         \arr[0][1] , \arr[0][0] , \_1_net_[2] , \_1_net_[1] , \_1_net_[0] ,
         \beforeSort[7][2] , \beforeSort[7][1] , \beforeSort[7][0] ,
         \beforeSort[6][2] , \beforeSort[6][1] , \beforeSort[6][0] ,
         \beforeSort[5][2] , \beforeSort[5][1] , \beforeSort[5][0] ,
         \beforeSort[4][2] , \beforeSort[4][1] , \beforeSort[4][0] ,
         \beforeSort[3][2] , \beforeSort[3][1] , \beforeSort[3][0] ,
         \beforeSort[2][2] , \beforeSort[2][1] , \beforeSort[2][0] ,
         \beforeSort[1][2] , \beforeSort[1][1] , \beforeSort[1][0] ,
         \afterSort[0][2] , \afterSort[0][1] , \afterSort[0][0] , N72, N73,
         N74, N175, N176, N177, N290, N298, N299, N300, N312, N313, N314, N328,
         N329, N330, N333, N352, n77, n78, n81, n84, n88, n89, n91, n93, n95,
         n97, n99, n101, n102, n103, n105, n107, n109, n111, n116, n117, n124,
         n125, n126, n130, n131, n133, n140, n141, n142, n144, n145, n147,
         n148, n150, n151, n152, n153, n154, n155, n156, n159, n161, n162,
         n163, n164, n165, n168, n170, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n183, n184, n185, n186, n188, n189, n190, n191,
         n194, n195, n200, n202, n203, n206, n207, n208, n211, n212, n213,
         n214, n215, n217, n218, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n232, n233, n234, n235, n237, n238, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n250, n251, n256,
         n257, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n272, n273, n274, n275, n276, n278, n280, n281, n282,
         n285, n286, n287, n288, n290, n291, n292, n293, n294, n295, n296,
         n297, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n317, n321, n322, n323, n324,
         n325, n326, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n392, n393, n394,
         n395, n396, n397, n398, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n478, n479, n480, n481, n483, n484, n485,
         n487, n488, n492, n493, n496, n498, n499, n500, n501, n502, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n515, n517,
         n518, n519, n520, n526, n537, n538, n539, n540, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n567,
         n571, n572, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n713, n716, n721, n723, n739, n740, n741;
  wire   [9:0] roundCost;
  wire   [9:0] roundCost_add_Cost;
  wire   [2:0] P1;
  wire   [2:0] state;
  wire   [2:0] P1_reg;

  DFFRX4 \arr_reg[5][1]  ( .D(n430), .CK(CLK), .RN(n581), .Q(\arr[5][1] ), 
        .QN(n375) );
  DFFSX4 \arr_reg[7][0]  ( .D(n425), .CK(CLK), .SN(n581), .Q(\arr[7][0] ), 
        .QN(n370) );
  DFFSX4 \arr_reg[6][1]  ( .D(n427), .CK(CLK), .SN(n582), .Q(\arr[6][1] ), 
        .QN(n372) );
  DFFSX4 \arr_reg[5][0]  ( .D(n431), .CK(CLK), .SN(n582), .Q(\arr[5][0] ), 
        .QN(n363) );
  DFFSX4 \arr_reg[3][1]  ( .D(n436), .CK(CLK), .SN(n582), .Q(\arr[3][1] ), 
        .QN(n380) );
  DFFSX4 \arr_reg[2][1]  ( .D(n439), .CK(CLK), .SN(n582), .Q(\arr[2][1] ), 
        .QN(n383) );
  OAI222X2 U108 ( .A0(n190), .A1(n520), .B0(n370), .B1(n179), .C0(n373), .C1(
        n180), .Y(n188) );
  OAI211X2 U215 ( .A0(n262), .A1(n261), .B0(n716), .C0(n257), .Y(n260) );
  OAI21X4 U219 ( .A0(n265), .A1(n263), .B0(n257), .Y(n264) );
  AOI32X2 U222 ( .A0(n363), .A1(\arr[6][0] ), .A2(n268), .B0(\arr[6][1] ), 
        .B1(n375), .Y(n266) );
  OAI2BB1X4 U223 ( .A0N(n269), .A1N(n376), .B0(n270), .Y(n263) );
  OAI21X4 U224 ( .A0(n376), .A1(n269), .B0(\arr[5][2] ), .Y(n270) );
  OAI21X4 U225 ( .A0(n375), .A1(\arr[4][1] ), .B0(n272), .Y(n269) );
  AOI2BB1X4 U227 ( .A0N(n261), .A1N(n273), .B0(n262), .Y(n265) );
  OAI21X4 U236 ( .A0(n285), .A1(n382), .B0(\arr[3][2] ), .Y(n286) );
  OAI211X2 U238 ( .A0(n383), .A1(\arr[3][1] ), .B0(n713), .C0(n384), .Y(n287)
         );
  AOI211X2 U245 ( .A0(n296), .A1(n297), .B0(n695), .C0(n694), .Y(n295) );
  DFFRX2 \P1_reg_reg[1]  ( .D(n365), .CK(CLK), .RN(n581), .Q(P1_reg[1]), .QN(
        n402) );
  DFFRX2 \P1_reg_reg[2]  ( .D(n364), .CK(CLK), .RN(n582), .Q(P1_reg[2]), .QN(
        n362) );
  DFFRX2 \P1_reg_reg[0]  ( .D(n366), .CK(CLK), .RN(n582), .Q(P1_reg[0]), .QN(
        n403) );
  DFFRX1 \count_read_reg[3]  ( .D(n418), .CK(CLK), .RN(n581), .Q(n721) );
  DFFSX2 \arr_reg[3][0]  ( .D(n437), .CK(CLK), .SN(n581), .Q(\arr[3][0] ), 
        .QN(n381) );
  DFFSX2 \arr_reg[4][2]  ( .D(n432), .CK(CLK), .SN(n582), .Q(\arr[4][2] ), 
        .QN(n376) );
  DFFSX2 \arr_reg[7][2]  ( .D(n424), .CK(CLK), .SN(n582), .Q(\arr[7][2] ), 
        .QN(n368) );
  DFFRX2 \arr_reg[3][2]  ( .D(n435), .CK(CLK), .RN(n581), .Q(\arr[3][2] ), 
        .QN(n379) );
  DFFRX2 \arr_reg[4][1]  ( .D(n433), .CK(CLK), .RN(n581), .Q(\arr[4][1] ), 
        .QN(n377) );
  DFFRX2 \arr_reg[2][0]  ( .D(n440), .CK(CLK), .RN(n581), .Q(\arr[2][0] ), 
        .QN(n384) );
  DFFSX4 \arr_reg[7][1]  ( .D(n444), .CK(CLK), .SN(n581), .Q(\arr[7][1] ), 
        .QN(n369) );
  DFFSX1 \MinCost_reg[8]  ( .D(n417), .CK(CLK), .SN(n582), .Q(n730), .QN(n352)
         );
  DFFSX1 \MinCost_reg[5]  ( .D(n414), .CK(CLK), .SN(n582), .Q(n733), .QN(n355)
         );
  DFFSX1 \MinCost_reg[2]  ( .D(n411), .CK(CLK), .SN(n582), .Q(n736), .QN(n358)
         );
  DFFSX1 \MinCost_reg[1]  ( .D(n410), .CK(CLK), .SN(n582), .Q(n737), .QN(n359)
         );
  DFFSX1 \MinCost_reg[4]  ( .D(n413), .CK(CLK), .SN(n582), .Q(n734), .QN(n356)
         );
  DFFSX1 \MinCost_reg[0]  ( .D(n445), .CK(CLK), .SN(n696), .Q(n738), .QN(n350)
         );
  DFFSX1 \MinCost_reg[3]  ( .D(n412), .CK(CLK), .SN(n582), .Q(n735), .QN(n357)
         );
  DFFSX1 \MinCost_reg[7]  ( .D(n416), .CK(CLK), .SN(n582), .Q(n731), .QN(n353)
         );
  DFFSX1 \MinCost_reg[6]  ( .D(n415), .CK(CLK), .SN(n582), .Q(n732), .QN(n354)
         );
  DFFSX4 \arr_reg[6][2]  ( .D(n426), .CK(CLK), .SN(n581), .Q(\arr[6][2] ), 
        .QN(n371) );
  DFFRX1 \state_reg[1]  ( .D(N299), .CK(CLK), .RN(n696), .Q(state[1]), .QN(
        n705) );
  DFFRX1 \state_reg[2]  ( .D(N300), .CK(CLK), .RN(n696), .Q(state[2]), .QN(
        n709) );
  DFFRX1 \state_reg[0]  ( .D(N298), .CK(CLK), .RN(n696), .Q(state[0]), .QN(
        n526) );
  DFFSX2 \arr_reg[1][0]  ( .D(n443), .CK(CLK), .SN(n696), .Q(\arr[1][0] ), 
        .QN(n387) );
  DFFRX1 \roundCost_reg[1]  ( .D(n393), .CK(CLK), .RN(n696), .Q(roundCost[1]), 
        .QN(n341) );
  DFFRX1 \roundCost_reg[2]  ( .D(n394), .CK(CLK), .RN(n696), .Q(roundCost[2]), 
        .QN(n342) );
  DFFRX1 \roundCost_reg[0]  ( .D(n392), .CK(CLK), .RN(n696), .Q(roundCost[0]), 
        .QN(n340) );
  DFFRX1 \roundCost_reg[3]  ( .D(n395), .CK(CLK), .RN(n696), .Q(roundCost[3]), 
        .QN(n343) );
  DFFRX1 \roundCost_reg[4]  ( .D(n396), .CK(CLK), .RN(n696), .Q(roundCost[4]), 
        .QN(n344) );
  DFFRX1 \roundCost_reg[5]  ( .D(n397), .CK(CLK), .RN(n696), .Q(roundCost[5]), 
        .QN(n345) );
  DFFRX1 \roundCost_reg[6]  ( .D(n398), .CK(CLK), .RN(n696), .Q(roundCost[6]), 
        .QN(n346) );
  DFFRX1 \roundCost_reg[9]  ( .D(N330), .CK(CLK), .RN(n696), .Q(roundCost[9]), 
        .QN(n349) );
  DFFRX1 \roundCost_reg[7]  ( .D(N328), .CK(CLK), .RN(n696), .Q(roundCost[7]), 
        .QN(n347) );
  DFFRX1 \roundCost_reg[8]  ( .D(N329), .CK(CLK), .RN(n696), .Q(roundCost[8]), 
        .QN(n348) );
  DFFRX1 \arr_reg[0][2]  ( .D(n423), .CK(CLK), .RN(n696), .Q(\arr[0][2] ), 
        .QN(n388) );
  DFFRX1 \arr_reg[0][1]  ( .D(n422), .CK(CLK), .RN(n696), .Q(\arr[0][1] ), 
        .QN(n389) );
  DFFRX1 \arr_reg[0][0]  ( .D(n421), .CK(CLK), .RN(n696), .Q(\arr[0][0] ), 
        .QN(n390) );
  DFFRX2 \arr_reg[1][2]  ( .D(n441), .CK(CLK), .RN(n581), .Q(\arr[1][2] ), 
        .QN(n385) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n409), .CK(CLK), .RN(n696), .QN(n405) );
  DFFRX1 \MatchCount_reg[1]  ( .D(n408), .CK(CLK), .RN(n696), .QN(n360) );
  DFFRX2 \arr_reg[4][0]  ( .D(n434), .CK(CLK), .RN(n581), .Q(\arr[4][0] ), 
        .QN(n378) );
  DFFSX2 \arr_reg[5][2]  ( .D(n429), .CK(CLK), .SN(n582), .Q(\arr[5][2] ), 
        .QN(n374) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n406), .CK(CLK), .RN(n696), .QN(n361) );
  DFFRX2 \arr_reg[2][2]  ( .D(n438), .CK(CLK), .RN(n581), .Q(\arr[2][2] ), 
        .QN(n382) );
  DFFRX1 \count_read_reg[2]  ( .D(n420), .CK(CLK), .RN(n696), .Q(N69), .QN(
        n634) );
  NOR2X8 U367 ( .A(n493), .B(n519), .Y(n609) );
  CLKINVX6 U369 ( .A(n263), .Y(n716) );
  NAND2X4 U372 ( .A(\arr[5][1] ), .B(n372), .Y(n268) );
  AOI211X2 U375 ( .A0(n643), .A1(n660), .B0(n659), .C0(n655), .Y(n644) );
  OAI2BB2X2 U376 ( .B0(n194), .B1(n203), .A0N(\arr[4][1] ), .A1N(n194), .Y(
        n433) );
  AOI221X2 U377 ( .A0(\arr[6][1] ), .A1(n613), .B0(n612), .B1(\arr[7][1] ), 
        .C0(n604), .Y(n607) );
  INVX2 U381 ( .A(n147), .Y(n692) );
  NOR2X8 U385 ( .A(n617), .B(n519), .Y(n610) );
  AOI221X2 U390 ( .A0(\arr[6][2] ), .A1(n595), .B0(\arr[7][2] ), .B1(n739), 
        .C0(n591), .Y(n597) );
  NOR2X2 U394 ( .A(n288), .B(\arr[6][2] ), .Y(n540) );
  NOR2BX1 U397 ( .AN(roundCost_add_Cost[5]), .B(MinCost[5]), .Y(n655) );
  OAI211X1 U400 ( .A0(roundCost_add_Cost[1]), .A1(n666), .B0(n650), .C0(n649), 
        .Y(n652) );
  NOR2BX1 U401 ( .AN(MinCost[4]), .B(roundCost_add_Cost[4]), .Y(n641) );
  NOR2BX1 U402 ( .AN(roundCost_add_Cost[4]), .B(MinCost[4]), .Y(n656) );
  NOR2X1 U403 ( .A(n656), .B(n641), .Y(n657) );
  NAND3X4 U407 ( .A(n321), .B(n322), .C(n323), .Y(n293) );
  XNOR2X1 U408 ( .A(\arr[7][0] ), .B(n567), .Y(n323) );
  NAND3X2 U409 ( .A(n302), .B(n303), .C(n304), .Y(n291) );
  XNOR2X1 U410 ( .A(\arr[6][1] ), .B(n572), .Y(n302) );
  XNOR2X1 U411 ( .A(\arr[6][0] ), .B(n567), .Y(n304) );
  CLKINVX1 U412 ( .A(n664), .Y(n669) );
  INVX12 U414 ( .A(n550), .Y(\_1_net_[1] ) );
  CLKINVX1 U418 ( .A(roundCost_add_Cost[1]), .Y(n667) );
  CLKBUFX3 U419 ( .A(n77), .Y(n577) );
  NAND2X4 U420 ( .A(n508), .B(n162), .Y(n228) );
  OR2X4 U421 ( .A(n606), .B(n515), .Y(n511) );
  CLKINVX1 U422 ( .A(n168), .Y(n684) );
  BUFX12 U424 ( .A(n737), .Y(MinCost[1]) );
  INVX12 U425 ( .A(n726), .Y(W[0]) );
  OA21XL U426 ( .A0(n487), .A1(MatchCount[0]), .B0(n109), .Y(n111) );
  OAI222XL U427 ( .A0(n405), .A1(n109), .B0(n701), .B1(n673), .C0(n487), .C1(
        MatchCount[0]), .Y(n409) );
  OAI221XL U428 ( .A0(n711), .A1(n150), .B0(n683), .B1(n151), .C0(n152), .Y(
        n426) );
  AOI211X1 U430 ( .A0(n698), .A1(n713), .B0(n188), .C0(n189), .Y(n186) );
  AOI21X4 U431 ( .A0(n297), .A1(n308), .B0(n695), .Y(n301) );
  AOI222XL U433 ( .A0(n556), .A1(\arr[5][1] ), .B0(\arr[6][1] ), .B1(n555), 
        .C0(n362), .C1(n478), .Y(n500) );
  INVXL U434 ( .A(n552), .Y(n478) );
  AO22X2 U435 ( .A0(\arr[1][1] ), .A1(n593), .B0(\arr[0][1] ), .B1(n592), .Y(
        n588) );
  AO22X4 U436 ( .A0(n274), .A1(n275), .B0(n379), .B1(\arr[4][2] ), .Y(n262) );
  CLKMX2X2 U437 ( .A(\arr[2][0] ), .B(n237), .S0(n228), .Y(n440) );
  OR2X1 U438 ( .A(n207), .B(n686), .Y(n506) );
  AOI222XL U440 ( .A0(n556), .A1(\arr[5][2] ), .B0(\arr[6][2] ), .B1(n555), 
        .C0(n362), .C1(n479), .Y(n502) );
  INVXL U441 ( .A(n557), .Y(n479) );
  OAI211X1 U442 ( .A0(n504), .A1(n655), .B0(n480), .C0(n660), .Y(n668) );
  CLKINVX1 U443 ( .A(n659), .Y(n480) );
  AND2X2 U445 ( .A(n578), .B(n154), .Y(n153) );
  MXI2X1 U446 ( .A(n403), .B(n81), .S0(n77), .Y(n366) );
  AOI221X1 U448 ( .A0(\arr[6][0] ), .A1(n595), .B0(n739), .B1(\arr[7][0] ), 
        .C0(n583), .Y(n586) );
  CLKMX2X2 U449 ( .A(\arr[2][1] ), .B(n234), .S0(n228), .Y(n439) );
  NOR2X4 U451 ( .A(n705), .B(n84), .Y(n576) );
  MXI2X2 U452 ( .A(n363), .B(n186), .S0(n168), .Y(n431) );
  NAND3XL U453 ( .A(\arr[0][1] ), .B(\arr[0][2] ), .C(\arr[0][0] ), .Y(n334)
         );
  NAND2X1 U454 ( .A(n256), .B(n338), .Y(n328) );
  OR3X2 U455 ( .A(n537), .B(n538), .C(n539), .Y(n225) );
  OAI221XL U456 ( .A0(n710), .A1(n150), .B0(n682), .B1(n151), .C0(n155), .Y(
        n427) );
  OR2X1 U457 ( .A(\arr[1][2] ), .B(\afterSort[0][2] ), .Y(n513) );
  NAND2X6 U458 ( .A(n498), .B(N352), .Y(n487) );
  NOR3X2 U459 ( .A(n726), .B(n325), .C(n721), .Y(n89) );
  OR3X2 U460 ( .A(state[0]), .B(state[1]), .C(state[2]), .Y(n580) );
  OR2X4 U461 ( .A(n607), .B(n693), .Y(n510) );
  INVX4 U462 ( .A(n515), .Y(n693) );
  AOI222XL U463 ( .A0(n556), .A1(\arr[5][0] ), .B0(\arr[6][0] ), .B1(n555), 
        .C0(n362), .C1(n481), .Y(n501) );
  INVXL U464 ( .A(n551), .Y(n481) );
  AOI31X1 U465 ( .A0(n654), .A1(n653), .A2(n652), .B0(n651), .Y(n658) );
  NAND2X2 U468 ( .A(n77), .B(n244), .Y(n243) );
  INVX12 U470 ( .A(n483), .Y(Valid) );
  INVX16 U472 ( .A(n484), .Y(W[1]) );
  AOI22XL U473 ( .A0(N175), .A1(n153), .B0(n688), .B1(\arr[6][0] ), .Y(n156)
         );
  OAI21XL U474 ( .A0(n667), .A1(n648), .B0(n737), .Y(n650) );
  OAI2BB2X2 U475 ( .B0(n665), .B1(n646), .A0N(n670), .A1N(n730), .Y(n647) );
  NAND2X1 U476 ( .A(\_1_net_[2] ), .B(n77), .Y(n144) );
  INVX12 U477 ( .A(n549), .Y(\_1_net_[2] ) );
  NAND2X1 U478 ( .A(N69), .B(n576), .Y(n499) );
  OR3X2 U479 ( .A(n740), .B(n515), .C(n519), .Y(n245) );
  AOI222XL U480 ( .A0(N68), .A1(n84), .B0(n635), .B1(W[0]), .C0(n636), .C1(
        W[1]), .Y(n485) );
  INVXL U481 ( .A(n485), .Y(n702) );
  NOR2BX4 U483 ( .AN(n647), .B(roundCost_add_Cost[9]), .Y(N333) );
  INVX1 U487 ( .A(N73), .Y(n682) );
  AO22X2 U488 ( .A0(\arr[1][1] ), .A1(n610), .B0(\arr[0][1] ), .B1(n609), .Y(
        n605) );
  AO22X4 U491 ( .A0(\arr[5][0] ), .A1(n610), .B0(\arr[4][0] ), .B1(n609), .Y(
        n600) );
  AO22X4 U492 ( .A0(\arr[1][0] ), .A1(n610), .B0(\arr[0][0] ), .B1(n609), .Y(
        n601) );
  OAI22X4 U493 ( .A0(n375), .A1(n168), .B0(n684), .B1(n181), .Y(n430) );
  AOI211X2 U494 ( .A0(n698), .A1(\arr[3][1] ), .B0(n183), .C0(n184), .Y(n181)
         );
  AOI2BB2XL U497 ( .B0(N72), .B1(n245), .A0N(n711), .A1N(n245), .Y(n242) );
  OAI222X1 U500 ( .A0(n370), .A1(n241), .B0(n247), .B1(n243), .C0(n387), .C1(
        n244), .Y(n443) );
  OAI222X1 U501 ( .A0(n368), .A1(n241), .B0(n242), .B1(n243), .C0(n385), .C1(
        n244), .Y(n441) );
  NAND2BX1 U502 ( .AN(MinCost[2]), .B(roundCost_add_Cost[2]), .Y(n653) );
  XNOR2X4 U504 ( .A(\arr[4][1] ), .B(n572), .Y(n309) );
  INVX1 U510 ( .A(N72), .Y(n683) );
  NAND4X2 U511 ( .A(n291), .B(n292), .C(n293), .D(n294), .Y(N66) );
  AO22X1 U512 ( .A0(\arr[5][0] ), .A1(n593), .B0(\arr[4][0] ), .B1(n592), .Y(
        n583) );
  OAI22X4 U515 ( .A0(n379), .A1(n215), .B0(n685), .B1(n217), .Y(n435) );
  AOI221X2 U516 ( .A0(n699), .A1(\arr[6][1] ), .B0(n698), .B1(\arr[5][1] ), 
        .C0(n223), .Y(n222) );
  AOI211X2 U517 ( .A0(n698), .A1(\arr[3][2] ), .B0(n173), .C0(n174), .Y(n170)
         );
  OAI222X2 U518 ( .A0(n178), .A1(n520), .B0(n368), .B1(n179), .C0(n371), .C1(
        n180), .Y(n173) );
  AOI221X2 U519 ( .A0(n699), .A1(\arr[6][0] ), .B0(n698), .B1(\arr[5][0] ), 
        .C0(n225), .Y(n224) );
  OAI21X2 U520 ( .A0(n102), .A1(n361), .B0(n103), .Y(n406) );
  XNOR2X1 U521 ( .A(\arr[7][1] ), .B(n572), .Y(n322) );
  OAI221X1 U523 ( .A0(n178), .A1(n517), .B0(n691), .B1(n144), .C0(n232), .Y(
        n229) );
  OAI22X4 U524 ( .A0(n380), .A1(n215), .B0(n685), .B1(n222), .Y(n436) );
  OAI211X4 U526 ( .A0(n706), .A1(n686), .B0(n162), .C0(n226), .Y(n215) );
  OAI22X2 U527 ( .A0(n374), .A1(n168), .B0(n684), .B1(n170), .Y(n429) );
  NAND3BX2 U528 ( .AN(n191), .B(n162), .C(n176), .Y(n168) );
  OAI22X4 U529 ( .A0(n378), .A1(n690), .B0(n194), .B1(n208), .Y(n434) );
  AOI221X2 U530 ( .A0(n700), .A1(\arr[6][0] ), .B0(n699), .B1(\arr[5][0] ), 
        .C0(n211), .Y(n208) );
  OAI222X2 U531 ( .A0(n148), .A1(n689), .B0(n190), .B1(n496), .C0(n370), .C1(
        n180), .Y(n211) );
  AOI31X1 U533 ( .A0(n642), .A1(n654), .A2(n657), .B0(n641), .Y(n643) );
  NAND3BX1 U534 ( .AN(n651), .B(n640), .C(n639), .Y(n642) );
  XOR2X1 U535 ( .A(roundCost_add_Cost[8]), .B(MinCost[8]), .Y(n665) );
  OA21X2 U536 ( .A0(n369), .A1(\arr[6][1] ), .B0(n290), .Y(n288) );
  NAND3X4 U538 ( .A(n306), .B(n305), .C(n307), .Y(n294) );
  NAND3X4 U539 ( .A(n311), .B(n309), .C(n310), .Y(n292) );
  OAI2BB2XL U545 ( .B0(n382), .B1(n228), .A0N(n228), .A1N(n229), .Y(n438) );
  OA21XL U546 ( .A0(n487), .A1(MatchCount[2]), .B0(n107), .Y(n102) );
  NAND2X1 U548 ( .A(n518), .B(n687), .Y(n131) );
  NOR2X2 U550 ( .A(N333), .B(N290), .Y(N352) );
  INVX8 U551 ( .A(n546), .Y(\_1_net_[0] ) );
  INVX3 U552 ( .A(N333), .Y(n673) );
  INVX1 U553 ( .A(N74), .Y(n681) );
  OAI31X2 U554 ( .A0(n661), .A1(n645), .A2(n644), .B0(n662), .Y(n646) );
  BUFX12 U556 ( .A(N66), .Y(n515) );
  AOI221X2 U557 ( .A0(n700), .A1(\arr[6][2] ), .B0(n699), .B1(\arr[5][2] ), 
        .C0(n200), .Y(n195) );
  AOI221X2 U558 ( .A0(\arr[2][1] ), .A1(n613), .B0(n612), .B1(\arr[3][1] ), 
        .C0(n605), .Y(n606) );
  NOR2X1 U559 ( .A(n148), .B(n686), .Y(n537) );
  OAI222X2 U560 ( .A0(n689), .A1(n207), .B0(n496), .B1(n185), .C0(n369), .C1(
        n180), .Y(n206) );
  NAND3X1 U561 ( .A(n257), .B(n716), .C(n259), .Y(P1[2]) );
  OA21X4 U562 ( .A0(n105), .A1(n487), .B0(n109), .Y(n107) );
  NOR3XL U564 ( .A(n336), .B(\arr[3][1] ), .C(\arr[2][1] ), .Y(n331) );
  NOR3X1 U566 ( .A(n493), .B(n519), .C(n693), .Y(n202) );
  XOR2X2 U567 ( .A(n378), .B(n567), .Y(n311) );
  AOI221X2 U568 ( .A0(n700), .A1(\arr[6][1] ), .B0(n699), .B1(\arr[5][1] ), 
        .C0(n206), .Y(n203) );
  AO22X2 U570 ( .A0(\arr[5][2] ), .A1(n610), .B0(\arr[4][2] ), .B1(n609), .Y(
        n608) );
  AND2X2 U573 ( .A(n653), .B(n639), .Y(n649) );
  NAND2X1 U574 ( .A(n512), .B(n513), .Y(n314) );
  XOR2X1 U575 ( .A(n376), .B(\afterSort[0][2] ), .Y(n310) );
  XOR2X1 U576 ( .A(\arr[3][2] ), .B(\afterSort[0][2] ), .Y(n543) );
  AO22X2 U577 ( .A0(\arr[5][1] ), .A1(n593), .B0(\arr[4][1] ), .B1(n592), .Y(
        n587) );
  OR2X2 U578 ( .A(n266), .B(\arr[5][2] ), .Y(n505) );
  CLKINVX1 U580 ( .A(n576), .Y(n704) );
  NAND2X1 U583 ( .A(state[0]), .B(n709), .Y(n84) );
  INVX12 U584 ( .A(n360), .Y(MatchCount[1]) );
  AO22XL U586 ( .A0(\arr[1][1] ), .A1(n628), .B0(\arr[0][1] ), .B1(n627), .Y(
        n623) );
  OAI221X2 U587 ( .A0(n665), .A1(n669), .B0(MinCost[8]), .B1(n670), .C0(n671), 
        .Y(N290) );
  NAND2BX1 U588 ( .AN(n518), .B(n687), .Y(n133) );
  XNOR2X1 U589 ( .A(\arr[6][2] ), .B(\afterSort[0][2] ), .Y(n303) );
  NAND2X4 U591 ( .A(n510), .B(n511), .Y(N73) );
  CLKINVX1 U592 ( .A(roundCost_add_Cost[8]), .Y(n670) );
  OAI22XL U594 ( .A0(n378), .A1(n175), .B0(n546), .B1(n176), .Y(n189) );
  OAI22XL U595 ( .A0(n377), .A1(n175), .B0(n710), .B1(n176), .Y(n184) );
  NAND2X1 U597 ( .A(n577), .B(n579), .Y(n78) );
  CLKINVX6 U600 ( .A(RST), .Y(n696) );
  OR2X1 U602 ( .A(n369), .B(n221), .Y(n507) );
  OA21X2 U603 ( .A0(n706), .A1(n691), .B0(n240), .Y(n508) );
  CLKINVX2 U604 ( .A(n577), .Y(n706) );
  NOR2X2 U606 ( .A(n698), .B(n699), .Y(n162) );
  NAND4BX1 U608 ( .AN(n487), .B(n361), .C(n105), .D(MatchCount[2]), .Y(n103)
         );
  NAND2XL U609 ( .A(\arr[1][2] ), .B(\afterSort[0][2] ), .Y(n512) );
  XOR2X4 U611 ( .A(\arr[2][1] ), .B(n572), .Y(n547) );
  BUFX20 U613 ( .A(\afterSort[0][0] ), .Y(n567) );
  OAI221X1 U614 ( .A0(n185), .A1(n517), .B0(n691), .B1(n207), .C0(n235), .Y(
        n234) );
  NAND2BX1 U615 ( .AN(roundCost_add_Cost[2]), .B(MinCost[2]), .Y(n639) );
  BUFX20 U616 ( .A(N65), .Y(n519) );
  NAND4X4 U617 ( .A(n296), .B(n313), .C(n314), .D(n312), .Y(n308) );
  AO22XL U619 ( .A0(\arr[1][0] ), .A1(n593), .B0(\arr[0][0] ), .B1(n592), .Y(
        n584) );
  NAND3BX4 U620 ( .AN(n295), .B(n291), .C(n293), .Y(N65) );
  OAI222X2 U621 ( .A0(n144), .A1(n689), .B0(n496), .B1(n178), .C0(n368), .C1(
        n180), .Y(n200) );
  XOR2X2 U622 ( .A(n572), .B(\arr[3][1] ), .Y(n542) );
  NAND2X2 U623 ( .A(n578), .B(n147), .Y(n145) );
  XOR2X4 U624 ( .A(n713), .B(n567), .Y(n544) );
  NOR3X1 U625 ( .A(n493), .B(n515), .C(n616), .Y(n230) );
  NOR2X8 U626 ( .A(P1[1]), .B(P1[0]), .Y(n592) );
  AOI32X2 U628 ( .A0(n142), .A1(n575), .A2(n81), .B0(n577), .B1(n518), .Y(n141) );
  OAI222X2 U629 ( .A0(n144), .A1(n686), .B0(n178), .B1(n220), .C0(n368), .C1(
        n221), .Y(n218) );
  NAND2X4 U631 ( .A(n159), .B(n571), .Y(n151) );
  NAND3X4 U632 ( .A(n515), .B(n617), .C(n519), .Y(n571) );
  NOR2X6 U634 ( .A(n81), .B(P1[1]), .Y(n593) );
  OAI222X2 U636 ( .A0(n520), .A1(n185), .B0(n369), .B1(n179), .C0(n372), .C1(
        n180), .Y(n183) );
  OAI222X1 U638 ( .A0(n131), .A1(n546), .B0(n133), .B1(n681), .C0(n390), .C1(
        n687), .Y(n421) );
  OAI222X1 U639 ( .A0(n131), .A1(n710), .B0(n133), .B1(n682), .C0(n389), .C1(
        n687), .Y(n422) );
  OAI222X1 U640 ( .A0(n131), .A1(n711), .B0(n133), .B1(n683), .C0(n388), .C1(
        n687), .Y(n423) );
  AOI2BB2X1 U641 ( .B0(N177), .B1(n153), .A0N(n154), .A1N(n371), .Y(n152) );
  OA22XL U642 ( .A0(n371), .A1(n233), .B0(n368), .B1(n175), .Y(n232) );
  AOI2BB2XL U643 ( .B0(N73), .B1(n245), .A0N(n710), .A1N(n245), .Y(n246) );
  OA21X4 U644 ( .A0(n382), .A1(\arr[1][2] ), .B0(n278), .Y(n273) );
  AOI221X2 U646 ( .A0(n699), .A1(\arr[6][2] ), .B0(n698), .B1(\arr[5][2] ), 
        .C0(n218), .Y(n217) );
  OAI2BB2X2 U647 ( .B0(n194), .B1(n195), .A0N(\arr[4][2] ), .A1N(n194), .Y(
        n432) );
  INVX12 U648 ( .A(n499), .Y(W[2]) );
  INVX12 U649 ( .A(n361), .Y(MatchCount[3]) );
  INVX16 U650 ( .A(n405), .Y(MatchCount[0]) );
  INVX16 U651 ( .A(n404), .Y(MatchCount[2]) );
  BUFX12 U652 ( .A(n732), .Y(MinCost[6]) );
  BUFX12 U653 ( .A(n731), .Y(MinCost[7]) );
  BUFX12 U654 ( .A(n735), .Y(MinCost[3]) );
  BUFX12 U655 ( .A(n738), .Y(MinCost[0]) );
  OR2X1 U656 ( .A(n704), .B(n636), .Y(n726) );
  BUFX16 U657 ( .A(n734), .Y(MinCost[4]) );
  BUFX16 U659 ( .A(n736), .Y(MinCost[2]) );
  BUFX16 U660 ( .A(n733), .Y(MinCost[5]) );
  NAND2BXL U661 ( .AN(roundCost_add_Cost[5]), .B(MinCost[5]), .Y(n660) );
  BUFX16 U662 ( .A(n730), .Y(MinCost[8]) );
  INVXL U663 ( .A(n194), .Y(n690) );
  OAI211X4 U665 ( .A0(n706), .A1(n245), .B0(n248), .C0(n233), .Y(n244) );
  AOI2BB2XL U666 ( .B0(N74), .B1(n245), .A0N(n546), .A1N(n245), .Y(n247) );
  OAI21X1 U667 ( .A0(n672), .A1(n326), .B0(state[1]), .Y(n329) );
  NOR2XL U668 ( .A(n370), .B(n221), .Y(n539) );
  NOR2XL U669 ( .A(n704), .B(n89), .Y(n324) );
  OAI21X4 U670 ( .A0(n301), .A1(n694), .B0(n291), .Y(n300) );
  XNOR2X1 U671 ( .A(\arr[5][2] ), .B(\afterSort[0][2] ), .Y(n305) );
  NAND2XL U672 ( .A(n576), .B(n256), .Y(n339) );
  NOR2XL U673 ( .A(n256), .B(n704), .Y(n116) );
  NOR4XL U674 ( .A(n333), .B(n334), .C(\arr[7][1] ), .D(\arr[6][2] ), .Y(n332)
         );
  AOI31X2 U675 ( .A0(n668), .A1(n663), .A2(n662), .B0(n661), .Y(n664) );
  NOR3XL U676 ( .A(state[0]), .B(state[2]), .C(n705), .Y(n165) );
  NOR2X6 U677 ( .A(n706), .B(n688), .Y(n159) );
  CLKINVX4 U678 ( .A(n141), .Y(n687) );
  XNOR2X4 U679 ( .A(\arr[5][1] ), .B(n572), .Y(n306) );
  OR3X6 U680 ( .A(n542), .B(n543), .C(n544), .Y(n297) );
  NAND4X2 U681 ( .A(n162), .B(n250), .C(n251), .D(n179), .Y(n147) );
  OA21X4 U682 ( .A0(n701), .A1(n673), .B0(n580), .Y(n545) );
  OAI211XL U683 ( .A0(n84), .A1(n328), .B0(n706), .C0(n697), .Y(N299) );
  INVXL U685 ( .A(roundCost_add_Cost[0]), .Y(n680) );
  NOR4XL U686 ( .A(\arr[7][0] ), .B(n337), .C(n275), .D(n268), .Y(n330) );
  OA22X4 U687 ( .A0(n598), .A1(n586), .B0(n579), .B1(n585), .Y(n546) );
  NAND3BX4 U689 ( .AN(n547), .B(n315), .C(n317), .Y(n296) );
  OAI211X2 U690 ( .A0(n377), .A1(\arr[5][1] ), .B0(\arr[5][0] ), .C0(n378), 
        .Y(n272) );
  INVXL U691 ( .A(n648), .Y(n666) );
  NAND2XL U692 ( .A(Cost[6]), .B(n89), .Y(n101) );
  NAND2XL U693 ( .A(Cost[5]), .B(n89), .Y(n99) );
  NAND2XL U694 ( .A(Cost[4]), .B(n89), .Y(n97) );
  NAND2XL U695 ( .A(Cost[3]), .B(n89), .Y(n95) );
  NAND2XL U696 ( .A(Cost[2]), .B(n89), .Y(n93) );
  NAND2XL U697 ( .A(Cost[1]), .B(n89), .Y(n91) );
  NAND2XL U698 ( .A(Cost[0]), .B(n89), .Y(n88) );
  NAND4X1 U699 ( .A(n362), .B(n402), .C(n578), .D(P1_reg[0]), .Y(n175) );
  OA22XL U700 ( .A0(\arr[4][0] ), .A1(n402), .B0(\arr[2][0] ), .B1(P1_reg[1]), 
        .Y(n558) );
  OA22XL U701 ( .A0(\arr[4][2] ), .A1(n402), .B0(\arr[2][2] ), .B1(P1_reg[1]), 
        .Y(n564) );
  OA22XL U702 ( .A0(\arr[4][1] ), .A1(n402), .B0(\arr[2][1] ), .B1(P1_reg[1]), 
        .Y(n560) );
  NAND4XL U703 ( .A(\arr[1][2] ), .B(\arr[2][2] ), .C(\arr[1][1] ), .D(n335), 
        .Y(n333) );
  NAND3XL U704 ( .A(n374), .B(n363), .C(n381), .Y(n336) );
  NAND2BXL U705 ( .AN(n282), .B(n368), .Y(n337) );
  INVX3 U707 ( .A(n324), .Y(n703) );
  NOR3X1 U708 ( .A(n519), .B(n515), .C(n493), .Y(n140) );
  NOR3X2 U709 ( .A(n693), .B(n519), .C(n617), .Y(n177) );
  NOR3X1 U710 ( .A(n326), .B(n672), .C(n704), .Y(N300) );
  CLKINVX1 U711 ( .A(n579), .Y(n598) );
  CLKINVX1 U712 ( .A(n328), .Y(n672) );
  NOR2X1 U714 ( .A(n706), .B(n579), .Y(n142) );
  CLKINVX1 U715 ( .A(n116), .Y(n701) );
  CLKINVX1 U716 ( .A(n221), .Y(n700) );
  NAND3XL U717 ( .A(P1[0]), .B(n575), .C(n142), .Y(n248) );
  NAND2X1 U718 ( .A(n578), .B(n164), .Y(n250) );
  CLKINVX1 U719 ( .A(roundCost_add_Cost[6]), .Y(n675) );
  CLKINVX1 U720 ( .A(roundCost_add_Cost[4]), .Y(n677) );
  CLKINVX1 U721 ( .A(roundCost_add_Cost[3]), .Y(n678) );
  CLKINVX1 U722 ( .A(roundCost_add_Cost[2]), .Y(n679) );
  CLKINVX1 U723 ( .A(roundCost_add_Cost[5]), .Y(n676) );
  NAND2X1 U724 ( .A(\_1_net_[0] ), .B(n577), .Y(n148) );
  INVX3 U725 ( .A(n233), .Y(n698) );
  NAND2X1 U726 ( .A(\_1_net_[1] ), .B(n577), .Y(n207) );
  CLKINVX1 U727 ( .A(\_1_net_[2] ), .Y(n711) );
  INVX3 U728 ( .A(n175), .Y(n699) );
  CLKINVX1 U729 ( .A(\_1_net_[1] ), .Y(n710) );
  NAND2X2 U730 ( .A(n212), .B(n578), .Y(n180) );
  NAND2X1 U731 ( .A(n227), .B(n578), .Y(n221) );
  NAND3X1 U732 ( .A(n330), .B(n331), .C(n332), .Y(n326) );
  INVXL U735 ( .A(n84), .Y(n707) );
  CLKBUFX3 U736 ( .A(n696), .Y(n582) );
  CLKBUFX3 U737 ( .A(n696), .Y(n581) );
  OAI22XL U738 ( .A0(n376), .A1(n175), .B0(n711), .B1(n176), .Y(n174) );
  OAI222XL U739 ( .A0(n692), .A1(n207), .B0(n145), .B1(n500), .C0(n369), .C1(
        n147), .Y(n444) );
  OAI222XL U740 ( .A0(n692), .A1(n148), .B0(n145), .B1(n501), .C0(n370), .C1(
        n147), .Y(n425) );
  OAI222XL U741 ( .A0(n692), .A1(n144), .B0(n145), .B1(n502), .C0(n368), .C1(
        n147), .Y(n424) );
  OAI32X1 U742 ( .A0(MatchCount[2]), .A1(n487), .A2(n723), .B0(n404), .B1(n107), .Y(n407) );
  INVX1 U743 ( .A(n105), .Y(n723) );
  OAI32X1 U744 ( .A0(MatchCount[1]), .A1(n405), .A2(n487), .B0(n360), .B1(n111), .Y(n408) );
  OAI221XL U745 ( .A0(n545), .A1(n670), .B0(n352), .B1(n117), .C0(n580), .Y(
        n417) );
  OAI221XL U746 ( .A0(n545), .A1(n488), .B0(n353), .B1(n117), .C0(n580), .Y(
        n416) );
  OAI221XL U747 ( .A0(n545), .A1(n675), .B0(n354), .B1(n117), .C0(n580), .Y(
        n415) );
  OAI221XL U748 ( .A0(n545), .A1(n676), .B0(n355), .B1(n117), .C0(n580), .Y(
        n414) );
  OAI221XL U749 ( .A0(n545), .A1(n677), .B0(n356), .B1(n117), .C0(n580), .Y(
        n413) );
  OAI221XL U750 ( .A0(n545), .A1(n678), .B0(n357), .B1(n117), .C0(n580), .Y(
        n412) );
  OAI221XL U751 ( .A0(n545), .A1(n679), .B0(n358), .B1(n117), .C0(n580), .Y(
        n411) );
  OAI221XL U752 ( .A0(n545), .A1(n667), .B0(n359), .B1(n117), .C0(n580), .Y(
        n410) );
  OAI221XL U753 ( .A0(n545), .A1(n680), .B0(n350), .B1(n117), .C0(n580), .Y(
        n445) );
  XOR2X1 U754 ( .A(n368), .B(\afterSort[0][2] ), .Y(n321) );
  OA22X4 U755 ( .A0(n597), .A1(n598), .B0(n579), .B1(n596), .Y(n549) );
  OA22X4 U756 ( .A0(n598), .A1(n590), .B0(n579), .B1(n589), .Y(n550) );
  XNOR2X1 U757 ( .A(\arr[2][2] ), .B(\afterSort[0][2] ), .Y(n315) );
  AOI21X1 U758 ( .A0(state[0]), .A1(n329), .B0(state[2]), .Y(N298) );
  OAI221XL U759 ( .A0(n703), .A1(n675), .B0(n576), .B1(n346), .C0(n101), .Y(
        n398) );
  NAND3BX1 U760 ( .AN(n325), .B(n636), .C(n721), .Y(n256) );
  NAND2X1 U761 ( .A(n634), .B(n635), .Y(n325) );
  OAI22XL U762 ( .A0(n576), .A1(n348), .B0(n703), .B1(n670), .Y(N329) );
  OAI22XL U763 ( .A0(n576), .A1(n347), .B0(n703), .B1(n488), .Y(N328) );
  OAI2BB2XL U764 ( .B0(n576), .B1(n349), .A0N(roundCost_add_Cost[9]), .A1N(
        n324), .Y(N330) );
  OAI221XL U765 ( .A0(n703), .A1(n676), .B0(n576), .B1(n345), .C0(n99), .Y(
        n397) );
  OAI221XL U766 ( .A0(n703), .A1(n677), .B0(n576), .B1(n344), .C0(n97), .Y(
        n396) );
  OAI221XL U767 ( .A0(n703), .A1(n678), .B0(n576), .B1(n343), .C0(n95), .Y(
        n395) );
  OAI221XL U768 ( .A0(n703), .A1(n679), .B0(n576), .B1(n342), .C0(n93), .Y(
        n394) );
  OAI221XL U769 ( .A0(n703), .A1(n667), .B0(n576), .B1(n341), .C0(n91), .Y(
        n393) );
  OAI221XL U770 ( .A0(n703), .A1(n680), .B0(n576), .B1(n340), .C0(n88), .Y(
        n392) );
  OAI221XL U771 ( .A0(n126), .A1(n499), .B0(n634), .B1(n707), .C0(n130), .Y(
        n420) );
  NAND3XL U772 ( .A(W[1]), .B(N67), .C(n634), .Y(n130) );
  OAI31XL U773 ( .A0(n499), .A1(n721), .A2(n708), .B0(n124), .Y(n418) );
  OAI21XL U774 ( .A0(n125), .A1(n84), .B0(n721), .Y(n124) );
  OA21XL U775 ( .A0(n634), .A1(n708), .B0(n576), .Y(n125) );
  INVXL U776 ( .A(n126), .Y(n708) );
  NAND4X1 U777 ( .A(n362), .B(n402), .C(n403), .D(n578), .Y(n233) );
  OAI22XL U778 ( .A0(n575), .A1(n706), .B0(n402), .B1(n577), .Y(n365) );
  CLKBUFX3 U779 ( .A(n165), .Y(n578) );
  NOR2X1 U780 ( .A(n84), .B(state[1]), .Y(n77) );
  NAND4X1 U781 ( .A(n402), .B(n403), .C(n578), .D(P1_reg[2]), .Y(n179) );
  OAI22XL U782 ( .A0(n636), .A1(n707), .B0(n704), .B1(N67), .Y(n419) );
  NOR3X1 U783 ( .A(n403), .B(n402), .C(P1_reg[2]), .Y(n212) );
  NOR3X1 U784 ( .A(P1_reg[0]), .B(n402), .C(P1_reg[2]), .Y(n227) );
  AO21X1 U785 ( .A0(P1_reg[0]), .A1(n402), .B0(n213), .Y(n164) );
  OAI21XL U786 ( .A0(n362), .A1(n577), .B0(n78), .Y(n364) );
  NOR2X1 U787 ( .A(n405), .B(n360), .Y(n105) );
  NOR2X1 U788 ( .A(P1_reg[0]), .B(P1_reg[1]), .Y(n554) );
  NOR2X1 U789 ( .A(n402), .B(P1_reg[0]), .Y(n553) );
  AOI222XL U790 ( .A0(P1_reg[0]), .A1(n558), .B0(\arr[1][0] ), .B1(n554), .C0(
        n553), .C1(\arr[3][0] ), .Y(n551) );
  AND2X1 U791 ( .A(P1_reg[2]), .B(n403), .Y(n556) );
  AND2X1 U792 ( .A(P1_reg[2]), .B(P1_reg[0]), .Y(n555) );
  AOI222XL U793 ( .A0(P1_reg[0]), .A1(n560), .B0(\arr[1][1] ), .B1(n554), .C0(
        n553), .C1(\arr[3][1] ), .Y(n552) );
  AOI222XL U794 ( .A0(P1_reg[0]), .A1(n564), .B0(\arr[1][2] ), .B1(n554), .C0(
        n553), .C1(\arr[3][2] ), .Y(n557) );
  NOR2X1 U795 ( .A(n403), .B(P1_reg[1]), .Y(n563) );
  NOR2X1 U796 ( .A(n403), .B(n402), .Y(n562) );
  AOI222XL U797 ( .A0(n558), .A1(n403), .B0(\arr[3][0] ), .B1(n563), .C0(
        \arr[5][0] ), .C1(n562), .Y(n559) );
  OAI2BB2XL U798 ( .B0(P1_reg[2]), .B1(n559), .A0N(\arr[7][0] ), .A1N(
        P1_reg[2]), .Y(N175) );
  AOI222XL U799 ( .A0(n560), .A1(n403), .B0(\arr[3][1] ), .B1(n563), .C0(
        \arr[5][1] ), .C1(n562), .Y(n561) );
  OAI2BB2XL U800 ( .B0(P1_reg[2]), .B1(n561), .A0N(\arr[7][1] ), .A1N(
        P1_reg[2]), .Y(N176) );
  AOI222XL U801 ( .A0(n564), .A1(n403), .B0(\arr[3][2] ), .B1(n563), .C0(
        \arr[5][2] ), .C1(n562), .Y(n565) );
  OAI2BB2XL U802 ( .B0(P1_reg[2]), .B1(n565), .A0N(\arr[7][2] ), .A1N(
        P1_reg[2]), .Y(N177) );
  XNOR2X1 U803 ( .A(\arr[1][1] ), .B(n572), .Y(n313) );
  OAI211XL U804 ( .A0(n78), .A1(n81), .B0(n180), .C0(n179), .Y(n191) );
  AOI2BB2XL U805 ( .B0(\arr[7][0] ), .B1(n699), .A0N(n373), .A1N(n233), .Y(
        n238) );
  NOR3XL U806 ( .A(n378), .B(n373), .C(n377), .Y(n335) );
  NAND4XL U807 ( .A(n577), .B(n493), .C(n519), .D(n515), .Y(n251) );
  BUFX12 U808 ( .A(n729), .Y(J[0]) );
  NOR2BX1 U809 ( .AN(N314), .B(n339), .Y(n729) );
  BUFX12 U810 ( .A(n728), .Y(J[1]) );
  NOR2BX1 U811 ( .AN(N313), .B(n339), .Y(n728) );
  BUFX12 U812 ( .A(n727), .Y(J[2]) );
  NOR2BX1 U813 ( .AN(N312), .B(n339), .Y(n727) );
  XOR2X1 U814 ( .A(n387), .B(n567), .Y(n312) );
  AOI221X2 U816 ( .A0(\arr[6][2] ), .A1(n613), .B0(n612), .B1(\arr[7][2] ), 
        .C0(n608), .Y(n615) );
  AOI221X2 U817 ( .A0(\arr[2][0] ), .A1(n613), .B0(n612), .B1(\arr[3][0] ), 
        .C0(n601), .Y(n602) );
  AOI221X2 U818 ( .A0(\arr[2][2] ), .A1(n613), .B0(n612), .B1(\arr[3][2] ), 
        .C0(n611), .Y(n614) );
  AOI221X2 U819 ( .A0(\arr[6][0] ), .A1(n613), .B0(n612), .B1(\arr[7][0] ), 
        .C0(n600), .Y(n603) );
  AOI221X4 U820 ( .A0(n577), .A1(n496), .B0(n213), .B1(n578), .C0(n214), .Y(
        n194) );
  NAND3XL U821 ( .A(n81), .B(P1[1]), .C(n142), .Y(n240) );
  AOI31XL U822 ( .A0(P1[0]), .A1(P1[1]), .A2(n142), .B0(n700), .Y(n226) );
  OAI31XL U823 ( .A0(P1[0]), .A1(P1[1]), .A2(n78), .B0(n175), .Y(n214) );
  AO22X4 U824 ( .A0(\arr[1][2] ), .A1(n593), .B0(\arr[0][2] ), .B1(n592), .Y(
        n594) );
  OAI2BB1X4 U825 ( .A0N(n285), .A1N(n382), .B0(n286), .Y(n261) );
  AO21X4 U826 ( .A0(\arr[4][1] ), .A1(n380), .B0(n276), .Y(n274) );
  AOI221X2 U827 ( .A0(\arr[2][1] ), .A1(n595), .B0(\arr[3][1] ), .B1(n739), 
        .C0(n588), .Y(n589) );
  AOI221X2 U828 ( .A0(\arr[6][1] ), .A1(n595), .B0(\arr[7][1] ), .B1(n739), 
        .C0(n587), .Y(n590) );
  AOI221X2 U829 ( .A0(\arr[2][2] ), .A1(n595), .B0(\arr[3][2] ), .B1(n739), 
        .C0(n594), .Y(n596) );
  AOI2BB2XL U830 ( .B0(N176), .B1(n153), .A0N(n154), .A1N(n372), .Y(n155) );
  AOI2BB2XL U831 ( .B0(\arr[7][1] ), .B1(n699), .A0N(n372), .A1N(n233), .Y(
        n235) );
  XNOR2X4 U833 ( .A(\arr[5][0] ), .B(n567), .Y(n307) );
  OAI22X4 U834 ( .A0(n615), .A1(n693), .B0(n515), .B1(n614), .Y(N72) );
  AO22X4 U835 ( .A0(\arr[5][2] ), .A1(n593), .B0(\arr[4][2] ), .B1(n592), .Y(
        n591) );
  NAND2X8 U836 ( .A(n259), .B(n264), .Y(n81) );
  OAI22X4 U837 ( .A0(n693), .A1(n603), .B0(n515), .B1(n602), .Y(N74) );
  NOR2X1 U838 ( .A(n635), .B(N67), .Y(n631) );
  AOI221XL U843 ( .A0(\arr[6][0] ), .A1(n631), .B0(\arr[7][0] ), .B1(n126), 
        .C0(n618), .Y(n621) );
  AOI221XL U845 ( .A0(\arr[2][0] ), .A1(n631), .B0(\arr[3][0] ), .B1(n126), 
        .C0(n619), .Y(n620) );
  OAI22XL U846 ( .A0(n634), .A1(n621), .B0(N69), .B1(n620), .Y(N314) );
  AOI221XL U848 ( .A0(\arr[6][1] ), .A1(n631), .B0(\arr[7][1] ), .B1(n126), 
        .C0(n622), .Y(n625) );
  AOI221XL U849 ( .A0(\arr[2][1] ), .A1(n631), .B0(\arr[3][1] ), .B1(n126), 
        .C0(n623), .Y(n624) );
  OAI22XL U850 ( .A0(n634), .A1(n625), .B0(N69), .B1(n624), .Y(N313) );
  AOI221XL U852 ( .A0(\arr[6][2] ), .A1(n631), .B0(\arr[7][2] ), .B1(n126), 
        .C0(n626), .Y(n633) );
  AOI221XL U854 ( .A0(\arr[2][2] ), .A1(n631), .B0(\arr[3][2] ), .B1(n126), 
        .C0(n629), .Y(n632) );
  OAI22XL U855 ( .A0(n633), .A1(n634), .B0(N69), .B1(n632), .Y(N312) );
  NOR2X1 U856 ( .A(n350), .B(roundCost_add_Cost[0]), .Y(n638) );
  NAND2X1 U858 ( .A(roundCost_add_Cost[3]), .B(n357), .Y(n654) );
  setNumber_6 \instanceSomething[1].setNumber  ( .selfIdx({1'b0, 1'b0, 1'b1}), 
        .self_value({\arr[1][2] , \arr[1][1] , \arr[1][0] }), .P1_i({n579, 
        P1[1:0]}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[1][2] , \beforeSort[1][1] , \beforeSort[1][0] }) );
  setNumber_5 \instanceSomething[2].setNumber  ( .selfIdx({1'b0, 1'b1, 1'b0}), 
        .self_value({\arr[2][2] , \arr[2][1] , \arr[2][0] }), .P1_i({n579, 
        P1[1], 1'b0}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[2][2] , \beforeSort[2][1] , \beforeSort[2][0] }) );
  setNumber_4 \instanceSomething[3].setNumber  ( .selfIdx({1'b0, 1'b1, 1'b1}), 
        .self_value({\arr[3][2] , \arr[3][1] , \arr[3][0] }), .P1_i({n579, 
        P1[1:0]}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[3][2] , \beforeSort[3][1] , \beforeSort[3][0] }) );
  setNumber_3 \instanceSomething[4].setNumber  ( .selfIdx({1'b1, 1'b0, 1'b0}), 
        .self_value({\arr[4][2] , \arr[4][1] , \arr[4][0] }), .P1_i({n579, 
        1'b0, 1'b0}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[4][2] , \beforeSort[4][1] , \beforeSort[4][0] }) );
  setNumber_2 \instanceSomething[5].setNumber  ( .selfIdx({1'b1, 1'b0, 1'b1}), 
        .self_value({\arr[5][2] , \arr[5][1] , \arr[5][0] }), .P1_i({n579, 
        P1[1:0]}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[5][2] , \beforeSort[5][1] , \beforeSort[5][0] }) );
  setNumber_1 \instanceSomething[6].setNumber  ( .selfIdx({1'b1, 1'b1, 1'b0}), 
        .self_value({\arr[6][2] , \arr[6][1] , \arr[6][0] }), .P1_i({n579, 
        P1[1], 1'b0}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[6][2] , \beforeSort[6][1] , \beforeSort[6][0] }) );
  setNumber_0 \instanceSomething[7].setNumber  ( .selfIdx({1'b1, 1'b1, 1'b1}), 
        .self_value({\arr[7][2] , \arr[7][1] , \arr[7][0] }), .P1_i({n579, 
        P1[1:0]}), .P1_value({\_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .number_o({\beforeSort[7][2] , \beforeSort[7][1] , \beforeSort[7][0] }) );
  sort8 sort8 ( .in1({1'b1, 1'b1, 1'b1}), .in2({\beforeSort[1][2] , 
        \beforeSort[1][1] , \beforeSort[1][0] }), .in3({\beforeSort[2][2] , 
        \beforeSort[2][1] , \beforeSort[2][0] }), .in4({\beforeSort[3][2] , 
        \beforeSort[3][1] , \beforeSort[3][0] }), .in5({\beforeSort[4][2] , 
        \beforeSort[4][1] , \beforeSort[4][0] }), .in6({\beforeSort[5][2] , 
        \beforeSort[5][1] , \beforeSort[5][0] }), .in7({\beforeSort[6][2] , 
        \beforeSort[6][1] , \beforeSort[6][0] }), .in8({\beforeSort[7][2] , 
        \beforeSort[7][1] , \beforeSort[7][0] }), .out1({\afterSort[0][2] , 
        \afterSort[0][1] , \afterSort[0][0] }) );
  JAM_DW01_add_2 add_28 ( .A(roundCost), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM(roundCost_add_Cost) );
  DFFRX4 \arr_reg[6][0]  ( .D(n428), .CK(CLK), .RN(n581), .Q(\arr[6][0] ), 
        .QN(n373) );
  DFFRX1 \count_read_reg[0]  ( .D(n419), .CK(CLK), .RN(n696), .Q(N67), .QN(
        n636) );
  DFFRX1 \MatchCount_reg[2]  ( .D(n407), .CK(CLK), .RN(n696), .QN(n404) );
  INVX3 U688 ( .A(n381), .Y(n713) );
  NOR2X1 U565 ( .A(n386), .B(\arr[2][1] ), .Y(n281) );
  NAND2BX1 U537 ( .AN(n384), .B(n387), .Y(n282) );
  OAI2BB2X2 U370 ( .B0(n281), .B1(n282), .A0N(\arr[2][1] ), .A1N(n386), .Y(
        n280) );
  OAI2BB1X2 U832 ( .A0N(\arr[3][1] ), .A1N(n383), .B0(n287), .Y(n285) );
  OA21X2 U706 ( .A0(n372), .A1(\arr[7][1] ), .B0(\arr[7][0] ), .Y(n548) );
  NAND2X2 U484 ( .A(n548), .B(n373), .Y(n290) );
  OAI21X1 U413 ( .A0(n385), .A1(\arr[2][2] ), .B0(n280), .Y(n278) );
  OAI2BB1X2 U549 ( .A0N(\arr[5][2] ), .A1N(n266), .B0(\arr[6][2] ), .Y(n267)
         );
  NOR2X4 U393 ( .A(n540), .B(n741), .Y(n259) );
  BUFX6 U569 ( .A(P1[2]), .Y(n579) );
  AOI221X1 U513 ( .A0(\arr[2][0] ), .A1(n595), .B0(\arr[3][0] ), .B1(n739), 
        .C0(n584), .Y(n585) );
  BUFX16 U612 ( .A(\afterSort[0][1] ), .Y(n572) );
  XOR2X2 U506 ( .A(n384), .B(n567), .Y(n317) );
  NOR2X1 U509 ( .A(n354), .B(roundCost_add_Cost[6]), .Y(n645) );
  NOR2X1 U447 ( .A(roundCost_add_Cost[7]), .B(n353), .Y(n661) );
  DFFRX1 \count_read_reg[1]  ( .D(n702), .CK(CLK), .RN(n696), .Q(N68), .QN(
        n635) );
  INVX16 U386 ( .A(n492), .Y(n617) );
  INVX12 U368 ( .A(n740), .Y(n493) );
  INVXL U482 ( .A(roundCost_add_Cost[9]), .Y(n671) );
  AO22X2 U490 ( .A0(\arr[5][1] ), .A1(n610), .B0(\arr[4][1] ), .B1(n609), .Y(
        n604) );
  OA21XL U598 ( .A0(n575), .A1(n78), .B0(n162), .Y(n509) );
  BUFX4 U571 ( .A(n230), .Y(n517) );
  OAI21X1 U627 ( .A0(n325), .A1(n721), .B0(N290), .Y(n338) );
  BUFX4 U382 ( .A(n140), .Y(n518) );
  BUFX4 U392 ( .A(n202), .Y(n496) );
  BUFX6 U637 ( .A(n177), .Y(n520) );
  NAND2X4 U563 ( .A(n545), .B(n487), .Y(n109) );
  NOR2X2 U507 ( .A(n220), .B(n190), .Y(n538) );
  NAND2X6 U633 ( .A(n520), .B(n577), .Y(n176) );
  INVX3 U605 ( .A(n517), .Y(n691) );
  NAND2X6 U380 ( .A(N73), .B(n577), .Y(n185) );
  INVX1 U391 ( .A(n496), .Y(n689) );
  OAI211X1 U388 ( .A0(n220), .A1(n185), .B0(n506), .C0(n507), .Y(n223) );
  INVX1 U630 ( .A(n571), .Y(n161) );
  NAND2X2 U645 ( .A(n159), .B(n161), .Y(n150) );
  OAI221X1 U498 ( .A0(n190), .A1(n517), .B0(n691), .B1(n148), .C0(n238), .Y(
        n237) );
  INVX2 U525 ( .A(n215), .Y(n685) );
  OAI222X1 U499 ( .A0(n369), .A1(n241), .B0(n246), .B1(n243), .C0(n386), .C1(
        n244), .Y(n442) );
  DFFRX2 \arr_reg[1][1]  ( .D(n442), .CK(CLK), .RN(n581), .Q(\arr[1][1] ), 
        .QN(n386) );
  AND2X6 U585 ( .A(n505), .B(n267), .Y(n257) );
  INVX3 U432 ( .A(n292), .Y(n695) );
  INVX6 U496 ( .A(n740), .Y(n492) );
  OR2X1 U734 ( .A(n227), .B(n212), .Y(n213) );
  AO22X2 U489 ( .A0(\arr[1][2] ), .A1(n610), .B0(\arr[0][2] ), .B1(n609), .Y(
        n611) );
  AOI2BB2X2 U94 ( .B0(n164), .B1(n578), .A0N(n571), .A1N(n706), .Y(n163) );
  NAND2X1 U635 ( .A(n578), .B(n244), .Y(n241) );
  NOR2X4 U371 ( .A(n575), .B(P1[0]), .Y(n595) );
  NAND2X6 U373 ( .A(N74), .B(n577), .Y(n190) );
  NOR3X4 U374 ( .A(n616), .B(n515), .C(n617), .Y(n220) );
  AND2X8 U378 ( .A(n293), .B(n300), .Y(n740) );
  INVX4 U379 ( .A(n294), .Y(n694) );
  NAND2XL U383 ( .A(roundCost_add_Cost[0]), .B(n350), .Y(n648) );
  AO21X1 U384 ( .A0(n667), .A1(n638), .B0(MinCost[1]), .Y(n637) );
  OAI211XL U387 ( .A0(n638), .A1(n667), .B0(n637), .C0(n649), .Y(n640) );
  NOR2XL U389 ( .A(n357), .B(roundCost_add_Cost[3]), .Y(n651) );
  AO21X1 U395 ( .A0(n658), .A1(n657), .B0(n656), .Y(n504) );
  NAND2BX1 U396 ( .AN(n645), .B(n663), .Y(n659) );
  NAND2XL U398 ( .A(roundCost_add_Cost[7]), .B(n353), .Y(n662) );
  AOI211X1 U399 ( .A0(\arr[3][1] ), .A1(n377), .B0(n378), .C0(n713), .Y(n276)
         );
  INVX2 U404 ( .A(n154), .Y(n688) );
  AND2X1 U405 ( .A(n116), .B(n673), .Y(n498) );
  INVX1 U406 ( .A(n220), .Y(n686) );
  INVXL U415 ( .A(n578), .Y(n697) );
  INVX2 U416 ( .A(n545), .Y(n117) );
  NAND3XL U417 ( .A(state[2]), .B(n526), .C(n705), .Y(n483) );
  OAI221XL U423 ( .A0(n546), .A1(n150), .B0(n681), .B1(n151), .C0(n156), .Y(
        n428) );
  OAI2BB2X1 U429 ( .B0(n685), .B1(n224), .A0N(\arr[3][0] ), .A1N(n685), .Y(
        n437) );
  NOR2X4 U439 ( .A(n81), .B(n575), .Y(n739) );
  NAND2X1 U444 ( .A(n576), .B(N68), .Y(n484) );
  NOR2X1 U450 ( .A(N67), .B(N68), .Y(n627) );
  AO22XL U466 ( .A0(\arr[1][2] ), .A1(n628), .B0(\arr[0][2] ), .B1(n627), .Y(
        n629) );
  AO22XL U467 ( .A0(\arr[5][2] ), .A1(n628), .B0(\arr[4][2] ), .B1(n627), .Y(
        n626) );
  AO22XL U469 ( .A0(\arr[5][1] ), .A1(n628), .B0(\arr[4][1] ), .B1(n627), .Y(
        n622) );
  AO22XL U471 ( .A0(\arr[1][0] ), .A1(n628), .B0(\arr[0][0] ), .B1(n627), .Y(
        n619) );
  AO22XL U485 ( .A0(\arr[5][0] ), .A1(n628), .B0(\arr[4][0] ), .B1(n627), .Y(
        n618) );
  NOR2X1 U486 ( .A(n636), .B(N68), .Y(n628) );
  NAND2X6 U495 ( .A(N72), .B(n577), .Y(n178) );
  NOR2X6 U503 ( .A(n616), .B(n493), .Y(n613) );
  INVX6 U505 ( .A(n519), .Y(n616) );
  AOI21X2 U508 ( .A0(\arr[6][2] ), .A1(n288), .B0(n368), .Y(n741) );
  NOR2X2 U514 ( .A(n635), .B(n636), .Y(n126) );
  NAND2X4 U522 ( .A(n509), .B(n163), .Y(n154) );
  NAND2X4 U532 ( .A(n376), .B(\arr[3][2] ), .Y(n275) );
  INVX16 U540 ( .A(n575), .Y(P1[1]) );
  AND2X8 U541 ( .A(n259), .B(n260), .Y(n575) );
  NOR2X8 U542 ( .A(n616), .B(n617), .Y(n612) );
  CLKINVX12 U543 ( .A(n81), .Y(P1[0]) );
  INVXL U544 ( .A(roundCost_add_Cost[7]), .Y(n488) );
  NAND2XL U547 ( .A(roundCost_add_Cost[6]), .B(n354), .Y(n663) );
endmodule

