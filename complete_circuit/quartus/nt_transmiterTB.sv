`timescale 1ns / 1ns
module nt_transmiterTB ();
  logic clk = 1, rst = 0, serin = 1;
  wire outvalid, serout;
  nt_transmiter UUT (
      serout,
      serin,
      outvalid,
      clk,
      rst
  );
  always #80 clk = ~clk;
  initial begin
    // seq det part
    #50;
    #53 serin = 0;
    #77;
    #200 serin = 1;
    #762;
    serin = 0;
    // count part
    #23;
    #500 serin = 1;
    // transmit part
    #231 serin = 0;
    #333 serin = 0;
    #123 serin = 0;
    #2370 $stop;
  end

endmodule
