`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/12 20:45:22
// Design Name: 
// Module Name: InsMem
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


module InsMem(pc,ins);
    input [31:0] pc;
    output reg [31:0] ins;
    reg [31:0] mem [255:0];//存储器内容，每条指令32位，共可存储256个指令
    initial $readmemh("C:/Users/zxc/Desktop/vivado/mem/sort.txt",mem);
    always @ (pc) ins=mem[pc>>2];
endmodule
