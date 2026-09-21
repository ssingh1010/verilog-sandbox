`timescale 1ns/1ps

module tb_popcount3;
    reg [2:0] in;
    wire [1:0] count;

    integer i;
    reg [1:0] expected;

    popcount3 dut (
        .in(in),
        .count(count)
    );

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            in = i[2:0];
            expected = in[0] + in[1] + in[2];
            #1;
            if (count !== expected) begin
                $display("popcount3 failed for %b: expected %0d got %0d", in, expected, count);
                $finish(1);
            end
        end

        $display("popcount3 passed");
        $finish(0);
    end
endmodule
