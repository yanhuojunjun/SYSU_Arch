`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/13 16:44:21
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(aluop,func,alucontrol);
    input [2:0] aluop;
    input [5:0] func;
    output reg [3:0] alucontrol;
    always @ (aluop,func) begin
        case(aluop)
        3'b000: alucontrol=4'b0010;  //lw sw addi
        3'b001: alucontrol=4'b0110;  //beq
        3'b010: begin ///R
            case(func)
            6'b100000:alucontrol=4'b0010;
            6'b100001:alucontrol=4'b0010;
            6'b100010:alucontrol=4'b0110;
            6'b000000:alucontrol=4'b1000;
            6'b101010:alucontrol=4'b0111;
            6'b001000:alucontrol=4'b0011;
            endcase
        end
        3'b011:alucontrol=4'b0011; //jump
        3'b100:alucontrol=4'b0111; //slti
        endcase    
    end
endmodule
