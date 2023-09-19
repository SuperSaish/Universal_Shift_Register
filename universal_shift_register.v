module univeral(
  input S1,S0,MSB_in,LSB_in,clk,rst,
  input [3:0]I,
  output reg [3:0]Q
);

  always@(posedge clk or posedge rst) begin
    if(rst) begin
      Q <= 4'b0000;
    end
    else begin
      case({S1,S0})
           2'b00:begin Q<=Q; end
           2'b01:begin Q<= {MSB_in,Q[3:1]}; end
           2'b10:begin Q<= {Q[2:0],LSB_in}; end
           2'b11:begin Q<= I; end
       endcase
     end
    end
endmodule
           
           
           
  
