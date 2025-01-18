`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/13 11:58:39
// Design Name: 
// Module Name: Registers
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


module Registers(clk,readreg1,readreg2,writereg,writedata,regwrite,readdata1,readdata2,ra);
    input clk;
    input [4:0] readreg1,readreg2,writereg;
    input [31:0] writedata;
    input regwrite;
    output [31:0] readdata1,readdata2;
    output wire [31:0] ra;
    reg [31:0] register [31:0];
    integer i;
    initial begin
        for(i=0;i<=31;i=i+1)
            register[i]=0;
    end
    assign  readdata1=register[readreg1];
    assign  readdata2=register[readreg2];
    always @ (negedge clk)begin
        if(regwrite==1&&writereg!=0)register[writereg]=writedata;
    end
    assign ra=register[31];//
endmodule
