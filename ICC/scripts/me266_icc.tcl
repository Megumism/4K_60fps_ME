icc_shell | tee run.log

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Logic Library settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
lappend search_path ~/Desktop/Workspace/55nm ../scripts ../design
set_app_var target_library "~/Desktop/Workspace/55nm/hu55npkldut_tt1p0v25c.db ~/Desktop/Workspace/55nm/HL55LPGP3VDS_SL_A01_P2_TT1D8V1D2V25C.db ~/Desktop/Workspace/55nm/mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c/asdrlspkb1p64x16cm2sw0_lib.db ~/Desktop/Workspace/IDCT_55nm_mem/ICC/dual-port/sadslspkb2p16x64m4b1w0cp0d0t0_lib.db ~/Desktop/Workspace/IDCT_55nm_mem/ICC/dual-port/sadslspkb2p24x64m4b1w0cp0d0t0_lib.db"
set_app_var link_library "* ~/Desktop/Workspace/55nm/hu55npkldut_tt1p0v25c.db ~/Desktop/Workspace/55nm/HL55LPGP3VDS_SL_A01_P2_TT1D8V1D2V25C.db ~/Desktop/Workspace/55nm/mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c/asdrlspkb1p64x16cm2sw0_lib.db ~/Desktop/Workspace/IDCT_55nm_mem/ICC/dual-port/sadslspkb2p16x64m4b1w0cp0d0t0_lib.db ~/Desktop/Workspace/IDCT_55nm_mem/ICC/dual-port/sadslspkb2p24x64m4b1w0cp0d0t0_lib.db"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Physical Library settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set mw_path "~/Desktop/Workspace/55nm/milkyway"
set tech_file "~/Desktop/Workspace/55nm/milkyway/tf/hu55npkldut_m06f1f0_RDL.tf"
set tlup_map "~/Desktop/Workspace/55nm/milkyway/tlup/layers.map"
set tlup_max "~/Desktop/Workspace/55nm/milkyway/tlup/HLMC_55nm_1p6m_1tm4x_rcworst.tlup"
set tlup_min "~/Desktop/Workspace/55nm/milkyway/tlup/HLMC_55nm_1p6m_1tm4x_rcbest.tlup"
set verilog_file "../design/me266_clk_with_driving.v"
set sdc_file "../design/me266_clk_with_driving.sdc"
set_app_var sh_enable_page_mode false

# Script step 1 - Data Setup and Basic Flow
#
exec rm -rf ../me266_chip.mw
#
############################################################
# Create Milkyway Design Library
############################################################
extend_mw_layers
create_mw_lib ../me266_chip.mw -open -technology $tech_file -mw_reference_library  "$mw_path/hu55npkldut_m08f1f2_RDL $mw_path/HL55LPGP3VDS_SL_A01_P2_6M /home/student/Desktop/Workspace/IDCT_55nm_mem/ICC/dual-port/sadslspkb2p16x64m4b1w0cp0d0t0 /home/student/Desktop/Workspace/IDCT_55nm_mem/ICC/dual-port/sadslspkb2p24x64m4b1w0cp0d0t0"

############################################################
# Load the netlist, constraints and controls.
############################################################
import_designs $verilog_file -format verilog -top me266_chip

############################################################
# Load TLU+ files
############################################################
set_tlu_plus_files -max_tluplus $tlup_max -min_tluplus $tlup_min -tech2itf_map  $tlup_map

check_library
check_tlu_plus_files
list_libs

source derive_pg.tcl
check_mv_design -power_nets
read_sdc $sdc_file
check_timing
report_timing_requirements
report_disable_timing
report_case_analysis
report_clock
report_clock -skew
redirect -tee ../reports/data_setup.timing { report_timing }

source opt_ctrl.tcl
source zic_timing.tcl
#exec cat zic.timing
#remove_ideal_network [get_ports scan_en]
save_mw_cel -as 1_datasetup

start_gui

