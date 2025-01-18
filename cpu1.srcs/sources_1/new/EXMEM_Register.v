`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 21:33:24
// Design Name: 
// Module Name: EXMEM_Register
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


module EXMEM_Register(clk,idex_memread,idex_memwrite,idex_readdata2,idex_memtoreg,idex_jal,idex_regwrite,idex_adder1_result,idex_pc,writereg,result,
exmem_memread,exmem_memwrite,exmem_readdata2,exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_writereg,exmem_result);
    input clk,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_regwrite;
    input [31:0] idex_adder1_result,idex_pc,idex_readdata2,result;
    input [4:0] writereg;
    output reg exmem_memread,exmem_memwrite,exmem_memtoreg,exmem_jal,exmem_regwrite;
    output reg [31:0] exmem_adder1_result,exmem_pc,exmem_readdata2,exmem_result;
    output reg [4:0] exmem_writereg;
    initial {exmem_memread,exmem_memwrite,exmem_readdata2,exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_writereg,exmem_result}=0;
    always @ (posedge clk)
        {exmem_memread,exmem_memwrite,exmem_readdata2,exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_writereg,exmem_result}=
        {idex_memread,idex_memwrite,idex_readdata2,idex_memtoreg,idex_jal,idex_regwrite,idex_adder1_result,idex_pc,writereg,result};
endmodule
