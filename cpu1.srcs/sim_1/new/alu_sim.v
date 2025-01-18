`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/13 17:08:27
// Design Name: 
// Module Name: alu_sim
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


module alu_sim();
    wire [31:0] y1,y2,y3,y4;
    wire zero1,zero2,zero3,zero4;
    ALU alu1(5,9,4'b0010,y1,zero1);
    ALU alu2(34,32,4'b0110,y2,zero2);
    ALU alu3(12,12,4'b0110,y3,zero3);
    ALU alu4(5,14,4'b0011,y4,zero4);
endmodule
