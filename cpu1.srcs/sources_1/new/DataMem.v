`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/13 18:09:45
// Design Name: 
// Module Name: DataMem
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


module DataMem(clk,adress,mem_writedata,memwrite,memread,cnt,readdata,cnt_out);
    input [31:0] adress,mem_writedata;
    input clk,memwrite,memread;
    input [3:0] cnt;
    output reg [31:0] readdata;
    output reg [7:0] cnt_out;
    reg [31:0] mem [255:0];
    initial $readmemh("C:/Users/zxc/Desktop/vivado/mem/sort_data.txt",mem);
    always @ (adress,memread,clk)begin
        if(memread==1)readdata=mem[adress>>2];
    end
    always @ (posedge clk) begin
        if(memwrite==1)mem[adress>>2]=mem_writedata;
    end
    always @ (cnt) cnt_out=mem[cnt];
endmodule
