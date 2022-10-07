//`timescale 1ns / 1ps
////////////////////////////////////////////////
// ��� ������� testbench
// �������� �������: x^9 + x^5 + 1; �����: 511
////////////////////////////////////////////////

module Glonass_test (
    );
    
    localparam N = 9;
    reg clk, reset_n;
    wire [1:N] Q;
    
    Glonass #(.N(N)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );
    
    localparam T = 1000000/511;
    always
    begin
        clk = 1'b1;
        #(T / 2);
        clk = 1'b0;
        #(T / 2);
     end
    
    initial
    begin
        reset_n = 1'b0;
        #2
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        wait (Q == 1);
        
        #20 $stop;
    end

endmodule 