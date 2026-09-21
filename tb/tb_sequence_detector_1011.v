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

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        din = 1'b0;
        stimulus = 12'b1_0_1_1_0_1_1_1_0_1_1_0;
        expected_match = 12'b0_0_0_1_0_0_1_0_0_0_1_0;

        #12;
        rst = 1'b0;

        for (i = 11; i >= 0; i = i - 1) begin
            din = stimulus[i];
            @(posedge clk);
            #1;
            if (match !== expected_match[i]) begin
                $display(
                    "sequence_detector_1011 failed at step %0d: din=%b expected %b got %b",
                    11 - i,
                    stimulus[i],
                    expected_match[i],
                    match
                );
                $finish(1);
            end
        end

        $display("sequence_detector_1011 passed");
        $finish(0);
    end
endmodule
