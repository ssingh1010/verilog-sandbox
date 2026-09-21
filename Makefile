SIM_OUT ?= /tmp/verilog-sandbox
IVERILOG ?= iverilog
VVP ?= vvp

.PHONY: test clean full_adder priority_encoder_4to2

test: full_adder priority_encoder_4to2

full_adder:
	mkdir -p $(SIM_OUT)
	$(IVERILOG) -g2012 -o $(SIM_OUT)/$@ tb/$@_tb.v src/$@.v
	$(VVP) $(SIM_OUT)/$@

priority_encoder_4to2:
	mkdir -p $(SIM_OUT)
	$(IVERILOG) -g2012 -o $(SIM_OUT)/$@ tb/$@_tb.v src/$@.v
	$(VVP) $(SIM_OUT)/$@

clean:
	rm -rf $(SIM_OUT)
