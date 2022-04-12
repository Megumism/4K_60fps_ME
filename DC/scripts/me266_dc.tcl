dc_shell | tee run.log

#Library Setup
set search_path "$search_path ../rtl/me266 ../scripts ../lib /home/student/Desktop/Workspace/55nm ../work ../mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c"
set target_library   "hu55npkldut_tt1p0v25c.db HL55LPGP3VDS_SL_A01_P2_TT1D8V1D2V25C.db asdrlspkb1p64x16cm2sw0_lib.db"
set symbol_library   "hu55npkldut.sdb"
set link_library     "* $target_library $symbol_library pre_sram.db cur_sram.db"

analyze -format verilog ../rtl/me266/cur.v
analyze -format verilog ../rtl/me266/pre_frame_buffer.v
analyze -format verilog ../rtl/me266/pe.v
analyze -format verilog ../rtl/me266/sad.v
analyze -format verilog ../rtl/me266/compare_tree.v
analyze -format verilog ../rtl/me266/core.v
analyze -format verilog ../rtl/me266/result.v
analyze -format verilog ../rtl/me266/top.v
#elaborate me266
analyze -format verilog ../rtl/me266/me266_chip.v
elaborate me266_chip

uniquify

reset_design
create_clock -period 5.08 [get_ports clk]
set_clock_uncertainty 0.25 [get_clocks clk]     
set_clock_transition 0.1 [get_clocks clk]
set_clock_latency -source 4 [get_clocks clk]
set_clock_latency 2 [get_clocks clk]
set_input_delay -max 2.5 -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay -max 2.5 -clock clk [all_outputs]
set_wire_load_mode segmented
set auto_wire_load_selection true
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [all_inputs]
set_load [load_of HL55LPGP3VDS_SL_A01_TT1D8V1D2V25C/HPDWUW1416DGP/PAD] [all_outputs]
set_max_transition 3.0 [current_design]
set_max_fanout  32 [current_design]
set_ideal_network {rst}
set_ideal_network {clk}
set_dont_touch [get_cells "HPDWUW1416DGP*"] true
set_fix_multiple_port_nets -all -buffer_constants

compile

#Saving sdc
write_sdc ../outputs/me266_clk_with_driving.sdc

check_design > ../reports/me266_check_design_report.rpt

#Clean-up
###YBR ADD -blast_buses###
remove_unconnected_ports [find -hierarchy cell "*"]
remove_unconnected_ports -blast_buses [find -hierarchy cell "*"]
###YBR ADD -blast_buses###
#Report
report_constraint -all_violators > ../reports/me266_violators_clk_with_driving.rpt
report_area > ../reports/me266_area_report_clk_with_driving.rpt
report_timing > ../reports/me266_timing_report_clk_with_driving.rpt

#Saving Designs after Compile
change_names -rule verilog -hier

###YBR
write -format verilog -hier -out ../outputs/me266_clk_with_driving.v
write -format ddc -hier -out ../outputs/me266_clk_with_driving.ddc
