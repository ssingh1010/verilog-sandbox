# verilog-sandbox

Small Verilog practice problems with matching self-checking test benches.

## Included examples

- `rtl/majority3.v` - 3-input majority gate
- `rtl/popcount3.v` - counts the number of set bits in a 3-bit input
- `rtl/sequence_detector_1011.v` - overlapping `1011` sequence detector

## Test benches

- `tb/tb_majority3.v`
- `tb/tb_popcount3.v`
- `tb/tb_sequence_detector_1011.v`

## Running the tests

Compile and run each example with Icarus Verilog:

```bash
iverilog -o majority3.out rtl/majority3.v tb/tb_majority3.v && vvp majority3.out
iverilog -o popcount3.out rtl/popcount3.v tb/tb_popcount3.v && vvp popcount3.out
iverilog -o sequence_detector_1011.out rtl/sequence_detector_1011.v tb/tb_sequence_detector_1011.v && vvp sequence_detector_1011.out
```
