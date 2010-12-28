// Printable Peristaltic Pump

// render_part=1; // PumpRotor()
render_part=2; // MarblePumpRotor()

use <parts.scad>

function PumpRotor_OD()=50.0;

module PumpRotor(
	od=PumpRotor_OD()
	, id=6.0
	, br=PumpRotor_OD()/2+Tygon_B_44_3_OD()-Tygon_B_44_3_ID()-Bearing_623_OD()/2
	, phase_n=3
	, bearing_od=Bearing_623_OD()
	, bearing_od_err=0.2
	, bearing_id=Bearing_623_ID()
	, bearing_id_err=0.2
	, bearing_th=Bearing_623_TH()
	, bearing_th_err=0.2
	, washer_th=0.5
	, washer_od=7.0
	, washer_id=3.2
	, wall_th=2.0
	) {
  
  difference() {
    union() {
	cylinder($fa=15,$fs=0.1,r=od/2, h=phase_n*(bearing_th+washer_th)+washer_th+2*wall_th,center=false);
	cylinder($fa=15,$fs=0.1,r1=od/2+wall_th,r2=od/2,h=wall_th,center=false);
	translate([0,0,wall_th+phase_n*(bearing_th+washer_th)+washer_th])
	  cylinder($fa=15,$fs=0.1,r2=od/2+wall_th,r1=od/2,h=wall_th,center=false);
    }
    translate([0,0,-0.1]) cylinder($fa=30,$fs=0.1,r=id/2, h=0.2+phase_n*(bearing_th+washer_th)+washer_th+2*wall_th,center=false);
    for(i=[0:phase_n-1]) assign(rotAngle=360*i/phase_n,
	bz=wall_th+i*(bearing_th+washer_th)+washer_th) {
      rotate([0,0,rotAngle]) {
	  translate([br,0,bz-washer_th]) cylinder($fa=15,$fs=0.1,r=washer_od/2,h=2*washer_th,center=false);
	  translate([br,0,bz-bearing_th_err/2]) cylinder($fa=15,$fs=0.1,r=bearing_od/2+bearing_od_err,h=bearing_th+bearing_th_err,center=false);
	  translate([br,0,bz+bearing_th+bearing_th_err-washer_th]) cylinder($fa=15,$fs=0.1,r=washer_od/2,h=2*washer_th,center=false);
	  translate([br,0,-0.1]) cylinder($fa=30,$fs=0.1,r=bearing_id/2,h=0.2+phase_n*(bearing_th+washer_th)+washer_th+2*wall_th,center=false);
	  rotate([0,0,90/phase_n]) translate([2*br/3,0,-0.1]) cylinder($fa=30,$fs=0.1,r=bearing_od/2,h=0.2+phase_n*(bearing_th+washer_th)+washer_th+2*wall_th,center=false);
	 }
      rotate([0,0,rotAngle]) {
	  translate([-br,0,bz-washer_th]) cylinder($fa=15,$fs=0.1,r=washer_od/2,h=2*washer_th,center=false);
	  translate([-br,0,bz-bearing_th_err/2]) cylinder($fa=15,$fs=0.1,r=bearing_od/2+bearing_od_err,h=bearing_th+bearing_th_err,center=false);
	  translate([-br,0,bz+bearing_th-washer_th]) cylinder($fa=15,$fs=0.1,r=washer_od/2,h=2*washer_th,center=false);
	  translate([-br,0,-0.1]) cylinder($fa=30,$fs=0.1,r=bearing_id/2,h=0.2+phase_n*(bearing_th+washer_th)+washer_th+2*wall_th,center=false);
	  rotate([0,0,90/phase_n]) translate([-2*br/3,0,-0.1]) cylinder($fa=30,$fs=0.1,r=bearing_od/2,h=0.2+phase_n*(bearing_th+washer_th)+washer_th+2*wall_th,center=false);
	 }
    }
  }
}

module MarblePumpRotor()

if(render_part==1) {
  echo("Rendering PumpRotor()...");
  PumpRotor();
}

if(render_part==2) {
  echo("Rendering MarblePumpRotor()...");
  MarblePumpRotor();
}
