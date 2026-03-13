`timescale 1ns/1ns
module testbench;
reg DIR;
reg[7:0]a;
reg [7:0]b;
wire [7:0]a_out;
wire [7:0]b_out;
oct_bus_ts buffer1(DIR,a,b,a_out,b_out);
initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
#0  DIR=0; a=8'b00000000; b=8'b00000001;

#5  DIR=1; a=8'b00000011; b=8'b00000010;

#5  DIR=0; a=8'b00001111; b=8'b11110000;

#5  DIR=1; a=8'b10101010; b=8'b01010101;

#5  DIR=0; a=8'b11111111; b=8'b00000000;  // edge values

#5  DIR=1; a=8'b11001100; b=8'b00110011;

#5  DIR=0; a=8'b10000000; b=8'b00000001;

#5  DIR=1; a=8'b01111111; b=8'b11111110;

#20 $finish;
end 

endmodule