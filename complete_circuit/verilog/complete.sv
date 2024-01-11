`timescale 1ns / 1ns
module complete (
    input  serIn,
    clk,
    rst,
    output outValid
);
  wire co1, co2, init, shen, cen1, cen2, ld;
  wire [7:0] par_ld;
  seq_cont CUT1 (
      clk,
      rst,
      serIn,
      co1,
      co2,
      ld,
      init,
      shen,
      cen1,
      cen2,
      outValid
  );
  three_bit_counter_reg CUT2 (
      clk,
      rst,
      serIn,
      init,
      cen1,
      shen,
      co1,
      par_ld
  );
  transmitter CUT3 (
      clk,
      rst,
      ld,
      cen2,
      par_ld,
      co2
  );
endmodule
