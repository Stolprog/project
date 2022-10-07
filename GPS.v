module GPS
    #(parameter N = 10)(
    input clk,
    input reset_n, 
    output [1:N] Q
    );

    reg [1:N] Q_reg, Q_next, Q2_reg, Q2_next;
    wire taps;
    wire taps2;  
                     
    always @(posedge clk, negedge reset_n)
    begin 
       if (~reset_n)
           Q_reg <= 'd1023; //10'b1111111111
       else
           Q_reg <= Q_next;
    ///
       if (~reset_n)
            Q2_reg <= 'd1023; //10'b1111111111
       else
            Q2_reg <= Q2_next;
    end

    always @(taps, Q_reg)
        Q_next = {taps, Q_reg[1:N-1]};
    ///
    always @(taps2, Q2_reg)
        Q2_next = {taps2, Q2_reg[1:N-1]};

    assign Q = Q_reg[8] ^  Q2_reg[8];  
    assign taps = Q_reg[10] ^ Q_reg[3];
    assign taps2 = Q2_reg[10] ^ Q2_reg[9]^ Q2_reg[8]^ Q2_reg[6]^ Q2_reg[3]^ Q2_reg[2];
endmodule

