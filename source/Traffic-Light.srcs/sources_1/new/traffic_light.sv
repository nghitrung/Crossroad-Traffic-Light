`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2026 09:44:27 PM
// Design Name: 
// Module Name: traffic_light
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
typedef enum logic [2:0] {
    OFF =    3'b000,
    RED =    3'b001,
    GREEN =  3'b010,
    YELLOW = 3'b011
} color_t;

module traffic_light #(
    parameter bit light_num = 0, // 1 for light 1, 0 for light 2
    parameter logic [4:0] RED_DUTY = 6,
    parameter logic [4:0] GREEN_DUTY = 3,
    parameter logic [4:0] YELLOW_DUTY = 3 
)(

    input logic clk,
    input logic rst,
    input state_t curr_state,
    output logic [4:0] timer,
    output color_t led
);
    

    localparam logic [4:0] DUTY_CYCLE = RED_DUTY + GREEN_DUTY + YELLOW_DUTY; 
    
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) timer <= 0;
        else if (timer >= DUTY_CYCLE - 1) timer <= 0;
        else timer <= timer + 1;
    end
    
    always_comb begin
        if (curr_state == EMER_1) led = light_num ? RED : GREEN;
        else if (curr_state == EMER_2) led = light_num ? GREEN : RED;
        else begin 
        // light 1 GREEN -> YELLOW -> GREEN
            if (!light_num) begin
                if (timer < GREEN_DUTY) led = GREEN;
                else if (timer < (YELLOW_DUTY + GREEN_DUTY)) led = YELLOW;
                else led = RED;
            end else begin 
                if (timer < RED_DUTY) led = RED;
                else if (timer < (RED_DUTY + GREEN_DUTY)) led = GREEN;
                else led = YELLOW;
            end
        end
    end
endmodule
