# Script step 1 - Data Setup and Basic Flow
#
exec rm -rf ../me266_chip.mw
#
############################################################
# Create Milkyway Design Library
############################################################
extend_mw_layers
create_mw_lib ../me266_chip.mw -open -technology $tech_file -mw_reference_library  "$mw_path/hu55npkldut_m08f1f2_RDL $mw_path/HL55LPGP3VDS_SL_A01_P2_6M /home/student/Desktop/Workspace/55nm/mem/asdrlspkb1p64x16cm2sw0/hu55mem"


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
