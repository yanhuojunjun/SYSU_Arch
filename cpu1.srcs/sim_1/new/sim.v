`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/12 20:58:34
// Design Name: 
// Module Name: sim
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


module sim();
    reg clk,en;
    wire [15:0] q;
    CPU ucpu(clk,en,q);
    initial begin
        clk=1;
        en=0;
        #0.1
        en=1;
    end
    always #3 clk=~clk;
    
endmodule
