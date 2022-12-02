
module Traffic_Light_Controller(


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
    reg [3:0]count;
    reg[2:0] ps;
    localparam Vermelho = 3'b100, Verde = 3'b001, Amarelo = 3'b010;
    
   
    //temporizador para cada estado
    always@(posedge clk or posedge rst)
        begin
        if(rst==1)
        begin
        ps<=S1;
        count<=0;
        end
        else
        
            case(ps)
                S1: if(count<20)
                        begin
                        ps<=S1;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S2;
                        count<=0;
                        end
                S2: if(count<3)
                        begin
                        ps<=S2;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S3;
                        count<=0;
                        end
                S3: if(count<20)
                        begin
                        ps<=S3;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S4;
                        count<=0;
                        end
                S4:if(count<3)
                        begin
                        ps<=S4;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S5;
                        count<=0;
                        end
                S5:if(count<15)
                        begin
                        ps<=S5;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S6;
                        count<=0;
                        end

                S6:if(count<3)
                        begin
                        ps<=S6;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S1;
                        count<=0;
                        end
                default: ps<=S1;
                endcase
            end   

    //Estados dos faróis
            always@(ps)    
            begin
                
                case(ps)
                     
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
