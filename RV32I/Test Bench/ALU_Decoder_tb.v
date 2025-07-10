`timescale 1ns/1ns
`include "ALU_Decoder.v"

module ALU_Decoder_tb;

  reg [1:0] ALUOp;
  reg [2:0] funct3;
  reg [6:0] funct7, op;
  wire [2:0] ALUControl;

  ALU_Decoder uut(
    .ALUOp(ALUOp)
  , .funct3(funct3)
  , .funct7(funct7)
  , .op(op)
  , .ALUControl(ALUControl)
  );

  initial begin
    $dumpfile("ALU_Decoder_tb.vcd");
    $dumpvars(0, ALU_Decoder_tb);

    // Test 1: LW/SW  ADD
    ALUOp = 2'b00; funct3 = 3'b000; funct7 = 7'b0000000; op = 7'b0000011;
    #20;

    // Test 2: BEQ  SUB
    ALUOp = 2'b01; funct3 = 3'b000; funct7 = 7'b0000000; op = 7'b1100011;
    #20;

    // Test 3: ADD (R-type)
    ALUOp = 2'b10; funct3 = 3'b000; funct7 = 7'b0000000; op = 7'b0110011;
    #20;

    // Test 4: SUB (R-type)
    ALUOp = 2'b10; funct3 = 3'b000; funct7 = 7'b0100000; op = 7'b0110011;
    #20;

    // Test 5: AND
    ALUOp = 2'b10; funct3 = 3'b111; funct7 = 7'b0000000; op = 7'b0110011;
    #20;

    $display("Test complete");
    $finish;
  end

endmodule
