`timescale 1ns / 1ns
module transmitter (
    input clk,
    rst,
    ld,
    cen,
    input [7:0] par_ld,
    output co
);
  logic [7:0] ps, ns;

  // huffman part
  always @(ps) begin
    ns = ps - 1'b1;
  end

  // counter part 
  always @(posedge clk, posedge rst) begin
    if (rst) ps <= 8'b0;
    else if (ld) ps <= par_ld;
    else if (cen) ps <= ns;
  end
  assign co = (ps == 1'd1);

endmodule
