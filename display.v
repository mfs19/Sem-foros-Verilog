module C7SEG(
  CLK,
  EN,
  DATA_IN,
  DATA_OUT,
  WAIT
);
  
  input CLK, EN, RST;
  input[7:0] DATA_IN;
  output WAIT;
  output[7:0] DATA_OUT;
  
  reg [7:0] DATA_OUT;
  reg WAIT;