gui_set_current_task -name {Design Planning}

######################################################################
# Initialize Floorplan
######################################################################
# Create corners and P/G pads and define all pad cell locations:
source pad_cell_cons.tcl
#initialize_floorplan -core_utilization 0.8 -left_io2core 30.0 -bottom_io2core 30.0 -right_io2core 30.0 -top_io2core 30.0
create_floorplan -core_utilization 0.8 -left_io2core 30.0 -bottom_io2core 30.0 -right_io2core 30.0 -top_io2core 30.0
insert_pad_filler -cell {HPFILLER5 HPFILLER1 HPFILLER05 HPFILLER01 HPFILLER0005}
source changePadDirection.tcl
source derive_pg.tcl
save_mw_cel -as 2_1_floorplan_init

######################################################################
# Place the hard macro, e.g., SRAM
# Comment following lines if there is no macro
######################################################################
##  1. You can move the macro to a proper position in the GUI:
##	i.   Press the key "m"
##	ii.  Select the macro (Click the left mouse button)
##	iii. Move the macro (Click the left mouse button --> move)
##  2. Or, you can use commands to move a macro
##	#move_objects -to {x y} collection
##  140.000 140.000 1165.000 1129.800
 	move_objects -to {150 1070} [get_cells ME266/PRE/sram2]
	move_objects -to {150 1010} [get_cells ME266/PRE/sram1]
	move_objects -to {150 950} [get_cells ME266/PRE/sram0]
	move_objects -to {570 150} [get_cells ME266/CUR/dua]

	create_placement_blockage -coordinate {{147.000 946.400} {747.000 1121.400}} -name placement_blockage_0 -type hard


## Create placement blockage around the macro to avoid DRC violations
##  1. You can create the placement blockage in the GUI:
##	i. In the menu, find "Floorplan" -- "Create placement blockage ..."
##	ii. In the layout window, use the mouse to create the placement blockage 
##  2. Or, you can use commands, for example:
	source create_macro_placement_blockage.tcl
set_attribute [all_macro_cells] is_placed true
set_attribute [all_macro_cells] is_fixed true
save_mw_cel -as 2_2_floorplan_macro
######################################################################
# End 
######################################################################


### Build the power plan structure
source pns.tcl
commit_fp_rail
preroute_instances
preroute_standard_cells -fill_empty_rows -remove_floating_pieces
analyze_fp_rail -nets {VDD VSS} -voltage_supply 1.0 -pad_masters {HPVDD1DGP HPVSS1DGP} -analyze_power
save_mw_cel -as 2_3_floorplan_pns

set_pnet_options -complete "M4 M5"
create_fp_placement -timing_driven -no_hierarchy_gravity
route_zrt_global

#Perform timing analysis
redirect -tee ../reports/floorplan.timing { report_timing }
save_mw_cel -as 2_4_floorplan_complete

remove_placement -object_type standard_cell
write_def -version 5.6 -placed -all_vias -blockages -routed_nets -specialnets -rows_tracks_gcells -output ../outputs/me266_chip.def

# IC Compiler run script for idct_floorplan_complete
report_ignored_layers
report_pnet_options
#source ndr.tcl
check_physical_design -stage pre_place_opt
check_physical_constraints
save_mw_cel -as 3_1_place_setup

place_opt

place_opt -effort high
route_zrt_global

place_opt_feasibility -skip initial_placement
route_zrt_global

redirect -tee ../reports/placement.timing { report_timing }

#report_timing -transition -cap -significant_digit 5 -nets > ../reports/place_timing.rpt 
#gui_change_highlight -collection [get_nets xxx] 

report_design -physical
report_qor
report_power
save_mw_cel -as 3_2_place_complete

#######################
# Examine Clock Tree  #
#######################

report_clock -skew -attributes
report_clock_tree -summary
report_constraint -all

