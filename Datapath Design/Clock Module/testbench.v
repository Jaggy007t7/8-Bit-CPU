`timescale 1ns/1ns
module testbench;
reg clk,select,a;
wire y;

clock clk1(select,clk,a,y);

initial begin 
    clk=1'b0;
    forever begin 
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 

#0  select=0; a=0;     // astable mode
#20 select=0; a=1;     // astable should still follow clk
#20 select=0; a=0;

#20 select=1; a=0;     // monostable mode
#5  a=1;               // pulse
#2  a=0;

#10 a=1;               // second pulse
#2  a=0;

#10 a=1;               // third pulse
#3  a=0;

#10 select=0; a=0;     // switch back to astable
#20 select=0; a=1;

#10 select=1; a=0;     // back to monostable
#4  a=1;
#3  a=0;

#20 $finish;

end

endmodule