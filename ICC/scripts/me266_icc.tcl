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
	#move_objects -to {140 200} [get_cells inst_idct/ram8x8_1/mem]
	#move_objects -to {140 140} [get_cells inst_idct/ram8x8_2/mem]

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
