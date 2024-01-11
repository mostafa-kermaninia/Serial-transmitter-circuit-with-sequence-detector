`timescale 1ns / 1ns
module three_bit_counter_reg (
    input clk,
    rst,
    serIn,
    iz0,
    cen,
    shen,
    output logic co,
    output logic [7:0] parOut
);
  logic [2:0] ps, ns;

  // huffman part
  always @(ps) begin
    // {co, ns} = ps + 1'b1;
    ns = ps + 1'b1;
  end

  // counter part 
  always @(posedge clk, posedge rst) begin
    if (rst) ps <= 3'b0;
    else if (iz0) begin
      ps <= 3'b0;
    end else if (cen) ps <= ns;
  end

  assign co = (ps == 3'b111);

  // shift reg part
  always @(posedge clk, posedge rst) begin
    if (rst) parOut <= 8'b0;
    else if (iz0) parOut <= 8'b0;
    else if (shen) parOut <= {serIn, parOut[7:1]};
    else parOut <= parOut;
  end

endmodule
