

module xor_nand (
    input wire A,
    input wire B, 
    output wire C
);
    // 1. Declare all internal signals as wires
    wire A_bar, B_bar, C1, C2, C1_bar, C2_bar;

    // 2. Correctly instantiate the sub-modules
    // Syntax: module_name instance_name (.port_name(wire_name), ...);
    nand_gate u_nand1 (.A(A),     .B(A),     .C(A_bar));
    nand_gate u_nand2 (.A(B),     .B(B),     .C(B_bar));
    nand_gate u_nand3 (.A(A),     .B(B_bar), .C(C1));
    nand_gate u_nand4 (.A(A_bar), .B(B),     .C(C2));
    //nand_gate u_nand5 (.A(C1),    .B(C1),    .C(C1_bar));
    //nand_gate u_nand6 (.A(C2),    .B(C2),    .C(C2_bar));
    nand_gate u_nand7 (.A(C1),.B(C2),.C(C));

endmodule

module nand_gate (
    input wire A,
    input wire B, 
    output wire C
);
    // 3. Added the missing semicolon here
    assign C = ~(A & B); 
endmodule

module xor_nand_tb;
    reg tb_A;
    reg tb_B;
    wire tb_C;

    xor_nand uut ( .A(tb_A), .B(tb_B), .C(tb_C));

    initial begin 
        $display("Time |A | B| Output C");
        tb_A = 1'b0; tb_B = 1'b0;
        #10
        $display("%40t | %b | %b |    %b ", $time, tb_A, tb_B, tb_C);

        tb_A = 1'b0; tb_B = 1'b1;
        #10
        $display("%40t | %b | %b |    %b ", $time, tb_A, tb_B, tb_C);

        tb_A = 1'b1; tb_B = 1'b0;
        #10
        $display("%40t | %b | %b |    %b ", $time, tb_A, tb_B, tb_C);

        tb_A = 1'b1; tb_B = 1'b1;
        #10
        $display("%40t | %b | %b |    %b ", $time, tb_A, tb_B, tb_C);

        
        $finish;
    end
endmodule 

