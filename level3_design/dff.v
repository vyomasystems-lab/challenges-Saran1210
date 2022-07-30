'timescale 1us/1us

module dff (
  input clk, d,
  output q
);

always @ (posedge clk) begin
  q <= d;
end

endmodule
