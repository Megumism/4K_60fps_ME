###################################################################

# Created by write_sdc on Fri Apr  8 10:41:26 2022

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_wire_load_mode segmented
set_max_fanout 32 [current_design]
set_max_transition 3 [current_design]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports clk]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports rst]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[63]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[62]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[61]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[60]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[59]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[58]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[57]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[56]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[55]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[54]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[53]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[52]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[51]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[50]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[49]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[48]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[47]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[46]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[45]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[44]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[43]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[42]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[41]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[40]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[39]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[38]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[37]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[36]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[35]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[34]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[33]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[32]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[31]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[30]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[29]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[28]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[27]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[26]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[25]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[24]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[23]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[22]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[21]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[20]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[19]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[18]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[17]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[16]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[15]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[14]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[13]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[12]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[11]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[10]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[9]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[8]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[7]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[6]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[5]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[4]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[3]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[2]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[1]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {ref_in[0]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[31]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[30]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[29]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[28]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[27]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[26]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[25]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[24]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[23]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[22]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[21]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[20]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[19]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[18]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[17]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[16]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[15]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[14]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[13]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[12]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[11]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[10]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[9]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[8]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[7]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[6]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[5]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[4]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[3]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[2]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[1]}]
set_driving_cell -lib_cell HPDWUW1416DGP -pin PAD [get_ports {cur_in[0]}]
set_load -pin_load 1.4272 [get_ports ref_read]
set_load -pin_load 1.4272 [get_ports cur_read]
set_load -pin_load 1.4272 [get_ports sad_out]
set_load -pin_load 1.4272 [get_ports x_out]
set_load -pin_load 1.4272 [get_ports y_out]
set_load -pin_load 1.4272 [get_ports sign_sad]
set_ideal_network [get_ports clk]
set_ideal_network [get_ports rst]
create_clock [get_ports clk]  -period 5.08  -waveform {0 2.54}
set_clock_latency 2  [get_clocks clk]
set_clock_latency -source 4  [get_clocks clk]
set_clock_uncertainty 0.25  [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
set_clock_transition -min -rise 0.1 [get_clocks clk]
set_clock_transition -min -fall 0.1 [get_clocks clk]
set_input_delay -clock clk  -max 2.5  [get_ports rst]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[63]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[62]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[61]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[60]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[59]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[58]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[57]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[56]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[55]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[54]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[53]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[52]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[51]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[50]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[49]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[48]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[47]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[46]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[45]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[44]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[43]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[42]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[41]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[40]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[39]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[38]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[37]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[36]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[35]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[34]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[33]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[32]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[31]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[30]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[29]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[28]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[27]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[26]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[25]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[24]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[23]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[22]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[21]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[20]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[19]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[18]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[17]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[16]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[15]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[14]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[13]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[12]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[11]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[10]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[9]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[8]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[7]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[6]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[5]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[4]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[3]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[2]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[1]}]
set_input_delay -clock clk  -max 2.5  [get_ports {ref_in[0]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[31]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[30]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[29]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[28]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[27]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[26]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[25]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[24]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[23]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[22]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[21]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[20]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[19]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[18]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[17]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[16]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[15]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[14]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[13]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[12]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[11]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[10]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[9]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[8]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[7]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[6]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[5]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[4]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[3]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[2]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[1]}]
set_input_delay -clock clk  -max 2.5  [get_ports {cur_in[0]}]
set_output_delay -clock clk  -max 2.5  [get_ports ref_read]
set_output_delay -clock clk  -max 2.5  [get_ports cur_read]
set_output_delay -clock clk  -max 2.5  [get_ports sad_out]
set_output_delay -clock clk  -max 2.5  [get_ports x_out]
set_output_delay -clock clk  -max 2.5  [get_ports y_out]
set_output_delay -clock clk  -max 2.5  [get_ports sign_sad]
