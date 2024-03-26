# vcs \
# -R \
# -full64 \
# -sverilog \
# testfixture3.v \
# ISE.sv \
# +access+r \
# +vcs+fsdbon

vcs \
-R \
-full64 \
-sverilog \
testfixture3.v \
ISE_syn.v \
+define+tb3 \
+access+r \
+vcs+fsdbon \
+define+SDF \
-v /usr/cad/CBDK/CBDK_IC_Contest_v2.5/Verilog/tsmc13_neg.v \
+maxdelays \
+neg_tchk
