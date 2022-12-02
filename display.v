//insere no display o valor do tempo
module SEG7(output reg [6:0] o, input [2:0] i);

always @ * begin
    case(i)
        0 : o = 8'b0111111;
        1 : o = 8'b0000110;
        2 : o = 8'b1011011;
        3 : o = 8'b1001111; 
        4 : o = 8'b1100110; 
        5 : o = 8'b1101101; 
        6 : o = 8'b1111101;
        7 : o = 8'b0000111;
        8 : o = 8'b1111111; 
        9 : o = 8'b1101111; 
    endcase
end
endmodule
