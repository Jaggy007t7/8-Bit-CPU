module clock(
    input select,
    input clk, // astable clk.
    input a,  //Input for monostable clk.
    output reg y
);

parameter astable_clk=0, monostable_clk=1;

always @(*)begin 
    case(select)
     astable_clk:begin 
        y=clk;
     end
     monostable_clk:begin
        y=a;
     end
    endcase   
end
endmodule
