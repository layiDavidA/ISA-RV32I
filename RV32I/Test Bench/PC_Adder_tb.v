`timescale 1ns/1ns
`include "PC_Adder.v"
module PC_Adder_tb;

reg [31:0] a,b;
wire [31:0] c;

PC_Adder uut(
.a(a),
.b(b),
.c(c));

initial begin 
$dumpfile("PC_Adder_tb.vcd");
$dumpvars(0, PC_Adder_tb);
a=0;
b=0;
#20;

a=32'd2;
b=32'd2;
#20;

a=32'd8;
b=32'd9;
#20;

$display("Test complete");

end

endmodule
