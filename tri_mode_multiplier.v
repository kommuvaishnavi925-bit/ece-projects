`timescale 1ns / 1ps

module tri_mode_tb;

reg [15:0] a;
reg [15:0] b;
reg [1:0] mode;
wire [31:0] result;

// Instantiate DUT
tri_mode_multiplier uut (
    .a(a),
    .b(b),
    .mode(mode),
    .result(result)
);

initial begin

    // Mode 00 → 16x16
    a = 16'd10; b = 16'd5; mode = 2'b00;
    #10;

    a = 16'd20; b = 16'd3; mode = 2'b00;
    #10;

    // Mode 01 → 2 x 8x8
    a = 16'h1234; b = 16'h0102; mode = 2'b01;
    #10;

    // Mode 10 → 4 x 4x4
    a = 16'h1234; b = 16'h1111; mode = 2'b10;
    #10;

    // Edge case
    a = 16'hFFFF; b = 16'h0001; mode = 2'b00;
    #10;

    $stop;

end

endmodule