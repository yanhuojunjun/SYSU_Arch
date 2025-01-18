`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 11:39:31
// Design Name: 
// Module Name: IDEX_Register
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


module IDEX_Register(clk,stop,regdst,regwrite,alusrc,memread,memwrite,memtoreg,jal,alucontrol,readdata1,readdata2,ifid_ins,ifid_adder1_result,ifid_pc,
idex_regdst,idex_regwrite,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_alucontrol,idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc);
    input clk,regdst,regwrite,alusrc,memread,memwrite,memtoreg,jal,stop;
    input [3:0] alucontrol;
    input [31:0] readdata1,readdata2,ifid_ins,ifid_adder1_result,ifid_pc;
    output reg idex_regdst,idex_regwrite,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal;
    output reg [3:0] idex_alucontrol;
    output reg [31:0] idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc;
    initial
        {idex_regdst,idex_regwrite,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_alucontrol,idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc}=0;
    always @ (posedge clk)
        if(stop!=1)
        {idex_regdst,idex_regwrite,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_alucontrol,idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc}
        ={regdst,regwrite,alusrc,memread,memwrite,memtoreg,jal,alucontrol,readdata1,readdata2,ifid_ins,ifid_adder1_result,ifid_pc};
        else {idex_regdst,idex_regwrite,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_alucontrol,idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc}=0;
endmodule
