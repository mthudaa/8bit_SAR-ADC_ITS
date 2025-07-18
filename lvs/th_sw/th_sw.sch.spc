** sch_path: /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/xschem/th_sw.sch
.subckt th_sw VDD VSS CK CKB IN OUT
*.PININFO VDD:I VSS:I CK:I CKB:I IN:I OUT:O
x1 VSS CK VGS IN OUT th_sw_main
x2 VDD VSS CK CKB IN VGS bootstrap
.ends

* expanding   symbol:  th_sw_main.sym # of pins=5
** sym_path: /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/xschem/th_sw_main.sym
** sch_path: /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/xschem/th_sw_main.sch
.subckt th_sw_main VSS CK VGS IN OUT
*.PININFO VSS:I CK:I VGS:I IN:I OUT:O
XM10 IN CK IN VSS sky130_fd_pr__nfet_01v8 L=0.15 W=20 nf=1 m=1
XM11 OUT VGS IN VSS sky130_fd_pr__nfet_01v8 L=0.15 W=20 nf=1 m=1
XM12 OUT CK OUT VSS sky130_fd_pr__nfet_01v8 L=0.15 W=20 nf=1 m=1
.ends


* expanding   symbol:  bootstrap.sym # of pins=6
** sym_path: /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/xschem/bootstrap.sym
** sch_path: /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/xschem/bootstrap.sch
.subckt bootstrap VDD VSS CK CKB IN VGS
*.PININFO VDD:I VSS:I CK:I CKB:I IN:I VGS:O
XM1 net1 CKB VDD VDD sky130_fd_pr__pfet_01v8 L=0.15 W=0.75 nf=1 m=1
XM2 net2 VGS VDD net2 sky130_fd_pr__pfet_01v8 L=0.15 W=4 nf=1 m=1
XM3 VGS net1 net2 net2 sky130_fd_pr__pfet_01v8 L=0.15 W=2 nf=1 m=1
XM4 net1 CKB net4 VSS sky130_fd_pr__nfet_01v8 L=0.15 W=0.5 nf=1 m=1
XM5 net4 CK VSS VSS sky130_fd_pr__nfet_01v8 L=0.15 W=2 nf=1 m=1
XM6 net1 VGS net4 VSS sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 m=1
XM7 IN VGS net4 VSS sky130_fd_pr__nfet_01v8 L=0.15 W=4 nf=1 m=1
XM8 VGS VDD net3 VSS sky130_fd_pr__nfet_01v8 L=0.15 W=7.5 nf=1 m=1
XM9 net3 CK VSS VSS sky130_fd_pr__nfet_01v8 L=0.15 W=7.5 nf=1 m=1
XC1 net2 net4 sky130_fd_pr__cap_mim_m3_1 W=4 L=4 m=32
.ends

.end
