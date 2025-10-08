`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 14:19:39
// Design Name: 
// Module Name: slowClock_1kHz
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


module slowClock_1kHz(
    input clk_fpga,
    output reg clk_1kHz
    );
    
    localparam clkdiv = 50_000 - 1;
    reg [15:0] period_count = 0;
    
    
    always@(posedge clk_fpga) begin
        if (period_count == clkdiv)
            begin
            period_count <= 0;
            clk_1kHz <= ~clk_1kHz;
            end
        else
            begin
            period_count <= period_count + 1'b1;
            clk_1kHz <= clk_1kHz;
        end
    end
endmodule


module two_bit_counter(
    input clk_1KHz,
    output reg [1:0] counter_out
    );
    
   
   
   
    always @ (posedge clk_1KHz) begin
        counter_out <= counter_out + 1'b1;
    end
               
endmodule
