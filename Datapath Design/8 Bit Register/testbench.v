module testbench;
reg clk,clear,load;
reg [7:0]a;
wire [7:0]b;

register register1(clk,clear,load,a,b);

initial begin 
    clk=1'b0;
    forever begin 
        #5 clk=~clk;
    end

end


initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
#0  load=1'b0 ; clear=1'b0 ; a=8'h16;

#7  load=1'b1 ; clear=1'b0 ; a=8'h16;  // load first value
#10 load=1'b1 ; clear=1'b0 ; a=8'h15;  // change value

#10 load=1'b0 ; clear=1'b0 ; a=8'hAA;  // hold previous value

#10 load=1'b1 ; clear=1'b0 ; a=8'h3C;  // load new value

#10 load=1'b1 ; clear=1'b1 ; a=8'hFF;  // clear register

#10 load=1'b1 ; clear=1'b0 ; a=8'h55;  // load after clear

#10 load=1'b1 ; clear=1'b0 ; a=8'h00;  // edge case

#10 load=1'b1 ; clear=1'b0 ; a=8'hFF;  // max value

#20 $finish;

end

endmodule