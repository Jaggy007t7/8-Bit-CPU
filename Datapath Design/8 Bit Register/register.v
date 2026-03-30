module register(
    input clk,   // Positive edge triggerd.
    input clear, //Asynchronous clear.
    input load,  // Control signal
    input [7:0]a,
    output reg[7:0]b
);

initial begin 
    b=4'b0000;
end

always @(posedge clk or posedge clear)begin 
    if(clear==1'b1)begin 
        b=8'b0;
    end
    else begin 
        if(load==1'b1)begin 
            b<=a;
        end
    end
end


endmodule
