SetActiveLib -work
comp -include "D:\KTU\SkaitmenineLogika\VHDL(Lab4)\SpecializuotasRegistras.vhdl" 
comp -include "$dsn\src\TestBench\spec_register_TB.vhd" 
asim +access +r TESTBENCH_FOR_spec_register 
wave 
wave -noreg clk
wave -noreg rst
wave -noreg A0
wave -noreg A1
wave -noreg Data
wave -noreg Q
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\spec_register_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_spec_register 
