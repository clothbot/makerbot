// Peristaltic Planetary Gear Pump

include <MCAD/involute_gears.scad>
include <functions_and_parts.scad>

tube_od=Tygon_B_44_3_OD();
tube_id=Tygon_B_44_3_ID();
tube_min_bend_r=Tygon_B_44_3_minBR();

roller_bearing_od=Bearing_623_OD(grow=0.0);
roller_bearing_id=Bearing_623_ID(grow=0.0);
roller_bearing_th=Bearing_623_TH(grow=0.0);
roller_axle_d=3.0+1.0;
roller_bolt_head_d=5.5+1.0;
roller_count=3;

drive_bearing_od=Bearing_625_OD(grow=0.0);
drive_bearing_id=Bearing_625_ID(grow=0.0);
drive_bearing_th=Bearing_625_TH(grow=0.0);

motor_axle_d=NEMA17_shaft_d(grow=1.0);

middle_gear_bearing_od=Bearing_608_OD(grow=1.0);

gear_d=16.0;
gear_num_teeth=17;
drive_gear_thickness=4.0;
motor_gear_thickness=10.0;

bevel_dr=0.5;
gear_clearance=0.1;

render_part=1; // drive_gears
render_part=2; // roller_retainer_ring
// render_part=3; // alignment_gears
// render_part=4; // pressure rollers
// render_part=5; // outer_pressure_ring

module roller_drive_gear(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth
	, gear_thickness=drive_gear_thickness
	, gear_clearance=gear_clearance
	, bevel_dr=bevel_dr, axle_d=roller_axle_d
	, coupler_thickness=drive_gear_thickness/4
	, annotate=false
	) {
  if(annotate) {
    echo("roller_drive_gear:");
    echo(str("  gear_d=",gear_d));
    echo(str("  gear_num_teeth=",gear_num_teeth));
    echo(str("  gear_thickness=",gear_thickness));
    echo(str("  gear_clearance=",gear_clearance));
    echo(str("  bevel_dr=",bevel_dr));
    echo(str("  axle_d=",axle_d));
    echo(str("  coupler_thickness=",coupler_thickness));
  }
  $fs=0.1;
  difference() {
    intersection() {
      gear(number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circular_pitch(gear_d,gear_num_teeth)
	, gear_thickness=gear_thickness, rim_thickness=gear_thickness
	, bore_diameter=axle_d, clearance=gear_clearance/2
	, hub_thickness=0
	, hub_diameter=0
	);
      cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness,h=gear_thickness,center=false);
      cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness,h=gear_thickness,center=false);
    }
    translate([0,0,gear_thickness]) rotate([180.0,0])
      translate([0,0,-bevel_dr])
	spider_coupler( thickness=coupler_thickness+2*bevel_dr
	  , outer_d=3*gear_d/4+bevel_dr, axle_d=axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2);
  }
  translate([0,0,gear_thickness])
    spider_coupler( thickness=coupler_thickness, outer_d=3*gear_d/4, axle_d=axle_d, bevel_dr=bevel_dr, shrink=0.2);
}

module motor_drive_gear(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth
	, gear_thickness=drive_gear_thickness, coupler_thickness=drive_gear_thickness/4
	, gear_clearance=gear_clearance
	, bevel_dr=bevel_dr, axle_d=motor_axle_d
	, annotate=false
	) {
  if(annotate) {
    echo("motor_drive_gear:");
    echo(str("  gear_d=",gear_d));
    echo(str("  gear_num_teeth=",gear_num_teeth));
    echo(str("  gear_thickness=",gear_thickness));
    echo(str("  gear_clearance=",gear_clearance));
    echo(str("  bevel_dr=",bevel_dr));
    echo(str("  axle_d=",axle_d));
    echo(str("  coupler_thickness=",coupler_thickness));
  }
  $fs=0.1;
  difference() {
    intersection() {
      gear(number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circular_pitch(gear_d,gear_num_teeth)
	, gear_thickness=gear_thickness, rim_thickness=gear_thickness
	, bore_diameter=axle_d, clearance=gear_clearance/2
	, hub_thickness=0
	, hub_diameter=0
	);
      cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness,h=gear_thickness,center=false);
      cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness,h=gear_thickness,center=false);
    }
    translate([0,0,gear_thickness]) rotate([180.0,0])
      translate([0,0,-bevel_dr])
	spider_coupler( thickness=coupler_thickness+2*bevel_dr
	  , outer_d=3*gear_d/4+bevel_dr, axle_d=axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2);
  }
  translate([0,0,gear_thickness])
    spider_coupler( thickness=coupler_thickness, outer_d=3*gear_d/4, axle_d=axle_d, bevel_dr=bevel_dr, shrink=0.2);
}


