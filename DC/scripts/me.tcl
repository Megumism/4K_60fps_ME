#Library Setup
set search_path "$search_path ../rtl/ME ../scripts /home/student/Desktop/Workspace/55nm ../work ../mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c"
set target_library   "hu55npkldut_tt1p0v25c.db HL55LPGP3VDS_SL_A01_P2_TT1D8V1D2V25C.db asdrlspkb1p64x16cm2sw0_lib.db"
set symbol_library   "hu55npkldut.sdb"
set link_library     "* $target_library $symbol_library"

#Reading Design Files and Specify the current design
source read_me.tcl

###YBR ADD uniquify###
uniquify
###YBR ADD uniquify###
source me.con

#Saving sdc
write_sdc ../outputs/me_core_test.sdc

check_design > ../reports/check_design_report.rpt

#Compile
compile

#Clean-up
###YBR ADD -blast_buses###
remove_unconnected_ports [find -hierarchy cell "*"]
remove_unconnected_ports -blast_buses [find -hierarchy cell "*"]
###YBR ADD -blast_buses###
#Report
report_constraint -all_violators > ../reports/violators_clk_with_driving.rpt
report_area > ../reports/area_report_clk_with_driving.rpt
report_timing > ../reports/timing_report_clk_with_driving.rpt

#Saving Designs after Compile
change_names -rule verilog -hier

###YBR
write -format verilog -hier -out ../outputs/core_clk_with_driving.v
write -format ddc -hier -out ../outputs/core_clk_with_driving.ddc

