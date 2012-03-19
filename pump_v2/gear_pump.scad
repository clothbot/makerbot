// Peristaltic Planetary Gear Pump

include <MCAD/involute_gears.scad>

render_part=0; // full_assembly
// render_part=1; // drive_gears
// render_part=2; // alignment_gears
// render_part=3; // pressure_rollers
 render_part=4; // outer_pressure_ring

module spider_coupler(
	thickness=5.0
	, outer_d=12.0
	, axle_d=3.0
	, bevel_dr=0.5
	, shrink=0.2
	) {
  intersection() {
    union() {
      cylinder(r=outer_d/2,h=thickness-bevel_dr,center=false);
      translate([0,0,thickness-bevel_dr])
        cylinder(r1=outer_d/2,r2=outer_d/2-bevel_dr,h=bevel_dr,center=false);
    }
    difference() {
      union() {
	  translate([shrink,shrink])
		cube(size=[outer_d/2-shrink,outer_d/2-shrink,thickness],center=false);
	  rotate([0,0,180]) translate([shrink,shrink,0])
		cube(size=[outer_d/2-shrink,outer_d/2-shrink,thickness],center=false);
	 }
	 union() {
	  translate([0,0,-bevel_dr]) cylinder(r=axle_d/2,h=thickness+2*bevel_dr,center=false);
	  translate([0,0,thickness-bevel_dr])  cylinder(r2=axle_d/2+2*bevel_dr,r1=axle_d/2,h=2*bevel_dr,center=false);
	  translate([0,0,thickness]) rotate([45,0,0]) cube(size=[outer_d,2*bevel_dr,2*bevel_dr],center=true);
	  translate([0,0,thickness]) rotate([45,0,90]) cube(size=[outer_d,2*bevel_dr,2*bevel_dr],center=true);
	 }
    }
  }
}

module roller_drive_gear(
	gear_d=20.0, gear_num_teeth=17, gear_spacing=1.0
	, roller_gear_thickness=10.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=15.0, motor_gear_hub_thickness=17.0
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=3.0, motor_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  difference() {
    intersection() {
	gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=roller_gear_thickness, rim_thickness=roller_gear_thickness
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=roller_gear_hub_d
		);
	cylinder(r1=gear_d/2,r2=gear_d/2+roller_gear_thickness,h=roller_gear_thickness,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+roller_gear_thickness,h=roller_gear_thickness,center=false);
    }
    translate([0,0,gear_thickness+bevel_dr]) rotate([180,0,0])
	    translate([0,0,-bevel_dr]) spider_coupler( thickness=(roller_gear_hub_thickness-roller_gear_thickness)/2+2*bevel_dr
		, outer_d=gear_hub_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
  translate([0,0,gear_thickness]) 
	  spider_coupler( thickness=(roller_gear_hub_thickness-roller_gear_thickness)/2
		, outer_d=gear_hub_d, axle_d=roller_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
}

module drive_gears(
	gear_d=20.0, gear_num_teeth=17, gear_spacing=1.0
	, roller_gear_thickness=10.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=15.0, motor_gear_hub_thickness=17.0
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=3.0, motor_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5, bevel_dr=0.5
	) {
  $fs=0.1;
  // Motor gear at center
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  intersection() {
    gear(number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circular_pitch
	, gear_thickness=motor_gear_thickness, rim_thickness=motor_gear_thickness
	, bore_diameter=motor_axle_d
	, clearance=gear_clearance/2
	, hub_thickness=motor_gear_hub_thickness
	, hub_diameter=motor_gear_hub_d
	);
    cylinder(r1=gear_d/2,r2=gear_d/2+motor_gear_hub_thickness,h=motor_gear_hub_thickness,center=false);
//    cylinder(r2=gear_d/2,r1=gear_d/2+motor_gear_thickness,h=motor_gear_thickness,center=false);
  }
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  roller_drive_gear(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=roller_gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=roller_gear_hub_thickness, gear_hub_d=roller_gear_hub_d, roller_axle_d=roller_axle_d
		, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
	  );

  }
}

if(render_part==1) {
  echo("Rendering drive_gears()...");
  drive_gears(gear_spacing=2.0);
}

module alignment_gear_middle(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0, gear_spacing=1.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0, middle_axle_d=5.0
	, gear_clearance=0.4, twist_ratio=0.5, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  union() {
    intersection() {
	gear(number_of_teeth=gear_num_teeth
	  , circular_pitch=gear_circular_pitch
	  , gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
	  , bore_diameter=middle_axle_d
	  , clearance=gear_clearance/2
	  , hub_thickness=0
	  , hub_diameter=gear_hub_d
	  , twist=twist_ratio*180/gear_num_teeth
	  );
	cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
    }
    translate([0,0,gear_thickness/2]) rotate([0,0,-twist_ratio*180/gear_num_teeth]) difference() {
	intersection() {
	  gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=middle_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=-twist_ratio*180/gear_num_teeth
		);
	  cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	  cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	}
	  translate([0,0,gear_thickness/2]) rotate([180,0,twist_ratio*180/gear_num_teeth])
	    translate([0,0,-bevel_dr]) spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2+2*bevel_dr
		, outer_d=gear_hub_d+2*bevel_dr, axle_d=middle_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
	}
	translate([0,0,gear_thickness]) 
	  spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2
		, outer_d=gear_hub_d, axle_d=middle_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
  }
}

