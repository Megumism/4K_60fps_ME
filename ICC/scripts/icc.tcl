# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Logic Library settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
lappend search_path ~/Desktop/Workspace/55nm ../scripts ../design
set_app_var target_library "~/Desktop/Workspace/55nm/hu55npkldut_tt1p0v25c.db ~/Desktop/Workspace/55nm/HL55LPGP3VDS_SL_A01_P2_TT1D8V1D2V25C.db ~/Desktop/Workspace/55nm/mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c/asdrlspkb1p64x16cm2sw0_lib.db"
set_app_var link_library "* ~/Desktop/Workspace/55nm/hu55npkldut_tt1p0v25c.db ~/Desktop/Workspace/55nm/HL55LPGP3VDS_SL_A01_P2_TT1D8V1D2V25C.db ~/Desktop/Workspace/55nm/mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c/asdrlspkb1p64x16cm2sw0_lib.db"


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

source run_data_setup.tcl
source run_design_planning.tcl
source run_placement.tcl
source run_cts.tcl
source run_route.tcl
source run_finishing.tcl
