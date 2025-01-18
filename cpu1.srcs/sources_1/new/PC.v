`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/12 20:39:49
// Design Name: 
// Module Name: PC
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
module PC(clk,stop,en,pcin,pc);
    input clk,en,stop;
    input [31:0] pcin;
    output reg [31:0] pc;
    initial pc<=0;
    always @ (posedge clk)
        if(en) begin
            if(stop!=1)
                pc<=pcin;
            else pc<=pc;
        end
endmodule
