`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 17:43:05
// Design Name: 
// Module Name: zhuanyi
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


module zhuanyi(branchcontrol,jump,jr,zhuan);
    input branchcontrol,jump,jr;
    output reg zhuan;
    initial zhuan=0;
    always @ (*) zhuan=branchcontrol|jump|jr;
endmodule
