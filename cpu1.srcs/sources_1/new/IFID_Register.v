`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 10:27:58
// Design Name: 
// Module Name: IFID_Register
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


module IFID_Register(clk,zhuan,stop,adder1_result,ins,pc,ifid_adder1_result,ifid_ins,ifid_pc);
    input clk,zhuan,stop;
    input [31:0] adder1_result,ins,pc;
    output reg [31:0] ifid_adder1_result,ifid_ins,ifid_pc;
    initial {ifid_adder1_result,ifid_ins,ifid_pc}=0;
    always @ (posedge clk)
        if(stop!=1) begin
            if(zhuan){ifid_adder1_result,ifid_ins,ifid_pc}=0;
            else {ifid_adder1_result,ifid_ins,ifid_pc}={adder1_result,ins,pc};
        end
        else {ifid_adder1_result,ifid_ins,ifid_pc}={ifid_adder1_result,ifid_ins,ifid_pc};
endmodule
