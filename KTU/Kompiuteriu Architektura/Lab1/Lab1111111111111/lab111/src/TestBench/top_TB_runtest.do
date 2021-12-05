SetActiveLib -work
comp -include "$dsn\src\top.vhd" 
comp -include "$dsn\src\TestBench\top_TB.vhd" 
asim +access +r TESTBENCH_FOR_top 
wave 
wave -noreg CLK
wave -noreg RST
wave -noreg Din
wave -noreg MAIN_Dout
wave -noreg S_Done
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\top_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_top 
