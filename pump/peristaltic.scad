// Printable Peristaltic Pump

use <parts.scad>

function PumpRotor_OD()=50.0;

module PumpRotor(
	od=PumpRotor_OD()
	, id=6.0
	, br=PumpRotor_OD()/2+Tygon_B_44_3_OD()-Tygon_B_44_3_ID()-Bearing_623_OD()/2
	, phase_n=3
	, bearing_od=Bearing_623_OD()
	, bearing_id=Bearing_623_ID()
	, bearing_th=Bearing_623_TH()
	, wall_th=2.0
	) {
  
  difference() {
    union() {
	cylinder($fa=15,$fs=0.1,r=od/2, h=phase_n*bearing_th+2*wall_th,center=false);
	cylinder($fa=15,$fs=0.1,r1=od/2+wall_th,r2=od/2,h=wall_th,center=false);
	translate([0,0,wall_th+phase_n*bearing_th])
	  cylinder($fa=15,$fs=0.1,r2=od/2+wall_th,r1=od/2,h=wall_th,center=false);
    }
    translate([0,0,-0.1]) cylinder($fa=30,$fs=0.1,r=id/2, h=0.2+phase_n*bearing_th+2*wall_th,center=false);
    for(i=[0:phase_n-1]) assign(rotAngle=360*i/phase_n,
	bz=wall_th+i*bearing_th) {
      rotate([0,0,rotAngle]) {
	  translate([br,0,bz]) cylinder($fa=15,$fs=0.1,r=bearing_od/2,h=bearing_th,center=false);
	  translate([br,0,-0.1]) cylinder($fa=30,$fs=0.1,r=bearing_id/2,h=0.2+phase_n*bearing_th+2*wall_th,center=false);
	 }
      rotate([0,0,rotAngle]) {
	  translate([-br,0,bz]) cylinder($fa=15,$fs=0.1,r=bearing_od/2,h=bearing_th,center=false);
	  translate([-br,0,-0.1]) cylinder($fa=30,$fs=0.1,r=bearing_id/2,h=0.2+phase_n*bearing_th+2*wall_th,center=false);
	 }
    }
  }
}

PumpRotor();
