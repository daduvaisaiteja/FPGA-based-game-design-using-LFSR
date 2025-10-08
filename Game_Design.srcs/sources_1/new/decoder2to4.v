`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 14:31:18
// Design Name: 
// Module Name: decoder2to4
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


module decoder2to4(
    input [1:0] counter_out,
    output reg dp,
    output reg [3:0] an
    );
    
    
    always@(counter_out) begin
        case (counter_out)
            0:  begin
                an = 4'b1110;
                dp = 1'b1;
                end
            1:  begin
                an = 4'b1101;
                dp = 1'b0;
                end
            2:  begin
                an = 4'b1011;
                dp = 1'b1;
                end
            3:  begin
                an = 4'b0111;
                dp = 1'b1;
                end
            endcase
        end 
                
endmodule


module mux4to1(
    input [1:0] counter_out,
    input [3:0] wickets,ones,tens,hundreds,
    output [3:0] mux_out
);


assign mux_out = (counter_out==0)?wickets : (counter_out==1)?ones : (counter_out==2)?tens : hundreds;

endmodule