module drive_gears(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_spacing=1.0
	, roller_gear_thickness=drive_gear_thickness, motor_gear_thickness=motor_gear_thickness
	, roller_axle_d=roller_axle_d, motor_axle_d=motor_axle_d
	, roller_gear_count=roller_count
	, gear_clearance=0.4
	, bevel_dr=bevel_dr
	, coupler_thickness=drive_gear_thickness/4
	, annotate=false
	) {
  if(annotate) {
    echo("drive_gears:");
    echo(str("  gear_d=",gear_d));
    echo(str("  gear_num_teeth=",gear_num_teeth));
    echo(str("  gear_spacing=",gear_spacing));
    echo(str("  roller_gear_thickness=",roller_gear_thickness));
    echo(str("  roller_axle_d=",roller_axle_d));
    echo(str("  motor_gear_thickness=",motor_gear_thickness));
    echo(str("  motor_axle_d=",motor_axle_d));
    echo(str("  roller_gear_count=",roller_gear_count));
    echo(str("  gear_clearance=",gear_clearance));
    echo(str("  bevel_dr=",bevel_dr));
    echo(str("  coupler_thickness=",coupler_thickness));
  }
  $fs=0.1;
  motor_drive_gear(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=motor_gear_thickness, gear_spacing=gear_spacing
	, axle_d=motor_axle_d, gear_clearance=gear_clearance, bevel_dr=bevel_dr, coupler_thickness=coupler_thickness, annotate=annotate
  );
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	roller_drive_gear(
	  gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=roller_gear_thickness, gear_spacing=gear_spacing
	  , axle_d=roller_axle_d, gear_clearance=gear_clearance, bevel_dr=bevel_dr, coupler_thickness=coupler_thickness, annotate=(i==0 && annotate)
	);
  }
}

if(render_part==1) {
  echo("Rendering drive_gears()...");
  drive_gears(gear_spacing=2.0, roller_axle_d=roller_axle_d, motor_axle_d=motor_axle_d,annotate=true);
}

module roller_retainer_ring(
	gear_d=gear_d, retainer_ring_th=drive_bearing_th
	, roller_bearing_od=roller_bearing_od, roller_bearing_id=roller_bearing_id, roller_bearing_th=roller_bearing_th
	, roller_bolt_head_d=roller_bolt_head_d
	, drive_bearing_od=drive_bearing_od, drive_bearing_id=drive_bearing_id, drive_bearing_th=drive_bearing_th
	, bevel_dr=bevel_dr, roller_gear_count=3
	) {
  $fs=0.1;
  difference() {
    cylinder(r=3*gear_d/2, h=drive_bearing_th,center=false);
    translate([0,0,-bevel_dr]) union() {
      cylinder(r=drive_bearing_id/2,h=2*bevel_dr+retainer_ring_th,center=false);
      cylinder(r1=drive_bearing_od/2+2*bevel_dr,r2=drive_bearing_od/2-bevel_dr,h=3*bevel_dr,center=false);
      translate([0,0,drive_bearing_th-bevel_dr]) cylinder(r1=drive_bearing_od/2-bevel_dr,r2=drive_bearing_od/2+2*bevel_dr,h=3*bevel_dr,center=false);
      cylinder(r=drive_bearing_od/2,h=drive_bearing_th+2*bevel_dr,center=false);
      for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
        rotate([0,0,rotAngle]) translate([gear_d+gear_clearance,0,0]) rotate([0,0,-2*rotAngle])
	    cylinder(r=roller_bolt_head_d/2+(roller_bearing_od-roller_bolt_head_d)/4,h=2*bevel_dr+retainer_ring_th,center=false);
      }
    }
    for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
      rotate([0,0,rotAngle]) translate([gear_d,0,retainer_ring_th-roller_bearing_th-bevel_dr]) rotate([0,0,-2*rotAngle])
	  cylinder(r=roller_bearing_od/2,h=2*bevel_dr+retainer_ring_th,center=false);
    }
  }
}

if(render_part==2) {
  echo("Rendering roller_retainer_ring()...");
  %  translate([0,0,drive_bearing_th]) motor_drive_gear(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=motor_gear_thickness
	, axle_d=motor_axle_d, gear_clearance=gear_clearance, bevel_dr=bevel_dr, coupler_thickness=drive_gear_thickness/4, annotate=false
  );
  roller_retainer_ring(gear_d=gear_d);
}
