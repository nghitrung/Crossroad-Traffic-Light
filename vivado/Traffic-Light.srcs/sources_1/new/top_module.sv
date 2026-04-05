`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2026 10:34:48 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input logic clk,
    input logic rst,
    input logic emer_1,
    input logic emer_2,
    output logic [2:0] LED_1,
    output logic [2:0] LED_2
);

    state_t curr_state;
    logic [4:0] timer1, timer2;
    
    state_of_light SOL (
        .clk(clk),
        .rst(rst),
        .emer_1(emer_1),
        .emer_2(emer_2),
        .state_signal(curr_state)
    );
    
    // LED 1 (Green -> Yellow -> Red)
    traffic_light #(.light_num(1'b1)) TFL1(
        .clk(clk),
        .rst(rst),
        .curr_state(curr_state),
        .timer(timer1),
        .led(LED_1)
    );
    
    traffic_light #(.light_num(1'b0)) TFL2(
        .clk(clk),
        .rst(rst),
        .curr_state(curr_state),
        .timer(timer2),
        .led(LED_2)
    );
    
endmodule
