
module IOPort0 ( dataOut, bus, rEn, wEn, reset );
  output [15:0] dataOut;
  inout [15:0] bus;
  input rEn, wEn, reset;
  wire   n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65;
  tri   [15:0] bus;

  DFFARX1 \savedData_reg[15]  ( .D(n62), .CLK(wEn), .RSTB(n49), .Q(dataOut[15]) );
  DFFARX1 \savedData_reg[14]  ( .D(n63), .CLK(wEn), .RSTB(n49), .Q(dataOut[14]) );
  DFFARX1 \savedData_reg[13]  ( .D(n64), .CLK(wEn), .RSTB(n49), .Q(dataOut[13]) );
  DFFARX1 \savedData_reg[12]  ( .D(n65), .CLK(wEn), .RSTB(n49), .Q(dataOut[12]) );
  DFFARX1 \savedData_reg[11]  ( .D(n58), .CLK(wEn), .RSTB(n49), .Q(dataOut[11]) );
  DFFARX1 \savedData_reg[10]  ( .D(n59), .CLK(wEn), .RSTB(n49), .Q(dataOut[10]) );
  DFFARX1 \savedData_reg[9]  ( .D(n60), .CLK(wEn), .RSTB(n49), .Q(dataOut[9])
         );
  DFFARX1 \savedData_reg[8]  ( .D(n61), .CLK(wEn), .RSTB(n49), .Q(dataOut[8])
         );
  DFFARX1 \savedData_reg[7]  ( .D(n54), .CLK(wEn), .RSTB(n49), .Q(dataOut[7])
         );
  DFFARX1 \savedData_reg[6]  ( .D(n55), .CLK(wEn), .RSTB(n49), .Q(dataOut[6])
         );
  DFFARX1 \savedData_reg[5]  ( .D(n56), .CLK(wEn), .RSTB(n49), .Q(dataOut[5])
         );
  DFFARX1 \savedData_reg[4]  ( .D(n57), .CLK(wEn), .RSTB(n49), .Q(dataOut[4])
         );
  DFFARX1 \savedData_reg[3]  ( .D(n50), .CLK(wEn), .RSTB(n49), .Q(dataOut[3])
         );
  DFFARX1 \savedData_reg[2]  ( .D(n51), .CLK(wEn), .RSTB(n49), .Q(dataOut[2])
         );
  DFFARX1 \savedData_reg[1]  ( .D(n52), .CLK(wEn), .RSTB(n49), .Q(dataOut[1])
         );
  DFFARX1 \savedData_reg[0]  ( .D(n53), .CLK(wEn), .RSTB(n49), .Q(dataOut[0])
         );
  TNBUFFHX1 \bus_tri[0]  ( .IN(dataOut[0]), .ENB(rEn), .Q(bus[0]) );
  TNBUFFHX1 \bus_tri[1]  ( .IN(dataOut[1]), .ENB(rEn), .Q(bus[1]) );
  TNBUFFHX1 \bus_tri[2]  ( .IN(dataOut[2]), .ENB(rEn), .Q(bus[2]) );
  TNBUFFHX1 \bus_tri[3]  ( .IN(dataOut[3]), .ENB(rEn), .Q(bus[3]) );
  TNBUFFHX1 \bus_tri[4]  ( .IN(dataOut[4]), .ENB(rEn), .Q(bus[4]) );
  TNBUFFHX1 \bus_tri[5]  ( .IN(dataOut[5]), .ENB(rEn), .Q(bus[5]) );
  TNBUFFHX1 \bus_tri[6]  ( .IN(dataOut[6]), .ENB(rEn), .Q(bus[6]) );
  TNBUFFHX1 \bus_tri[7]  ( .IN(dataOut[7]), .ENB(rEn), .Q(bus[7]) );
  TNBUFFHX1 \bus_tri[8]  ( .IN(dataOut[8]), .ENB(rEn), .Q(bus[8]) );
  TNBUFFHX1 \bus_tri[9]  ( .IN(dataOut[9]), .ENB(rEn), .Q(bus[9]) );
  TNBUFFHX1 \bus_tri[10]  ( .IN(dataOut[10]), .ENB(rEn), .Q(bus[10]) );
  TNBUFFHX1 \bus_tri[11]  ( .IN(dataOut[11]), .ENB(rEn), .Q(bus[11]) );
  TNBUFFHX1 \bus_tri[12]  ( .IN(dataOut[12]), .ENB(rEn), .Q(bus[12]) );
  TNBUFFHX1 \bus_tri[13]  ( .IN(dataOut[13]), .ENB(rEn), .Q(bus[13]) );
  TNBUFFHX1 \bus_tri[14]  ( .IN(dataOut[14]), .ENB(rEn), .Q(bus[14]) );
  TNBUFFHX1 \bus_tri[15]  ( .IN(dataOut[15]), .ENB(rEn), .Q(bus[15]) );
  NBUFFX2 U4 ( .IN(bus[0]), .Q(n53) );
  NBUFFX2 U5 ( .IN(bus[1]), .Q(n52) );
  NBUFFX2 U6 ( .IN(bus[2]), .Q(n51) );
  NBUFFX2 U7 ( .IN(bus[3]), .Q(n50) );
  NBUFFX2 U8 ( .IN(bus[4]), .Q(n57) );
  NBUFFX2 U9 ( .IN(bus[5]), .Q(n56) );
  NBUFFX2 U10 ( .IN(bus[6]), .Q(n55) );
  NBUFFX2 U11 ( .IN(bus[7]), .Q(n54) );
  NBUFFX2 U12 ( .IN(bus[8]), .Q(n61) );
  NBUFFX2 U13 ( .IN(bus[9]), .Q(n60) );
  NBUFFX2 U14 ( .IN(bus[10]), .Q(n59) );
  NBUFFX2 U15 ( .IN(bus[11]), .Q(n58) );
  NBUFFX2 U16 ( .IN(bus[12]), .Q(n65) );
  NBUFFX2 U17 ( .IN(bus[13]), .Q(n64) );
  NBUFFX2 U18 ( .IN(bus[14]), .Q(n63) );
  NBUFFX2 U19 ( .IN(bus[15]), .Q(n62) );
  INVX2 U20 ( .IN(reset), .QN(n49) );
endmodule

