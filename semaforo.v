module ControladorSemaforo(
  input clk, reset,
  input Sa, Sb //sensores de carros
  output reg Va, Aa, Vea //Va = vermelho para rua a, Aa = amarelo para rua a, Vea = verde para rua a
  output reg Vb, Ab, Veb // similar ao anterior
);
  
  reg [3:0] state_reg, state_next;
  localparam s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7; //para cada estado, se atribui 10 segundos
  
  
  always @(posedge clk, negedge reset)
    begin
      if(~reset)
        state_reg <= s0;
      else
        state_reg <= state_next;
    end
  
  //maquina de estados
  always @ (*)
    begin 
      state_next = state_reg;
      case(state_reg)
        s0,s1,s3,s4,s5:
          state_next = state_reg + 1;
        s2:
          if(~Sb)
            state_next = s2;
        else state_next = s3;
        s6:
          if(~Sa & Sb)
            state_next = s6;
        else if(Sa|~Sb)
          state_next = s7;
        s7: state_next = s0;
      endcase
    end
  
  //saidas
  always @ (*)
    begin 
      Va = 1'b0;
      Aa = 1'b0;
      Vea = 1'b0;
      Vb = 1'b0;
      Ab = 1'b0;
      Veb = 1'b0;
      case(state_reg)
        s0,s1,s2:
          begin
            Vea = 1'b1;
            Vb = 1'b1;
          end
        s3:
          begin
            Aa = 1'b1;
            Vb = 1'b1;
          end
        s4,s5,s6:
          begin
            Va = 1'b1;
            Ab = 1'b1;
          end
        s7:
          begin
            Va = 1'b1;
            Ab = 1'b1;
          end
      endcase
    end
endmodule
