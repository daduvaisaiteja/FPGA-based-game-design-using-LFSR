`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 14:12:36
// Design Name: 
// Module Name: score_and_wickets
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


module score_and_wickets(
    input clk_fpga,
    input reset,
    input delivery,
    input teamSwitch,
    input [3:0] lfsr_out,
    input gameOver,
    output reg [7:0] binaryRuns,
    output reg [3:0] binaryWickets,
    output reg [11:0] team1Data,
    output reg [11:0] team2Data
    );
    
    localparam single = 16;
    localparam double = 32;
    localparam triple = 48;
    localparam four = 64;
    localparam six = 96;
    
    
    always @ (posedge clk_fpga, posedge reset) begin
        if (reset)
            begin
            binaryRuns <= 0;
            binaryWickets <=0;
            team1Data <= 0;
            team2Data <= 0;
            end
         else if (gameOver)
                begin
                binaryRuns <= binaryRuns;
                binaryWickets <= binaryWickets;
                team1Data <= team1Data;
                team2Data <= team2Data;
                end
         else if(delivery) 
            begin
            if((~teamSwitch) && (binaryWickets < 10))
                begin
                case (lfsr_out)
                    0,1,2: team1Data <= team1Data;
                    3,4,5,6: team1Data <= team1Data + single;
                    7,8,9: team1Data <= team1Data + double;
                    10: team1Data <= team1Data + triple;
                    11: team1Data <= team1Data + four;
                    12: team1Data <= team1Data + six;
                    13,14: team1Data <= team1Data;
                    15: team1Data <= team1Data + 1;
                endcase
                binaryRuns <= team1Data[11:4];
                binaryWickets <= team1Data[3:0];
                end
            else if ((teamSwitch) && (binaryWickets < 10))
                begin
                case (lfsr_out)
                    0,1,2: team2Data <= team2Data;
                    3,4,5,6: team2Data <= team2Data + single;
                    7,8,9: team2Data <= team2Data + double;
                    10: team2Data <= team2Data + triple;
                    11: team2Data <= team2Data + four;
                    12: team2Data <= team2Data + six;
                    13,14: team2Data <= team2Data;
                    15: team2Data <= team2Data + 1;
                endcase
                binaryRuns <= team2Data[11:4];
                binaryWickets <= team2Data[3:0];
            end
        end
    else
        begin
        case (teamSwitch)
    0:  begin
        binaryRuns <= team1Data[11:4]; 
        binaryWickets <= team1Data[3:0];
        end
    1:  begin
        binaryRuns <= team2Data[11:4];
        binaryWickets <= team2Data[3:0];
        end
    endcase
    end
end

endmodule
    
          
               
             
                 
