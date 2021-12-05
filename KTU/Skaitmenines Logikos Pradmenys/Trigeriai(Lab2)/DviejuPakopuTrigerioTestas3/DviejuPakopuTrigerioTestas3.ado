setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/Trigeriai/DviejuPakopuTrigerioTestas3/DviejuPakopuTrigerioTestas3.adf"]} { 
	design create DviejuPakopuTrigerioTestas3 "D:/KTU/SkaitmenineLogika/Trigeriai"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/Trigeriai/DviejuPakopuTrigerioTestas3"
cd "D:/KTU/SkaitmenineLogika/Trigeriai"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_xp2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/KTU/SkaitmenineLogika/Trigeriai/impl1/StatinisTrigeris.vhd"
addfile "D:/KTU/SkaitmenineLogika/Trigeriai/impl1/DviejuPakopuTrigeris.vhd"
vlib "D:/KTU/SkaitmenineLogika/Trigeriai/DviejuPakopuTrigerioTestas3/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai/impl1/StatinisTrigeris.vhd"
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai/impl1/DviejuPakopuTrigeris.vhd"
entity DVIEJUPAKOPUTRIGERIS
vsim  +access +r DVIEJUPAKOPUTRIGERIS   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
