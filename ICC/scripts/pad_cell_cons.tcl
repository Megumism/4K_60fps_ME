# Create corners and P/G pads
remove_pin_pad_physical_constraints
create_cell {CornerLL CornerLR CornerTR CornerTL} HPCORNER 
create_cell {HPMAC2PFC_inst} HPMAC2PFC
create_cell {vss1_l vss1_r vss1_t vss1_b} HPVSS1DGP 
create_cell {vdd1_l vdd1_r vdd1_t vdd1_b} HPVDD1DGP
create_cell {vss2_l vss2_r vss2_t vss2_b} HPVSS2DGP
create_cell {vdd2_l vdd2_r vdd2_t vdd2_b} HPVDD2DGP

#set_pad_physical_constraints  -lib_cell -lib_cell_orientation {FS FN FS FN}  -pad_name HPDWUW1416DGP
#set_pad_physical_constraints  -lib_cell -lib_cell_orientation {FS FN FS FN}  -pad_name HPVSSIA
#set_pad_physical_constraints  -lib_cell -lib_cell_orientation {FS FN FS FN}  -pad_name HPVCCIA
#set_pad_physical_constraints  -lib_cell -lib_cell_orientation {FS FN FS FN}  -pad_name HPVSSA
#set_pad_physical_constraints  -lib_cell -lib_cell_orientation {FS FN FS FN}  -pad_name HPVCCA
#set_pad_physical_constraints  -lib_cell -lib_cell_orientation {FS FN FS FN}  -pad_name HPCORNERA
# Define corner pad locations
set_pad_physical_constraints   -pad_name "CornerTL" -side 1
set_pad_physical_constraints   -pad_name "CornerTR" -side 2
set_pad_physical_constraints   -pad_name "CornerLR" -side 3
set_pad_physical_constraints   -pad_name "CornerLL" -side 4

# Define signal and PG pad locations

# Left side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in0" -side 1 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in1" -side 1 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in2" -side 1 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in3" -side 1 -order 4
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in4" -side 1 -order 5
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in5" -side 1 -order 6
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in6" -side 1 -order 7
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in7" -side 1 -order 8
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in8" -side 1 -order 9
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in9" -side 1 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in10" -side 1 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in11" -side 1 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in12" -side 1 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in13" -side 1 -order 14
set_pad_physical_constraints   -pad_name "vdd2_l" -side 1 -order 15
set_pad_physical_constraints   -pad_name "vdd1_l" -side 1 -order 16
set_pad_physical_constraints   -pad_name "vss1_l" -side 1 -order 17
set_pad_physical_constraints   -pad_name "vss2_l" -side 1 -order 18
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in14" -side 1 -order 19
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in15" -side 1 -order 20
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in16" -side 1 -order 21
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in17" -side 1 -order 22
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in18" -side 1 -order 23
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in19" -side 1 -order 24
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in20" -side 1 -order 25
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in21" -side 1 -order 26
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in22" -side 1 -order 27
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in23" -side 1 -order 28
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_x_out" -side 1 -order 29
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_sign_sad" -side 1 -order 30

# Top side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in24" -side 2 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in25" -side 2 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in26" -side 2 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in27" -side 2 -order 4
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in28" -side 2 -order 5
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in29" -side 2 -order 6
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in30" -side 2 -order 7
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in31" -side 2 -order 8
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in32" -side 2 -order 9
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in33" -side 2 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in34" -side 2 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in35" -side 2 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in36" -side 2 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in37" -side 2 -order 14
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in38" -side 2 -order 15
set_pad_physical_constraints   -pad_name "vdd2_t" -side 2 -order 16
set_pad_physical_constraints   -pad_name "vdd1_t" -side 2 -order 17
set_pad_physical_constraints   -pad_name "vss1_t" -side 2 -order 18
set_pad_physical_constraints   -pad_name "vss2_t" -side 2 -order 19
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in39" -side 2 -order 20
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in40" -side 2 -order 21
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in41" -side 2 -order 22
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in42" -side 2 -order 23
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in43" -side 2 -order 24
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in44" -side 2 -order 25
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in45" -side 2 -order 26
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in46" -side 2 -order 27
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in47" -side 2 -order 28
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in48" -side 2 -order 29
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_sad_out" -side 2 -order 30

# Right side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in49" -side 3 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in50" -side 3 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in51" -side 3 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in52" -side 3 -order 4
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in53" -side 3 -order 5
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in54" -side 3 -order 6
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in55" -side 3 -order 7
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in56" -side 3 -order 8
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in57" -side 3 -order 9
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in58" -side 3 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in59" -side 3 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in60" -side 3 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in61" -side 3 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in62" -side 3 -order 14
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_in63" -side 3 -order 15
set_pad_physical_constraints   -pad_name "vdd2_r" -side 3 -order 16
set_pad_physical_constraints   -pad_name "vdd1_r" -side 3 -order 17
set_pad_physical_constraints   -pad_name "vss1_r" -side 3 -order 18
set_pad_physical_constraints   -pad_name "vss2_r" -side 3 -order 19
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in0" -side 3 -order 20
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in1" -side 3 -order 21
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in2" -side 3 -order 22
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in3" -side 3 -order 23
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in4" -side 3 -order 24
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in5" -side 3 -order 25
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in6" -side 3 -order 26
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in7" -side 3 -order 27
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in8" -side 3 -order 28
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in9" -side 3 -order 29
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_y_out" -side 3 -order 30

# Bottom side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in10" -side 4 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in11" -side 4 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in12" -side 4 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in13" -side 4 -order 4
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in14" -side 4 -order 5
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in15" -side 4 -order 6
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in16" -side 4 -order 7
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in17" -side 4 -order 8
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in18" -side 4 -order 9
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in19" -side 4 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in20" -side 4 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in21" -side 4 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in22" -side 4 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in23" -side 4 -order 14
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in24" -side 4 -order 15
set_pad_physical_constraints   -pad_name "vdd2_b" -side 4 -order 16
set_pad_physical_constraints   -pad_name "vdd1_b" -side 4 -order 17
set_pad_physical_constraints   -pad_name "vss1_b" -side 4 -order 18
set_pad_physical_constraints   -pad_name "vss2_b" -side 4 -order 19
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in25" -side 4 -order 20
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in26" -side 4 -order 21
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in27" -side 4 -order 22
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in28" -side 4 -order 23
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in29" -side 4 -order 24
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in30" -side 4 -order 25
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_in31" -side 4 -order 26
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_clk" -side 4 -order 27
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_rst" -side 4 -order 28
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_ref_read" -side 4 -order 29
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_cur_read" -side 4 -order 30



