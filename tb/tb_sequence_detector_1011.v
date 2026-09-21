`timescale 1ns/1ps

module tb_sequence_detector_1011;
    reg clk;
    reg rst;
    reg din;
    wire match;

    integer i;
    reg [11:0] stimulus;
    reg [11:0] expected_match;

    sequence_detector_1011 dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .match(match)
    );

    always #5 clk = ~clk;

    task drive_and_check;
        input reg next_din;
        input reg expected;
        input integer step;
        begin
            @(negedge clk);
            din = next_din;
            @(posedge clk);
            #1;
            if (match !== expected) begin
                $display(
                    "sequence_detector_1011 failed at step %0d: din=%b expected %b got %b",
                    step,
                    next_din,
                    expected,
                    match
                );
                $finish(1);
            end
        end
    endtask

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        din = 1'b0;
        stimulus = 12'b1_0_1_1_0_1_1_1_0_1_1_0;
        expected_match = 12'b0_0_0_1_0_0_1_0_0_0_1_0;

        #12;
        rst = 1'b0;

        for (i = 11; i >= 0; i = i - 1) begin
            drive_and_check(stimulus[i], expected_match[i], 11 - i);
        end

        $display("sequence_detector_1011 passed");
        $finish(0);
    end
endmodule
