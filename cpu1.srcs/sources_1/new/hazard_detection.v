`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/11 10:25:43
// Design Name: 
// Module Name: hazard_detection
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


module Hazard_detection(rs,rt,rd,write,stop,lw);
    input [4:0] rs,rt,rd;
    input write,lw;
    output reg stop;
    initial stop=0;
    always @ (*) begin
        stop=0;
        if(write==1&&(rd==rs||(rd==rt&&lw==0)))stop=1;
    end
endmodule
