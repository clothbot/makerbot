// Planetary Gear Pump

use <parametric_involute_gear_v5.0.scad>

render_part=1; // half_planetary_hex()
//render_part=2; // half_planetary_hex_w_rollers()
//render_part=3; // planetary_hex_w_rollers()
//render_part=4; // symmetric planetary_hex_w_rollers()
render_part=5; // low tooth-count planetar_hex_w_rollers()

function gear_circle_pitch(pitch_d=25.0,num_teeth=15) = 180 * pitch_d / num_teeth;
function gear_pitch_diametrial(pitch_d=25.0, num_teeth=15) = num_teeth / pitch_d;
function gear_addendum(pitch_d=25.0, num_teeth=15) = 1 / gear_pitch_diametrial(pitch_d=pitch_d, num_teeth=num_teeth);
function gear_outer_radius(pitch_d=25.0, num_teeth=15) = (pitch_d/2) + gear_addendum(pitch_d=pitch_d, num_teeth=num_teeth);
function gear_dedendum(pitch_d=25.0, num_teeth=15, clearance=0.2) = gear_addendum(pitch_d=pitch_d,num_teeth=num_teeth) + clearance;
function gear_root_radius(pitch_d=25.0, num_teeth=15, clearance=0.2) = pitch_d/2 - gear_dedendum(pitch_d=pitch_d,num_teeth=num_teeth,clearance=clearance);
function gear_backlash_angle(pitch_d=25.0, backlash=0) = backlash / (pitch_d/2) * 180 / pi();
function gear_half_thick_angle(pitch_d=25.0, num_teeth=15, backlash=0) = (360 / num_teeth - gear_backlash_angle(pitch_d=pitch_d,backlash=backlash) ) / 4;

module half_planetary_hex(planet_d=60.0,gear_num_teeth=9, shrink=0, rim_thickness=10, twist=0
	, extension=0.1, wall_th=2.0) {
  animate_angle=360*$t;
  echo(str("half_planetary_hex: planet_d=",planet_d,", gear_num_teeth=",gear_num_teeth,", shrink=",shrink));
  rotate([0,0,animate_angle]) intersection() {
    union() {
      gear(
	  number_of_teeth=gear_num_teeth
	  , circular_pitch=gear_circle_pitch(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)
	  , rim_thickness=rim_thickness
	  , twist=twist
	  , bore_diameter=0
	  , hub_thickness=rim_thickness
	  , gear_thickness=rim_thickness
      ) ;
	cylinder(r1=0.5*planet_d/3-shrink,r2=0.5*planet_d/3-gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth),center=false);
	translate([0,0,rim_thickness-gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)])
	  cylinder(r2=0.5*planet_d/3-shrink,r1=0.5*planet_d/3-gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth),center=false);
    }
    cylinder(r1=0.5*planet_d/3-shrink,r2=0.5*planet_d/3+rim_thickness-shrink,h=rim_thickness,center=false);
    cylinder(r2=0.5*planet_d/3-shrink,r1=0.5*planet_d/3+rim_thickness-shrink,h=rim_thickness,center=false);
  }
  for(i = [0:2] ) assign(rotAngle=360*i/3) {
    rotate([0,0,rotAngle+animate_angle/3]) translate([planet_d/3,0,0]) rotate([0,0,rotAngle-2*animate_angle/3]) intersection() {
	union() {
 	  gear(
	    number_of_teeth=gear_num_teeth
	    , circular_pitch=gear_circle_pitch(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)
	    , rim_thickness=rim_thickness
	    , twist=-twist
	    , bore_diameter=0
	    , hub_thickness=rim_thickness
	    , gear_thickness=rim_thickness
	    ) ;
	  cylinder(r1=0.5*planet_d/3-shrink,r2=0.5*planet_d/3-gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth),center=false);
	  translate([0,0,rim_thickness-gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)])
	    cylinder(r2=0.5*planet_d/3-shrink,r1=0.5*planet_d/3-gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=planet_d/3-2*shrink,num_teeth=gear_num_teeth),center=false);
	}
      cylinder(r1=0.5*planet_d/3-shrink,r2=0.5*planet_d/3+rim_thickness-shrink,h=rim_thickness,center=false);
      cylinder(r2=0.5*planet_d/3-shrink,r1=0.5*planet_d/3+rim_thickness-shrink,h=rim_thickness,center=false);
    }
  }
  difference() {
    cylinder(r=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=3*9)+wall_th,h=rim_thickness,center=false);
    translate([0,0,-extension])
	cylinder(r1=planet_d/2+extension+2*shrink,r2=planet_d/2-rim_thickness-extension+2*shrink,h=rim_thickness+2*extension,center=false);
    translate([0,0,-extension])
	cylinder(r2=planet_d/2-extension+2*shrink,r1=planet_d/2-rim_thickness-extension+2*shrink,h=rim_thickness+2*extension,center=false);
    gear( number_of_teeth=3*gear_num_teeth
	, circular_pitch=gear_circle_pitch(pitch_d=planet_d+2*shrink, num_teeth=3*gear_num_teeth)
	, rim_thickness=rim_thickness
	, twist=-twist/3
	, bore_diameter=0
	);
  }
}

