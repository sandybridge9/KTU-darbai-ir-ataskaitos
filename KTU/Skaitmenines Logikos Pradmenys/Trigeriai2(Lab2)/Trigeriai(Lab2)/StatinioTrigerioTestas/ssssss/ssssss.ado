setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/StatinioTrigerioTestas/ssssss/ssssss.adf"]} { 
	design create ssssss "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/StatinioTrigerioTestas"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/StatinioTrigerioTestas/ssssss"
cd "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/StatinioTrigerioTestas"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_xp2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/StatinisTrigeris.vhd"
addfile "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/DviejuPakopuTrigeris.vhd"
vlib "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/StatinioTrigerioTestas/ssssss/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/StatinisTrigeris.vhd"
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai(Lab2)/impl1/DviejuPakopuTrigeris.vhd"
entity STATINISTRIGERIS
vsim  +access +r STATINISTRIGERIS   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
