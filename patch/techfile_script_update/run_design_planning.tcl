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
	move_objects -to {140 200} [get_cells inst_idct/ram8x8_1/mem]
	move_objects -to {140 140} [get_cells inst_idct/ram8x8_2/mem]

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
write_def -version 5.6 -placed -all_vias -blockages -routed_nets -specialnets -rows_tracks_gcells -output ../outputs/idct_chip.def
