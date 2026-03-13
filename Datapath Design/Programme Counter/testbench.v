`timescale 1ns/1ns
module testbench;
reg clk;
reg reset;
wire [3:0]count;

counter counter1(clk,reset,count);

initial begin 
clk = 1'b1;
forever begin 
    #5 clk = ~clk;
end
end

initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin
    
#0  reset = 1'b1;     
#10 reset = 1'b0;     

#80;                 

#10 reset = 1'b1;     
#10 reset = 1'b0;     

#100;                 

#10 reset = 1'b1;     
#10 reset = 1'b0;

#40 $finish;
end
endmodule