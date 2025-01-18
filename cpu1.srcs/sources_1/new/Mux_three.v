`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 11:58:02
// Design Name: 
// Module Name: Mux_three
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


module Mux_three(d0,d1,d2,s,y);
    input [31:0] d0,d1,d2;
    input [1:0] s;
    output [31:0] y;
    assign y= s[1] ? d2:(s[0] ? d1:d0);
endmodule
