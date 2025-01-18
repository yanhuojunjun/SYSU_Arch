`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/30 10:15:33
// Design Name: 
// Module Name: increase
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


module increase(button_l,cnt);
    input button_l;
    output reg [3:0] cnt;
    initial cnt=0;
    always @ (posedge button_l)
        if(cnt==7)cnt=0;
        else cnt=cnt+1;
endmodule