if(render_part==1) {
  echo("Rendering half_planetary_hex()...");
//  translate([0,0,-15]) {
//	cylinder(r=60/2,h=1);
//	gear(
//	  number_of_teeth=3*9
//	  , circular_pitch=gear_circle_pitch(pitch_d=61,num_teeth=3*9)
//      ) ;
//  }
  half_planetary_hex(twist=180/9,shrink=0.3,rim_thickness=10,gear_num_teeth=9,planet_d=50,extension=0);
}

module half_planetary_hex_w_rollers(planet_d=60.0, gear_num_teeth=9, shrink=0, rim_thickness=10, twist=0, extension=0.1, wall_th=2.0) {
  half_planetary_hex(planet_d=planet_d,gear_num_teeth=gear_num_teeth,shrink=shrink,rim_thickness=rim_thickness, twist=twist, wall_th=wall_th);
  animate_angle=360*$t;
  for(i=[0:2]) assign(rotAngle=360*i/3+60) {
    rotate([0,0,rotAngle+animate_angle/3]) translate([planet_d/3,0,0]) rotate([0,0,rotAngle-2*animate_angle/3]) union() {
      translate([0,0,-extension])
	  cylinder(r=0.5*planet_d/3-shrink-gear_dedendum(pitch_d=planet_d/3-shrink,num_teeth=gear_num_teeth,clearance=0),h=rim_thickness+2*extension,center=false);
	cylinder(r1=0.5*planet_d/3-shrink
	  , r2=0.5*planet_d/3-shrink-gear_dedendum(pitch_d=planet_d/3-shrink,num_teeth=gear_num_teeth,clearance=0)
	  , h=gear_dedendum(pitch_d=planet_d/3-shrink,num_teeth=gear_num_teeth,clearance=0)
	  , center=false);
	translate([0,0,rim_thickness-gear_dedendum(pitch_d=planet_d/3-shrink,num_teeth=gear_num_teeth,clearance=0)])
	  cylinder(r2=0.5*planet_d/3-shrink
	    , r1=0.5*planet_d/3-shrink-gear_dedendum(pitch_d=planet_d/3-shrink,num_teeth=gear_num_teeth,clearance=0)
	    , h=gear_dedendum(pitch_d=planet_d/3-shrink,num_teeth=gear_num_teeth,clearance=0)
	    , center=false);
    }
  }
}

if(render_part==2) {
  echo("Rendering half_planetary_hex_w_rollers()...");
//  translate([0,0,-10]) {
//	cylinder(r=60/2,h=1);
//	rotate([0,0,180/(3*9)]) gear(
//	  number_of_teeth=3*9
//	  , circular_pitch=gear_circle_pitch(pitch_d=61,num_teeth=3*9)
//	  , twist=-180/(3*9)
//      ) ;
//  }
  half_planetary_hex_w_rollers(twist=180/9,shrink=0.3,rim_thickness=10,gear_num_teeth=9,planet_d=50,extension=0);
}

module planetary_hex_w_rollers(planet_d=60.0, gear_num_teeth=9, shrink=0, rim_thickness=10, twist=0, extension=0.1) {
  union() {
    half_planetary_hex_w_rollers(
	planet_d=planet_d
	, gear_num_teeth=gear_num_teeth
	, shrink=shrink
	, rim_thickness=rim_thickness
	, twist=twist
	, extension=0
	);
    translate([0,0,rim_thickness]) rotate([0,0,60])
     half_planetary_hex_w_rollers(
	planet_d=planet_d
	, gear_num_teeth=gear_num_teeth
	, shrink=shrink
	, rim_thickness=rim_thickness
	, twist=-twist
	, extension=0
	);
  }
}

if(render_part==3) {
  echo("Rendering planetary_hex_w_rollers()...");
//  planetary_hex_w_rollers(twist=180/21,shrink=0.2,rim_thickness=4,gear_num_teeth=21);
  planetary_hex_w_rollers(twist=180/9,shrink=0.4,rim_thickness=10,gear_num_teeth=9,planet_d=50);

}

if(render_part==4) {
  echo("Rendering symmetric planetary_hex_w_rollers()...");
  union() {
    planetary_hex_w_rollers(twist=180/21,shrink=0.2,rim_thickness=4,gear_num_teeth=21);
    mirror([0,0,1]) planetary_hex_w_rollers(twist=180/21,shrink=0.2,rim_thickness=4,gear_num_teeth=21);
  }
}

if(render_part==5) {
  echo("Rendering symmetric planetary_hex_w_rollers()...");
  union() {
    planetary_hex_w_rollers(twist=90/9,shrink=0.25,rim_thickness=5/2,gear_num_teeth=9,planet_d=3*8);
    mirror([0,0,1]) planetary_hex_w_rollers(twist=90/9,shrink=0.25,rim_thickness=5/2,gear_num_teeth=9,planet_d=3*8);
  }
}
