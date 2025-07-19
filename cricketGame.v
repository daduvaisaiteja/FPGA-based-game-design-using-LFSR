`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 13:33:07
// Design Name: 
// Module Name: CricketGame
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



module CricketGame(
    input clk_fpga,
    input reset,
    input delivery,
    input teamSwitch,
    output  [7:0] binaryRuns,
    output  [3:0] binaryWickets,
    output  [15:0] leds,
    output inningOver,
    output gameOver,
    output winner
    );
    
    wire [11:0] team1Data;
    wire [11:0] team2Data;
    wire [6:0] team1Balls;
    wire [6:0] team2Balls;
    wire [3:0] lfsr_out;
    
    
    lfsr CG1_1(clk_fpga, reset, lfsr_out);
    
    score_and_wickets CG1_2(clk_fpga, reset, delivery, teamSwitch, lfsr_out, gameOver, binaryRuns, binaryWickets, team1Data, team2Data);
    
    score_comparator CG1_3(clk_fpga, reset, team1Data, team2Data, team1Balls, team2Balls, binaryWickets, leds, inningOver, gameOver, winner);
     
    led_controller CG1_4(clk_fpga, reset, teamSwitch,delivery, lfsr_out, inningOver, gameOver, leds, team1Balls, team2Balls );
      
endmodule
