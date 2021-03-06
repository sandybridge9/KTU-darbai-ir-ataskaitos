#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology LATTICE-XP2
set_option -part LFXP2_5E
set_option -package TN144C
set_option -speed_grade -6

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency auto
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false

set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
add_file -vhdl {D:/Program Files (x86)/diamond/3.8_x64/cae_library/synthesis/vhdl/xp2.vhd}
add_file -vhdl -lib "work" {D:/Tadas/KTU/SkaitmenineLogika/LabNr1/lab1/Schema1.vhd}
add_file -vhdl -lib "work" {D:/Tadas/KTU/SkaitmenineLogika/LabNr1/lab1/Schema12.vhd}
add_file -vhdl -lib "work" {D:/Tadas/KTU/SkaitmenineLogika/LabNr1/lab1/Schema2.vhd}

#-- top module name
set_option -top_module SCHEMA2

#-- set result format/file last
project -result_file {D:/Tadas/KTU/SkaitmenineLogika/LabNr1/lab1/Laboratorinis1_lab1.edi}

#-- error message log file
project -log_file {Laboratorinis1_lab1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run
