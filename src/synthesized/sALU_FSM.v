
module ALU_FSM ( clk, reset, ALUstr, opCode, DIRiEn, DIRjEn, DBRjEn, RrEn, 
        RwEn, ALUEnIn1, ALUEnIn2, ALUOutEn, IF );
  input [3:0] opCode;
  input clk, reset, ALUstr;
  output DIRiEn, DIRjEn, DBRjEn, RrEn, RwEn, ALUEnIn1, ALUEnIn2, ALUOutEn, IF;
  wire   N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N114,
         n13, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74;
  wire   [3:0] currState;
  wire   [3:0] nextState;
  assign IF = N114;

  DFFARX1 \currState_reg[0]  ( .D(nextState[0]), .CLK(clk), .RSTB(n13), .Q(
        currState[0]), .QN(n71) );
  DFFARX1 \currState_reg[2]  ( .D(nextState[2]), .CLK(clk), .RSTB(n13), .Q(
        currState[2]), .QN(n74) );
  DFFARX1 \currState_reg[3]  ( .D(nextState[3]), .CLK(clk), .RSTB(n13), .Q(
        currState[3]), .QN(n73) );
  DFFARX1 \currState_reg[1]  ( .D(nextState[1]), .CLK(clk), .RSTB(n13), .Q(
        currState[1]), .QN(n72) );
  LATCHX1 ALUEnIn1_reg ( .CLK(N104), .D(n16), .Q(ALUEnIn1) );
  LATCHX1 DBRjEn_reg ( .CLK(N101), .D(n24), .Q(DBRjEn) );
  LATCHX1 DIRiEn_reg ( .CLK(N102), .D(N103), .Q(DIRiEn) );
  LATCHX1 ALUEnIn2_reg ( .CLK(N105), .D(N106), .Q(ALUEnIn2) );
  LATCHX1 ALUOutEn_reg ( .CLK(N96), .D(n22), .Q(ALUOutEn) );
  LATCHX1 RrEn_reg ( .CLK(N97), .D(N98), .Q(RrEn) );
  LATCHX1 RwEn_reg ( .CLK(N99), .D(n25), .Q(RwEn) );
  LATCHX1 DIRjEn_reg ( .CLK(N100), .D(n15), .Q(DIRjEn) );
  INVX0 U3 ( .IN(reset), .QN(n13) );
  NAND4X0 U76 ( .IN1(n33), .IN2(n63), .IN3(n36), .IN4(n64), .QN(n56) );
  AND2X1 U77 ( .IN1(n38), .IN2(n65), .Q(n64) );
  AND3X1 U78 ( .IN1(n50), .IN2(n19), .IN3(n38), .Q(n41) );
  NAND4X0 U79 ( .IN1(n41), .IN2(n47), .IN3(n48), .IN4(n34), .QN(nextState[1])
         );
  NOR2X0 U80 ( .IN1(n24), .IN2(n25), .QN(n48) );
  INVX0 U81 ( .IN(N106), .QN(n17) );
  INVX0 U82 ( .IN(N98), .QN(n19) );
  INVX0 U83 ( .IN(n36), .QN(n25) );
  INVX0 U84 ( .IN(n49), .QN(n24) );
  NAND3X0 U85 ( .IN1(n63), .IN2(n17), .IN3(n40), .QN(N105) );
  NAND3X0 U86 ( .IN1(n39), .IN2(n19), .IN3(n40), .QN(N97) );
  NAND3X0 U87 ( .IN1(n39), .IN2(n18), .IN3(n47), .QN(N102) );
  INVX0 U88 ( .IN(N96), .QN(n18) );
  NAND2X0 U89 ( .IN1(n47), .IN2(n33), .QN(N103) );
  NAND2X0 U90 ( .IN1(n40), .IN2(n34), .QN(N100) );
  INVX0 U91 ( .IN(n33), .QN(n22) );
  INVX0 U92 ( .IN(n34), .QN(n15) );
  INVX0 U93 ( .IN(n35), .QN(n16) );
  AND4X1 U94 ( .IN1(nextState[3]), .IN2(nextState[2]), .IN3(nextState[1]), 
        .IN4(nextState[0]), .Q(N114) );
  NAND4X0 U95 ( .IN1(n21), .IN2(n60), .IN3(n49), .IN4(n17), .QN(nextState[3])
         );
  INVX0 U96 ( .IN(n56), .QN(n21) );
  AO21X1 U97 ( .IN1(n44), .IN2(n57), .IN3(n39), .Q(n60) );
  NAND4X0 U98 ( .IN1(n53), .IN2(n35), .IN3(n34), .IN4(n54), .QN(nextState[2])
         );
  NOR2X0 U99 ( .IN1(n55), .IN2(n56), .QN(n54) );
  AOI21X1 U100 ( .IN1(n57), .IN2(n45), .IN3(n39), .QN(n55) );
  NAND2X0 U101 ( .IN1(n66), .IN2(n69), .QN(n33) );
  AO21X1 U102 ( .IN1(n51), .IN2(n52), .IN3(n20), .Q(N98) );
  INVX0 U103 ( .IN(n53), .QN(n20) );
  AO21X1 U104 ( .IN1(n68), .IN2(n59), .IN3(n23), .Q(N106) );
  INVX0 U105 ( .IN(n50), .QN(n23) );
  NOR2X0 U106 ( .IN1(n73), .IN2(n71), .QN(n67) );
  NAND2X0 U107 ( .IN1(n51), .IN2(n66), .QN(n39) );
  NOR2X0 U108 ( .IN1(n74), .IN2(n72), .QN(n59) );
  NAND2X0 U109 ( .IN1(n66), .IN2(n67), .QN(n36) );
  NAND2X0 U110 ( .IN1(n52), .IN2(n69), .QN(n50) );
  AND2X1 U111 ( .IN1(n51), .IN2(n70), .Q(n46) );
  NAND2X0 U112 ( .IN1(n51), .IN2(n59), .QN(n53) );
  NAND2X0 U113 ( .IN1(n69), .IN2(n59), .QN(n38) );
  NAND2X0 U114 ( .IN1(n67), .IN2(n52), .QN(n63) );
  NAND2X0 U115 ( .IN1(n70), .IN2(n69), .QN(n65) );
  NAND2X0 U116 ( .IN1(n66), .IN2(n68), .QN(n34) );
  NAND2X0 U117 ( .IN1(n52), .IN2(n68), .QN(n35) );
  NAND2X0 U118 ( .IN1(n70), .IN2(n67), .QN(n49) );
  NAND2X0 U119 ( .IN1(n70), .IN2(n68), .QN(n47) );
  AND2X1 U120 ( .IN1(n65), .IN2(n37), .Q(n40) );
  NAND3X0 U121 ( .IN1(n33), .IN2(n37), .IN3(n38), .QN(N96) );
  NAND3X0 U122 ( .IN1(n36), .IN2(n37), .IN3(n38), .QN(N99) );
  NAND3X0 U123 ( .IN1(n49), .IN2(n37), .IN3(n63), .QN(N101) );
  NAND3X0 U124 ( .IN1(n39), .IN2(n37), .IN3(n35), .QN(N104) );
  OR4X1 U125 ( .IN1(n32), .IN2(opCode[0]), .IN3(opCode[2]), .IN4(opCode[3]), 
        .Q(n57) );
  INVX0 U126 ( .IN(opCode[1]), .QN(n32) );
  AO21X1 U127 ( .IN1(n58), .IN2(opCode[1]), .IN3(opCode[3]), .Q(n45) );
  XNOR2X1 U128 ( .IN1(opCode[0]), .IN2(opCode[2]), .Q(n58) );
  NAND4X0 U129 ( .IN1(n41), .IN2(n42), .IN3(n43), .IN4(n33), .QN(nextState[0])
         );
  NAND2X0 U130 ( .IN1(ALUstr), .IN2(n46), .QN(n42) );
  AO21X1 U131 ( .IN1(n44), .IN2(n45), .IN3(n39), .Q(n43) );
  AND2X1 U132 ( .IN1(n61), .IN2(n62), .Q(n44) );
  NAND4X0 U133 ( .IN1(opCode[2]), .IN2(opCode[0]), .IN3(opCode[1]), .IN4(n31), 
        .QN(n61) );
  OR4X1 U134 ( .IN1(n31), .IN2(opCode[0]), .IN3(opCode[1]), .IN4(opCode[2]), 
        .Q(n62) );
  INVX0 U135 ( .IN(opCode[3]), .QN(n31) );
  NOR2X0 U136 ( .IN1(n73), .IN2(currState[0]), .QN(n69) );
  NOR2X0 U137 ( .IN1(n74), .IN2(currState[1]), .QN(n66) );
  NOR2X0 U138 ( .IN1(currState[2]), .IN2(currState[1]), .QN(n70) );
  NOR2X0 U139 ( .IN1(n71), .IN2(currState[3]), .QN(n68) );
  NOR2X0 U140 ( .IN1(n72), .IN2(currState[2]), .QN(n52) );
  NOR2X0 U141 ( .IN1(currState[3]), .IN2(currState[0]), .QN(n51) );
  NAND2X0 U142 ( .IN1(n46), .IN2(n30), .QN(n37) );
  INVX0 U143 ( .IN(ALUstr), .QN(n30) );
endmodule

