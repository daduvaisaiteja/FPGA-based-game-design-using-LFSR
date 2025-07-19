`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 12:30:08
// Design Name: 
// Module Name: score_comparator
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


module score_comparator(
    input clk_fpga,
    input reset,
    input  [11:0] team1Data,
    input  [11:0] team2Data,
    input  [6:0] team1Balls,
    input  [6:0] team2Balls,
    input  [3:0] binaryWickets,
    input  [15:0] balls,
    output reg inningOver,
    output reg gameOver,
    output reg winner
    );
    
    always @ (posedge clk_fpga) begin
        if((binaryWickets >= 10) | (balls >= 120))
            inningOver <= 1;
        else
            inningOver <= 0;
    end
    
    always @ (posedge clk_fpga, posedge reset) begin
        if (reset)
            gameOver <= 0;
        else if(((team1Data[3:0] >= 10) || (team1Balls >= 120)) && ((team2Data[3:0] >= 10) || (team2Balls >= 120)))
            gameOver <= 1;
        else
            gameOver <= gameOver;
    end
            
    always @ (posedge gameOver) begin
        if (team1Data[11:4] > team2Data[11:4])
            winner <= 0;
        else
             winner <= 1;
    end
  
endmodule
