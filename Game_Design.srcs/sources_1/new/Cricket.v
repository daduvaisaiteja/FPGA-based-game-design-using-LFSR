`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 14:56:08
// Design Name: 
// Module Name: Cricket
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


module CricketGame_TopModule(
    input clk_fpga,
    input reset,
    input Play,
    input teamSwitch,
    output dp,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    
    wire delivery;
    wire [7:0] binaryRuns;
    wire [3:0] binaryWickets;
    wire inningOver;
    wire gameOver;
    wire winner;
    
    
    debounce CG0(clk_fpga, Play, delivery);
    
    CricketGame CG1(clk_fpga, reset, delivery, teamSwitch, binaryRuns, binaryWickets, led, inningOver, gameOver, winner);
    
    
    
    bcdDisplay CG2(clk_fpga,binaryRuns, binaryWickets, inningOver, gameOver, winner, an, dp, seg);
    
    
endmodule
