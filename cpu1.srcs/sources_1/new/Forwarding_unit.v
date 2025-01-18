`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 12:08:57
// Design Name: 
// Module Name: Forwarding_unit
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


module Forwarding_unit(rs,rt,writereg1,regwrite1,writereg2,regwrite2,forwardrs,forwardrt);
    input [4:0] rs,rt,writereg1,writereg2;
    input regwrite1,regwrite2;
    output reg [1:0] forwardrs,forwardrt;
    initial begin
        forwardrs=0;
        forwardrt=0;
    end
    always @ (*) begin
        forwardrs=0;
        forwardrt=0;
        if(regwrite2==1 && writereg2!=0) begin
            if(writereg2==rs) forwardrs=2'b10;
            if(writereg2==rt) forwardrt=2'b10;
        end
        if(regwrite1==1 && writereg1!=0) begin
            if(writereg1==rs) forwardrs=2'b01;
            if(writereg1==rt) forwardrt=2'b01;
        end
    end
endmodule
