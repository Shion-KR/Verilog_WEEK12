`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/19 05:11:50
// Design Name: 
// Module Name: LCD_cursor_tb
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


module LCD_cursor_tb();

reg rst, clk;
reg [9:0] number_btn;
reg [1:0] control_btn;
wire LCD_E, LCD_RS, LCD_RW;
wire [7:0] LCD_DATA;
wire [7:0] LED_out;

LCD_cursor u(rst, clk, LCD_E, LCD_RS, LCD_RW, LCD_DATA, LED_out, number_btn, control_btn);

always
    #0.5 clk = ~clk;

initial begin
        clk = 0; rst = 0; control_btn = 2'b00; number_btn = 10'b0000_0000_01; // default
    #20 rst = 1;
    #20 number_btn = 10'b0010_0000_00; // 3
    #20 number_btn = 10'b0000_0001_00; // 8
    #20 control_btn = 2'b10; // LEFT
    #20 control_btn = 2'b01; // RIGHT
    $finish;
end      

endmodule
