`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2025 13:17:55
// Design Name: 
// Module Name: scroll_Leds
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


module scroll_Leds(
    input clk_fpga,
    output reg [15:0] leds
    );
    
    wire clk_10Hz;
    
    
    always @ (posedge clk_10Hz) begin
        if (leds == 16'hffff)
            leds <= 16'hfffe;
        else
            leds <= {leds[14:0], 1'b1};
    end 
            
    slowClock_10Hz CG1_4_1_1(clk_fpga, clk_10Hz);
            
endmodule

module slowClock_10Hz(
input clk_fpga,
output reg clk_10Hz
);

localparam clkdiv = 5_000_000 - 1;
reg [22:0] period_count = 0;

always @ (posedge clk_fpga) begin
if (period_count == clkdiv)
    begin
    period_count <= 0;
    clk_10Hz <= ~clk_10Hz;
    end
else
    begin
    period_count <= period_count + 1'b1;
    clk_10Hz <= clk_10Hz;
    end
end
endmodule
