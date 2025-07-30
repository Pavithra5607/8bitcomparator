
module tb_comparator_8bit;
    reg  [7:0] A, B;
    wire A_gt_B, A_eq_B, A_lt_B;

    comparator_8bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
      $dumpfile("comparator_8bit.vcd");
      $dumpvars;
        $display("Time\tA\tB\tA>B\tA==B\tA<B");
        $monitor("%0t\t%d\t%d\t%b\t%b\t%b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);

        A = 8'd100; B = 8'd50;  #10;  
        A = 8'd30;  B = 8'd30;  #10;  
        A = 8'd20;  B = 8'd40;  #10;  
        A = 8'd0;   B = 8'd0;   #10; 
        A = 8'd255; B = 8'd128; #10;  
        A = 8'd7;   B = 8'd200; #10;  

        $finish;
    end
endmodule