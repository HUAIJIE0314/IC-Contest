#Read All Files
#read_file -format verilog  Bicubic.sv

set DESIGN "Bicubic"
analyze -format sverilog "Bicubic.sv"
elaborate $DESIGN
#read_file -format sverilog  Bicubic.v
current_design Bicubic
link

#Setting Clock Constraints
source -echo -verbose Bicubic.sdc
set_fix_hold                [all_clocks]
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
#set_max_area 0
#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
#compile_ultra


compile_ultra -exact_map -timing_high_effort_script
compile_ultra -area_high_effort_script -incremental
optimize_netlist -area


# set_max_dynamic_power 0
# set_max_leakage_power 0
# set_dynamic_optimization true
# 
# compile_ultra -exact_map
# #compile -area_effort high -inc
# set_clock_gating_style -pos integrated -max_fanout 4
# compile_ultra -gate_clock -inc
# compile -power_effort high -inc
# optimize_netlist -area -force




write -format ddc     -hierarchy -output "Bicubic_syn.ddc"
write_sdf -version 1.0  Bicubic_syn.sdf
write -format verilog -hierarchy -output Bicubic_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  Bicubic_syn.qor
write_parasitics -output Bicubic_syn.spef
