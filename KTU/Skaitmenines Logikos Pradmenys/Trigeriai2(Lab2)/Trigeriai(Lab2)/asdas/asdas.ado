setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/asdas/asdas.adf"]} { 
	design create asdas "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/asdas"
cd "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_xp2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/DviejuPakopuTrigeris.vhd"
addfile "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/StatinisTrigeris.vhd"
vlib "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/asdas/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/DviejuPakopuTrigeris.vhd"
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/StatinisTrigeris.vhd"
entity DVIEJUPAKOPUTRIGERIS
vsim  +access +r DVIEJUPAKOPUTRIGERIS   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