module alignment_gear_roller(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0, gear_spacing=1.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0
	, roller_axle_d=3.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5
	, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  intersection() {
	gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=-twist_ratio*180/gear_num_teeth
		);
	cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
  }
  translate([0,0,gear_thickness/2]) rotate([0,0,twist_ratio*180/gear_num_teeth]) difference() {
    intersection() {
	  gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=twist_ratio*180/gear_num_teeth
	  );
	cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
    }
    translate([0,0,gear_thickness/2]) rotate([180,0,-twist_ratio*180/gear_num_teeth])
      translate([0,0,-bevel_dr]) spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2+2*bevel_dr
		, outer_d=gear_hub_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
	translate([0,0,gear_thickness]) 
	  spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2
		, outer_d=gear_hub_d, axle_d=roller_axle_d, bevel_dr=bevel_dr );
}

module alignment_gears(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0, gear_spacing=1.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0
	, roller_axle_d=3.0, middle_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5
	, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  // Motor gear at center
  alignment_gear_middle(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=gear_thickness, gear_spacing=gear_spacing
	, gear_hub_thickness=gear_hub_thickness, gear_hub_d=gear_hub_d, middle_axle_d=middle_axle_d
	, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
	);
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  alignment_gear_roller(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=gear_hub_thickness, gear_hub_d=gear_hub_d, roller_axle_d=roller_axle_d
		, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
	  );
  }
}

if(render_part==2) {
  echo("Rendering alignment_gears()...");
  alignment_gears(gear_spacing=2.0);
}

module pressure_roller(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, bevel_dr=0.5
	) {
  $fs=0.1;
  difference() {
    union() {
	cylinder(r=roller_max_d/2,h=roller_shield_thickness,center=false);
	translate([0,0,roller_shield_thickness])
	  cylinder(r1=roller_max_d/2,r2=roller_min_d/2,h=roller_thickness,center=false);
	translate([0,0,roller_shield_thickness+roller_thickness])
	  cylinder(r=roller_min_d/2,h=roller_shield_thickness,center=false);
//	translate([0,0,roller_shield_thickness+roller_thickness+(roller_shield_d/2-roller_min_d/2)])
//	  cylinder(r=roller_shield_d/2,h=roller_shield_thickness-(roller_shield_d/2-roller_min_d/2),center=false);
	translate([0,0,2*roller_shield_thickness+roller_thickness])
	  spider_coupler( thickness=roller_coupler_thickness/2
		, outer_d=roller_coupler_d, axle_d=roller_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
    }
    translate([0,0,-bevel_dr]) cylinder(r=roller_axle_d/2
	,h=2*bevel_dr+2*roller_shield_thickness+roller_thickness,center=false);
    translate([0,0,-bevel_dr]) spider_coupler( thickness=roller_coupler_thickness/2+2*bevel_dr
		, outer_d=roller_coupler_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
    translate([0,0,2*roller_shield_thickness+roller_thickness+bevel_dr]) rotate([180,0,0])
	  spider_coupler( thickness=roller_coupler_thickness/2+2*bevel_dr
		, outer_d=roller_coupler_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
}

module pump_pressure_rollers(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	) {
  $fs=0.1;
  for(i=[0:pressure_roller_count-1]) assign( rotAngle=360*i/pressure_roller_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  pressure_roller(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
	  );
  }
}

if(render_part==3) {
  echo("Rendering pump_pressure_rollers()...");
  pump_pressure_rollers(gear_spacing=2.0);
}

function Tygon_B_44_3_OD()=25.4*3/16; // Outer Diameter
function Tygon_B_44_3_ID()=25.4*1/16; // Inner Diameter
function Tygon_B_44_3_WT()=25.4*1/16; // Wall Thickness
function Tygon_B_44_3_minBR()=25.4*1/8; // minimum Bend Radius

module outer_pressure_ring(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	) {
  $fs=0.1;
  difference() {
    cylinder(r=gear_d+roller_shield_d,h=roller_thickness/8,center=false);
    translate([0,0,-bevel_dr]) cylinder(r=gear_d+roller_min_d/2+bevel_dr,h=roller_thickness/8+2*bevel_dr,center=false);
  }
  translate([0,0,roller_thickness/8]) difference() {
    cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness,center=false);
    translate([0,0,-bevel_dr]) cylinder(r=gear_d+roller_min_d/2+bevel_dr,h=roller_thickness+2*bevel_dr,center=false);
    cylinder(r1=gear_d+roller_min_d/2+tube_outer_d-tube_inner_d,r2=gear_d+roller_max_d/2+tube_outer_d-tube_inner_d,h=roller_thickness,center=false);
    translate([0,0,roller_thickness-bevel_dr]) cylinder(r=gear_d+roller_max_d/2+2*bevel_dr,h=2*bevel_dr,center=false);
  }
  translate([0,0,9*roller_thickness/8]) difference() {
    cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness/4,center=false);
    translate([0,0,-bevel_dr]) cylinder(r=gear_d+roller_max_d/2+2*bevel_dr,h=roller_thickness/4+2*bevel_dr,center=false);
  }
}

if(render_part==4) {
  echo("Rendering outer_pressure_ring()...");
  translate([0,0,23]) rotate([180,0,0]) pump_pressure_rollers(gear_spacing=0.0);
  outer_pressure_ring(gear_spacing=0.0);
}


if(render_part==0) {
  echo("Rendering full assembly...");
  drive_gears(gear_spacing=0.0);
  translate([0,0,13]) pump_pressure_rollers(gear_spacing=0.0);
  translate([0,0,30]) rotate([180,0,0]) outer_pressure_ring(gear_spacing=0.0);
  translate([0,0,50]) rotate([180,0,0]) alignment_gears(gear_spacing=0.0);
}
