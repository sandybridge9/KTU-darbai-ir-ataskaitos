SetActiveLib -work
comp -include "D:\KTU\SkaitmenineLogika\VHDL(Lab4)\Skaitiklis.vhdl" 
comp -include "$dsn\src\TestBench\counter_TB.vhd" 
asim +access +r TESTBENCH_FOR_counter 
wave 
wave -noreg clock
wave -noreg clear
wave -noreg load
wave -noreg Data
wave -noreg p
wave -noreg Q
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\counter_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_counter 
