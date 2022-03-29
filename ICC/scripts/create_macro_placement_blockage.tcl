###########################################################################
# Set placement blockage around each macro to avoid standard cells 
# to be placed too close to the macro and prevent DRC violations
###########################################################################

set am [all_macro_cells]
set sp 2
foreach_in_col m $am {
    ## get the position of a macro cell
    set lbx [lindex [lindex [get_attribute [get_object_name $m] bbox] 0] 0]
    set lby [lindex [lindex [get_attribute [get_object_name $m] bbox] 0] 1]
    set rtx [lindex [lindex [get_attribute [get_object_name $m] bbox] 1] 0]
    set rty [lindex [lindex [get_attribute [get_object_name $m] bbox] 1] 1]
    eval "create_placement_blockage -bbox {[expr $lbx - $sp] [expr $lby - $sp] [expr $rtx + $sp] [expr $rty + $sp]}"
    #eval "create_routing_blockage -bbox {[expr $lbx - $sp] [expr $lby - $sp] [expr $rtx + $sp] [expr $rty + $sp]}  -layers {metal3Blockage metal2Blockage metal1Blockage via2Blockage via1Blockage}"
    #eval "create_route_guide -coordinate {[expr $lbx - $sp] [expr $lby - $sp] [expr $rtx + $sp] [expr $rty + $sp]} -no_signal_layers {M1 M2 M3}"
}

