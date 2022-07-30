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
