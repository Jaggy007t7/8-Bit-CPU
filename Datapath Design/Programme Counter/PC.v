// 4 Bit counter;
module counter(
    input clk,reset, //asynchronous reset.
    output reg [3:0]count
);

initial begin 
    count=4'b1111;
end

always @(posedge clk or posedge reset)begin 
    if(reset)begin 
        count=4'b0000;
    end
    else begin 
    if(count==4'b1111)begin 
        count<=4'b0000;
    end
    else begin 
        count = count+1'b1;
    end
    end
end

endmodule
