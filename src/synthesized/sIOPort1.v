
module IOPort1 ( bus, rEn, dataIn );
  output [15:0] bus;
  input [15:0] dataIn;
  input rEn;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15;
  tri   [15:0] bus;

  \**TSGEN**  \bus_tri[15]  ( .\function (dataIn[15]), .three_state(N0), 
        .\output (bus[15]) );
  GTECH_NOT I_0 ( .A(rEn), .Z(N0) );
  \**TSGEN**  \bus_tri[14]  ( .\function (dataIn[14]), .three_state(N1), 
        .\output (bus[14]) );
  GTECH_NOT I_1 ( .A(rEn), .Z(N1) );
  \**TSGEN**  \bus_tri[13]  ( .\function (dataIn[13]), .three_state(N2), 
        .\output (bus[13]) );
  GTECH_NOT I_2 ( .A(rEn), .Z(N2) );
  \**TSGEN**  \bus_tri[12]  ( .\function (dataIn[12]), .three_state(N3), 
        .\output (bus[12]) );
  GTECH_NOT I_3 ( .A(rEn), .Z(N3) );
  \**TSGEN**  \bus_tri[11]  ( .\function (dataIn[11]), .three_state(N4), 
        .\output (bus[11]) );
  GTECH_NOT I_4 ( .A(rEn), .Z(N4) );
  \**TSGEN**  \bus_tri[10]  ( .\function (dataIn[10]), .three_state(N5), 
        .\output (bus[10]) );
  GTECH_NOT I_5 ( .A(rEn), .Z(N5) );
  \**TSGEN**  \bus_tri[9]  ( .\function (dataIn[9]), .three_state(N6), 
        .\output (bus[9]) );
  GTECH_NOT I_6 ( .A(rEn), .Z(N6) );
  \**TSGEN**  \bus_tri[8]  ( .\function (dataIn[8]), .three_state(N7), 
        .\output (bus[8]) );
  GTECH_NOT I_7 ( .A(rEn), .Z(N7) );
  \**TSGEN**  \bus_tri[7]  ( .\function (dataIn[7]), .three_state(N8), 
        .\output (bus[7]) );
  GTECH_NOT I_8 ( .A(rEn), .Z(N8) );
  \**TSGEN**  \bus_tri[6]  ( .\function (dataIn[6]), .three_state(N9), 
        .\output (bus[6]) );
  GTECH_NOT I_9 ( .A(rEn), .Z(N9) );
  \**TSGEN**  \bus_tri[5]  ( .\function (dataIn[5]), .three_state(N10), 
        .\output (bus[5]) );
  GTECH_NOT I_10 ( .A(rEn), .Z(N10) );
  \**TSGEN**  \bus_tri[4]  ( .\function (dataIn[4]), .three_state(N11), 
        .\output (bus[4]) );
  GTECH_NOT I_11 ( .A(rEn), .Z(N11) );
  \**TSGEN**  \bus_tri[3]  ( .\function (dataIn[3]), .three_state(N12), 
        .\output (bus[3]) );
  GTECH_NOT I_12 ( .A(rEn), .Z(N12) );
  \**TSGEN**  \bus_tri[2]  ( .\function (dataIn[2]), .three_state(N13), 
        .\output (bus[2]) );
  GTECH_NOT I_13 ( .A(rEn), .Z(N13) );
  \**TSGEN**  \bus_tri[1]  ( .\function (dataIn[1]), .three_state(N14), 
        .\output (bus[1]) );
  GTECH_NOT I_14 ( .A(rEn), .Z(N14) );
  \**TSGEN**  \bus_tri[0]  ( .\function (dataIn[0]), .three_state(N15), 
        .\output (bus[0]) );
  GTECH_NOT I_15 ( .A(rEn), .Z(N15) );
endmodule

