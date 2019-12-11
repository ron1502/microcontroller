
module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [16:0] carry;

  FADDX1 U2_14 ( .A(A[14]), .B(n17), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  FADDX1 U2_13 ( .A(A[13]), .B(n16), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  FADDX1 U2_12 ( .A(A[12]), .B(n15), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  FADDX1 U2_11 ( .A(A[11]), .B(n14), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  FADDX1 U2_10 ( .A(A[10]), .B(n13), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  FADDX1 U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  FADDX1 U2_8 ( .A(A[8]), .B(n11), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  FADDX1 U2_7 ( .A(A[7]), .B(n10), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  FADDX1 U2_6 ( .A(A[6]), .B(n9), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1 U2_5 ( .A(A[5]), .B(n8), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1 U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1 U2_2 ( .A(A[2]), .B(n5), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1 U2_1 ( .A(A[1]), .B(n4), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X1 U2_15 ( .IN1(A[15]), .IN2(n3), .IN3(carry[15]), .Q(DIFF[15]) );
  XOR2X1 U1 ( .IN1(n1), .IN2(n2), .Q(DIFF[0]) );
  INVX0 U2 ( .IN(B[1]), .QN(n4) );
  NAND2X0 U3 ( .IN1(B[0]), .IN2(n1), .QN(carry[1]) );
  INVX0 U4 ( .IN(B[2]), .QN(n5) );
  INVX0 U5 ( .IN(B[3]), .QN(n6) );
  INVX0 U6 ( .IN(B[4]), .QN(n7) );
  INVX0 U7 ( .IN(B[5]), .QN(n8) );
  INVX0 U8 ( .IN(B[6]), .QN(n9) );
  INVX0 U9 ( .IN(B[7]), .QN(n10) );
  INVX0 U10 ( .IN(B[8]), .QN(n11) );
  INVX0 U11 ( .IN(B[9]), .QN(n12) );
  INVX0 U12 ( .IN(B[10]), .QN(n13) );
  INVX0 U13 ( .IN(B[11]), .QN(n14) );
  INVX0 U14 ( .IN(B[12]), .QN(n15) );
  INVX0 U15 ( .IN(B[13]), .QN(n16) );
  INVX0 U16 ( .IN(B[14]), .QN(n17) );
  INVX0 U17 ( .IN(B[0]), .QN(n2) );
  INVX0 U18 ( .IN(A[0]), .QN(n1) );
  INVX0 U19 ( .IN(B[15]), .QN(n3) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;

  wire   [15:1] carry;

  FADDX1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X1 U1_15 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(SUM[15]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  XOR2X1 U1 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
  AND2X1 U2 ( .IN1(A[0]), .IN2(B[0]), .Q(carry[1]) );
endmodule


module ALU ( bus, enIn1, enIn2, opCode, outEn, reset );
  inout [15:0] bus;
  input [3:0] opCode;
  input enIn1, enIn2, outEn, reset;
  wire   N58, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80,
         N81, N82, N83, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, N97, N98, N99, N100, n57, n58, n59, n66, n67, n68, n70, n71, n72,
         n74, n75, n76, n78, n79, n80, n82, n83, n84, n86, n90, n91, n92, n94,
         n95, n96, n98, n99, n100, n103, n104, n106, n107, n108, n110, n111,
         n112, n114, n115, n116, n118, n119, n120, n122, n123, n124, n127,
         n128, n129, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n183, n185, n187,
         n189, n191, n193, n195, n197, n199, n201, n203, n205, n207, n209,
         n211, n213, n215, n216, n217, n218, n219, n220, n221, n222, n223,
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
         n345, n346, n347, n348, n349;
  wire   [15:0] in1;
  wire   [15:0] in2;
  tri   [15:0] bus;
  assign N58 = enIn1;

  TNBUFFHX1 \bus_tri[0]  ( .IN(n149), .ENB(outEn), .Q(bus[0]) );
  TNBUFFHX1 \bus_tri[1]  ( .IN(n148), .ENB(outEn), .Q(bus[1]) );
  TNBUFFHX1 \bus_tri[2]  ( .IN(n147), .ENB(outEn), .Q(bus[2]) );
  TNBUFFHX1 \bus_tri[3]  ( .IN(n146), .ENB(outEn), .Q(bus[3]) );
  TNBUFFHX1 \bus_tri[4]  ( .IN(n145), .ENB(outEn), .Q(bus[4]) );
  TNBUFFHX1 \bus_tri[5]  ( .IN(n144), .ENB(outEn), .Q(bus[5]) );
  TNBUFFHX1 \bus_tri[6]  ( .IN(n143), .ENB(outEn), .Q(bus[6]) );
  TNBUFFHX1 \bus_tri[7]  ( .IN(n142), .ENB(outEn), .Q(bus[7]) );
  TNBUFFHX1 \bus_tri[8]  ( .IN(n141), .ENB(outEn), .Q(bus[8]) );
  TNBUFFHX1 \bus_tri[9]  ( .IN(n140), .ENB(outEn), .Q(bus[9]) );
  TNBUFFHX1 \bus_tri[10]  ( .IN(n139), .ENB(outEn), .Q(bus[10]) );
  TNBUFFHX1 \bus_tri[11]  ( .IN(n138), .ENB(outEn), .Q(bus[11]) );
  TNBUFFHX1 \bus_tri[12]  ( .IN(n137), .ENB(outEn), .Q(bus[12]) );
  TNBUFFHX1 \bus_tri[13]  ( .IN(n136), .ENB(outEn), .Q(bus[13]) );
  TNBUFFHX1 \bus_tri[14]  ( .IN(n135), .ENB(outEn), .Q(bus[14]) );
  TNBUFFHX1 \bus_tri[15]  ( .IN(n134), .ENB(outEn), .Q(bus[15]) );
  ALU_DW01_sub_0 sub_30_S2 ( .A(in1), .B(in2), .CI(1'b0), .DIFF({N100, N99, 
        N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86, N85})
         );
  ALU_DW01_add_0 add_29_S2 ( .A(in1), .B(in2), .CI(1'b0), .SUM({N83, N82, N81, 
        N80, N79, N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, N68}) );
  LASRX1 \in1_reg[15]  ( .RSTB(n334), .SETB(1'b1), .CLK(n340), .D(n330), .Q(
        in1[15]), .QN(n211) );
  LASRX1 \in1_reg[1]  ( .RSTB(n336), .SETB(1'b1), .CLK(n340), .D(n317), .Q(
        in1[1]), .QN(n209) );
  LASRX1 \in1_reg[2]  ( .RSTB(n336), .SETB(1'b1), .CLK(n340), .D(n318), .Q(
        in1[2]), .QN(n207) );
  LASRX1 \in1_reg[3]  ( .RSTB(n336), .SETB(1'b1), .CLK(n340), .D(n319), .Q(
        in1[3]), .QN(n205) );
  LASRX1 \in1_reg[4]  ( .RSTB(n336), .SETB(1'b1), .CLK(n340), .D(n320), .Q(
        in1[4]), .QN(n203) );
  LASRX1 \in1_reg[5]  ( .RSTB(n335), .SETB(1'b1), .CLK(n340), .D(n321), .Q(
        in1[5]), .QN(n201) );
  LASRX1 \in1_reg[6]  ( .RSTB(n336), .SETB(1'b1), .CLK(n340), .D(n322), .Q(
        in1[6]), .QN(n199) );
  LASRX1 \in1_reg[7]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n323), .Q(
        in1[7]), .QN(n197) );
  LASRX1 \in1_reg[8]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n324), .Q(
        in1[8]), .QN(n195) );
  LASRX1 \in1_reg[9]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n315), .Q(
        in1[9]), .QN(n193) );
  LASRX1 \in1_reg[10]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n325), .Q(
        in1[10]), .QN(n191) );
  LASRX1 \in1_reg[11]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n326), .Q(
        in1[11]), .QN(n189) );
  LASRX1 \in1_reg[12]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n327), .Q(
        in1[12]), .QN(n187) );
  LASRX1 \in1_reg[13]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n328), .Q(
        in1[13]), .QN(n185) );
  LASRX1 \in1_reg[14]  ( .RSTB(n335), .SETB(1'b1), .CLK(n339), .D(n329), .Q(
        in1[14]), .QN(n183) );
  DFFARX1 \in2_reg[15]  ( .D(n180), .CLK(enIn2), .RSTB(n333), .Q(in2[15]), 
        .QN(n156) );
  DFFARX1 \in2_reg[1]  ( .D(n179), .CLK(enIn2), .RSTB(n333), .Q(in2[1]), .QN(
        n157) );
  DFFARX1 \in2_reg[2]  ( .D(n178), .CLK(enIn2), .RSTB(n333), .Q(in2[2]), .QN(
        n158) );
  DFFARX1 \in2_reg[3]  ( .D(n177), .CLK(enIn2), .RSTB(n333), .Q(in2[3]), .QN(
        n159) );
  DFFARX1 \in2_reg[4]  ( .D(n176), .CLK(enIn2), .RSTB(n333), .Q(in2[4]), .QN(
        n160) );
  DFFARX1 \in2_reg[5]  ( .D(n175), .CLK(enIn2), .RSTB(n333), .Q(in2[5]), .QN(
        n161) );
  DFFARX1 \in2_reg[6]  ( .D(n174), .CLK(enIn2), .RSTB(n333), .Q(in2[6]), .QN(
        n162) );
  DFFARX1 \in2_reg[7]  ( .D(n173), .CLK(enIn2), .RSTB(n334), .Q(in2[7]), .QN(
        n163) );
  DFFARX1 \in2_reg[8]  ( .D(n172), .CLK(enIn2), .RSTB(n333), .Q(in2[8]), .QN(
        n164) );
  DFFARX1 \in2_reg[9]  ( .D(n171), .CLK(enIn2), .RSTB(n334), .Q(in2[9]), .QN(
        n165) );
  DFFARX1 \in2_reg[10]  ( .D(n170), .CLK(enIn2), .RSTB(n334), .Q(in2[10]), 
        .QN(n151) );
  DFFARX1 \in2_reg[11]  ( .D(n169), .CLK(enIn2), .RSTB(n334), .Q(in2[11]), 
        .QN(n152) );
  DFFARX1 \in2_reg[12]  ( .D(n168), .CLK(enIn2), .RSTB(n334), .Q(in2[12]), 
        .QN(n153) );
  DFFARX1 \in2_reg[13]  ( .D(n167), .CLK(enIn2), .RSTB(n334), .Q(in2[13]), 
        .QN(n154) );
  DFFARX1 \in2_reg[14]  ( .D(n166), .CLK(enIn2), .RSTB(n334), .Q(in2[14]), 
        .QN(n155) );
  DFFARX1 \in2_reg[0]  ( .D(n181), .CLK(enIn2), .RSTB(n333), .Q(in2[0]), .QN(
        n150) );
  LASRX1 \in1_reg[0]  ( .RSTB(n334), .SETB(1'b1), .CLK(n340), .D(n316), .Q(
        in1[0]), .QN(n213) );
  INVX4 U150 ( .IN(n302), .QN(n303) );
  ISOLORX2 U151 ( .D(n293), .ISO(n283), .Q(n308) );
  NAND2X1 U152 ( .IN1(n162), .IN2(n272), .QN(n281) );
  DELLN3X2 U153 ( .IN(bus[6]), .Q(n322) );
  INVX4 U154 ( .IN(opCode[0]), .QN(n348) );
  INVX8 U155 ( .IN(opCode[2]), .QN(n346) );
  NAND2X0 U156 ( .IN1(n279), .IN2(n219), .QN(n103) );
  NAND2X0 U157 ( .IN1(n274), .IN2(in2[14]), .QN(n279) );
  NAND2X0 U158 ( .IN1(n288), .IN2(n218), .QN(n104) );
  NAND2X0 U159 ( .IN1(n155), .IN2(n274), .QN(n288) );
  NAND2X1 U160 ( .IN1(n273), .IN2(in2[14]), .QN(n287) );
  AO21X1 U161 ( .IN1(opCode[1]), .IN2(n346), .IN3(n292), .Q(n133) );
  OR2X1 U162 ( .IN1(opCode[3]), .IN2(reset), .Q(n292) );
  NBUFFX2 U163 ( .IN(n300), .Q(n272) );
  AO221X1 U164 ( .IN1(n153), .IN2(n215), .IN3(n274), .IN4(in2[12]), .IN5(n294), 
        .Q(n111) );
  AO221X1 U165 ( .IN1(n273), .IN2(in2[11]), .IN3(n152), .IN4(n314), .IN5(n311), 
        .Q(n116) );
  AO221X1 U166 ( .IN1(n215), .IN2(n165), .IN3(n275), .IN4(in2[9]), .IN5(n306), 
        .Q(n58) );
  AO221X1 U167 ( .IN1(n273), .IN2(in2[9]), .IN3(n165), .IN4(n314), .IN5(n311), 
        .Q(n59) );
  AO221X1 U168 ( .IN1(n164), .IN2(n215), .IN3(n275), .IN4(in2[8]), .IN5(n294), 
        .Q(n67) );
  AND2X1 U169 ( .IN1(n310), .IN2(in2[6]), .Q(n299) );
  NBUFFX2 U170 ( .IN(n300), .Q(n271) );
  AOI221X1 U171 ( .IN1(n312), .IN2(in2[3]), .IN3(n159), .IN4(n274), .IN5(n310), 
        .QN(n277) );
  INVX2 U172 ( .IN(n305), .QN(n331) );
  NBUFFX2 U173 ( .IN(bus[0]), .Q(n316) );
  NBUFFX2 U174 ( .IN(bus[14]), .Q(n329) );
  NBUFFX2 U175 ( .IN(bus[13]), .Q(n328) );
  NBUFFX2 U176 ( .IN(bus[12]), .Q(n327) );
  NBUFFX2 U177 ( .IN(bus[11]), .Q(n326) );
  NBUFFX2 U178 ( .IN(bus[10]), .Q(n325) );
  NBUFFX2 U179 ( .IN(bus[9]), .Q(n315) );
  NBUFFX2 U180 ( .IN(bus[8]), .Q(n324) );
  NBUFFX2 U181 ( .IN(bus[7]), .Q(n323) );
  NBUFFX2 U182 ( .IN(bus[5]), .Q(n321) );
  NBUFFX2 U183 ( .IN(bus[4]), .Q(n320) );
  NBUFFX2 U184 ( .IN(bus[3]), .Q(n319) );
  NBUFFX2 U185 ( .IN(bus[2]), .Q(n318) );
  NBUFFX2 U186 ( .IN(bus[1]), .Q(n317) );
  NBUFFX2 U187 ( .IN(bus[15]), .Q(n330) );
  AOI222X1 U188 ( .IN1(n183), .IN2(n103), .IN3(n104), .IN4(in1[14]), .IN5(n311), .IN6(in2[14]), .QN(n286) );
  NOR2X2 U189 ( .IN1(n128), .IN2(n127), .QN(n215) );
  INVX2 U190 ( .IN(n308), .QN(n314) );
  AND2X1 U191 ( .IN1(n265), .IN2(n263), .Q(n216) );
  OR2X1 U192 ( .IN1(opCode[2]), .IN2(opCode[0]), .Q(n217) );
  INVX2 U193 ( .IN(n294), .QN(n280) );
  AND2X1 U194 ( .IN1(n287), .IN2(n307), .Q(n218) );
  AND2X1 U195 ( .IN1(n280), .IN2(n278), .Q(n219) );
  NAND2X0 U196 ( .IN1(n211), .IN2(n99), .QN(n220) );
  NAND2X0 U197 ( .IN1(n100), .IN2(in1[15]), .QN(n221) );
  NAND2X0 U198 ( .IN1(n311), .IN2(in2[15]), .QN(n222) );
  NAND3X0 U199 ( .IN1(n220), .IN2(n221), .IN3(n222), .QN(n98) );
  NAND2X0 U200 ( .IN1(n264), .IN2(n216), .QN(n99) );
  INVX4 U201 ( .IN(n307), .QN(n311) );
  NAND2X2 U202 ( .IN1(n280), .IN2(n281), .QN(n223) );
  NAND2X2 U203 ( .IN1(n282), .IN2(n224), .QN(n75) );
  INVX2 U204 ( .IN(n223), .QN(n224) );
  NAND2X1 U205 ( .IN1(n275), .IN2(in2[6]), .QN(n282) );
  OR2X1 U206 ( .IN1(n284), .IN2(n305), .Q(n225) );
  OR2X1 U207 ( .IN1(n285), .IN2(n304), .Q(n226) );
  NAND3X0 U208 ( .IN1(n225), .IN2(n226), .IN3(n286), .QN(n135) );
  INVX0 U209 ( .IN(N82), .QN(n284) );
  INVX0 U210 ( .IN(N99), .QN(n285) );
  NAND2X0 U211 ( .IN1(n191), .IN2(n119), .QN(n227) );
  NAND2X0 U212 ( .IN1(n120), .IN2(in1[10]), .QN(n228) );
  NAND2X0 U213 ( .IN1(n311), .IN2(in2[10]), .QN(n229) );
  NAND3X0 U214 ( .IN1(n227), .IN2(n228), .IN3(n229), .QN(n118) );
  NAND2X0 U215 ( .IN1(n185), .IN2(n107), .QN(n230) );
  NAND2X0 U216 ( .IN1(n108), .IN2(in1[13]), .QN(n231) );
  NAND2X0 U217 ( .IN1(n310), .IN2(in2[13]), .QN(n232) );
  NAND3X0 U218 ( .IN1(n230), .IN2(n231), .IN3(n232), .QN(n106) );
  NAND2X0 U219 ( .IN1(n203), .IN2(n83), .QN(n233) );
  NAND2X0 U220 ( .IN1(n84), .IN2(in1[4]), .QN(n234) );
  NAND2X0 U221 ( .IN1(n310), .IN2(in2[4]), .QN(n235) );
  NAND3X0 U222 ( .IN1(n233), .IN2(n234), .IN3(n235), .QN(n82) );
  NAND2X0 U223 ( .IN1(n201), .IN2(n79), .QN(n236) );
  NAND2X0 U224 ( .IN1(n80), .IN2(in1[5]), .QN(n237) );
  NAND2X0 U225 ( .IN1(n311), .IN2(in2[5]), .QN(n238) );
  NAND3X0 U226 ( .IN1(n236), .IN2(n237), .IN3(n238), .QN(n78) );
  NAND2X0 U227 ( .IN1(n189), .IN2(n115), .QN(n239) );
  NAND2X0 U228 ( .IN1(n116), .IN2(in1[11]), .QN(n240) );
  NAND2X0 U229 ( .IN1(n311), .IN2(in2[11]), .QN(n241) );
  NAND3X0 U230 ( .IN1(n239), .IN2(n240), .IN3(n241), .QN(n114) );
  NAND2X0 U231 ( .IN1(n209), .IN2(n95), .QN(n242) );
  NAND2X0 U232 ( .IN1(n96), .IN2(in1[1]), .QN(n243) );
  NAND2X0 U233 ( .IN1(n310), .IN2(in2[1]), .QN(n244) );
  NAND3X0 U234 ( .IN1(n242), .IN2(n243), .IN3(n244), .QN(n94) );
  NAND2X0 U235 ( .IN1(n213), .IN2(n123), .QN(n245) );
  NAND2X0 U236 ( .IN1(n124), .IN2(in1[0]), .QN(n246) );
  NAND2X0 U237 ( .IN1(n311), .IN2(in2[0]), .QN(n247) );
  NAND3X0 U238 ( .IN1(n245), .IN2(n246), .IN3(n247), .QN(n122) );
  NAND2X0 U239 ( .IN1(n207), .IN2(n91), .QN(n248) );
  NAND2X0 U240 ( .IN1(n92), .IN2(in1[2]), .QN(n249) );
  NAND2X0 U241 ( .IN1(n311), .IN2(in2[2]), .QN(n250) );
  NAND3X0 U242 ( .IN1(n248), .IN2(n249), .IN3(n250), .QN(n90) );
  NAND2X0 U243 ( .IN1(n197), .IN2(n71), .QN(n251) );
  NAND2X0 U244 ( .IN1(n72), .IN2(in1[7]), .QN(n252) );
  NAND2X0 U245 ( .IN1(n311), .IN2(in2[7]), .QN(n253) );
  NAND3X0 U246 ( .IN1(n251), .IN2(n252), .IN3(n253), .QN(n70) );
  NAND2X0 U247 ( .IN1(n195), .IN2(n67), .QN(n254) );
  NAND2X0 U248 ( .IN1(n68), .IN2(in1[8]), .QN(n255) );
  NAND2X0 U249 ( .IN1(n311), .IN2(in2[8]), .QN(n256) );
  NAND3X0 U250 ( .IN1(n254), .IN2(n255), .IN3(n256), .QN(n66) );
  NAND2X0 U251 ( .IN1(n193), .IN2(n58), .QN(n257) );
  NAND2X0 U252 ( .IN1(n59), .IN2(in1[9]), .QN(n258) );
  NAND2X0 U253 ( .IN1(n310), .IN2(in2[9]), .QN(n259) );
  NAND3X0 U254 ( .IN1(n257), .IN2(n258), .IN3(n259), .QN(n57) );
  NAND2X0 U255 ( .IN1(n187), .IN2(n111), .QN(n260) );
  NAND2X0 U256 ( .IN1(n112), .IN2(in1[12]), .QN(n261) );
  NAND2X0 U257 ( .IN1(n310), .IN2(in2[12]), .QN(n262) );
  NAND3X0 U258 ( .IN1(n260), .IN2(n261), .IN3(n262), .QN(n110) );
  INVX4 U259 ( .IN(n307), .QN(n310) );
  NAND2X0 U260 ( .IN1(n156), .IN2(n215), .QN(n263) );
  NAND2X0 U261 ( .IN1(n274), .IN2(in2[15]), .QN(n264) );
  AOINVX1 U262 ( .IN(n294), .QN(n265) );
  NOR2X0 U263 ( .IN1(in1[3]), .IN2(n276), .QN(n266) );
  NOR2X0 U264 ( .IN1(n277), .IN2(n205), .QN(n267) );
  NOR2X0 U265 ( .IN1(n307), .IN2(n159), .QN(n268) );
  OR3X1 U266 ( .IN1(n266), .IN2(n267), .IN3(n268), .Q(n86) );
  NAND2X1 U267 ( .IN1(n128), .IN2(n129), .QN(n269) );
  AOINVX2 U268 ( .IN(n309), .QN(n270) );
  NAND2X2 U269 ( .IN1(n269), .IN2(n270), .QN(n313) );
  INVX0 U270 ( .IN(n313), .QN(n312) );
  INVX2 U271 ( .IN(n313), .QN(n273) );
  NOR2X1 U272 ( .IN1(n128), .IN2(n127), .QN(n300) );
  ISOLORX2 U273 ( .D(opCode[3]), .ISO(reset), .Q(n127) );
  INVX4 U274 ( .IN(n308), .QN(n274) );
  INVX4 U275 ( .IN(n308), .QN(n275) );
  NOR2X4 U276 ( .IN1(n347), .IN2(n303), .QN(n306) );
  NBUFFX16 U277 ( .IN(n306), .Q(n294) );
  AOI221X1 U278 ( .IN1(n159), .IN2(n271), .IN3(n275), .IN4(in2[3]), .IN5(n306), 
        .QN(n276) );
  NAND2X0 U279 ( .IN1(n155), .IN2(n215), .QN(n278) );
  NAND2X4 U280 ( .IN1(n348), .IN2(n296), .QN(n128) );
  INVX4 U281 ( .IN(n295), .QN(n296) );
  OR3X1 U282 ( .IN1(opCode[1]), .IN2(n346), .IN3(n348), .Q(n283) );
  OR2X1 U283 ( .IN1(opCode[3]), .IN2(reset), .Q(n293) );
  OR2X1 U284 ( .IN1(n297), .IN2(n299), .Q(n289) );
  OR2X1 U285 ( .IN1(n298), .IN2(n289), .Q(n74) );
  NAND2X0 U286 ( .IN1(n273), .IN2(in2[6]), .QN(n290) );
  NAND2X0 U287 ( .IN1(n162), .IN2(n275), .QN(n291) );
  NAND3X0 U288 ( .IN1(n290), .IN2(n291), .IN3(n307), .QN(n76) );
  NOR2X4 U289 ( .IN1(n309), .IN2(n217), .QN(n302) );
  NAND2X4 U290 ( .IN1(opCode[1]), .IN2(opCode[2]), .QN(n295) );
  ISOLORX2 U291 ( .D(n292), .ISO(n301), .Q(n307) );
  AND2X1 U292 ( .IN1(n199), .IN2(n75), .Q(n297) );
  AND2X1 U293 ( .IN1(n76), .IN2(in1[6]), .Q(n298) );
  ISOLORX2 U294 ( .D(opCode[3]), .ISO(reset), .Q(n309) );
  OR3X1 U295 ( .IN1(opCode[1]), .IN2(opCode[0]), .IN3(n346), .Q(n301) );
  NAND4X0 U296 ( .IN1(n132), .IN2(n347), .IN3(n346), .IN4(n336), .QN(n304) );
  AO221X1 U297 ( .IN1(opCode[2]), .IN2(n348), .IN3(opCode[0]), .IN4(n347), 
        .IN5(n133), .Q(n305) );
  NBUFFX2 U298 ( .IN(n349), .Q(n336) );
  INVX0 U299 ( .IN(n341), .QN(n337) );
  INVX0 U300 ( .IN(n341), .QN(n338) );
  INVX0 U301 ( .IN(n344), .QN(n339) );
  INVX0 U302 ( .IN(n345), .QN(n340) );
  AO22X1 U303 ( .IN1(n338), .IN2(in2[14]), .IN3(n329), .IN4(n344), .Q(n166) );
  AO22X1 U304 ( .IN1(n338), .IN2(in2[13]), .IN3(n328), .IN4(n344), .Q(n167) );
  AO22X1 U305 ( .IN1(n338), .IN2(in2[12]), .IN3(n327), .IN4(n345), .Q(n168) );
  AO22X1 U306 ( .IN1(n338), .IN2(in2[11]), .IN3(n326), .IN4(n345), .Q(n169) );
  AO22X1 U307 ( .IN1(n338), .IN2(in2[10]), .IN3(n325), .IN4(n344), .Q(n170) );
  AO22X1 U308 ( .IN1(n337), .IN2(in2[9]), .IN3(n315), .IN4(n342), .Q(n171) );
  AO22X1 U309 ( .IN1(n337), .IN2(in2[8]), .IN3(n324), .IN4(n342), .Q(n172) );
  AO22X1 U310 ( .IN1(n337), .IN2(in2[7]), .IN3(n323), .IN4(n343), .Q(n173) );
  AO22X1 U311 ( .IN1(n337), .IN2(in2[6]), .IN3(n322), .IN4(n343), .Q(n174) );
  AO22X1 U312 ( .IN1(n337), .IN2(in2[5]), .IN3(n321), .IN4(n343), .Q(n175) );
  AO22X1 U313 ( .IN1(n337), .IN2(in2[4]), .IN3(n320), .IN4(n341), .Q(n176) );
  AO22X1 U314 ( .IN1(n337), .IN2(in2[3]), .IN3(n319), .IN4(n342), .Q(n177) );
  AO22X1 U315 ( .IN1(n337), .IN2(in2[2]), .IN3(n318), .IN4(n341), .Q(n178) );
  AO22X1 U316 ( .IN1(n338), .IN2(in2[1]), .IN3(n317), .IN4(n342), .Q(n179) );
  AO22X1 U317 ( .IN1(n338), .IN2(in2[15]), .IN3(n330), .IN4(n343), .Q(n180) );
  AO22X1 U318 ( .IN1(n338), .IN2(in2[0]), .IN3(n316), .IN4(n345), .Q(n181) );
  NBUFFX2 U319 ( .IN(n349), .Q(n333) );
  NBUFFX2 U320 ( .IN(n349), .Q(n334) );
  NBUFFX2 U321 ( .IN(n349), .Q(n335) );
  AO221X1 U322 ( .IN1(n273), .IN2(in2[13]), .IN3(n154), .IN4(n275), .IN5(n310), 
        .Q(n108) );
  AO221X1 U323 ( .IN1(n273), .IN2(in2[12]), .IN3(n153), .IN4(n274), .IN5(n311), 
        .Q(n112) );
  AO221X1 U324 ( .IN1(n273), .IN2(in2[10]), .IN3(n151), .IN4(n274), .IN5(n310), 
        .Q(n120) );
  AO221X1 U325 ( .IN1(n273), .IN2(in2[8]), .IN3(n164), .IN4(n275), .IN5(n310), 
        .Q(n68) );
  AO221X1 U326 ( .IN1(n273), .IN2(in2[7]), .IN3(n163), .IN4(n314), .IN5(n311), 
        .Q(n72) );
  AO221X1 U327 ( .IN1(n273), .IN2(in2[5]), .IN3(n161), .IN4(n314), .IN5(n310), 
        .Q(n80) );
  AO221X1 U328 ( .IN1(n273), .IN2(in2[4]), .IN3(n160), .IN4(n275), .IN5(n310), 
        .Q(n84) );
  AO221X1 U329 ( .IN1(n273), .IN2(in2[2]), .IN3(n158), .IN4(n314), .IN5(n311), 
        .Q(n92) );
  AO221X1 U330 ( .IN1(n273), .IN2(in2[1]), .IN3(n157), .IN4(n314), .IN5(n311), 
        .Q(n96) );
  AO221X1 U331 ( .IN1(n312), .IN2(in2[0]), .IN3(n150), .IN4(n274), .IN5(n310), 
        .Q(n124) );
  AO221X1 U332 ( .IN1(n154), .IN2(n215), .IN3(n314), .IN4(in2[13]), .IN5(n294), 
        .Q(n107) );
  AO221X1 U333 ( .IN1(n152), .IN2(n215), .IN3(n275), .IN4(in2[11]), .IN5(n294), 
        .Q(n115) );
  AO221X1 U334 ( .IN1(n151), .IN2(n215), .IN3(n275), .IN4(in2[10]), .IN5(n294), 
        .Q(n119) );
  AO221X1 U335 ( .IN1(n163), .IN2(n272), .IN3(n314), .IN4(in2[7]), .IN5(n294), 
        .Q(n71) );
  AO221X1 U336 ( .IN1(n161), .IN2(n272), .IN3(n274), .IN4(in2[5]), .IN5(n294), 
        .Q(n79) );
  AO221X1 U337 ( .IN1(n160), .IN2(n272), .IN3(n274), .IN4(in2[4]), .IN5(n294), 
        .Q(n83) );
  AO221X1 U338 ( .IN1(n158), .IN2(n272), .IN3(n275), .IN4(in2[2]), .IN5(n294), 
        .Q(n91) );
  AO221X1 U339 ( .IN1(n157), .IN2(n272), .IN3(n314), .IN4(in2[1]), .IN5(n306), 
        .Q(n95) );
  AO221X1 U340 ( .IN1(n150), .IN2(n272), .IN3(n274), .IN4(in2[0]), .IN5(n294), 
        .Q(n123) );
  INVX2 U341 ( .IN(n304), .QN(n332) );
  XOR2X1 U342 ( .IN1(opCode[3]), .IN2(opCode[0]), .Q(n132) );
  INVX0 U343 ( .IN(reset), .QN(n349) );
  INVX0 U344 ( .IN(opCode[1]), .QN(n347) );
  INVX0 U345 ( .IN(N58), .QN(n341) );
  INVX0 U346 ( .IN(N58), .QN(n344) );
  INVX0 U347 ( .IN(N58), .QN(n345) );
  INVX0 U348 ( .IN(N58), .QN(n342) );
  INVX0 U349 ( .IN(N58), .QN(n343) );
  NAND3X0 U350 ( .IN1(opCode[0]), .IN2(n346), .IN3(opCode[1]), .QN(n129) );
  AO221X1 U351 ( .IN1(n312), .IN2(in2[15]), .IN3(n156), .IN4(n275), .IN5(n311), 
        .Q(n100) );
  AO221X1 U352 ( .IN1(N77), .IN2(n331), .IN3(N94), .IN4(n332), .IN5(n57), .Q(
        n140) );
  AO221X1 U353 ( .IN1(N68), .IN2(n331), .IN3(N85), .IN4(n332), .IN5(n122), .Q(
        n149) );
  AO221X1 U354 ( .IN1(N69), .IN2(n331), .IN3(N86), .IN4(n332), .IN5(n94), .Q(
        n148) );
  AO221X1 U355 ( .IN1(N70), .IN2(n331), .IN3(N87), .IN4(n332), .IN5(n90), .Q(
        n147) );
  AO221X1 U356 ( .IN1(N71), .IN2(n331), .IN3(N88), .IN4(n332), .IN5(n86), .Q(
        n146) );
  AO221X1 U357 ( .IN1(N72), .IN2(n331), .IN3(N89), .IN4(n332), .IN5(n82), .Q(
        n145) );
  AO221X1 U358 ( .IN1(N73), .IN2(n331), .IN3(N90), .IN4(n332), .IN5(n78), .Q(
        n144) );
  AO221X1 U359 ( .IN1(N74), .IN2(n331), .IN3(N91), .IN4(n332), .IN5(n74), .Q(
        n143) );
  AO221X1 U360 ( .IN1(N75), .IN2(n331), .IN3(N92), .IN4(n332), .IN5(n70), .Q(
        n142) );
  AO221X1 U361 ( .IN1(N76), .IN2(n331), .IN3(N93), .IN4(n332), .IN5(n66), .Q(
        n141) );
  AO221X1 U362 ( .IN1(N78), .IN2(n331), .IN3(N95), .IN4(n332), .IN5(n118), .Q(
        n139) );
  AO221X1 U363 ( .IN1(N79), .IN2(n331), .IN3(N96), .IN4(n332), .IN5(n114), .Q(
        n138) );
  AO221X1 U364 ( .IN1(N80), .IN2(n331), .IN3(N97), .IN4(n332), .IN5(n110), .Q(
        n137) );
  AO221X1 U365 ( .IN1(N81), .IN2(n331), .IN3(N98), .IN4(n332), .IN5(n106), .Q(
        n136) );
  AO221X1 U366 ( .IN1(N83), .IN2(n331), .IN3(N100), .IN4(n332), .IN5(n98), .Q(
        n134) );
endmodule

