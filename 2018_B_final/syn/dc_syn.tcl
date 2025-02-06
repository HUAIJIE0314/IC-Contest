#Read All Files

#read_file -format sverilog  RFILE.sv
#current_design RFILE

analyze -library WORK -format sverilog RFILE.sv
elaborate RFILE -architecture verilog -library WORK

link

#Setting Clock Constraints
source -echo -verbose RFILE_DC.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
#compile
#set_max_area 0


compile -map_effort high -area_effort high
#compile_ultra -inc -area_high_effort_script
#compile_ultra

set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}



write -format ddc     -hierarchy -output "RFILE_syn.ddc"
write_sdf -version 1.0  RFILE_syn.sdf
write -format verilog -hierarchy -output RFILE_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  RFILE_syn.qor
