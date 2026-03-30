`timescale 1ns/1ns

module testbench;
reg [31:0]a,b;
reg sel;
wire [31:0]y;

mux mux1(a,b,sel,y);

initial begin 
    $dumpfile("mux_testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
// Initial values
a = 32'h00000000; 
b = 32'h00000000; 
sel = 1'b0;

#5  a = 32'h00000023; b = 32'h00000012;  // sel=0 -> expect a
#5  sel = 1'b1;                          // expect b
#5  sel = 1'b0;                          // expect a

#5  a = 32'hFFFFFFFF; b = 32'h00000001;  // max vs small
#5  sel = 1'b1;

#5  a = 32'h12345678; b = 32'h87654321;
#5  sel = 1'b0;
#5  sel = 1'b1;

#5  a = 32'hAAAAAAAA; b = 32'h55555555;  // pattern test
#5  sel = 1'b0;
#5  sel = 1'b1;

#5  a = 32'h00000000; b = 32'hFFFFFFFF;  // edge values
#5  sel = 1'b0;
#5  sel = 1'b1;

#5  $finish;

end
endmodule