
module MAR ( bus, load, address, reset );
  input [15:0] bus;
  output [15:0] address;
  input load, reset;
  wire   n16;

  DFFARX1 \address_reg[15]  ( .D(bus[15]), .CLK(load), .RSTB(n16), .Q(
        address[15]) );
  DFFARX1 \address_reg[14]  ( .D(bus[14]), .CLK(load), .RSTB(n16), .Q(
        address[14]) );
  DFFARX1 \address_reg[13]  ( .D(bus[13]), .CLK(load), .RSTB(n16), .Q(
        address[13]) );
  DFFARX1 \address_reg[12]  ( .D(bus[12]), .CLK(load), .RSTB(n16), .Q(
        address[12]) );
  DFFARX1 \address_reg[11]  ( .D(bus[11]), .CLK(load), .RSTB(n16), .Q(
        address[11]) );
  DFFARX1 \address_reg[10]  ( .D(bus[10]), .CLK(load), .RSTB(n16), .Q(
        address[10]) );
  DFFARX1 \address_reg[9]  ( .D(bus[9]), .CLK(load), .RSTB(n16), .Q(address[9]) );
  DFFARX1 \address_reg[8]  ( .D(bus[8]), .CLK(load), .RSTB(n16), .Q(address[8]) );
  DFFARX1 \address_reg[7]  ( .D(bus[7]), .CLK(load), .RSTB(n16), .Q(address[7]) );
  DFFARX1 \address_reg[6]  ( .D(bus[6]), .CLK(load), .RSTB(n16), .Q(address[6]) );
  DFFARX1 \address_reg[5]  ( .D(bus[5]), .CLK(load), .RSTB(n16), .Q(address[5]) );
  DFFARX1 \address_reg[4]  ( .D(bus[4]), .CLK(load), .RSTB(n16), .Q(address[4]) );
  DFFARX1 \address_reg[3]  ( .D(bus[3]), .CLK(load), .RSTB(n16), .Q(address[3]) );
  DFFARX1 \address_reg[2]  ( .D(bus[2]), .CLK(load), .RSTB(n16), .Q(address[2]) );
  DFFARX1 \address_reg[1]  ( .D(bus[1]), .CLK(load), .RSTB(n16), .Q(address[1]) );
  DFFARX1 \address_reg[0]  ( .D(bus[0]), .CLK(load), .RSTB(n16), .Q(address[0]) );
  INVX2 U4 ( .IN(reset), .QN(n16) );
endmodule

