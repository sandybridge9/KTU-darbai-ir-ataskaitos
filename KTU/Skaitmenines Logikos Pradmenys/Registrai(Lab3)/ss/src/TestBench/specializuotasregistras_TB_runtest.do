SetActiveLib -work
comp -include "D:\KTU\SkaitmenineLogika\Registrai(Lab3)\impl1\SpecializuotasRegistras.vhd" 
comp -include "$dsn\src\TestBench\specializuotasregistras_TB.vhd" 
asim +access +r TESTBENCH_FOR_specializuotasregistras 
wave 
wave -noreg reset
wave -noreg CLK
wave -noreg A0
wave -noreg A1
wave -noreg Q0
wave -noreg Q1
wave -noreg Q2
wave -noreg Q3
wave -noreg Q4
wave -noreg Q5
wave -noreg Q6
wave -noreg x0
wave -noreg x1
wave -noreg x2
wave -noreg x3
wave -noreg x4
wave -noreg x5
wave -noreg x6
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\specializuotasregistras_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_specializuotasregistras 
