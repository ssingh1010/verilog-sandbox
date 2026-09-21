module priority_encoder_4to2 (
    input  wire [3:0] in,
    output reg  [1:0] code,
    output wire       valid
);
    wire has_unknown;

    assign has_unknown = (^in === 1'bx);
    assign valid = has_unknown ? 1'bx : |in;

    always @* begin
        if (has_unknown) begin
            code = 2'bxx;
        end else if (in[3]) begin
            code = 2'b11;
        end else if (in[2]) begin
            code = 2'b10;
        end else if (in[1]) begin
            code = 2'b01;
        end else begin
            code = 2'b00;
        end
    end
endmodule
