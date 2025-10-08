`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 14:43:01
// Design Name: 
// Module Name: bcd7seg
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


module bcd7seg(
    input [3:0] mux_out,
    output reg [6:0] segs
    );
    
   always @ (mux_out) begin
        case (mux_out)
            //0: segs = 7'b100_0000; //0
            0: segs = 7'b100_0000;
            //1: segs = 7'b111_1001; //1
            1: segs = 7'b111_1001;
            //2: segs = 7'b010_0100; //2
            2: segs = 7'b010_0100;
            //3: segs = 7'b011_0000; //3
            3: segs = 7'b011_0000;
            //4: segs = 7'b001_1001; //4
            4: segs = 7'b001_1001;
            //5: segs = 7'b001_0010; //5
            5: segs = 7'b001_0010;
            //6: segs = 7'b000_0010; //6
            6: segs = 7'b000_0010;
            //7: segs = 7'b111_1000; //7
            7: segs = 7'b111_1000;
            //8: segs = 7'b000_0000; //8
            8: segs = 7'b000_00000;
            //9: segs = 7'b001_0000; //9
            9: segs = 7'b001_0000;
            //10: segs = 7'b000_1000; //A
            10: segs = 7'b000_1000;
            //11: segs = 7'b000_0011; //B
            11: segs = 7'b000_0011;
            
           // 12: segs = 7'b101_1111; //'
            12: segs = 7'b0000010;
            //13: segs = 7'b100_1111; //I
            13: segs = 7'b0000110;
            //14: segs = 7'b111_1101; //'
            14: segs = 7'b0010000;
            //15: segs = 7'b000_0111; //t
            15: segs = 7'b1000111;
        endcase
    end
             
endmodule
