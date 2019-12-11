
module LdSr_FSM ( clk, reset, LDSRstr, DIRiEn, DIRjEn, opCode, RrEn, RwEn, 
        MARload, MDRwriteEn, MDRreadEn, MDRrOutEn, MEMR_W, MEMEn, MFC, IF );
  input [3:0] opCode;
  input clk, reset, LDSRstr, MFC;
  output DIRiEn, DIRjEn, RrEn, RwEn, MARload, MDRwriteEn, MDRreadEn, MDRrOutEn,
         MEMR_W, MEMEn, IF;
  wire   N168, N169, N171, N173, N175, N177, N178, N179, N180, N181, N182,
         N183, N184, N185, N186, N187, N188, N189, N190, N191, n20, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n85,
         n86, n87, n88;
  wire   [4:0] currState;
  wire   [4:0] nextState;

  LATCHX1 \nextState_reg[0]  ( .CLK(N178), .D(N171), .Q(nextState[0]) );
  DFFARX1 \currState_reg[0]  ( .D(nextState[0]), .CLK(clk), .RSTB(n20), .Q(
        currState[0]), .QN(n88) );
  LATCHX1 \nextState_reg[3]  ( .CLK(N178), .D(N177), .Q(nextState[3]) );
  DFFARX1 \currState_reg[3]  ( .D(nextState[3]), .CLK(clk), .RSTB(n20), .Q(
        currState[3]), .QN(n85) );
  LATCHX1 \nextState_reg[4]  ( .CLK(N178), .D(N179), .Q(nextState[4]) );
  DFFARX1 \currState_reg[4]  ( .D(nextState[4]), .CLK(clk), .RSTB(n20), .Q(
        currState[4]) );
  LATCHX1 \nextState_reg[1]  ( .CLK(N178), .D(N173), .Q(nextState[1]) );
  DFFARX1 \currState_reg[1]  ( .D(nextState[1]), .CLK(clk), .RSTB(n20), .Q(
        currState[1]), .QN(n86) );
  LATCHX1 \nextState_reg[2]  ( .CLK(N178), .D(N175), .Q(nextState[2]) );
  DFFARX1 \currState_reg[2]  ( .D(nextState[2]), .CLK(clk), .RSTB(n20), .Q(
        currState[2]), .QN(n87) );
  LATCHX1 MDRreadEn_reg ( .CLK(N189), .D(n25), .Q(MDRreadEn) );
  LATCHX1 RwEn_reg ( .CLK(N185), .D(n23), .Q(RwEn) );
  LATCHX1 MDRrOutEn_reg ( .CLK(N190), .D(n32), .Q(MDRrOutEn) );
  LATCHX1 MDRwriteEn_reg ( .CLK(N188), .D(n31), .Q(MDRwriteEn) );
  LATCHX1 MEMR_W_reg ( .CLK(N191), .D(n28), .Q(MEMR_W) );
  LATCHX1 MARload_reg ( .CLK(N186), .D(N187), .Q(MARload) );
  LATCHX1 RrEn_reg ( .CLK(N183), .D(N184), .Q(RrEn) );
  LATCHX1 DIRjEn_reg ( .CLK(N181), .D(N182), .Q(DIRjEn) );
  LATCHX1 MEMEn_reg ( .CLK(N168), .D(N169), .Q(MEMEn) );
  LATCHX1 DIRiEn_reg ( .CLK(N180), .D(n33), .Q(DIRiEn) );
  INVX0 U3 ( .IN(reset), .QN(n20) );
  INVX0 U86 ( .IN(N187), .QN(n29) );
  AND2X1 U87 ( .IN1(n57), .IN2(n49), .Q(n51) );
  NAND2X0 U88 ( .IN1(n61), .IN2(n58), .QN(N187) );
  NAND3X0 U89 ( .IN1(n50), .IN2(n30), .IN3(n51), .QN(N183) );
  INVX0 U90 ( .IN(N184), .QN(n30) );
  NAND3X0 U91 ( .IN1(n50), .IN2(n29), .IN3(n51), .QN(N186) );
  NAND3X0 U92 ( .IN1(n44), .IN2(n49), .IN3(n45), .QN(N189) );
  NAND2X0 U93 ( .IN1(n51), .IN2(n56), .QN(N180) );
  NAND2X0 U94 ( .IN1(n51), .IN2(n47), .QN(N188) );
  INVX0 U95 ( .IN(n74), .QN(n26) );
  INVX0 U96 ( .IN(n45), .QN(n25) );
  INVX0 U97 ( .IN(n56), .QN(n33) );
  INVX0 U98 ( .IN(n44), .QN(n32) );
  INVX0 U99 ( .IN(N169), .QN(n27) );
  INVX0 U100 ( .IN(n47), .QN(n31) );
  NAND2X0 U101 ( .IN1(n76), .IN2(n81), .QN(n45) );
  NAND2X0 U102 ( .IN1(n70), .IN2(n81), .QN(n44) );
  AND3X1 U103 ( .IN1(n87), .IN2(n85), .IN3(n86), .Q(n80) );
  NAND2X0 U104 ( .IN1(n70), .IN2(n80), .QN(n56) );
  AND4X1 U105 ( .IN1(n55), .IN2(n47), .IN3(n46), .IN4(n45), .Q(n64) );
  NAND2X0 U106 ( .IN1(n76), .IN2(n80), .QN(n74) );
  AND3X1 U107 ( .IN1(n50), .IN2(n27), .IN3(n54), .Q(n60) );
  NAND3X0 U108 ( .IN1(n70), .IN2(n87), .IN3(n77), .QN(n47) );
  NAND2X0 U109 ( .IN1(n26), .IN2(n38), .QN(n49) );
  NAND3X0 U110 ( .IN1(n70), .IN2(n86), .IN3(n82), .QN(n50) );
  NAND2X0 U111 ( .IN1(n72), .IN2(n62), .QN(N169) );
  NAND3X0 U112 ( .IN1(n76), .IN2(n87), .IN3(n77), .QN(n53) );
  NAND3X0 U113 ( .IN1(n70), .IN2(n85), .IN3(n71), .QN(n57) );
  NAND3X0 U114 ( .IN1(n44), .IN2(n49), .IN3(n52), .QN(N190) );
  NAND4X0 U115 ( .IN1(n66), .IN2(n52), .IN3(n44), .IN4(n43), .QN(N179) );
  NAND2X0 U116 ( .IN1(n53), .IN2(n54), .QN(N184) );
  NAND3X0 U117 ( .IN1(n76), .IN2(n86), .IN3(n82), .QN(n58) );
  NAND3X0 U118 ( .IN1(n76), .IN2(n85), .IN3(n71), .QN(n61) );
  NAND3X0 U119 ( .IN1(n50), .IN2(n24), .IN3(n55), .QN(N181) );
  INVX0 U120 ( .IN(N190), .QN(n24) );
  NAND3X0 U121 ( .IN1(n46), .IN2(n49), .IN3(n50), .QN(N191) );
  NAND3X0 U122 ( .IN1(n43), .IN2(n49), .IN3(n52), .QN(N185) );
  NAND2X0 U123 ( .IN1(n55), .IN2(n44), .QN(N182) );
  NAND4X0 U124 ( .IN1(n61), .IN2(n57), .IN3(n62), .IN4(n63), .QN(N175) );
  OA21X1 U125 ( .IN1(n40), .IN2(n53), .IN3(n64), .Q(n63) );
  NAND4X0 U126 ( .IN1(n46), .IN2(n45), .IN3(n58), .IN4(n59), .QN(N177) );
  OA21X1 U127 ( .IN1(n57), .IN2(n40), .IN3(n60), .Q(n59) );
  NAND4X0 U128 ( .IN1(n43), .IN2(n29), .IN3(n72), .IN4(n73), .QN(N171) );
  OA221X1 U129 ( .IN1(n74), .IN2(n38), .IN3(n53), .IN4(n75), .IN5(n64), .Q(n73) );
  NAND4X0 U130 ( .IN1(n66), .IN2(n45), .IN3(n49), .IN4(n27), .QN(N168) );
  INVX0 U131 ( .IN(n75), .QN(n39) );
  INVX0 U132 ( .IN(n43), .QN(n23) );
  INVX0 U133 ( .IN(n46), .QN(n28) );
  INVX0 U134 ( .IN(n65), .QN(n40) );
  NOR2X0 U135 ( .IN1(currState[4]), .IN2(currState[0]), .QN(n76) );
  NOR2X0 U136 ( .IN1(n88), .IN2(currState[4]), .QN(n70) );
  NAND4X0 U137 ( .IN1(n64), .IN2(n60), .IN3(n78), .IN4(n79), .QN(N178) );
  NOR4X0 U138 ( .IN1(N187), .IN2(N179), .IN3(n26), .IN4(n33), .QN(n79) );
  NOR2X0 U139 ( .IN1(currState[4]), .IN2(n83), .QN(n78) );
  OA21X1 U140 ( .IN1(n65), .IN2(n39), .IN3(opCode[3]), .Q(n83) );
  NOR2X0 U141 ( .IN1(n87), .IN2(currState[1]), .QN(n71) );
  NOR2X0 U142 ( .IN1(n86), .IN2(currState[3]), .QN(n77) );
  NOR2X0 U143 ( .IN1(n85), .IN2(currState[2]), .QN(n82) );
  AND3X1 U144 ( .IN1(currState[2]), .IN2(currState[1]), .IN3(currState[3]), 
        .Q(n81) );
  NAND3X0 U145 ( .IN1(n80), .IN2(n88), .IN3(currState[4]), .QN(n43) );
  NAND3X0 U146 ( .IN1(n76), .IN2(currState[3]), .IN3(n71), .QN(n46) );
  NAND3X0 U147 ( .IN1(n76), .IN2(currState[2]), .IN3(n77), .QN(n55) );
  NAND3X0 U148 ( .IN1(n42), .IN2(n41), .IN3(opCode[2]), .QN(n75) );
  NOR3X0 U149 ( .IN1(n42), .IN2(opCode[2]), .IN3(n41), .QN(n65) );
  NAND3X0 U150 ( .IN1(currState[4]), .IN2(n80), .IN3(currState[0]), .QN(n52)
         );
  NAND3X0 U151 ( .IN1(n70), .IN2(currState[1]), .IN3(n82), .QN(n66) );
  NAND3X0 U152 ( .IN1(n70), .IN2(currState[3]), .IN3(n71), .QN(n62) );
  NAND3X0 U153 ( .IN1(n76), .IN2(currState[1]), .IN3(n82), .QN(n72) );
  NAND3X0 U154 ( .IN1(n70), .IN2(currState[2]), .IN3(n77), .QN(n54) );
  NOR4X0 U155 ( .IN1(n48), .IN2(nextState[0]), .IN3(nextState[3]), .IN4(
        nextState[2]), .QN(IF) );
  NAND2X0 U156 ( .IN1(nextState[4]), .IN2(nextState[1]), .QN(n48) );
  NAND4X0 U157 ( .IN1(n66), .IN2(n55), .IN3(n67), .IN4(n68), .QN(N173) );
  AOI22X1 U158 ( .IN1(n39), .IN2(n69), .IN3(MFC), .IN4(N169), .QN(n67) );
  AND4X1 U159 ( .IN1(n45), .IN2(n56), .IN3(n50), .IN4(n52), .Q(n68) );
  NAND2X0 U160 ( .IN1(n53), .IN2(n57), .QN(n69) );
  INVX0 U161 ( .IN(LDSRstr), .QN(n38) );
  INVX0 U162 ( .IN(opCode[1]), .QN(n41) );
  INVX0 U163 ( .IN(opCode[0]), .QN(n42) );
endmodule

