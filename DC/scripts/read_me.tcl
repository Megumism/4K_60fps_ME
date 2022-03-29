analyze -format verilog ../rtl/ME/pe.v
analyze -format verilog ../rtl/ME/sad.v

analyze -format verilog ../rtl/ME/compare_tree.v

analyze -format verilog ../rtl/ME/core.v
elaborate core
