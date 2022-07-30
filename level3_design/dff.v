module dff (
  input clk, d,
  output wire q
);

always @ (posedge clk) begin
  q <= d;
end

endmodule
