# vcs \
# -R \
# -full64 \
# -sverilog \
# tb.sv \
# DW_sqrt.v \
# geofence.sv \
# +access+r \
# +vcs+fsdbon


vcs \
-R \
-full64 \
-sverilog \
tb.sv \
geofence_syn.v \
+access+r \
+vcs+fsdbon \
+define+SDF \
-v /usr/cad/CBDK/CBDK_IC_Contest_v2.5/Verilog/tsmc13_neg.v \
+maxdelays \
+neg_tchk