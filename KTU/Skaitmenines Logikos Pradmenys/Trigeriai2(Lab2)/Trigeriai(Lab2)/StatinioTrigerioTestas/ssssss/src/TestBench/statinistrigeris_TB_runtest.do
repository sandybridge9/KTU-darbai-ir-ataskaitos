SetActiveLib -work
comp -include "D:\KTU\SkaitmenineLogika\Trigeriai(Lab2)\impl1\StatinisTrigeris.vhd" 
comp -include "$dsn\src\TestBench\statinistrigeris_TB.vhd" 
asim +access +r TESTBENCH_FOR_statinistrigeris 
wave 
wave -noreg CLK
wave -noreg x2
wave -noreg x3
wave -noreg x4
wave -noreg D
wave -noreg Q
wave -noreg nQ
wave -noreg RESET
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\statinistrigeris_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_statinistrigeris 
