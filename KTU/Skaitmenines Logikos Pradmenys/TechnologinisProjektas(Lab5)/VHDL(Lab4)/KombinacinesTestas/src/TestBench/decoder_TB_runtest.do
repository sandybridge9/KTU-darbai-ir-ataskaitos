SetActiveLib -work
comp -include "D:\KTU\SkaitmenineLogika\VHDL(Lab4)\KombinacineSchema.vhdl" 
comp -include "$dsn\src\TestBench\decoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_decoder 
wave 
wave -noreg a
wave -noreg b
wave -noreg c
wave -noreg d
wave -noreg e
wave -noreg f
wave -noreg y
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\decoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_decoder 
