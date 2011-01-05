// Planetary Gears
use <parametric_involute_gear.scad>
debug_flag=1;
render_part=1;

module PlanetaryGear_2D(
	clearance=0.2
	// , outer_d=60.0
	, outer_wall_th=5.0
	// , outer_num_teeth=120
	, roller_gear_pitch_d=22.0
	, roller_gear_num_teeth=11
	, drive_gear_pitch_d=30.0
	, drive_gear_num_teeth=15
	, roller_n=2
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
  translate([-drive_gear_pitch_d/2-roller_gear_pitch_d/2,0]) gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(roller_gear_num_teeth,roller_gear_pitch_d)
	, number_of_teeth=roller_gear_num_teeth
	);
  translate([drive_gear_pitch_d/2+roller_gear_pitch_d/2,0]) 
	rotate((roller_gear_num_teeth+drive_gear_num_teeth)%2*180/roller_gear_num_teeth) gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(roller_gear_num_teeth,roller_gear_pitch_d)
	, number_of_teeth=roller_gear_num_teeth
	);
}

if(render_part==1) {
  echo("Rendering PlanetaryGear_2D()...");
  PlanetaryGear_2D();
}
