module dff (
  input CLK, RST, D, 
  output reg Q
 );
  
  always @(posedge CLK or posedge RST)
  begin        
  if(RST)         
  Q <= 0;
  else        
  Q <= D;
  end

  endmodule

module nlprg8 (
  input CLK,
  input RST,
  output o0,
  output o1,
  output o2,
  output o3,
  output o4,
  output o5,
  output o6,
  output o7
);
  wire s0;
  wire o0_temp;
  wire s1;
  wire o2_temp;
  wire s2;
  wire o1_temp;
  wire s3;
  wire o3_temp;
  wire o4_temp;
  wire o5_temp;
  wire o6_temp;
  wire o7_temp;

  dff dff0 (CLK,RST,s0,o0_temp); 
  dff dff1 (CLK,RST,s1,o2_temp);
  dff dff2 (CLK,RST,s2,o1_temp);
  dff dff3 (CLK,RST,s3,o3_temp);
  dff dff4 (CLK,RST,o4_temp,o5_temp);
  dff dff5 (CLK,RST,o3_temp,o4_temp);
  dff dff6 (CLK,RST,o5_temp,o6_temp);
  dff dff7 (CLK,RST,o6_temp,o7_temp);
   
  assign s0 = (~ (o6_temp ^ o7_temp) ^ o3_temp);
  assign s1 = ~ (~ (o3_temp ^ o4_temp) ^ o1_temp);
  assign s2 = ~ (~ (o5_temp ^ o6_temp) ^ o0_temp);
  assign s3 = ((o5_temp ^ o2_temp) ^ (~ (o1_temp | o0_temp) & (((o7_temp & o6_temp) & (o5_temp & o4_temp)) & o3_temp)));
  assign o0 = o0_temp;
  assign o1 = o1_temp;
  assign o2 = o2_temp;
  assign o3 = o3_temp;
  assign o4 = o4_temp;
  assign o5 = o5_temp;
  assign o6 = o6_temp;
  assign o7 = o7_temp;

endmodule
