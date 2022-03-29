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
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_start" -side 1 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_mode0" -side 1 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_mode1" -side 1 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din0" -side 1 -order 5
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din1" -side 1 -order 6
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din2" -side 1 -order 7
set_pad_physical_constraints   -pad_name "vdd2_l" -side 1 -order 8
set_pad_physical_constraints   -pad_name "vdd1_l" -side 1 -order 9
set_pad_physical_constraints   -pad_name "vss1_l" -side 1 -order 10
set_pad_physical_constraints   -pad_name "vss2_l" -side 1 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din3" -side 1 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din4" -side 1 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din5" -side 1 -order 14
set_pad_physical_constraints   -pad_name "HPMAC2PFC_inst" -side 1 -order 15

# Top side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din6" -side 2 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din7" -side 2 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din8" -side 2 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din9" -side 2 -order 4
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din10" -side 2 -order 5
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din11" -side 2 -order 6
set_pad_physical_constraints   -pad_name "vdd2_t" -side 2 -order 7
set_pad_physical_constraints   -pad_name "vdd1_t" -side 2 -order 8
set_pad_physical_constraints   -pad_name "vss1_t" -side 2 -order 9
set_pad_physical_constraints   -pad_name "vss2_t" -side 2 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din12" -side 2 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din13" -side 2 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din14" -side 2 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_din15" -side 2 -order 14

# Right side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout0" -side 3 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout1" -side 3 -order 2
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout2" -side 3 -order 3
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout3" -side 3 -order 4
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout4" -side 3 -order 5
set_pad_physical_constraints   -pad_name "vdd2_r" -side 3 -order 6
set_pad_physical_constraints   -pad_name "vdd1_r" -side 3 -order 7
set_pad_physical_constraints   -pad_name "vss1_r" -side 3 -order 8
set_pad_physical_constraints   -pad_name "vss2_r" -side 3 -order 9
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout5" -side 3 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout6" -side 3 -order 11
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout7" -side 3 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout8" -side 3 -order 13
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout9" -side 3 -order 14

# Bottom side
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout10" -side 4 -order 1
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout11" -side 4 -order 2
set_pad_physical_constraints   -pad_name "vdd2_b" -side 4 -order 3
set_pad_physical_constraints   -pad_name "vdd1_b" -side 4 -order 4
set_pad_physical_constraints   -pad_name "vss1_b" -side 4 -order 5
set_pad_physical_constraints   -pad_name "vss2_b" -side 4 -order 6
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout12" -side 4 -order 7
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout13" -side 4 -order 8
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout14" -side 4 -order 9
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_dout15" -side 4 -order 10
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_clk" -side 4 -order 12
set_pad_physical_constraints   -pad_name "HPDWUW1416DGP_rstn" -side 4 -order 13
