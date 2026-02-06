vlib work
vlog *.*v* +cover -covercells 
vsim -voptargs=+acc work.tb -cover -sv_seed random
#add wave /tb/intf1/*
#do wave.do
coverage save aa.ucdb -onexit -du work.memory
run -all
coverage report -detail -cvg -comments -output SFC_cov_rprt.txt {}
# quit -sim
vcover report aa.ucdb -details -annotate -all -output CC_SVA_cov_rprt.txt
vcover report aa.ucdb -du=memory -recursive -assert -directive -cvg -codeAll -output cov_rprt_summary.txt