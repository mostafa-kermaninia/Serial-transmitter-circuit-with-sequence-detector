 `timescale 1ns / 1ns
module transmitter_TB ();
  logic clk = 1, rst = 0, cen, ld = 0;
  logic [7:0] par_ld = 8'b0;
  wire co_Pre,co_Post;
  transmitter CUT1 (
      clk,
      rst,
      ld,
      cen,
      par_ld,
      co_Pre
  );
  transmitter_PP CUT2 (
      clk,
      rst,
      ld,
      cen,
      par_ld,
      co_Post
  );


  always #250 clk = ~clk;

  initial begin
    #319 cen = 1;
    #234;
    par_ld = 8'b00001101;
    #225 ld = 1;
    #310 ld = 0;

    #33504;
    $stop;
  end
endmodule
