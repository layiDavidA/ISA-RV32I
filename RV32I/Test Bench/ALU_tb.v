`timescale 1ns/1ns
`include "ALU.v"

module ALU_tb;

  // Inputs
  reg [31:0] A;
  reg [31:0] B;
  reg [2:0] ALUControl;

  // Outputs
  wire [31:0] Result;
  wire Carry, OverFlow, Zero, Negative;

  ALU uut (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result),
    .Carry(Carry),
    .OverFlow(OverFlow),
    .Zero(Zero),
    .Negative(Negative)
  );

  initial begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);

    $display("Starting ALU testbench...");

    // Test ADD: 2 + 2 = 4
    A = 32'd2;
    B = 32'd2;
    ALUControl = 3'b000; 
    #20;

    // Test SUB: 5 - 2 = 3
    A = 32'd5;
    B = 32'd2;
    ALUControl = 3'b001; 
    #20;

    // Test AND: 5 & 3 = 1
    A = 32'd5;
    B = 32'd3;
    ALUControl = 3'b010; 
    #20;

    // Test OR: 5 | 2 = 7
    A = 32'd5;
    B = 32'd2;
    ALUControl = 3'b011; 
    #20;

    // Test SLT: 2 < 5 → 1
    A = 32'd2;
    B = 32'd5;
    ALUControl = 3'b101; 
    #20;

    // Test SLT: 5 < 2 → 0
    A = 32'd5;
    B = 32'd2;
    ALUControl = 3'b101; 
    #20;

    // Test ADD overflow: 2^31 - 1 + 1
    A = 32'h7FFFFFFF;
    B = 32'd1;
    ALUControl = 3'b000; 
    #20;

    // Test SUB overflow: -2^31 - 1
    A = 32'h80000000;
    B = 32'd1;
    ALUControl = 3'b001; 
    #20;

    $display("ALU test complete.");
    $finish;
  end

endmodule
