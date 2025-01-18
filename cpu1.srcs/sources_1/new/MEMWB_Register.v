`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 22:07:25
// Design Name: 
// Module Name: MEMWB_Register
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


module MEMWB_Register(clk,exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_result,readdata,exmem_writereg,reg_writedata,reg_writedata_1,
memwb_memtoreg,memwb_jal,memwb_regwrite,memwb_adder1_result,memwb_pc,memwb_result,memwb_readdata,memwb_writereg,memwb_reg_writedata,memwb_reg_writedata_1);
    input clk,exmem_memtoreg,exmem_jal,exmem_regwrite;
    input [31:0] exmem_adder1_result,exmem_pc,exmem_result,readdata,reg_writedata,reg_writedata_1;
    input [4:0] exmem_writereg;
    output reg memwb_memtoreg,memwb_jal,memwb_regwrite;
    output reg [31:0] memwb_adder1_result,memwb_pc,memwb_result,memwb_readdata,memwb_reg_writedata,memwb_reg_writedata_1;
    output reg [4:0] memwb_writereg;
    initial {memwb_memtoreg,memwb_jal,memwb_regwrite,memwb_adder1_result,memwb_pc,memwb_result,memwb_readdata,memwb_writereg,memwb_reg_writedata,memwb_reg_writedata_1}=0;
    always @ (posedge clk)
        {memwb_memtoreg,memwb_jal,memwb_regwrite,memwb_adder1_result,memwb_pc,memwb_result,memwb_readdata,memwb_writereg,memwb_reg_writedata,memwb_reg_writedata_1}=
        {exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_result,readdata,exmem_writereg,reg_writedata,reg_writedata_1};
endmodule
