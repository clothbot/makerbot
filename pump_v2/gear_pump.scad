// Peristaltic Planetary Gear Pump

include <MCAD/involute_gears.scad>

// render_part=1; // drive_gears
render_part=2; // alignment_gears

module drive_gears(
	gear_d=20.0, gear_num_teeth=17,
	, roller_gear_thickness=10.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=15.0, motor_gear_hub_thickness=17.0
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=3.0, motor_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	) {
  $fs=0.1;
  // Motor gear at center
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  gear(number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circular_pitch
	, gear_thickness=motor_gear_thickness, rim_thickness=motor_gear_thickness
	, bore_diameter=motor_axle_d
	, clearance=gear_clearance/2
	, hub_thickness=motor_gear_hub_thickness
	, hub_diameter=motor_gear_hub_d
	);
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance,0,0]) rotate([0,0,-2*rotAngle])
	gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=roller_gear_thickness, rim_thickness=roller_gear_thickness
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=roller_gear_hub_thickness
		, hub_diameter=roller_gear_hub_d
		);
  }
}

if(render_part==1) {
  echo("Rendering drive_gears()...");
  drive_gears();
}

module alignment_gears(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0
	, roller_axle_d=3.0, middle_axle_d=3.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5
	) {
  $fs=0.1;
  // Motor gear at center
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  union() {
    gear(number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circular_pitch
	, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
	, bore_diameter=middle_axle_d
	, clearance=gear_clearance/2
	, hub_thickness=gear_hub_thickness
	, hub_diameter=gear_hub_d
	, twist=twist_ratio*180/gear_num_teeth
	);
    translate([0,0,gear_thickness/2]) rotate([0,0,-twist_ratio*180/gear_num_teeth])
      gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=middle_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=-twist_ratio*180/gear_num_teeth
		);
  }
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance,0,0]) rotate([0,0,-2*rotAngle]) union() {
	gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=gear_hub_thickness
		, hub_diameter=gear_hub_d
		, twist=-twist_ratio*180/gear_num_teeth
		);
	translate([0,0,gear_thickness/2]) rotate([0,0,twist_ratio*180/gear_num_teeth])
	  gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=twist_ratio*180/gear_num_teeth
	  );
	}
  }
}

if(render_part==2) {
  echo("Rendering alignment_gears()...");
  alignment_gears();
}
