// Planetary Gears
use <parametric_involute_gear.scad>
debug_flag=1;
render_part=1;

// Need to work out periodicity criteria
module PlanetaryGear_2D(
	clearance=0.2
	, outer_wall_th=5.0
	, roller_gear_pitch_d=18.0
	, roller_gear_num_teeth=9
	, roller_n=6
	, drive_gear_pitch_d=30.0
	, drive_gear_num_teeth=15
	) {
  outer_d=2*roller_gear_pitch_d+drive_gear_pitch_d;
  outer_num_teeth=outer_d*drive_gear_num_teeth/drive_gear_pitch_d;
  difference() {
    circle(r=(outer_d+2*outer_wall_th)/2);
    gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(outer_num_teeth,outer_d+clearance)
	, number_of_teeth=outer_num_teeth
	);
  }
  gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(drive_gear_num_teeth,drive_gear_pitch_d)
	, number_of_teeth=drive_gear_num_teeth
	);
  for( i=[0:roller_n-1] ) {
    rotate(360*i/roller_n) translate([drive_gear_pitch_d/2+roller_gear_pitch_d/2,0])
	rotate(-360*(i/roller_n)*(drive_gear_num_teeth/roller_gear_num_teeth))
	gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(roller_gear_num_teeth,roller_gear_pitch_d)
	, number_of_teeth=roller_gear_num_teeth
	);
  }
}

if(render_part==1) {
  echo("Rendering PlanetaryGear_2D()...");
  PlanetaryGear_2D();
}
