`timescale 1ns/1ns
module testbench;
reg CS,WE;
reg[7:0]a;
reg[7:0]D;
wire [7:0]out;

ram ram1(CS,WE,a,D,out);

initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
/* Read Initial Memory values */
#0  CS=0; WE=1'b1; a=8'h00;
#2  a=8'h01;
#2  a=8'h02;
#2  a=8'h03;
#2  a=8'h04;
#2  a=8'h05;
#2  a=8'h06;
#2  a=8'h07;
#2  a=8'h08;
#2  a=8'h09;
#2  a=8'h0A;
#2  a=8'h0B;

// Write Operations.
#2  WE=0; a=8'h10; D=8'hAA;
#2  WE=0; a=8'h11; D=8'h55;
#2  WE=0; a=8'h12; D=8'hFF;
#2  WE=0; a=8'h13; D=8'h0F;

// Read after write.
#2  WE=1; a=8'h10;
#2  a=8'h11;
#2  a=8'h12;
#2  a=8'h13;

// Chip select disabled.
#2  CS=1; a=8'h10;
#2  CS=0;

// test cases
#2  WE=1; a=8'h20;
#2  a=8'h21;
#2  a=8'h22;

#10 $finish;
end
endmodule