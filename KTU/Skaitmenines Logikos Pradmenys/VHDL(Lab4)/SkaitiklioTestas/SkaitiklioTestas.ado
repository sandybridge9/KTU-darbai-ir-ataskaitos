setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SkaitiklioTestas/SkaitiklioTestas.adf"]} { 
	design create SkaitiklioTestas "D:/KTU/SkaitmenineLogika/VHDL(Lab4)"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SkaitiklioTestas"
cd "D:/KTU/SkaitmenineLogika/VHDL(Lab4)"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_xp2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/Skaitiklis.vhdl"
vlib "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SkaitiklioTestas/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/Skaitiklis.vhdl"
entity counter
vsim  +access +r counter   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
