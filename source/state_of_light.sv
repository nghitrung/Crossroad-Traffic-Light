`timescale 1ns / 1ps

typedef enum logic [1:0] {
    NORMAL = 2'b00,
    EMER_1 = 2'b01,
    EMER_2 = 2'b10
} state_t;

module state_of_light(
    input logic clk,
    input logic rst,
    input logic emer_1, 
    input logic emer_2,
    output state_t state_signal
);

    state_t state, next_state;
    
    // using always_ff for sequential logic
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) state <= NORMAL;
        else     state <= next_state;
    end
    
    // using always_comb for combinational logic 
    always_comb begin
        case (state)
            NORMAL: begin 
                if (emer_1)      next_state = EMER_1;
                else if (emer_2) next_state = EMER_2;
                else             next_state = NORMAL;
            end
            
            EMER_1: next_state = emer_1 ? EMER_1 : NORMAL;
            EMER_2: next_state = emer_2 ? EMER_2 : NORMAL;
            default: next_state = NORMAL;
        endcase
    end
    
    assign state_signal = state;
endmodule
