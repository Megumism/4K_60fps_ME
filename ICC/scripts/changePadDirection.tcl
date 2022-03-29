rotate_objects -mirror x [all_physical_only_cells]
rotate_objects -mirror y [all_physical_only_cells]
rotate_objects -to E CornerTL
rotate_objects -to FE CornerTR
rotate_objects -to FN CornerLR
rotate_objects -to N CornerLL
rotate_objects -mirror x [get_cells HP*]
rotate_objects -mirror y [get_cells HP*]
change_selection [get_port *]
remove_objects [get_selection ]
change_selection []
