`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/13 11:16:02
// Design Name: 
// Module Name: Control
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


module Control(ins,regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr);
    input [31:0] ins;
    output reg regdst,regwrite,alusrc,memread,memwrite,memtoreg,jump,branch,bne,jal,jr;
    output reg [2:0] aluop;
    wire [5:0] opcode,func;
    assign opcode=ins[31:26];
    assign func=ins[5:0];
    always @ (ins) begin
        case(opcode)
        6'b000000://add sub addu sll slt jr
            if(func==6'b001000)//jr
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b00001000000001; 
            else   
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b11001000000000;
        6'b101011://sw
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b00100001000000;
        6'b100011://lw
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b01100010100000;
        6'b001000://addi
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b01100000000000;
        6'b000100://beq
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b00000100001000;
        6'b000010://j
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b00001100010000;
        6'b001001://addiu
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b01100000000000;
        6'b001010://slti
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b01110000000000;
        6'b000101://bne
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b00000100001100;
        6'b000011://jal
            {regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr}=14'b01001100010010;
        endcase
    end
endmodule
