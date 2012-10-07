// Parametric Spool Holder for back of Replicator.

render_part=0; // all parts
//render_part=1; // spool_holder()
//render_part=2; // spool_holder_cap()
//render_part=3; // spool_holder_insert()
//render_part=4; // spool holder cap and insert

dim_delta=0.5;
rep_panel_th=6.0+dim_delta;
rep_spool_bracket_w=33.0;
rep_spool_bracket_h=34.0;
rep_spool_bracket_offset=8.0;
rep_spool_bracket_th=3.0;
rep_support_tube_d=25.4*5/8+dim_delta; // 5/8" copper pipe
rep_support_tube_id=25.4*0.55; // inner diameter of copper pipe

spool_id=30.0;
spool_od=36.0;
spool_h=92.0;
bearing_od=22.5;
bearing_id=8.0;
bearing_th=7.0;

module spool_holder(panel_th=rep_panel_th,spool_bracket_w=rep_spool_bracket_w,spool_bracket_h=rep_spool_bracket_h
	, spool_bracket_offset=rep_spool_bracket_offset,spool_bracket_th=rep_spool_bracket_th, support_tube_d=rep_support_tube_d
	, spool_id=spool_id, spool_h=spool_h, bearing_od=bearing_od, bearing_id=bearing_id, bearing_th=bearing_th
	, set_screw_d=3.0+dim_delta, set_screw_nut_w=5.5+dim_delta, set_screw_nut_h=2.4
	) {
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
      cylinder($fn=32,r1=support_tube_d/2+0.75*panel_th,r2=support_tube_d/2,h=1.5*panel_th,center=false);
      cylinder($fn=32,r=support_tube_d/2,h=spool_bracket_th+3*bearing_th,center=false);
	// set screw
	translate([0,0,panel_th+bearing_th/2+spool_bracket_th]) rotate([90,0,0]) {
	  cylinder($fn=16,r=set_screw_d/2,h=spool_id/2+spool_bracket_th,center=false);
	  translate([0,0,support_tube_d/2]) rotate([0,0,30]) intersection() {
		cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
		rotate([0,0,120]) cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
		rotate([0,0,240]) cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
	  }
	}
    }
  }
}

module spool_holder_cap(panel_th=rep_panel_th,spool_bracket_w=rep_spool_bracket_w,spool_bracket_h=rep_spool_bracket_h
	, spool_bracket_offset=rep_spool_bracket_offset,spool_bracket_th=rep_spool_bracket_th, support_tube_d=rep_support_tube_d+dim_delta
	, spool_id=spool_id, spool_h=spool_h, bearing_od=bearing_od, bearing_id=bearing_id, bearing_th=bearing_th
	, set_screw_d=3.0+dim_delta, set_screw_nut_w=5.5+dim_delta, set_screw_nut_h=2.4
	) {
  difference() {
    union() {
	minkowski() {
      translate([0,0,spool_bracket_th])  cylinder($fn=16,r=spool_id/2-spool_bracket_th,h=bearing_th+spool_bracket_th,center=false);
	  // sphere($fn=9,r=spool_bracket_th);
	  cylinder(r1=spool_bracket_th,r2=0,h=spool_bracket_th,center=true);
	}
	cylinder(r1=spool_id/2-spool_bracket_th/2,r2=spool_id/2,h=spool_bracket_th/2,center=false);
    }
    translate([0,0,-panel_th]) {
      cylinder($fn=32,r1=support_tube_d/2+0.75*panel_th,r2=support_tube_d/2,h=1.5*panel_th,center=false);
      cylinder($fn=32,r=support_tube_d/2,h=spool_bracket_th+3*bearing_th,center=false);
	// set screw
	translate([0,0,panel_th+bearing_th/2+spool_bracket_th]) rotate([90,0,0]) {
	  cylinder($fn=16,r=set_screw_d/2,h=spool_id/2+spool_bracket_th,center=false);
	  translate([0,0,support_tube_d/2]) intersection() {
		cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
		rotate([0,0,120]) cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
		rotate([0,0,240]) cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
	  }
	}
    }
  }
}

