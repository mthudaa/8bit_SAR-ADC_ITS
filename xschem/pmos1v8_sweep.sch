v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 470 -220 470 -170 {
lab=g}
N 470 -170 540 -170 {
lab=g}
N 470 -300 470 -280 {
lab=GND}
N 580 -300 580 -200 {
lab=GND}
N 580 -140 580 -100 {
lab=d}
N 580 -100 730 -100 {
lab=d}
N 730 -140 730 -100 {
lab=d}
N 730 -300 730 -200 {
lab=GND}
N 670 -220 670 -170 {
lab=b}
N 580 -170 670 -170 {
lab=b}
N 670 -300 670 -280 {
lab=GND}
N 830 -300 830 -270 {
lab=GND}
N 830 -210 830 -160 {
lab=n}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2024 H. Pretl, Apache-2.0 license (adapted from B. Murmann)"}
C {devices/launcher.sym} 240 -270 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 240 -230 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/ngspice_get_value.sym} 970 -310 0 1 {name=r2 node=@n.xm1.nsg13_lv_pmos[gds]
descr="gds="}
C {devices/ngspice_get_value.sym} 970 -340 0 1 {name=r4 node=@n.xm1.nsg13_lv_pmos[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 970 -280 0 1 {name=r5 node=v(@n.xm1.nsg13_lv_pmos[vth])
descr="vth="}
C {devices/ngspice_get_value.sym} 970 -220 0 1 {name=r6 node=@n.xm1.nsg13_lv_pmos[cgg]
descr="cgs="}
C {devices/ngspice_get_value.sym} 970 -250 0 1 {name=r7 node=v(@n.xm1.nsg13_lv_pmos[vdss])
descr="vdss(vds_sat)="}
C {devices/ngspice_get_value.sym} 970 -190 0 1 {name=r8 node=v(@n.xm1.nsg13_lv_pmos[fug])
descr="fug(f_t)="}
C {devices/ngspice_get_value.sym} 970 -160 0 1 {name=r9 node=@n.xm1.nsg13_lv_pmos[cgd]
descr="cdg="}
C {devices/ngspice_get_value.sym} 970 -100 0 1 {name=r10 node=v(@n.xm1.nsg13_lv_pmos[sid])
descr="sid="}
C {devices/ngspice_get_value.sym} 970 -130 0 1 {name=r11 node=v(@n.xm1.nsg13_lv_pmos[rg])
descr="rg="}
C {devices/gnd.sym} 580 -300 2 1 {name=l6 lab=GND}
C {devices/vsource.sym} 730 -170 0 0 {name=vd value=0.9}
C {devices/vsource.sym} 670 -250 2 1 {name=vsb value=\{vbx\}}
C {devices/vsource.sym} 470 -250 0 0 {name=vg value="0.65 AC 1"}
C {devices/gnd.sym} 470 -300 2 1 {name=l7 lab=GND}
C {devices/gnd.sym} 670 -300 2 1 {name=l8 lab=GND}
C {devices/gnd.sym} 730 -300 2 1 {name=l9 lab=GND}
C {devices/lab_wire.sym} 510 -170 0 0 {name=p4 sig_type=std_logic lab=g}
C {devices/lab_wire.sym} 650 -100 0 0 {name=p5 sig_type=std_logic lab=d}
C {devices/lab_wire.sym} 650 -170 0 1 {name=p6 sig_type=std_logic lab=b}
C {devices/ccvs.sym} 830 -240 0 0 {name=H1 vnam=vd value=1}
C {devices/gnd.sym} 830 -300 2 1 {name=l1 lab=GND}
C {devices/lab_pin.sym} 830 -170 0 0 {name=p1 sig_type=std_logic lab=n}
C {devices/code_shown.sym} 0 -1290 0 0 {name=NGSPICE_CTRL only_toplevel=true 
value="
.option sparse
.temp 27
.param wx=5 lx=0.15 vbx=0
.noise v(n) vg lin 1 1 1 1
.control
option numdgt=3
set wr_singlescale
set wr_vecnames

compose l_vec  start=0.15 stop=2 step=0.05
compose vg_vec start= 0 stop=1.8  step=25m
compose vd_vec start= 0 stop=1.8  step=25m
compose vb_vec start=0 stop=1.8 step=0.1

foreach var1 $&l_vec
  alterparam lx=$var1
  reset
  foreach var2 $&vg_vec
    alter vg $var2
    foreach var3 $&vd_vec
      alter vd $var3
      foreach var4 $&vb_vec
        alter vsb $var4
	run 
	remzerovec
	wrdata /home/mthudaa/vlsi/8bit_SAR-ADC_ITS/program/lookup_table/pmos1v8.txt noise1.all
	destroy all
	set appendwrite
	unset set wr_vecnames
      end
    end
  end
end

set appendwrite=0

alterparam lx=0.15
alterparam vbx=0
reset
op
*showmod
show
write pmos1v8.raw
.endc
"}
C {sky130_fd_pr/corner.sym} 10 -310 0 0 {name=CORNER only_toplevel=false corner=tt}
C {sky130_fd_pr/pfet_01v8.sym} 560 -170 0 0 {name=M1
L=\{lx\}
W=\{wx\}
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/code_shown.sym} 1040 -890 0 0 {name=NGSPICE_SAVE1 only_toplevel=true 
value="
.save b d g n
.save @m.xm1.msky130_fd_pr__pfet_01v8[cgso]
.save @m.xm1.msky130_fd_pr__pfet_01v8[cgdo]
.save @m.xm1.msky130_fd_pr__pfet_01v8[cdd]
.save @m.xm1.msky130_fd_pr__pfet_01v8[cgb]
.save @m.xm1.msky130_fd_pr__pfet_01v8[cgd]
.save @m.xm1.msky130_fd_pr__pfet_01v8[cgg]
.save @m.xm1.msky130_fd_pr__pfet_01v8[cgs]
.save @m.xm1.msky130_fd_pr__pfet_01v8[css]
.save @m.xm1.msky130_fd_pr__pfet_01v8[gds]
.save @m.xm1.msky130_fd_pr__pfet_01v8[gm]
.save @m.xm1.msky130_fd_pr__pfet_01v8[gmbs]
.save @m.xm1.msky130_fd_pr__pfet_01v8[id]
.save @m.xm1.msky130_fd_pr__pfet_01v8[l]
.save @m.xm1.msky130_fd_pr__pfet_01v8[vgs]
.save @m.xm1.msky130_fd_pr__pfet_01v8[vds]
.save @m.xm1.msky130_fd_pr__pfet_01v8[vbs]
.save @m.xm1.msky130_fd_pr__pfet_01v8[vth]
.save @m.xm1.msky130_fd_pr__pfet_01v8[vdsat]
"}
