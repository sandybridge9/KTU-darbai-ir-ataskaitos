setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/Trigeriai/StatinioTrigerioTestas/StatinioTrigerioTestas.adf"]} { 
	design create StatinioTrigerioTestas "D:/KTU/SkaitmenineLogika/Trigeriai"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/Trigeriai/StatinioTrigerioTestas"
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
vlib "D:/KTU/SkaitmenineLogika/Trigeriai/StatinioTrigerioTestas/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Trigeriai/impl1/StatinisTrigeris.vhd"
entity STATINISTRIGERIS
vsim  +access +r STATINISTRIGERIS   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
