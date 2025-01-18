`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 12:02:53
// Design Name: 
// Module Name: compare
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


module compare(readdata1,readdata2,zero);
    input [31:0] readdata1,readdata2;
    output reg zero;
    always @ (readdata1,readdata2)
        if(readdata1==readdata2)zero=1;
        else zero=0;
endmodule
