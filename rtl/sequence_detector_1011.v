module sequence_detector_1011 (
    input  wire clk,
    input  wire rst,
    input  wire din,
    output reg  match
);
    localparam [1:0]
        S0   = 2'd0,
        S1   = 2'd1,
        S10  = 2'd2,
        S101 = 2'd3;

    reg [1:0] state;
    reg [1:0] next_state;

    always @(*) begin
        case (state)
            S0:   next_state = din ? S1   : S0;
            S1:   next_state = din ? S1   : S10;
            S10:  next_state = din ? S101 : S0;
            S101: next_state = din ? S1   : S10;
            default: next_state = S0;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            match <= 1'b0;
        end else begin
            match <= (state == S101) && din;
            state <= next_state;
        end
    end
endmodule
