module alu(
    input [7:0]value1,value2,
    input sel,
    output reg [7:0]result,
    output reg Cout,Bout,
    output reg overflow,negative
);

parameter add=0, subtract=1;
always @(*) begin 
    case(sel)
        add:begin 
            {Cout,result} = value1+value2;
            overflow=Cout;
        end 
        subtract:begin 
            {Bout,result} = value1-value2;
            negative=Bout;
        end 
    endcase;
end

endmodule