#######################################
# Preparing for Clock Tree Synthesis  #
#######################################
set_clock_tree_options -target_skew 0.15
set_clock_uncertainty 0.1 [all_clocks]
#source ndr.tcl
set_clock_tree_options -max_fanout 32
report_clock_tree -settings
check_physical_design -stage pre_clock_opt -display
#set_delay_calculation -clock_arnoldi
check_clock_tree

clock_opt -only_cts -no_clock_route -update_clock_latency
report_clock_tree -summary
report_clock_timing -type skew -significant_digits 3
report_constraint -all > ../reports/cts_cons.rpt
redirect -tee ../reports/cts_only_cts.timing { report_timing }
save_mw_cel -as 4_1_clock_cts

###################################
# Perform Hold Time Optimization  #
###################################
set_fix_hold [all_clocks]
extract_rc 
clock_opt -only_psyn -no_clock_route 
redirect -tee ../reports/cts_only_psyn.timing { report_timing }
report_qor
report_constraint -all
save_mw_cel -as 4_2_clock_psyn

route_zrt_group -all_clock_nets
report_constraint -all
report_constraint -all > ../reports/cts_cons.rpt
save_mw_cel -as 4_3_clock_route
report_design -physical

source common_optimization_settings_icc.tcl
source common_placement_settings.tcl
source common_post_cts_timing_settings.tcl
source common_route_si_settings_zrt_icc.tcl

#report_constraint -all
all_ideal_nets
all_high_fanout -nets -threshold 501
report_preferred_routing_direction
report_tlu_plus_files
check_legality
verify_pg_nets

set_route_zrt_common_options -post_detail_route_redundant_via_insertion medium
set_route_zrt_detail_options -optimize_wire_via_effort_level medium
set_net_routing_layer_constraints -min_layer_name M2   -max_layer_name M5 [get_nets *]
set_route_zrt_common_options -global_max_layer_mode hard -global_min_layer_mode soft -net_max_layer_mode hard -net_min_layer_mode soft
set_ignored_layers -min_routing_layer M2 -max_routing_layer M5
set_route_zrt_common_options -connect_within_pins_by_layer_name {{M1 via_wire_standard_cell_pins}}

report_routing_rules; # report routing rules
report_route_opt_strategy; # report route_opt_stretegy
report_route_zrt_common_options; # Reports zrt common route options
report_route_zrt_global_options; # Reports zrt global route options
report_route_zrt_track_options; # Reports zrt route track assignment options
report_route_zrt_detail_options; # Reports zrt detail route options

route_opt -initial_route_only
redirect -tee ../reports/route_initial.timing { report_timing }
report_clock_tree -summary
report_clock_timing -type skew
report_qor
report_constraint -all

#route_opt -skip_initial_route  -power
#redirect -tee ../reports/route_power.timing { report_timing }
source derive_pg.tcl
verify_zrt_route;  #DRC: Check whether there are any physical design rule violations
verify_lvs;  #LVS: isolate opens and shorts
#route_opt -incremental;  #run incremental route_opt to see if that will fix the errors.
route_opt -incr -effort high
route_zrt_eco
route_opt -incr -only_hold_time
route_opt -incr -effort high
route_zrt_eco
report_design_physical -route
report_constraint -all > ../reports/route_final_cons.rpt
redirect -tee ../reports/route_final.timing { report_timing }
save_mw_cel -as 5_route_final

get_utilization > ../reports/utilization.rpt

########################################
# INSERT STANDARD CELL FILLERS         #
########################################

insert_stdcell_filler -cell_with_metal "SVL_FILL64 SVL_FILL32 SVL_FILL16 SVL_FILL8 SVL_FILL4 SVL_FILL2 SVL_FILL1" -connect_to_power VDD -connect_to_ground VSS -between_std_cells_only

save_mw_cel -as 6_1_chip_finish_filler
set_write_stream_options -child_depth 200
write_stream -cells 6_1_chip_finish_filler ../outputs/me266_chip.gdsii
write_verilog -no_corner_pad_cells ../outputs/me266_chip.v

#exit