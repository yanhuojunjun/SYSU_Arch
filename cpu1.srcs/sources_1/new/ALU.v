`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/13 16:54:10
// Design Name: 
// Module Name: ALU
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


module ALU(aluin1,aluin2,shamt,alucontrol,result);
    input [31:0] aluin1,aluin2;
    input [4:0] shamt;
    input [3:0] alucontrol;
    output reg [31:0] result;
    always @ (aluin1,aluin2,alucontrol)begin
        case(alucontrol)
        4'b0010:result=aluin1+aluin2;//+
        4'b0110:result=aluin1-aluin2;//-
        4'b0011:result=0;//«Â¡„
        4'b0000:result=0;
        4'b1000:result=aluin2<<shamt;//shift left
        4'b0111: begin    //slt
            result=aluin1-aluin2;
            result=result>>31;
        end
        endcase
    end
endmodule
