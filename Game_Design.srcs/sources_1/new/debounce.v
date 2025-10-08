`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 13:13:40
// Design Name: 
// Module Name: debounce
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounce(
    input clk_fpga,
    input Play,
    output delivery
    );
    
    wire Q1;
    wire Q2;
    wire Q2_bar;
    
   // Slow_Clock_4Hz CG0_0(clk_fpga, clk_4Hz);
    D_FF_1 CG0_1(clk_fpga, Play, Q1);
    D_FF_2 CG0_2(clk_fpga, Q1, Q2);
    
    
    assign Q2_bar = ~Q2;
    
    assign delivery = Q1 & Q2_bar;

endmodule

module D_FF_1(
    input clk_fpga,
    input Play,
    output reg Q1
    );
    
    always @ (posedge clk_fpga) begin
        Q1 <= Play;
    end
     
endmodule

module D_FF_2(
    input clk_fpga,
    input Q1,
    output reg Q2
    );
    
    always @ (posedge clk_fpga) begin
        Q2 <= Q1;
    end
     
endmodule

//module Slow_Clock_4Hz(
      // input clk_fpga,
    //   output reg clk_4Hz  
//);
       //reg [25:0] count=0;
       
        
       //always @(posedge clk_fpga) begin 
       //count<=count+1;
       //if(count==12_500_000)
       //begin
       //count<=0;
       //clk_4Hz = ~clk_4Hz;
      // end 
   //end
//endmodule
