lappend auto_path "C:/lscc/diamond/3.9_x64/data/script"
package require simulation_generation
set ::bali::simulation::Para(PROJECT) {SpecializuotoRegistroTestas}
set ::bali::simulation::Para(PROJECTPATH) {D:/KTU/SkaitmenineLogika/VHDL(Lab4)}
set ::bali::simulation::Para(FILELIST) {"D:/KTU/SkaitmenineLogika/VHDL(Lab4)/KombinacineSchema.vhdl" "D:/KTU/SkaitmenineLogika/VHDL(Lab4)/SpecializuotasRegistras.vhdl" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none" "none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" "work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" "VHDL" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_xp2}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {spec_register}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {1}
set ::bali::simulation::Para(RUNSIMULATION)  {1}
set ::bali::simulation::Para(HDLPARAMETERS) {}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
::bali::simulation::ActiveHDL_Run
