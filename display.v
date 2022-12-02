//insere no display o valor do tempo
module 7SEG(output reg [7:0] z, input [2:0] s);

always @ * begin
    case(s)
        0 : z = ~8'b00111111;
        1 : z = ~8'b00000110;
        2 : z = ~8'b01011011;
        3 : z = ~8'b01001111; 
        4 : z = ~8'b01100110; 
        5 : z = ~8'b01101101; 
        6 : z = ~8'b01111101;
        7 : z = ~8'b00000111;
        8 : z = ~8'b01111111; 
        9 : z = ~8'b01101111; 
    endcase
end
endmodule
