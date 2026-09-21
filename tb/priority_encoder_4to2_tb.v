`timescale 1ns/1ps

module priority_encoder_4to2_tb;
    reg [3:0] in;
    wire [1:0] code;
    wire valid;
    reg [1:0] expected_code;
    reg expected_valid;
    integer vector;

    priority_encoder_4to2 dut (
        .in(in),
        .code(code),
        .valid(valid)
    );

    task automatic check_vector;
        input [3:0] stimulus;
        input [1:0] exp_code;
        input exp_valid;
        begin
            in = stimulus;
            #1;

            if (code !== exp_code || valid !== exp_valid) begin
                $display(
                    "FAIL priority_encoder_4to2: in=%b expected_code=%b expected_valid=%0d got_code=%b got_valid=%0d",
                    stimulus,
                    exp_code,
                    exp_valid,
                    code,
                    valid
                );
                $finish(1);
            end
        end
    endtask

    initial begin
        for (vector = 0; vector < 16; vector = vector + 1) begin
            expected_valid = (vector != 0);

            if (vector[3]) begin
                expected_code = 2'b11;
            end else if (vector[2]) begin
                expected_code = 2'b10;
            end else if (vector[1]) begin
                expected_code = 2'b01;
            end else begin
                expected_code = 2'b00;
            end

            check_vector(vector[3:0], expected_code, expected_valid);
        end

        check_vector(4'b10z0, 2'bxx, 1'bx);
        check_vector(4'b0x10, 2'bxx, 1'bx);

        $display("PASS priority_encoder_4to2");
        $finish;
    end
endmodule
