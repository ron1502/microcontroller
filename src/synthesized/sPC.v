
module PC_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HADDX1 U1_1_14 ( .A0(A[14]), .B0(carry[14]), .C1(carry[15]), .SO(SUM[14]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX1 U1_1_10 ( .A0(A[10]), .B0(carry[10]), .C1(carry[11]), .SO(SUM[10]) );
  HADDX1 U1_1_11 ( .A0(A[11]), .B0(carry[11]), .C1(carry[12]), .SO(SUM[11]) );
  HADDX1 U1_1_12 ( .A0(A[12]), .B0(carry[12]), .C1(carry[13]), .SO(SUM[12]) );
  HADDX1 U1_1_13 ( .A0(A[13]), .B0(carry[13]), .C1(carry[14]), .SO(SUM[13]) );
  INVX0 U1 ( .IN(A[0]), .QN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[15]), .IN2(A[15]), .Q(SUM[15]) );
endmodule


module PC ( reset, count, outEn, bus );
  output [15:0] bus;
  input reset, count, outEn;
  wire   N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, n98, n99, n100, n101, n102, n103, n104, n105, n106;
  wire   [15:0] address;
  wire   [15:0] nextAddress;
  tri   [15:0] bus;

  TNBUFFHX1 \bus_tri[0]  ( .IN(nextAddress[0]), .ENB(outEn), .Q(bus[0]) );
  TNBUFFHX1 \bus_tri[1]  ( .IN(nextAddress[1]), .ENB(outEn), .Q(bus[1]) );
  TNBUFFHX1 \bus_tri[2]  ( .IN(nextAddress[2]), .ENB(outEn), .Q(bus[2]) );
  TNBUFFHX1 \bus_tri[3]  ( .IN(nextAddress[3]), .ENB(outEn), .Q(bus[3]) );
  TNBUFFHX1 \bus_tri[4]  ( .IN(nextAddress[4]), .ENB(outEn), .Q(bus[4]) );
  TNBUFFHX1 \bus_tri[5]  ( .IN(nextAddress[5]), .ENB(outEn), .Q(bus[5]) );
  TNBUFFHX1 \bus_tri[6]  ( .IN(nextAddress[6]), .ENB(outEn), .Q(bus[6]) );
  TNBUFFHX1 \bus_tri[7]  ( .IN(nextAddress[7]), .ENB(outEn), .Q(bus[7]) );
  TNBUFFHX1 \bus_tri[8]  ( .IN(nextAddress[8]), .ENB(outEn), .Q(bus[8]) );
  TNBUFFHX1 \bus_tri[9]  ( .IN(nextAddress[9]), .ENB(outEn), .Q(bus[9]) );
  TNBUFFHX1 \bus_tri[10]  ( .IN(nextAddress[10]), .ENB(outEn), .Q(bus[10]) );
  TNBUFFHX1 \bus_tri[11]  ( .IN(nextAddress[11]), .ENB(outEn), .Q(bus[11]) );
  TNBUFFHX1 \bus_tri[12]  ( .IN(nextAddress[12]), .ENB(outEn), .Q(bus[12]) );
  TNBUFFHX1 \bus_tri[13]  ( .IN(nextAddress[13]), .ENB(outEn), .Q(bus[13]) );
  TNBUFFHX1 \bus_tri[14]  ( .IN(nextAddress[14]), .ENB(outEn), .Q(bus[14]) );
  TNBUFFHX1 \bus_tri[15]  ( .IN(nextAddress[15]), .ENB(outEn), .Q(bus[15]) );
  PC_DW01_inc_0 add_18 ( .A(address), .SUM({N32, N31, N30, N29, N28, N27, N26, 
        N25, N24, N23, N22, N21, N20, N19, N18, N17}) );
  DFFARX1 \address_reg[15]  ( .D(N32), .CLK(n102), .RSTB(n98), .Q(address[15])
         );
  DFFARX1 \address_reg[1]  ( .D(N18), .CLK(n105), .RSTB(n101), .Q(address[1])
         );
  DFFARX1 \address_reg[2]  ( .D(N19), .CLK(n105), .RSTB(n101), .Q(address[2])
         );
  DFFARX1 \address_reg[3]  ( .D(N20), .CLK(n105), .RSTB(n100), .Q(address[3])
         );
  DFFARX1 \address_reg[4]  ( .D(N21), .CLK(n104), .RSTB(n100), .Q(address[4])
         );
  DFFARX1 \address_reg[5]  ( .D(N22), .CLK(n104), .RSTB(n100), .Q(address[5])
         );
  DFFARX1 \address_reg[6]  ( .D(N23), .CLK(n104), .RSTB(n100), .Q(address[6])
         );
  DFFARX1 \address_reg[7]  ( .D(N24), .CLK(n104), .RSTB(n99), .Q(address[7])
         );
  DFFARX1 \address_reg[8]  ( .D(N25), .CLK(n103), .RSTB(n99), .Q(address[8])
         );
  DFFARX1 \address_reg[9]  ( .D(N26), .CLK(n103), .RSTB(n99), .Q(address[9])
         );
  DFFARX1 \address_reg[10]  ( .D(N27), .CLK(n103), .RSTB(n99), .Q(address[10])
         );
  DFFARX1 \address_reg[11]  ( .D(N28), .CLK(n103), .RSTB(n99), .Q(address[11])
         );
  DFFARX1 \address_reg[12]  ( .D(N29), .CLK(n102), .RSTB(n98), .Q(address[12])
         );
  DFFARX1 \address_reg[13]  ( .D(N30), .CLK(n102), .RSTB(n98), .Q(address[13])
         );
  DFFARX1 \address_reg[14]  ( .D(N31), .CLK(n102), .RSTB(n98), .Q(address[14])
         );
  DFFARX1 \address_reg[0]  ( .D(N17), .CLK(n105), .RSTB(n101), .Q(address[0])
         );
  DFFARX1 \nextAddress_reg[0]  ( .D(address[0]), .CLK(n105), .RSTB(n101), .Q(
        nextAddress[0]) );
  DFFARX1 \nextAddress_reg[1]  ( .D(address[1]), .CLK(n105), .RSTB(n101), .Q(
        nextAddress[1]) );
  DFFARX1 \nextAddress_reg[2]  ( .D(address[2]), .CLK(n105), .RSTB(n100), .Q(
        nextAddress[2]) );
  DFFARX1 \nextAddress_reg[3]  ( .D(address[3]), .CLK(n105), .RSTB(n100), .Q(
        nextAddress[3]) );
  DFFARX1 \nextAddress_reg[4]  ( .D(address[4]), .CLK(n104), .RSTB(n100), .Q(
        nextAddress[4]) );
  DFFARX1 \nextAddress_reg[5]  ( .D(address[5]), .CLK(n104), .RSTB(n100), .Q(
        nextAddress[5]) );
  DFFARX1 \nextAddress_reg[6]  ( .D(address[6]), .CLK(n104), .RSTB(n100), .Q(
        nextAddress[6]) );
  DFFARX1 \nextAddress_reg[7]  ( .D(address[7]), .CLK(n104), .RSTB(n99), .Q(
        nextAddress[7]) );
  DFFARX1 \nextAddress_reg[8]  ( .D(address[8]), .CLK(n103), .RSTB(n99), .Q(
        nextAddress[8]) );
  DFFARX1 \nextAddress_reg[9]  ( .D(address[9]), .CLK(n103), .RSTB(n99), .Q(
        nextAddress[9]) );
  DFFARX1 \nextAddress_reg[10]  ( .D(address[10]), .CLK(n103), .RSTB(n99), .Q(
        nextAddress[10]) );
  DFFARX1 \nextAddress_reg[11]  ( .D(address[11]), .CLK(n103), .RSTB(n98), .Q(
        nextAddress[11]) );
  DFFARX1 \nextAddress_reg[12]  ( .D(address[12]), .CLK(n102), .RSTB(n98), .Q(
        nextAddress[12]) );
  DFFARX1 \nextAddress_reg[13]  ( .D(address[13]), .CLK(n102), .RSTB(n98), .Q(
        nextAddress[13]) );
  DFFARX1 \nextAddress_reg[14]  ( .D(address[14]), .CLK(n102), .RSTB(n98), .Q(
        nextAddress[14]) );
  DFFARX1 \nextAddress_reg[15]  ( .D(address[15]), .CLK(n102), .RSTB(n98), .Q(
        nextAddress[15]) );
  NBUFFX2 U4 ( .IN(n106), .Q(n98) );
  NBUFFX2 U5 ( .IN(n106), .Q(n99) );
  NBUFFX2 U6 ( .IN(n106), .Q(n100) );
  NBUFFX2 U7 ( .IN(n106), .Q(n101) );
  NBUFFX2 U8 ( .IN(count), .Q(n102) );
  NBUFFX2 U9 ( .IN(count), .Q(n103) );
  NBUFFX2 U10 ( .IN(count), .Q(n104) );
  NBUFFX2 U11 ( .IN(count), .Q(n105) );
  INVX0 U12 ( .IN(reset), .QN(n106) );
endmodule

