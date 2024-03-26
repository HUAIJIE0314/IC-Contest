# Read all Files
#read_verilog ISE.v
read_file -format sverilog ISE.sv
current_design ISE
link

# Setting Clock Constraits
source -echo -verbose ISE_DC.sdc

# Synthesis all design
set_max_area 0
compile -map_effort high -area_effort high
#compile_ultra -inc -area_high_effort_script

write -format ddc  -hierarchy -output "ISE_syn.ddc"
write_sdf ISE_syn.sdf
write_file -format verilog -hierarchy -output ISE_syn.v
report_area > area.log
report_timing > timing.log
report_qor > ISE_syn.qor

