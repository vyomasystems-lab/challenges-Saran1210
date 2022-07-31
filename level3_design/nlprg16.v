module nlprg16 (
  input CLK,
  input RST,
  output [15:0] o
);
  wire o0;
  wire s0;
  wire s1;
  wire o5;
  wire o1;
  wire s2;
  wire o2;
  wire s3;
  wire o3;
  wire s4;
  wire o4;
  wire s5;
  wire o7;
  wire o6;
  wire o8;
  wire o9;
  wire o10;
  wire o11;
  wire o12;
  wire o13;
  wire o14;
  wire o15;

  dff dff0 (CLK,RST,s1,o0); 
  dff dff1 (CLK,RST,s0,o1);
  dff dff2 (CLK,RST,s2,o2);
  dff dff3 (CLK,RST,s3,o3);
  dff dff4 (CLK,RST,s4,o4);
  dff dff5 (CLK,RST,s5,o5);
  dff dff6 (CLK,RST,o5,o6);
  dff dff7 (CLK,RST,o6,o7);

  dff dff8 (CLK,RST,o7,o8); 
  dff dff9 (CLK,RST,o8,o9);
  dff dff10 (CLK,RST,o9,o10); 
  dff dff11 (CLK,RST,o10,o11);
  dff dff12 (CLK,RST,o11,o12); 
  dff dff13 (CLK,RST,o12,o13);
  dff dff14 (CLK,RST,o13,o14); 
  dff dff15 (CLK,RST,o14,o15);

 assign s0 = ((o12 ^ o13) ^ o0);
  assign s1 = ~ ((o14 ^ o15) ^ o5);
  assign s2 = ((o10 ^ o11) ^ o1);
  assign s3 = ((o8 ^ o9) ^ o2);
  assign s4 = ((o6 ^ o7) ^ o3);
  assign s5 = (~ (o7 ^ o4) ^ (((o3 & o2) & (o1 & o0)) & ((((~ (o15 | o14) & ~ (o13 | o12)) & (~ (o11 | o10) & ~ (o9 | o8))) & ~ (o7 | o6)) & ~ o5)));
  assign o[0] = o0;
  assign o[1] = o1;
  assign o[2] = o2;
  assign o[3] = o3;
  assign o[4] = o4;
  assign o[5] = o5;
  assign o[6] = o6;
  assign o[7] = o7;
  assign o[8] = o8;
  assign o[9] = o9;
  assign o[10] = o10;
  assign o[11] = o11;
  assign o[12] = o12;
  assign o[13] = o13;
  assign o[14] = o14;
  assign o[15] = o15;
endmodule
