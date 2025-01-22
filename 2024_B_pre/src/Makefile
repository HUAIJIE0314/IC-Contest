design_name = ed25519



verdi: | $(bld_dir)
	verdi -ssf $(design_name).fsdb &

rtl: | clean
	vcs \
	-R \
	-full64 \
	-sverilog \
	tb2.sv \
	Bicubic.sv \
	-v ImgROM.v \
	-v ResultSRAM.v \
	+access+r \
	+vcs+fsdbon \
	+fsdb+mda \
	+fsdbfile+Bicubic.fsdb

syn:
	vcs \
	-R \
	-full64 \
	-sverilog \
	tb2.sv \
	Bicubic_syn.v \
	-v ImgROM.v \
	-v ResultSRAM.v \
	-v /home/raid7_2/course/cvsd/CBDK_IC_Contest/CIC/Verilog/tsmc13_neg.v \
	+define+SDF \
	+access+r \
	+vcs+fsdbon \
	+fsdb+mda \
	+fsdbfile+Bicubic.fsdb +maxdelays +neg_tchk


synthesis:
	dcnxt_shell -f dc_syn.tcl

power:
	pt_shell -f ./pt_script.tcl

lint:
	spyglass -tcl lint.tcl &


clean:
	rm -rf *.history *.log *.fsdb; \
	rm -rf simv* novas*; \
	rm -rf csrc ucli.key vc_hdrs.h BSSLib.lib++; \
	rm -rf nWaveLog verdiLog; \
	rm -rf spyglass-1 build; \

