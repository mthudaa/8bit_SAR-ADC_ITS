** sch_path: /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/xschem/x10b_cap_array.sch
.subckt x10b_cap_array vcm sw[0] sw[1] sw[2] sw[3] sw[4] sw[5] sw[6] sw[7] sw[8] sw[9] vc
*.PININFO sw[0:9]:I vcm:I vc:B
XC3 vc sw[2] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=128
XC4 vc sw[3] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=64
XC5 vc sw[4] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=32
XC6 vc sw[5] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=16
XC7 vc sw[6] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=8
XC8 vc sw[7] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=4
XC9 vc sw[8] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=2
XC10 vc sw[9] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=1
XC11 vc vcm sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=1
XC1 vc sw[0] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=512
XC2 vc sw[1] sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=256
XC12 net1 net2 sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=98
* noconn #net1
* noconn #net2
.ends
.end
