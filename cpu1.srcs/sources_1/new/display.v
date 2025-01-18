`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 22:03:01
// Design Name: 
// Module Name: display
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


module display(clk,cnt,cnt_out,an,seg);
    input clk;
    input [3:0] cnt;
    input [7:0] cnt_out;
    output reg [3:0] an;
    output reg [7:0] seg;
    reg [31:0] ji;
    reg divclk;
    reg [7:0] shu[9:0];
    initial begin
        ji=0;
        divclk=0;
        shu[0]=8'b00000011;
        shu[1]=8'b10011111;
        shu[2]=8'b00100101;
        shu[3]=8'b00001101;
        shu[4]=8'b10011001;
        shu[5]=8'b01001001;
        shu[6]=8'b01000001;
        shu[7]=8'b00011111;
        shu[8]=8'b00000001;
        shu[9]=8'b00001001;
        an=4'b0111;
    end
    always @ (posedge clk)
        if(ji==2500) begin
            ji=0;
            divclk=~divclk;
        end
        else ji=ji+1;
    always @ (posedge divclk) begin
        case(an)
        4'b0111: begin
            an=4'b1011;
            seg=shu[0];
        end
        4'b1011: begin
            an=4'b1101;
            seg=shu[cnt_out[7:4]];
        end
        4'b1101: begin
            an=4'b1110;
            seg=shu[cnt_out[3:0]];
        end
        4'b1110: begin
            an=4'b0111;
            seg=shu[cnt+1];
        end
        endcase
    end
endmodule
