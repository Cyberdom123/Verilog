`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 18:28:45
// Design Name: 
// Module Name: rotating_doors
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


module rotating_doors(
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    input clk,
    input nearby,
    input inside,
    input stuck
    );
    
    reg [7:0] num;
    reg [7:0] num_increment;
    reg [7:0] num_decrement;
    reg [2:0] state;
    reg [2:0] next_state;
    reg a_r, b_r, c_r, d_r, e_r, f_r;
    assign a = a_r;
    assign b = b_r;
    assign c = c_r;
    assign d = d_r;
    assign e = e_r;
    assign f = f_r;
        
    parameter MODE_NORMAL = 2'b00;
    parameter MODE_NEARBY = 2'b01;
    parameter MODE_INSIDE = 2'b10;
    parameter MODE_STUCK  = 2'b11;
    
    initial begin
        num = 0;
        num_increment = 0;
        num_decrement = 0;
        a_r = 0;
        b_r = 0;
        c_r = 0;
        d_r = 0;
        e_r = 0;
        f_r = 0;
        state = MODE_NORMAL;
        next_state = MODE_NORMAL;
    end
    
    always@(negedge clk) begin
        if (num >= 0 & num < 10) begin
            a_r = 0; b_r = 1; c_r = 1; d_r = 1; e_r = 1; f_r = 1;
        end
        else if (num >= 10 & num < 20) begin
            a_r = 1; b_r = 0; c_r = 1; d_r = 1; e_r = 1; f_r = 1;
        end     
        else if (num >= 20 & num < 30) begin
            a_r = 1; b_r = 1; c_r = 0; d_r = 1; e_r = 1; f_r = 1;
        end   
        else if (num >= 30 & num < 40) begin
            a_r = 1; b_r = 1; c_r = 1; d_r = 0; e_r = 1; f_r = 1;
        end 
        else if (num >= 40 & num < 50) begin
            a_r = 1; b_r = 1; c_r = 1; d_r = 1; e_r = 0; f_r = 1;
        end    
        else if (num >= 50 & num < 60) begin
            a_r = 1; b_r = 1; c_r = 1; d_r = 1; e_r = 1; f_r = 0;
        end
        if (num >= 60)
            num_decrement = 60;
        else 
            num_decrement = 0;
    end
    
    always@(negedge clk) begin
        state <= next_state;
    end
    
    always@(posedge clk) begin
    num = num + num_increment;
    num = num - num_decrement;
        case (state)
            MODE_NORMAL: begin
                num_increment = 3; 
                if (stuck)
                    next_state = MODE_STUCK;
                else if (nearby)
                    next_state = MODE_NEARBY;
                else if (inside)
                    next_state = MODE_INSIDE;
            end
            
            MODE_NEARBY: begin
                num_increment = 1;
                if (stuck)
                    next_state = MODE_STUCK;
                else if (nearby)
                    next_state = MODE_NEARBY;
                else if (inside)
                    next_state = MODE_INSIDE;
                else
                    next_state = MODE_NORMAL;                      
            end     

            MODE_INSIDE: begin
                num_increment = 2;
                if (stuck)
                    next_state = MODE_STUCK;
                else if (nearby)
                    next_state = MODE_NEARBY;
                else if (inside)
                    next_state = MODE_INSIDE;
                else
                    next_state = MODE_NORMAL;                      
            end 
            
            MODE_STUCK: begin
                num_increment =  0;
                if (stuck)
                    next_state = MODE_STUCK;
                else if (nearby)
                    next_state = MODE_NEARBY;
                else if (inside)
                    next_state = MODE_INSIDE;
                else
                    next_state = MODE_NORMAL;                      
            end                              
        endcase
    end
endmodule
