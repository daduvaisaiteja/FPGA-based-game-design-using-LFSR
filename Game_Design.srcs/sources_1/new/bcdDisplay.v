`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 13:52:27
// Design Name: 
// Module Name: bcdDisplay
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


module bcdDisplay(
    input clk_fpga,
    input [7:0] binaryRuns,
    input [3:0] binaryWickets,
    input inningOver,
    input gameOver,
    input winner,
    output  [3:0] an,
    output dp,
    output [6:0] seg
    );
    
    wire clk_1kHz;
    wire [3:0] mux_out;
    wire [1:0] counter_out;
    wire [3:0] wickets,ones,tens,hundreds;
    
    binary_to_BCD CG2_1(binaryRuns,binaryWickets,inningOver,gameOver,winner,wickets,ones,tens,hundreds);
    
    slowClock_1kHz CG2_2(clk_fpga, clk_1kHz);
    
    two_bit_counter CG2_3(clk_1kHz, counter_out);
    
    decoder2to4 CG2_4(counter_out, dp, an);
    
    mux4to1 CG2_5(counter_out,wickets,ones,tens,hundreds,mux_out);
    
    
    bcd7seg CG2_6(mux_out,seg);
    
endmodule
