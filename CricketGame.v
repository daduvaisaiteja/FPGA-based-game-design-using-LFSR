`timescale 1ns / 1ps

module CricketGame(
    input wire clk_fpga,
    input wire reset,
    input wire delivery,
    input wire teamSwitch,
    output reg [7:0] binaryRuns,
    output reg [3:0] binaryWickets,
    output reg [15:0] balls,
    output reg inningOver,
    output reg gameOver,
    output reg winner
    );
    
    wire [11:0] team1Data;
    wire [11:0] team2Data;
    wire [6:0] team1Balls;
    wire [6:0] team2Balls;
    wire [3:0] lfsr_out;
    
    
    lfsr CG1_1(clk_fpga, reset, lfsr_out);
    
    score_and_wickets CG1_2(clk_fpga, reset, delivery, teamSwitch, lfsr_out, gameOver, binaryRuns, binaryWickets, team1Data, team2Data);
    
    score_comparator CG1_3(clk_fpga, reset, team1Data, team2Data, team1Balls, team2Balls, binaryWickets, balls, inningOver, gameOver, winner);
       
endmodule

module lfsr(
    input clk_fpga,
    input reset,
    output [3:0] LFSR_RANDOM_NUMBER
    );
    
    reg [5:0] shift;
    wire xor_sum;
    assign xor_sum = shift[1] ^ shift[4];
    
    always @ (posedge clk_fpga) begin
        if(reset)
            shift <= 6'b111111;
        else
            shift <= {xor_sum, shift[5:1]};
    end
        
    assign LFSR_RANDOM_NUMBER = shift[3:0];    

endmodule

//assign dotball = delivery & ((shift[3:0] == 3) | (shift[3:0] == 4) | (shift[3:0] == 5) | (shift[3:0] == 6));
//assign single = delivery & ((shift[3:0] == 3) | (shift[3:0] == 4) | (shift[3:0] == 5) | (shift[3:0] == 6));
//assign double = delivery & ((shift[3:0] == 7) | (shift[3:0] == 8) | (shift[3:0] == 9));
//assign triple = delivery & (shift[3:0] == 10);
//assign fours = delivery & (shift[3:0] == 11);
//assign sixes = delivery & (shift[3:0] == 12);
//assign wideball = delivery & (shift[3:0] == 13);
//assign noball = delivery & (shift[3:0] == 14);

//assign wicket = delivery & (shift[3:0] == 15);

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