// This is the simulation code for IC - Octal Bus Transceiver;
module oct_bus_ts(
    input DIR,
    input [7:0]a,
    input [7:0]b,
    output [7:0]a_out,
    output [7:0]b_out
);

assign a_out = (DIR)?a:b;
assign b_out = (DIR)?a:b;
endmodule
