
module IR ( bus, busEn, instruction, reset );
  input [15:0] bus;
  output [15:0] instruction;
  input busEn, reset;
  wire   n16;

  DFFARX1 \instruction_reg[15]  ( .D(bus[15]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[15]) );
  DFFARX1 \instruction_reg[14]  ( .D(bus[14]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[14]) );
  DFFARX1 \instruction_reg[13]  ( .D(bus[13]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[13]) );
  DFFARX1 \instruction_reg[12]  ( .D(bus[12]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[12]) );
  DFFARX1 \instruction_reg[11]  ( .D(bus[11]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[11]) );
  DFFARX1 \instruction_reg[10]  ( .D(bus[10]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[10]) );
  DFFARX1 \instruction_reg[9]  ( .D(bus[9]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[9]) );
  DFFARX1 \instruction_reg[8]  ( .D(bus[8]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[8]) );
  DFFARX1 \instruction_reg[7]  ( .D(bus[7]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[7]) );
  DFFARX1 \instruction_reg[6]  ( .D(bus[6]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[6]) );
  DFFARX1 \instruction_reg[5]  ( .D(bus[5]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[5]) );
  DFFARX1 \instruction_reg[4]  ( .D(bus[4]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[4]) );
  DFFARX1 \instruction_reg[3]  ( .D(bus[3]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[3]) );
  DFFARX1 \instruction_reg[2]  ( .D(bus[2]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[2]) );
  DFFARX1 \instruction_reg[1]  ( .D(bus[1]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[1]) );
  DFFARX1 \instruction_reg[0]  ( .D(bus[0]), .CLK(busEn), .RSTB(n16), .Q(
        instruction[0]) );
  INVX2 U4 ( .IN(reset), .QN(n16) );
endmodule

