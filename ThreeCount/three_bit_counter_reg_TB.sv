`timescale 1ns / 1ns
module three_bit_counter_reg_TB ();
  logic clk = 1, rst = 0, serIn, iz0 = 1, shen, cen;
  wire co_pre, co_post;
  wire [7:0] parOut_pre, parOut_post;
  three_bit_counter_reg CUT1 (
      clk,
      rst,
      serIn,
      iz0,
      cen,
      shen,
      co_pre,
      parOut_pre
  );
  three_bit_counter_reg_PP CUT2 (
      clk,
      rst,
      serIn,
      iz0,
      cen,
      shen,
      co_post,
      parOut_post
  );

  always #250 clk = ~clk;

  initial begin
    #225 serIn = 0;
    #500 serIn = 1;
    #500 iz0 = 1;
    #500 iz0 = 0;
    #500 cen = 1;
    shen = 1;
    #500 serIn = 1;
    #500 serIn = 0;
    #500 serIn = 0;
    #500 serIn = 1;
    #500 serIn = 0;
    #500 serIn = 1;
    #500 serIn = 0;
    #500 serIn = 1;
    // /10101001
    #343 serIn = 0;
    #343 serIn = 0;
    #343 serIn = 0;
    #343 serIn = 0;
    #343 cen = 0;
    #343 shen = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 cen = 0;
    #343 shen = 0;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 1;
    #343 serIn = 0;
    #343 serIn = 1;
    #343 serIn = 0;
    #3354;
    $stop;
  end
endmodule
