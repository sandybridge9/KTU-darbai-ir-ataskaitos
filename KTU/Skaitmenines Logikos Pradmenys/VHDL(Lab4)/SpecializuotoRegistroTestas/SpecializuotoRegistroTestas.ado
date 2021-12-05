setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SpecializuotoRegistroTestas/SpecializuotoRegistroTestas.adf"]} { 
	design create SpecializuotoRegistroTestas "D:/KTU/SkaitmenineLogika/VHDL(Lab4)"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SpecializuotoRegistroTestas"
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
addfile "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/KombinacineSchema.vhdl"
addfile "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SpecializuotasRegistras.vhdl"
vlib "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SpecializuotoRegistroTestas/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/KombinacineSchema.vhdl"
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SpecializuotasRegistras.vhdl"
entity spec_register
vsim  +access +r spec_register   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
