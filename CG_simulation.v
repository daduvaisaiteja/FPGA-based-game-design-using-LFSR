`timescale 1ns / 1ps



module CG_simulation();
  reg delivery;
  reg clk_fpga;
  reg teamSwitch;
  reg reset;
  wire [7:0] binaryRuns;
  wire [3:0] binaryWickets;
  wire [15:0] balls;
  wire gameOver;
  wire inningOver;
  wire winner;
 

CricketGame uut(.clk_fpga(clk_fpga), .delivery(delivery), .teamSwitch(teamSwitch), .reset(reset), .binaryRuns(binaryRuns), .balls(balls), .gameOver(gameOver), .inningOver(inningOver), .winner(winner));
    
    localparam dotball = 8;
    localparam single = 16;
    localparam double = 32;
    localparam triple = 48;
    localparam four = 64;
    localparam six = 96;
    localparam noball = 97;
    
always @(posedge clk_fpga)begin
    
        assign dotball = delivery & ((shift[3:0] == 3) | (shift[3:0] == 4) | (shift[3:0] == 5) | (shift[3:0] == 6));
        assign single = delivery & ((shift[3:0] == 3) | (shift[3:0] == 4) | (shift[3:0] == 5) | (shift[3:0] == 6));
        assign double = delivery & ((shift[3:0] == 7) | (shift[3:0] == 8) | (shift[3:0] == 9));
        assign triple = delivery & (shift[3:0] == 10);
        assign fours = delivery & (shift[3:0] == 11);
        assign sixes = delivery & (shift[3:0] == 12);
        assign wideball = delivery & (shift[3:0] == 13);
        assign noball = delivery & (shift[3:0] == 14);
        assign wicket = delivery & (shift[3:0] == 15);
    
    end
  


endmodule
