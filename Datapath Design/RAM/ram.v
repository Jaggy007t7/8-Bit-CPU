
module ram #(parameter add_width=8,data_width=8 )
(
    input CS,WE,  // CS - chip select is a control input;
    input [add_width-1:0]A,
    input [data_width-1:0]D,
    output reg[data_width-1:0]out

);

reg [data_width-1:0]RAM[2**add_width-1:0];
initial begin 
    $readmemb("data.csv",RAM);
end

always @(*)begin 
    if(CS==1'b1)begin 
        out=8'b0000;
    end
    else begin 
        if(WE==1'b0)begin 
            RAM[A] <= D;
        end
        else begin 
            out<=RAM[A];
        end
    end
end
endmodule
