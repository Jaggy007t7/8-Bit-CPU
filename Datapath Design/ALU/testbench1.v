`timescale 1ns/1ns
module testbench;
reg [7:0]value1,value2;
reg sel;

wire [7:0]result;
wire Cout,Bout;
wire overflow,negative;

alu alu1(value1,value2,sel,result,Cout,Bout,overflow,negative);

initial begin
$dumpfile("testbench.vcd");
$dumpvars(0,testbench);

end 
initial begin

#0  value1 = 8'b00001111; value2 = 8'b11100010; sel = 0;
#5  value1 = 8'b00010111; value2 = 8'b11100010; sel = 1;
#5  value1 = 8'b00101111; value2 = 8'b11101010; sel = 1;

#5  value1 = 8'b00000000; value2 = 8'b00000000; sel = 0;
#5  value1 = 8'b00000001; value2 = 8'b00000001; sel = 0;
#5  value1 = 8'b00001010; value2 = 8'b00000101; sel = 0;

#5  value1 = 8'b11111111; value2 = 8'b00000001; sel = 0;  // carry case
#5  value1 = 8'b10000000; value2 = 8'b10000000; sel = 0;  // overflow case

#5  value1 = 8'b00001000; value2 = 8'b00000011; sel = 1;
#5  value1 = 8'b00000100; value2 = 8'b00001010; sel = 1;  // negative result
#5  value1 = 8'b00000000; value2 = 8'b00000001; sel = 1;  // borrow case

#5  value1 = 8'b11111111; value2 = 8'b11111111; sel = 0;
#5  value1 = 8'b10101010; value2 = 8'b01010101; sel = 0;

#5 $finish;


end


endmodule
