`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2026 11:09:56 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb; 
    logic clk;
    logic rst;
    logic emer_1;
    logic emer_2;
    
    wire [2:0] LED_1;
    wire [2:0] LED_2;
    
    top_module uut (
        .clk(clk),
        .rst(rst),
        .emer_1(emer_1),
        .emer_2(emer_2),
        .LED_1(LED_1),
        .LED_2(LED_2)
    );
    
    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 0;
        emer_1 = 0;
        emer_2 = 0;
        
        #20; rst = 1;
        
        // NORMAL STATE
        #205;
        
        // EMER_1 STATE
        emer_1 = 1;
        #50 emer_1 = 0;
        
        // EMER_2 STATE
        #50 emer_2 = 1;
        #50 emer_2 = 0;
        
        // Test both EMER
        #50 emer_1 = 1; #10 emer_2 = 1;
        #50 emer_1 = 0; #10 emer_2 = 0;
        
        // Run default
        #500
        
        $finish;
    end
    
endmodule
