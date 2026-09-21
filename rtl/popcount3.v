module popcount3 (
    input  wire [2:0] in,
    output wire [1:0] count
);
    assign count = in[0] + in[1] + in[2];
endmodule
