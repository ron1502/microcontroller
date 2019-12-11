
module MOVFSM ( clk, reset, MOVstr, opCode, IF, DIRiEn, DIRjEn, DBRjEn, RrEn, 
        RwEn );
  input [3:0] opCode;
  input clk, reset, MOVstr;
  output IF, DIRiEn, DIRjEn, DBRjEn, RrEn, RwEn;
  wire   N76, N77, N78, N79, N80, n10, n12, n13, n14, n15, n16, n17, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n39, n40;
  wire   [3:0] currState;
  wire   [3:0] nextState;

  DFFARX1 \currState_reg[0]  ( .D(nextState[0]), .CLK(clk), .RSTB(n10), .Q(
        currState[0]), .QN(n39) );
  DFFARX1 \currState_reg[3]  ( .D(IF), .CLK(clk), .RSTB(n10), .Q(currState[3])
         );
  DFFARX1 \currState_reg[1]  ( .D(nextState[1]), .CLK(clk), .RSTB(n10), .Q(
        currState[1]), .QN(n40) );
  DFFARX1 \currState_reg[2]  ( .D(nextState[2]), .CLK(clk), .RSTB(n10), .Q(
        currState[2]) );
  LATCHX1 RwEn_reg ( .CLK(N78), .D(n13), .Q(RwEn) );
  LATCHX1 DIRiEn_reg ( .CLK(N79), .D(n14), .Q(DIRiEn) );
  LATCHX1 RrEn_reg ( .CLK(N77), .D(n15), .Q(RrEn) );
  LATCHX1 DIRjEn_reg ( .CLK(N80), .D(n16), .Q(DIRjEn) );
  LATCHX1 DBRjEn_reg ( .CLK(N76), .D(n12), .Q(DBRjEn) );
  INVX0 U3 ( .IN(reset), .QN(n10) );
  NAND2X0 U39 ( .IN1(n37), .IN2(n31), .QN(N76) );
  INVX0 U40 ( .IN(n31), .QN(n12) );
  ISOLANDX1 U41 ( .D(n23), .ISO(n24), .Q(IF) );
  AND3X1 U42 ( .IN1(n39), .IN2(n40), .IN3(n36), .Q(n33) );
  NAND3X0 U43 ( .IN1(n39), .IN2(n40), .IN3(n23), .QN(n31) );
  NAND4X0 U44 ( .IN1(n26), .IN2(n27), .IN3(n28), .IN4(n29), .QN(nextState[1])
         );
  ISOLANDX1 U45 ( .D(n36), .ISO(n24), .Q(n25) );
  INVX0 U46 ( .IN(n29), .QN(n15) );
  AOI21X1 U47 ( .IN1(n33), .IN2(n20), .IN3(IF), .QN(n37) );
  NAND3X0 U48 ( .IN1(n28), .IN2(n17), .IN3(n35), .QN(N80) );
  INVX0 U49 ( .IN(n25), .QN(n17) );
  NAND2X0 U50 ( .IN1(n33), .IN2(n20), .QN(n35) );
  NAND2X0 U51 ( .IN1(n37), .IN2(n26), .QN(N78) );
  NAND2X0 U52 ( .IN1(n37), .IN2(n29), .QN(N77) );
  NAND2X0 U53 ( .IN1(n37), .IN2(n27), .QN(N79) );
  INVX0 U54 ( .IN(n26), .QN(n13) );
  INVX0 U55 ( .IN(n27), .QN(n14) );
  INVX0 U56 ( .IN(n28), .QN(n16) );
  NAND2X0 U57 ( .IN1(currState[1]), .IN2(currState[0]), .QN(n24) );
  ISOLANDX1 U58 ( .D(currState[2]), .ISO(currState[3]), .Q(n23) );
  AO221X1 U59 ( .IN1(n21), .IN2(n22), .IN3(n23), .IN4(n24), .IN5(n25), .Q(
        nextState[2]) );
  NOR4X0 U60 ( .IN1(opCode[2]), .IN2(opCode[1]), .IN3(currState[3]), .IN4(
        currState[1]), .QN(n22) );
  AND4X1 U61 ( .IN1(n39), .IN2(MOVstr), .IN3(opCode[0]), .IN4(opCode[3]), .Q(
        n21) );
  NAND4X0 U62 ( .IN1(n30), .IN2(n31), .IN3(n32), .IN4(n26), .QN(nextState[0])
         );
  NOR2X0 U63 ( .IN1(n25), .IN2(n15), .QN(n32) );
  NAND4X0 U64 ( .IN1(n33), .IN2(opCode[3]), .IN3(opCode[1]), .IN4(n34), .QN(
        n30) );
  NOR3X0 U65 ( .IN1(n20), .IN2(opCode[2]), .IN3(opCode[0]), .QN(n34) );
  INVX0 U66 ( .IN(MOVstr), .QN(n20) );
  NAND3X0 U67 ( .IN1(currState[1]), .IN2(n39), .IN3(n23), .QN(n26) );
  NAND3X0 U68 ( .IN1(currState[0]), .IN2(n40), .IN3(n23), .QN(n27) );
  NOR2X0 U69 ( .IN1(currState[3]), .IN2(currState[2]), .QN(n36) );
  NAND3X0 U70 ( .IN1(currState[1]), .IN2(n39), .IN3(n36), .QN(n29) );
  NAND3X0 U71 ( .IN1(currState[0]), .IN2(n40), .IN3(n36), .QN(n28) );
endmodule