module spool_holder_insert(panel_th=rep_panel_th,spool_bracket_w=rep_spool_bracket_w,spool_bracket_h=rep_spool_bracket_h
	, spool_bracket_offset=rep_spool_bracket_offset,spool_bracket_th=rep_spool_bracket_th, support_tube_d=rep_support_tube_d, support_tube_id=rep_support_tube_id-dim_delta
	, spool_id=spool_id, spool_od=spool_od, spool_h=spool_h, bearing_od=bearing_od, bearing_id=bearing_id, bearing_th=bearing_th
	, set_screw_d=3.0+dim_delta, set_screw_nut_w=5.5+dim_delta, set_screw_nut_h=2.4
	) {
  difference() {
    union() {
	cylinder(r=spool_od/2,h=spool_bracket_th,center=false);
	hull() {
	  cylinder(r=support_tube_id/2,h=spool_bracket_th,center=false);
	  translate([0,0,bearing_th+1.5*spool_bracket_th]) cylinder(r1=support_tube_id/2,r2=support_tube_id/2-spool_bracket_th/2,h=spool_bracket_th/2,center=false);
	}
    }
    cylinder($fn=16,r=set_screw_d/2,h=2*(bearing_th+4*spool_bracket_th),center=true);
    hull() {
	cylinder($fn=12,r=set_screw_d/2,h=spool_bracket_th/2,center=false);
	translate([0,0,bearing_th+1.5*spool_bracket_th]) intersection() {
		cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
		rotate([0,0,120]) cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
		rotate([0,0,240]) cube([set_screw_nut_w,2*set_screw_nut_w,2*set_screw_nut_h],center=true);
	}
    }
    rotate([0,0,30]) {
	cube(size=[support_tube_d,set_screw_d/4,2*(bearing_th+3*spool_bracket_th)],center=true);
	rotate([0,0,60]) cube(size=[support_tube_d,set_screw_d/4,2*(bearing_th+3*spool_bracket_th)],center=true);
	rotate([0,0,-60]) cube(size=[support_tube_d,set_screw_d/4,2*(bearing_th+3*spool_bracket_th)],center=true);
    }
  }
}


if(render_part==0) {
 echo("Rendering all parts...");
 difference() {
  translate([0,0,0.5*spool_id/sqrt(2)+rep_spool_bracket_th/2]) rotate([0,90,0]) spool_holder();
  translate([0,0,-spool_id/2]) cube([2*(rep_spool_bracket_w+bearing_od),2*(rep_spool_bracket_h+bearing_od),spool_id],center=true);
  translate([0,0,0.5*spool_id/sqrt(2)+rep_spool_bracket_th/2+spool_id/2+rep_support_tube_d/2+sqrt(2)*rep_spool_bracket_th]) cube([2*(rep_spool_bracket_w+bearing_od),2*(rep_spool_bracket_h+bearing_od),spool_id],center=true);
 }
 translate([spool_id+rep_panel_th/2,0,0]) spool_holder_cap();
 translate([spool_id/2+rep_panel_th,spool_id/2+spool_od/2,0]) spool_holder_insert();
}

if(render_part==1) {
 echo("Rendering printable spool_holder()...");
 difference() {
  translate([0,0,0.5*spool_id/sqrt(2)+rep_spool_bracket_th/2]) rotate([0,90,0]) spool_holder();
  translate([0,0,-spool_id/2]) cube([2*(rep_spool_bracket_w+bearing_od),2*(rep_spool_bracket_h+bearing_od),spool_id],center=true);
  translate([0,0,0.5*spool_id/sqrt(2)+rep_spool_bracket_th/2+spool_id/2+rep_support_tube_d/2+sqrt(2)*rep_spool_bracket_th]) cube([2*(rep_spool_bracket_w+bearing_od),2*(rep_spool_bracket_h+bearing_od),spool_id],center=true);
 }
}

if(render_part==2) {
  echo("Rendering spool_holder_cap()...");
  spool_holder_cap();
}

if(render_part==3) {
  echo("Rendering spool_holder_insert()...");
  spool_holder_insert();
}

if(render_part==4) {
  echo("Rendering spool holder cap and insert...");
  translate([-(spool_id+rep_panel_th)/2,0,0]) spool_holder_cap();
  translate([(spool_id+rep_panel_th)/2,0,0]) spool_holder_insert();
}
