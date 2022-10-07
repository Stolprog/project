module GPS_test (
    );
    
    localparam N = 10;
    reg clk, reset_n;
    wire [1:N] Q;
   
    GPS #(.N(N)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );
    
    localparam T = 1000000/1023;
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