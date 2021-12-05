setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/ss/ss.adf"]} { 
	design create ss "D:/KTU/SkaitmenineLogika/Registrai(Lab3)"
  set newDesign 1
}
design open "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/ss"
cd "D:/KTU/SkaitmenineLogika/Registrai(Lab3)"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_xp2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/impl1/PostumioRegistras.vhd"
addfile "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/impl1/SpecializuotasRegistras.vhd"
vlib "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/ss/work"
set worklib work
adel -all
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/impl1/PostumioRegistras.vhd"
vcom -dbg -work work "D:/KTU/SkaitmenineLogika/Registrai(Lab3)/impl1/SpecializuotasRegistras.vhd"
entity SPECIALIZUOTASREGISTRAS
vsim  +access +r SPECIALIZUOTASREGISTRAS   -PL pmi_work -L ovi_xp2
add wave *
run 1000ns
