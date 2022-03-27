

#Library Setup
set search_path "$search_path ../rtl/idct ../scripts /home/student/Desktop/Workspace/55nm ../work ../mem/asdrlspkb1p64x16cm2sw0/tt1p2v25c"
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
create_clock -period 5 [get_ports clk]
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
set_ideal_network {rst}
set_ideal_network {clk}
set_dont_touch [get_cells "HPDWUW1416DGP*"] true
set_fix_multiple_port_nets -all -buffer_constants

compile

report_timing

