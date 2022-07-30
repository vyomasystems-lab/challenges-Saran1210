module dff #
 (
  parameter WIDTH = 8
 )

 (
  input [0:0] CLK, 
  input [0:0] RST, 
  input [(WIDTH - 1):0] D, 
  output reg [(WIDTH - 1):0] Q
 );

  always @(posedge CLK)
  begin        
  if(RST) begin        
  Q <= 0;
  end  
  else begin        
  Q <= D;
  end 
  end 
endmodule
