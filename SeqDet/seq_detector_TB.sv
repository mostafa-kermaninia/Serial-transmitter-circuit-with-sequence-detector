`timescale 1ns / 1ns
module seq_detector_TB ();
  logic clk = 1;
  logic rst = 0;
  logic SIn;
  //wire  detected_Pre;
  wire detected_Post;
  // seq_detector CUT1 (
  //     clk,
  //     rst,
  //     SIn,
  //     detected_Pre
  // );
  SeqDetVerilogPP CUT2 (
      clk,
      rst,
      SIn,
      detected_Post
  );

  always #250 clk = ~clk;
  initial begin
    SIn = 1;
    #300;
    SIn = 0;
    #300;
    SIn = 1;
    #2500;
    SIn = 0;
    #300;
    SIn = 0;
    #300;
    SIn = 1;
    #500;
    SIn = 0;
    #500 SIn = 1;
    #5000;
    $stop;
  end


endmodule
