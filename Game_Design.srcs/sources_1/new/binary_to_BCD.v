`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 14:04:34
// Design Name: 
// Module Name: binary_to_BCD
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


module binary_to_BCD(
    input [7:0] binaryRuns,
    input [3:0] binaryWickets,
    input inningOver,
    input gameOver,
    input winner,
    output reg [3:0] wickets, ones, tens, hundreds
    );
    
    reg [7:0] data;
    
    always@(binaryRuns, binaryWickets, inningOver, gameOver, winner) begin
        if(~gameOver)
            begin
            if(inningOver)
                begin
                hundreds <= 4'b1111;
                tens <= 4'b1111;
                ones <= 4'b1111;
                wickets <= 4'b1111;
                end
            else
                begin
                data = binaryRuns;
                hundreds <= data / 100;
                data = data % 100;
                tens <= data / 10;
                ones <= data % 10;
                wickets <= (binaryWickets % 10);
                end
            end
        else
            begin
            case (winner)
            0:  begin
                hundreds <= 4'b0000;
                //hundreds <= 4'b1111;
                tens <= 4'b0000;
                //tens <= 4'b0000;
                ones <= 4'b0001;
                //ones <= 4'b0001;
                wickets <= 4'b0000;
                //wickets <= 4'b0000;
                end
            1:  begin
                hundreds <= 4'b0000;
                // hundreds <= 4'b1111;
                tens <= 4'b0000;
                //tens <= 4'b0000;
                ones <= 4'b0010;
                //ones <= 4'b0010;
                wickets <= 4'b0000;
                //wickets <= 4'b0000;
                end
            endcase
            end 
        end
    endmodule

