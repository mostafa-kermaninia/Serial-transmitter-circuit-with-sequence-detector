`timescale 1ns / 1ns
module seq_cont (
    input serIn,
    co1,
    co2,
    clk,
    rst,
    output logic ld,
    init,
    shen,
    cen1,
    cen2,
    outValid
);
  // huffman model
  logic [3:0] ns, ps;
  always @(posedge clk, posedge rst) begin
    if (rst) ps <= I;
    else ps <= ns;
  end

  // sequence detector state
  parameter [3:0] I = 4'b0000, A = 4'b0001, B = 4'b0010, C = 4'b0011, D = 4'b0100,E = 4'b0101, F = 4'b0110, G = 4'b0111;
  // other states
  parameter [3:0] ld_state = 4'b1000, tr_state = 4'b1001;
  // main fsm implement
  always @(ps, serIn) begin
    init = 1'b0;
    ld = 1'b0;
    cen1 = 1'b0;
    shen = 1'b0;
    outValid = 1'b0;
    ns = I;
    case (ps)
      I: ns = serIn ? I : A;
      A: ns = serIn ? B : A;
      B: ns = serIn ? C : A;
      C: ns = serIn ? D : A;
      D: ns = serIn ? E : A;
      E: ns = serIn ? F : A;
      F: begin
        ns   = serIn ? I : G;
        shen = ~serIn;
        init = 1;
      end
      G: begin
        ns = co1 ? ld_state : G;
        cen1 = 1;
        outValid = co1;
        shen = 1;
      end
      ld_state: begin
        ns = tr_state;
        ld = 1;
        cen2 = 1;
        outValid = 1;
      end
      tr_state: begin
        ns = co2 ? I : tr_state;
        outValid = 1;
        cen2 = 1;
      end
      default: ns = I;
    endcase
  end

endmodule

