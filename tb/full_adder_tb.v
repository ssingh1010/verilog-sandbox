`timescale 1ns/1ps

module full_adder_tb;
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;
    reg [1:0] expected;
    integer vector;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        for (vector = 0; vector < 8; vector = vector + 1) begin
            {a, b, cin} = vector[2:0];
            #1;

            expected = a + b + cin;

            if ({cout, sum} !== expected) begin
                $display(
                    "FAIL full_adder: a=%0d b=%0d cin=%0d expected=%b got=%b",
                    a,
                    b,
                    cin,
                    expected,
                    {cout, sum}
                );
                $finish(1);
            end
        end

        $display("PASS full_adder");
        $finish;
    end
endmodule
