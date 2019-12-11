
module decoder ( IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, 
        reset, IRiEn, IRjEn, IF, BRjEn, bus );
  input [15:0] instruction;
  output [3:0] opCode;
  output [3:0] index;
  output [15:0] bus;
  input IR, reset, IRiEn, IRjEn, IF, BRjEn;
  output ALUstr, MOVstr, LDSRstr;
  wire   instruction_15, instruction_14, instruction_13, instruction_12, n37,
         n38, n39, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n68, n69, n70, n71, n72, n73, n74, n75, n77, n78, n83, n84, n85,
         n89;
  tri   [15:0] bus;
  assign instruction_15 = instruction[15];
  assign instruction_14 = instruction[14];
  assign instruction_13 = instruction[13];
  assign instruction_12 = instruction[12];

  DFFARX1 \opCode_reg[3]  ( .D(instruction_15), .CLK(IR), .RSTB(n89), .Q(
        opCode[3]) );
  DFFARX1 \opCode_reg[2]  ( .D(instruction_14), .CLK(IR), .RSTB(n89), .Q(
        opCode[2]) );
  DFFARX1 \opCode_reg[1]  ( .D(instruction_13), .CLK(IR), .RSTB(n89), .Q(
        opCode[1]) );
  DFFARX1 \opCode_reg[0]  ( .D(instruction_12), .CLK(IR), .RSTB(n89), .Q(
        opCode[0]) );
  DFFARX1 LDSRstr_reg ( .D(n85), .CLK(IR), .RSTB(n89), .Q(LDSRstr), .QN(n77)
         );
  DFFARX1 ALUstr_reg ( .D(n84), .CLK(IR), .RSTB(n89), .Q(ALUstr) );
  DFFARX1 MOVstr_reg ( .D(n83), .CLK(IR), .RSTB(n89), .Q(MOVstr), .QN(n78) );
  DFFASRX1 \index_reg[3]  ( .D(1'b0), .CLK(reset), .RSTB(n75), .SETB(n74), .Q(
        index[3]) );
  DFFASRX1 \index_reg[2]  ( .D(1'b0), .CLK(reset), .RSTB(n73), .SETB(n72), .Q(
        index[2]) );
  DFFASRX1 \index_reg[1]  ( .D(1'b0), .CLK(reset), .RSTB(n71), .SETB(n70), .Q(
        index[1]) );
  DFFASRX1 \index_reg[0]  ( .D(1'b0), .CLK(reset), .RSTB(n69), .SETB(n68), .Q(
        index[0]) );
  OAI221X1 U3 ( .IN1(IRiEn), .IN2(instruction[3]), .IN3(n37), .IN4(
        instruction[9]), .IN5(n38), .QN(n74) );
  AO221X1 U4 ( .IN1(instruction[3]), .IN2(n37), .IN3(instruction[9]), .IN4(
        IRiEn), .IN5(n39), .Q(n75) );
  OAI221X1 U5 ( .IN1(IRiEn), .IN2(instruction[2]), .IN3(n37), .IN4(
        instruction[8]), .IN5(n38), .QN(n72) );
  AO221X1 U6 ( .IN1(instruction[2]), .IN2(n37), .IN3(instruction[8]), .IN4(
        IRiEn), .IN5(n39), .Q(n73) );
  OAI221X1 U7 ( .IN1(IRiEn), .IN2(instruction[1]), .IN3(n37), .IN4(
        instruction[7]), .IN5(n38), .QN(n70) );
  AO221X1 U8 ( .IN1(instruction[1]), .IN2(n37), .IN3(instruction[7]), .IN4(
        IRiEn), .IN5(n39), .Q(n71) );
  OAI221X1 U9 ( .IN1(IRiEn), .IN2(instruction[0]), .IN3(n37), .IN4(
        instruction[6]), .IN5(n38), .QN(n68) );
  INVX0 U10 ( .IN(n39), .QN(n38) );
  AO221X1 U11 ( .IN1(instruction[0]), .IN2(n37), .IN3(instruction[6]), .IN4(
        IRiEn), .IN5(n39), .Q(n69) );
  NOR2X0 U12 ( .IN1(IRjEn), .IN2(IRiEn), .QN(n39) );
  INVX0 U13 ( .IN(IRiEn), .QN(n37) );
  NAND2X0 U15 ( .IN1(n41), .IN2(n42), .QN(n83) );
  NAND3X0 U16 ( .IN1(n43), .IN2(n44), .IN3(instruction_15), .QN(n42) );
  XNOR2X1 U17 ( .IN1(instruction_13), .IN2(n45), .Q(n43) );
  AO21X1 U18 ( .IN1(n46), .IN2(instruction_15), .IN3(n78), .Q(n41) );
  INVX0 U19 ( .IN(n47), .QN(n46) );
  OAI22X1 U20 ( .IN1(n48), .IN2(n49), .IN3(n77), .IN4(n50), .QN(n85) );
  NOR2X0 U21 ( .IN1(n49), .IN2(n44), .QN(n50) );
  OA22X1 U22 ( .IN1(n45), .IN2(n51), .IN3(n44), .IN4(n52), .Q(n48) );
  NAND2X0 U23 ( .IN1(instruction_13), .IN2(n44), .QN(n51) );
  INVX0 U24 ( .IN(instruction_12), .QN(n45) );
  AO221X1 U25 ( .IN1(n53), .IN2(n44), .IN3(n47), .IN4(ALUstr), .IN5(n49), .Q(
        n84) );
  INVX0 U26 ( .IN(instruction_15), .QN(n49) );
  NAND2X0 U27 ( .IN1(instruction_14), .IN2(n52), .QN(n47) );
  INVX0 U28 ( .IN(n53), .QN(n52) );
  INVX0 U29 ( .IN(instruction_14), .QN(n44) );
  NOR2X0 U30 ( .IN1(instruction_12), .IN2(instruction_13), .QN(n53) );
  NOR2X0 U31 ( .IN1(reset), .IN2(IF), .QN(n89) );
  TNBUFFHX4 \bus_tri[0]  ( .IN(instruction[0]), .ENB(BRjEn), .Q(bus[0]) );
  TNBUFFHX4 \bus_tri[1]  ( .IN(instruction[1]), .ENB(BRjEn), .Q(bus[1]) );
  TNBUFFHX4 \bus_tri[2]  ( .IN(instruction[2]), .ENB(BRjEn), .Q(bus[2]) );
  TNBUFFHX4 \bus_tri[3]  ( .IN(instruction[3]), .ENB(BRjEn), .Q(bus[3]) );
  TNBUFFHX4 \bus_tri[4]  ( .IN(instruction[4]), .ENB(BRjEn), .Q(bus[4]) );
  TNBUFFHX4 \bus_tri[5]  ( .IN(instruction[5]), .ENB(BRjEn), .Q(bus[5]) );
  TNBUFFHX4 \bus_tri[6]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[6]) );
  TNBUFFHX4 \bus_tri[7]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[7]) );
  TNBUFFHX4 \bus_tri[8]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[8]) );
  TNBUFFHX4 \bus_tri[9]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[9]) );
  TNBUFFHX4 \bus_tri[10]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[10]) );
  TNBUFFHX4 \bus_tri[11]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[11]) );
  TNBUFFHX4 \bus_tri[12]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[12]) );
  TNBUFFHX4 \bus_tri[13]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[13]) );
  TNBUFFHX4 \bus_tri[14]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[14]) );
  TNBUFFHX4 \bus_tri[15]  ( .IN(1'b0), .ENB(BRjEn), .Q(bus[15]) );
endmodule

