`timescale 1ns/1ps

module tb_majority3;
    reg a;
    reg b;
    reg c;
    wire y;

    integer i;
    reg expected;

    majority3 dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i[2:0];
            expected = (a + b + c) >= 2;
            #1;
            if (y !== expected) begin
                $display("majority3 failed for %b%b%b: expected %b got %b", a, b, c, expected, y);
                $finish(1);
            end
        end

        $display("majority3 passed");
        $finish(0);
    end
endmodule
