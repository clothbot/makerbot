// Planetary Gear Pump

use <parametric_involute_gear_v5.0.scad>

render_part=1; // half_planetary_hex()

function gear_circle_pitch(pitch_d=25.0,num_teeth=15) = 180 * pitch_d / num_teeth;
function gear_pitch_diametrial(pitch_d=25.0, num_teeth=15) = num_teeth / pitch_d;
function gear_addendum(pitch_d=25.0, num_teeth=15) = 1 / gear_pitch_diametrial(pitch_d=pitch_d, num_teeth=num_teeth);
function gear_outer_radius(pitch_d=25.0, num_teeth=15) = (pitch_d/2) + gear_addendum(pitch_d=pitch_d, num_teeth=num_teeth);
function gear_dedendum(pitch_d=25.0, num_teeth=15, clearance=0.2) = gear_addendum(pitch_d=pitch_d,num_teeth=num_teeth) + clearance;
function gear_root_radius(pitch_d=25.0, num_teeth=15, clearance=0.2) = pitch_d/2 - gear_dedendum(pitch_d=pitch_d,num_teeth=num_teeth,clearance=clearance);
function gear_backlash_angle(pitch_d=25.0, backlash=0) = backlash / (pitch_d/2) * 180 / pi();
function gear_half_thick_angle(pitch_d=25.0, num_teeth=15, backlash=0) = (360 / num_teeth - gear_backlash_angle(pitch_d=pitch_d,backlash=backlash) ) / 4;

module half_planetary_hex(planet_d=60.0,gear_num_teeth=9) {
  animate_angle=360*$t;
  echo(str("half_planetary_hex: planet_d=",planet_d,", gear_num_teeth=",gear_num_teeth));
  rotate([0,0,animate_angle]) gear(
	number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circle_pitch(pitch_d=planet_d/3,num_teeth=gear_num_teeth)
  ) ;
  for(i = [0:2] ) assign(rotAngle=360*i/3) {
    rotate([0,0,rotAngle+animate_angle/3]) translate([planet_d/3,0,0]) rotate([0,0,rotAngle-2*animate_angle/3]) 
      gear(
	number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circle_pitch(pitch_d=planet_d/3,num_teeth=gear_num_teeth)
      ) ;
  }
}

if(render_part==1) {
  echo("Rendering half_planetary_hex()...");
  translate([0,0,-7]) {
	cylinder(r=60/2,h=1);
	gear(
	  number_of_teeth=3*9
	  , circular_pitch=gear_circle_pitch(pitch_d=61,num_teeth=3*9)
      ) ;
  }
  half_planetary_hex();
}

