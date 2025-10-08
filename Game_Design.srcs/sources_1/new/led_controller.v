`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 12:51:51
// Design Name: 
// Module Name: led_controller
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


module led_controller(
    input clk_fpga,
    input reset,
    input teamSwitch,
    input delivery,
    input [3:0] lfsr_out,
    input inningOver,
    input gameOver,
    output reg [15:0] leds,
    output reg [6:0] team1Balls,
    output reg [6:0] team2Balls
    );
    
    wire [15:0] scroll;
    
    always @ (posedge clk_fpga, posedge reset) begin
        if (reset)
            begin
            leds <= 0;
            team1Balls <= 0;
            team2Balls <= 0;
            end
        else if(gameOver)
            leds <= scroll;
        else if(delivery)
           begin
           if((teamSwitch == 0) && (inningOver == 0))
            begin
            case (lfsr_out)
                13,14: team1Balls <= team1Balls;
                default: team1Balls <= team1Balls + 1;
            endcase
            leds <= team1Balls;
            end
        else if((teamSwitch) && (inningOver == 0))
            begin
            case (lfsr_out)
                13,14: team2Balls <= team2Balls;
                default: team2Balls <= team2Balls + 1;
            endcase
            leds <= team2Balls;
            end
        end
    else if(~teamSwitch)
        leds <= team1Balls;
    else
        leds <= team2Balls;
end
        
scroll_Leds CG1_4_1(clk_fpga, scroll);
            
endmodule
