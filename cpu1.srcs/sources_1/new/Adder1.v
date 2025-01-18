`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/12 20:33:01
// Design Name: 
// Module Name: Adder1
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


module Adder
#(parameter width=32)
(a,b,out);
    input [width-1:0] a,b;
    output [width-1:0] out;
    assign out=a+b;
endmodule
