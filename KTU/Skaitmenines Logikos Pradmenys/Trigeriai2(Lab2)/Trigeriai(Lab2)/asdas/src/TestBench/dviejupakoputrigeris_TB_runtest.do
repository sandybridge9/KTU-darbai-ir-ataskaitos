SetActiveLib -work
comp -include "D:\KTU\SkaitmenineLogika\Trigeriai(Lab2)\impl1\DviejuPakopuTrigeris.vhd" 
comp -include "$dsn\src\TestBench\dviejupakoputrigeris_TB.vhd" 
asim +access +r TESTBENCH_FOR_dviejupakoputrigeris 
wave 
wave -noreg CLK
wave -noreg x2
wave -noreg x3
wave -noreg x4
wave -noreg RESET
wave -noreg Q2
wave -noreg nQ2
wave -noreg Q1
wave -noreg D
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dviejupakoputrigeris_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dviejupakoputrigeris 
