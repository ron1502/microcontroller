
module MDR ( bus, dReadIn, dToWriteOut, readEn, writeEn, rOutEn, reset );
  inout [15:0] bus;
  input [15:0] dReadIn;
  output [15:0] dToWriteOut;
  input readEn, writeEn, rOutEn, reset;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15;
  wire   [15:0] savedData;
  tri   [15:0] bus;

  \**SEQGEN**  \savedData_reg[15]  ( .clear(reset), .preset(1'b0), 
        .next_state(dReadIn[15]), .clocked_on(readEn), .data_in(1'b0), 
        .enable(1'b0), .Q(savedData[15]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[14]  ( .clear(reset), .preset(1'b0), 
        .next_state(dReadIn[14]), .clocked_on(readEn), .data_in(1'b0), 
        .enable(1'b0), .Q(savedData[14]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[13]  ( .clear(reset), .preset(1'b0), 
        .next_state(dReadIn[13]), .clocked_on(readEn), .data_in(1'b0), 
        .enable(1'b0), .Q(savedData[13]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[12]  ( .clear(reset), .preset(1'b0), 
        .next_state(dReadIn[12]), .clocked_on(readEn), .data_in(1'b0), 
        .enable(1'b0), .Q(savedData[12]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[11]  ( .clear(reset), .preset(1'b0), 
        .next_state(dReadIn[11]), .clocked_on(readEn), .data_in(1'b0), 
        .enable(1'b0), .Q(savedData[11]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[10]  ( .clear(reset), .preset(1'b0), 
        .next_state(dReadIn[10]), .clocked_on(readEn), .data_in(1'b0), 
        .enable(1'b0), .Q(savedData[10]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[9]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[9]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[8]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[8]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[7]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[7]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[6]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[6]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[5]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[5]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[4]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[4]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[3]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[2]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[1]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \savedData_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(
        dReadIn[0]), .clocked_on(readEn), .data_in(1'b0), .enable(1'b0), .Q(
        savedData[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**TSGEN**  \bus_tri[15]  ( .\function (savedData[15]), .three_state(N0), 
        .\output (bus[15]) );
  GTECH_NOT I_0 ( .A(rOutEn), .Z(N0) );
  \**TSGEN**  \bus_tri[14]  ( .\function (savedData[14]), .three_state(N1), 
        .\output (bus[14]) );
  GTECH_NOT I_1 ( .A(rOutEn), .Z(N1) );
  \**TSGEN**  \bus_tri[13]  ( .\function (savedData[13]), .three_state(N2), 
        .\output (bus[13]) );
  GTECH_NOT I_2 ( .A(rOutEn), .Z(N2) );
  \**TSGEN**  \bus_tri[12]  ( .\function (savedData[12]), .three_state(N3), 
        .\output (bus[12]) );
  GTECH_NOT I_3 ( .A(rOutEn), .Z(N3) );
  \**TSGEN**  \bus_tri[11]  ( .\function (savedData[11]), .three_state(N4), 
        .\output (bus[11]) );
  GTECH_NOT I_4 ( .A(rOutEn), .Z(N4) );
  \**TSGEN**  \bus_tri[10]  ( .\function (savedData[10]), .three_state(N5), 
        .\output (bus[10]) );
  GTECH_NOT I_5 ( .A(rOutEn), .Z(N5) );
  \**TSGEN**  \bus_tri[9]  ( .\function (savedData[9]), .three_state(N6), 
        .\output (bus[9]) );
  GTECH_NOT I_6 ( .A(rOutEn), .Z(N6) );
  \**TSGEN**  \bus_tri[8]  ( .\function (savedData[8]), .three_state(N7), 
        .\output (bus[8]) );
  GTECH_NOT I_7 ( .A(rOutEn), .Z(N7) );
  \**TSGEN**  \bus_tri[7]  ( .\function (savedData[7]), .three_state(N8), 
        .\output (bus[7]) );
  GTECH_NOT I_8 ( .A(rOutEn), .Z(N8) );
  \**TSGEN**  \bus_tri[6]  ( .\function (savedData[6]), .three_state(N9), 
        .\output (bus[6]) );
  GTECH_NOT I_9 ( .A(rOutEn), .Z(N9) );
  \**TSGEN**  \bus_tri[5]  ( .\function (savedData[5]), .three_state(N10), 
        .\output (bus[5]) );
  GTECH_NOT I_10 ( .A(rOutEn), .Z(N10) );
  \**TSGEN**  \bus_tri[4]  ( .\function (savedData[4]), .three_state(N11), 
        .\output (bus[4]) );
  GTECH_NOT I_11 ( .A(rOutEn), .Z(N11) );
  \**TSGEN**  \bus_tri[3]  ( .\function (savedData[3]), .three_state(N12), 
        .\output (bus[3]) );
  GTECH_NOT I_12 ( .A(rOutEn), .Z(N12) );
  \**TSGEN**  \bus_tri[2]  ( .\function (savedData[2]), .three_state(N13), 
        .\output (bus[2]) );
  GTECH_NOT I_13 ( .A(rOutEn), .Z(N13) );
  \**TSGEN**  \bus_tri[1]  ( .\function (savedData[1]), .three_state(N14), 
        .\output (bus[1]) );
  GTECH_NOT I_14 ( .A(rOutEn), .Z(N14) );
  \**TSGEN**  \bus_tri[0]  ( .\function (savedData[0]), .three_state(N15), 
        .\output (bus[0]) );
  GTECH_NOT I_15 ( .A(rOutEn), .Z(N15) );
  \**SEQGEN**  \dToWriteOut_reg[15]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[15]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[14]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[14]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[13]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[13]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[12]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[12]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[11]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[11]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[10]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[10]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[9]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[9]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[8]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[8]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[7]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[7]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[6]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[6]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[5]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[5]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[4]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[4]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[3]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[3]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[2]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[2]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[1]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[1]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dToWriteOut_reg[0]  ( .clear(reset), .preset(1'b0), 
        .next_state(bus[0]), .clocked_on(writeEn), .data_in(1'b0), .enable(
        1'b0), .Q(dToWriteOut[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
endmodule

