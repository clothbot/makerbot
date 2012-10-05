// Parametric Spool Holder for back of Replicator.

rep_panel_th=6.0;
rep_spool_bracket_w=33.0;
rep_spool_bracket_h=34.0;
rep_spool_bracket_offset=8.0;
rep_spool_bracket_th=3.0;
rep_support_tube_d=25.4*5/8; // 5/8" copper pipe

spool_id=32.0;
spool_h=92.0;
bearing_od=22.5;
bearing_id=8.0;
bearing_th=7.0;

module spool_holder(panel_th=rep_panel_th,spool_bracket_w=rep_spool_bracket_w,spool_bracket_h=rep_spool_bracket_h
	, spool_bracket_offset=rep_spool_bracket_offset,spool_bracket_th=rep_spool_bracket_th, support_tube_d=rep_support_tube_d
	, spool_id=spool_id, spool_h=spool_h, bearing_od=bearing_od, bearing_id=bearing_id, bearing_th=bearing_th) {
  difference() {
    union() {
      translate([-spool_bracket_w/2,spool_id/2-spool_bracket_offset,-panel_th-spool_bracket_th]) cube([spool_bracket_w,spool_bracket_h,spool_bracket_th],center=false);
      translate([-spool_bracket_w/2,spool_id/2,-panel_th-spool_bracket_th])
	  cube([spool_bracket_w,spool_bracket_th,panel_th+2*spool_bracket_th],center=false);
      translate([-spool_bracket_w/2,-spool_bracket_h/2,0]) cube([spool_bracket_w,spool_bracket_h+2*spool_bracket_th,spool_bracket_th],center=false);
      minkowski() {
	  translate([0,0,spool_bracket_th])  cylinder($fn=16,r=spool_id/2-spool_bracket_th,h=bearing_th+spool_bracket_th,center=false);
	  // sphere($fn=9,r=spool_bracket_th);
	  cylinder(r1=spool_bracket_th,r2=0,h=spool_bracket_th,center=true);
      }
    }
    translate([0,0,-panel_th]) {
      cylinder($fn=32,r1=support_tube_d/2+panel_th/2,r2=support_tube_d/2,h=2*panel_th,center=false);
      cylinder($fn=32,r=support_tube_d/2,h=spool_bracket_th+3*bearing_th,center=false);
    }
  }
}

module spool_holder_cap(panel_th=rep_panel_th,spool_bracket_w=rep_spool_bracket_w,spool_bracket_h=rep_spool_bracket_h
	, spool_bracket_offset=rep_spool_bracket_offset,spool_bracket_th=rep_spool_bracket_th, support_tube_d=rep_support_tube_d
	, spool_id=spool_id, spool_h=spool_h, bearing_od=bearing_od, bearing_id=bearing_id, bearing_th=bearing_th) {
  difference() {
    union() {
	minkowski() {
      translate([0,0,spool_bracket_th])  cylinder($fn=16,r=spool_id/2-spool_bracket_th,h=bearing_th+spool_bracket_th,center=false);
	  // sphere($fn=9,r=spool_bracket_th);
	  cylinder(r1=spool_bracket_th,r2=0,h=spool_bracket_th,center=true);
	}
	cylinder(r=spool_id/2+panel_th/2,h=spool_bracket_th,center=false);
    }
    translate([0,0,-panel_th]) {
      cylinder($fn=32,r1=support_tube_d/2+panel_th/2,r2=support_tube_d/2,h=2*panel_th,center=false);
      cylinder($fn=32,r=support_tube_d/2,h=spool_bracket_th+3*bearing_th,center=false);
    }
  }
}


difference() {
  translate([0,0,0.5*spool_id/sqrt(2)+rep_spool_bracket_th/2]) rotate([0,90,0]) spool_holder();
  translate([0,0,-spool_id/2]) cube([2*(rep_spool_bracket_w+bearing_od),2*(rep_spool_bracket_h+bearing_od),spool_id],center=true);
}

translate([spool_id+rep_panel_th/2,0,0]) spool_holder_cap();
