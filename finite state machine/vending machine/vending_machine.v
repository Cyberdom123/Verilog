`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 11:02:27
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    output drink,
    output coin_1_o, // 1 * 10gr
    output coin_2_o, // 2 * 10gr
    output coin_5_o, // 5 * 10gr
    output coin_10_o,// 10* 10gr
    output coin_20_o,// 20* 10gr 
    output coin_50_o,// 50* 10gr
    input clk,
    input coin_1, // 1 * 10gr
    input coin_2, // 2 * 10gr
    input coin_5, // 5 * 10gr
    input coin_10,// 10* 10gr
    input coin_20,// 20* 10gr 
    input coin_50 // 50* 10gr
    );
    
    reg drink_reg;
    reg [7:0] cost;
    reg [7:0] money;
    
    reg coin_1_reg_o;
    reg coin_2_reg_o;
    reg coin_5_reg_o;
    reg coin_10_reg_o;
    reg coin_20_reg_o;
    reg coin_50_reg_o;
    
    parameter MODE_ACCEPT = 2'b00;
    parameter MODE_DRINK =  2'b01;
    parameter MODE_CHANGE = 2'b10;
    reg [1:0] state, next_state;
    
    assign drink = drink_reg;
    assign coin_1_o = coin_1_reg_o;
    assign coin_2_o = coin_2_reg_o;
    assign coin_5_o = coin_5_reg_o;
    assign coin_10_o= coin_10_reg_o;
    assign coin_20_o= coin_20_reg_o;
    assign coin_50_o= coin_50_reg_o;
  
initial begin
    cost = 37;
    money = 0;
    drink_reg = 0;
    coin_1_reg_o  = 0;
    coin_2_reg_o  = 0;
    coin_5_reg_o  = 0;
    coin_10_reg_o = 0;
    coin_20_reg_o = 0;
    coin_50_reg_o = 0;
    state = MODE_ACCEPT;
    next_state = MODE_ACCEPT;
end

always@(negedge clk) begin
    state <= next_state;
end
always@(posedge clk) begin
    case (state)
    MODE_ACCEPT: begin
        if (coin_1 == 1)
            money = money + 1;
        if (coin_2 == 1)
            money = money + 2;
        if (coin_5 == 1)
            money = money + 5;
        if (coin_10 == 1)
            money = money + 10;
        if (coin_20 == 1)
            money = money + 20;
        if (coin_50 == 1)
            money = money + 50;
            
        if (money >= cost) begin
            next_state = MODE_DRINK;
        end
    end
    
    
    MODE_DRINK: begin
        drink_reg = 1;
        money = money - cost;
        next_state = MODE_CHANGE;
    end
    
    MODE_CHANGE: begin
        drink_reg = 0;
        coin_1_reg_o  = 0;
        coin_2_reg_o  = 0;
        coin_5_reg_o  = 0;
        coin_10_reg_o = 0;
        coin_20_reg_o = 0;
        coin_50_reg_o = 0;
            if (money > 0) begin
               if (money >= 50) begin
                    coin_50_reg_o = 1;
                    money = money - 50;
               end
               else if(money >= 20) begin
                    coin_20_reg_o = 1;
                    money = money - 20;
               end
               else if(money >= 10) begin
                    coin_10_reg_o = 1;
                    money = money - 10;
               end           
               else if(money >= 5) begin
                    coin_5_reg_o = 1;
                    money = money - 5;
               end
               else if(money >= 2) begin
                    coin_2_reg_o = 1;
                    money = money - 2;  
               end
               else if(money >= 1) begin
                    coin_1_reg_o = 1;
                    money = money - 1;  
               end
            end
            
            else
                next_state = MODE_ACCEPT;
    end
    
    endcase
end
endmodule
