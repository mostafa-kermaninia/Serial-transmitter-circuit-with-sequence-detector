`timescale 1ns / 1ns
module seq_detector (
    input  clk,
    rst,
    serIn,
    output detected
);
  parameter [2:0] I = 3'b000, A = 3'b001, B = 3'b010, C = 3'b011, D = 3'b100,E = 3'b101, F = 3'b110, G = 3'b111;

  logic [2:0] ns, ps;
  always @(ps, serIn) begin
    ns = I;
    case (ps)
      I: ns = serIn ? I : A;
      A: ns = serIn ? B : A;
      B: ns = serIn ? C : A;
      C: ns = serIn ? D : A;
      D: ns = serIn ? E : A;
      E: ns = serIn ? F : A;
      F: ns = serIn ? I : G;
      G: ns = serIn ? G : G;
      default: ns = I;
    endcase
  end
  assign detected = (ps == G) ? 1'b1 : 1'b0;

  always @(posedge clk, posedge rst) begin
    if (rst) ps <= I;
    else ps <= ns;
  end

endmodule

