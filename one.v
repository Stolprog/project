//`timescale 1ns / 1ps
////////////////////////////////////////////////
// ПСП ГЛОНАСС
// Задающий полином: x^9 + x^5 + 1; Длина: 511
////////////////////////////////////////////////
module Glonass
    #(parameter N = 9)(
    input clk,
    input reset_n, 
    output [1:N] Q
    );

    reg [1:N] Q_reg, Q_next;
    wire taps;
                        
    always @(posedge clk, negedge reset_n)
    begin 
        if (~reset_n)
            Q_reg <= 'd511; //9'b111111111
        else
        Q_reg <= Q_next;
    end
   
    always @(taps, Q_reg)
        Q_next = {taps, Q_reg[1:N-1]};
    
    assign Q = Q_reg[7];  
    assign taps = Q_reg[9] ^ Q_reg[5];

endmodule


