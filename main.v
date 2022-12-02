
module ControladorSemaforo(


    
    input clk,rst,
    output reg [2:0]light_F1,
    output reg [2:0]light_F2,
    output reg [2:0]light_F6,
    output reg [2:0]light_F9,
    output reg [2:0]light_P1,
    output reg [2:0]light_P2,
    output reg [2:0]light_P3,
    output reg [2:0]light_P4,
    output reg [2:0]light_P5,
    output reg [2:0]light_P6,
    output reg [2:0]light_P7,
    output reg [2:0]light_P8,
    output reg [2:0]light_P9,
    output reg [2:0]light_P10,
    );
    
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4,S6=5;
    reg [3:0]contador;
    reg[2:0] estado;
    localparam Vermelho = 3'b100, Verde = 3'b001, Amarelo = 3'b010;
    
    
    
    display s1 (.o(o), .i(i)); //display para identificar o tempo do semáforo
   
    //temporizador para cada estado
    always@(posedge clk or posedge rst)
        begin
        if(rst==1)
        begin
        estado<=S1;
        contador<=0;
        end
        else
        
            case(estado)
                S1: if(contador<30)
                        begin
                        estado<=S1;
                        contador<=contador+1;
                        display s1 (seg_n, contador);
                        end
                    else
                        begin
                        estado<=S2;
                        contador<=0;
                        end
                S2: if(contador<3)
                        begin
                        estado<=S2;
                        contador<=contador+1;
                        display s1 (seg_n, contador);
                        end

                    else
                        begin
                        estado<=S3;
                        contador<=0;
                        end
                S3: if(contador<30)
                        begin
                        estado<=S3;
                        contador<=contador+1;
                        display s1 (seg_n, contador);
                        end

                    else
                        begin
                        estado<=S4;
                        contador<=0;
                        end
                S4:if(contador<3)
                        begin
                        estado<=S4;
                        contador<=contador+1;
                        display s1 (seg_n, contador);
                        end

                    else
                        begin
                        estado<=S5;
                        contador<=0;
                        end
                S5:if(contador<15)
                        begin
                        estado<=S5;
                        contador<=contador+1;
                        display s1 (seg_n, contador);
                        end

                    else
                        begin
                        estado<=S6;
                        contador<=0;
                        end

                S6:if(contador<3)
                        begin
                        estado<=S6;
                        contador<=contador+1;
                        display s1 (seg_n, contador);
                        end

                    else
                        begin
                        estado<=S1;
                        contador<=0;
                        end
                default: estado<=S1;
                endcase
            end   

    //Estados dos faróis
    always@(estado)    
            begin
                
                case(estado)
                     
                    S1:
                    begin
                       light_F1<=3'b001;
                       light_P2<=3'b001;
                       light_P4<=3'b001;
                       light_F2<=3'b100;
                       light_P1<=3'b100;
                       light_P3<=3'b100;
                       light_P5<=3'b100;
                       light_F6<=3'b001;
                       light_P7<=3'b001;
                       light_P9<=3'b001; 
                       light_F9<=3'b100;
                       light_P6<=3'b100;
                       light_P8<=3'b100;
                       light_P10<=3'b100; 
                    end
                    S2:
                    begin 
                       light_F1<=3'b010;
                       light_P2<=3'b010;
                       light_P4<=3'b010;
                       light_F2<=3'b100;
                       light_P1<=3'b100;
                       light_P3<=3'b100;
                       light_P5<=3'b100;
                       light_F6<=3'b010;
                       light_P7<=3'b010;
                       light_P9<=3'b010; 
                       light_F9<=3'b100;
                       light_P6<=3'b100;
                       light_P8<=3'b100;
                       light_P10<=3'b100; 
                    end
                    S3:
                    begin
                       light_F1<=3'b100;
                       light_P2<=3'b100;
                       light_P4<=3'b100;
                       light_F2<=3'b001;
                       light_P1<=3'b001;
                       light_P3<=3'b001;
                       light_P5<=3'b100;
                       light_F6<=3'b100;
                       light_P7<=3'b100;
                       light_P9<=3'b100; 
                       light_F9<=3'b001;
                       light_P6<=3'b001;
                       light_P8<=3'b001;
                       light_P10<=3'b100;
                    end
                    S4:
                    begin
                       light_F1<=3'b100;
                       light_P2<=3'b100;
                       light_P4<=3'b100;
                       light_F2<=3'b010;
                       light_P1<=3'b010;
                       light_P3<=3'b010;
                       light_P5<=3'b100;
                       light_F6<=3'b100;
                       light_P7<=3'b100;
                       light_P9<=3'b100; 
                       light_F9<=3'b010;
                       light_P6<=3'b010;
                       light_P8<=3'b010;
                       light_P10<=3'b100;
                    end
                    S5:
                    begin
                       light_F1<=3'b100;
                       light_P2<=3'b001;
                       light_P4<=3'b001;
                       light_F2<=3'b100;
                       light_P1<=3'b001;
                       light_P3<=3'b001;
                       light_P5<=3'b001;
                       light_F6<=3'b100;
                       light_P7<=3'b001;
                       light_P9<=3'b001; 
                       light_F9<=3'b100;
                       light_P6<=3'b001;
                       light_P8<=3'b001;
                       light_P10<=3'b001;
                    end
                    S6:
                    begin 
                       light_F1<=3'b100;
                       light_P2<=3'b001;
                       light_P4<=3'b001;
                       light_F2<=3'b100;
                       light_P1<=3'b010;
                       light_P3<=3'b010;
                       light_P5<=3'b010;
                       light_F6<=3'b100;
                       light_P7<=3'b001;
                       light_P9<=3'b001; 
                       light_F9<=3'b100;
                       light_P6<=3'b010;
                       light_P8<=3'b010;
                       light_P10<=3'b010;
                    end
                    default:
                    begin 
                       light_F1<=3'b000;
                       light_P2<=3'b000;
                       light_P4<=3'b000;
                       light_F2<=3'b000;
                       light_P1<=3'b000;
                       light_P3<=3'b000;
                       light_P5<=3'b000;
                       light_F6<=3'b000;
                       light_P7<=3'b000;
                       light_P9<=3'b000; 
                       light_F9<=3'b000;
                       light_P6<=3'b000;
                       light_P8<=3'b000;
                       light_P10<=3'b000;
                    end
                    endcase
            end                
              

endmodule
