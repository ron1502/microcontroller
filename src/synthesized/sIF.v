
module IF ( reset, clk, IF, IR, pcCount, pcOutEn, marLoad, irBusEn, R_W, memEn, 
        mdrReadEn, mdrROutEn, MFC );
  input reset, clk, IF, MFC;
  output IR, pcCount, pcOutEn, marLoad, irBusEn, R_W, memEn, mdrReadEn,
         mdrROutEn;
  wire   N59, N60, N61, N62, N63, N64, N65, n13, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n49, n50, n51, n52;
  wire   [3:0] currState;
  wire   [3:0] nextState;

  DFFARX1 \currState_reg[0]  ( .D(nextState[0]), .CLK(clk), .RSTB(n13), .Q(
        currState[0]), .QN(n51) );
  DFFARX1 \currState_reg[2]  ( .D(nextState[2]), .CLK(clk), .RSTB(n13), .Q(
        currState[2]), .QN(n49) );
  DFFARX1 \currState_reg[3]  ( .D(nextState[3]), .CLK(clk), .RSTB(n13), .Q(
        currState[3]), .QN(n52) );
  DFFARX1 \currState_reg[1]  ( .D(nextState[1]), .CLK(clk), .RSTB(n13), .Q(
        currState[1]), .QN(n50) );
  LATCHX1 memEn_reg ( .CLK(N62), .D(n22), .Q(memEn) );
  LATCHX1 mdrROutEn_reg ( .CLK(N64), .D(n15), .Q(mdrROutEn) );
  LATCHX1 mdrReadEn_reg ( .CLK(N63), .D(n19), .Q(mdrReadEn) );
  LATCHX1 irBusEn_reg ( .CLK(N65), .D(n16), .Q(irBusEn) );
  LATCHX1 pcOutEn_reg ( .CLK(N59), .D(n17), .Q(pcOutEn) );
  LATCHX1 pcCount_reg ( .CLK(N60), .D(n18), .Q(pcCount) );
  LATCHX1 marLoad_reg ( .CLK(N61), .D(n23), .Q(marLoad) );
  LATCHX1 R_W_reg ( .CLK(N62), .D(n22), .Q(R_W) );
  INVX0 U3 ( .IN(reset), .QN(n13) );
  INVX0 U49 ( .IN(n39), .QN(n21) );
  INVX0 U50 ( .IN(n36), .QN(n18) );
  INVX0 U51 ( .IN(n45), .QN(n15) );
  ISOLANDX1 U52 ( .D(n42), .ISO(n22), .Q(n46) );
  NAND2X0 U53 ( .IN1(n46), .IN2(n29), .QN(N61) );
  NAND2X0 U54 ( .IN1(n35), .IN2(n42), .QN(N64) );
  INVX0 U55 ( .IN(n29), .QN(n23) );
  AND3X1 U56 ( .IN1(nextState[0]), .IN2(nextState[3]), .IN3(nextState[1]), .Q(
        IR) );
  NAND2X0 U57 ( .IN1(n47), .IN2(n51), .QN(n29) );
  NAND2X0 U58 ( .IN1(n21), .IN2(n51), .QN(n42) );
  NAND3X0 U59 ( .IN1(n51), .IN2(n49), .IN3(n41), .QN(n36) );
  NAND2X0 U60 ( .IN1(n44), .IN2(n51), .QN(n45) );
  NAND3X0 U61 ( .IN1(n49), .IN2(n52), .IN3(n50), .QN(n39) );
  ISOLANDX1 U62 ( .D(n43), .ISO(n15), .Q(n35) );
  NAND3X0 U63 ( .IN1(n33), .IN2(n42), .IN3(n43), .QN(N65) );
  NAND3X0 U64 ( .IN1(n33), .IN2(n34), .IN3(n35), .QN(nextState[3]) );
  INVX0 U65 ( .IN(n30), .QN(n22) );
  NAND4X0 U66 ( .IN1(n28), .IN2(n29), .IN3(n30), .IN4(n31), .QN(nextState[2])
         );
  NAND3X0 U67 ( .IN1(n31), .IN2(n42), .IN3(n36), .QN(N60) );
  NAND3X0 U68 ( .IN1(n34), .IN2(n42), .IN3(n45), .QN(N63) );
  NAND2X0 U69 ( .IN1(n46), .IN2(n34), .QN(N62) );
  NAND2X0 U70 ( .IN1(n46), .IN2(n31), .QN(N59) );
  INVX0 U71 ( .IN(n33), .QN(n16) );
  INVX0 U72 ( .IN(n31), .QN(n17) );
  INVX0 U73 ( .IN(n34), .QN(n19) );
  AO221X1 U74 ( .IN1(IF), .IN2(n21), .IN3(MFC), .IN4(n20), .IN5(n32), .Q(
        nextState[1]) );
  INVX0 U75 ( .IN(n28), .QN(n20) );
  OR3X1 U76 ( .IN1(n22), .IN2(N65), .IN3(n18), .Q(n32) );
  NAND4X0 U77 ( .IN1(n28), .IN2(n29), .IN3(n36), .IN4(n37), .QN(nextState[0])
         );
  OA221X1 U78 ( .IN1(n38), .IN2(n52), .IN3(n39), .IN4(n40), .IN5(n35), .Q(n37)
         );
  NOR2X0 U79 ( .IN1(currState[1]), .IN2(currState[2]), .QN(n38) );
  OR2X1 U80 ( .IN1(n51), .IN2(IF), .Q(n40) );
  NAND2X0 U81 ( .IN1(n44), .IN2(currState[0]), .QN(n33) );
  NAND2X0 U82 ( .IN1(n47), .IN2(currState[0]), .QN(n30) );
  NOR2X0 U83 ( .IN1(n50), .IN2(currState[3]), .QN(n41) );
  AND3X1 U84 ( .IN1(n50), .IN2(n52), .IN3(currState[2]), .Q(n47) );
  AND3X1 U85 ( .IN1(n50), .IN2(n49), .IN3(currState[3]), .Q(n44) );
  NAND3X0 U86 ( .IN1(currState[0]), .IN2(n41), .IN3(currState[2]), .QN(n34) );
  NAND3X0 U87 ( .IN1(n41), .IN2(n51), .IN3(currState[2]), .QN(n28) );
  NAND4X0 U88 ( .IN1(currState[3]), .IN2(currState[1]), .IN3(n51), .IN4(n49), 
        .QN(n43) );
  NAND3X0 U89 ( .IN1(n41), .IN2(n49), .IN3(currState[0]), .QN(n31) );
endmodule

