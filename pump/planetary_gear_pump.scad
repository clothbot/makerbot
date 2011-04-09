// Planetary Gear Pump

use <parametric_involute_gear_v5.0.scad>
use <parts.scad>

global_planet_d=40;
global_axle_d=5.0;
global_roller_num_teeth=9;
global_drive_num_teeth=15;

//render_part=1; // half_planetary_hex()
//render_part=2; // half_planetary_hex_w_rollers()
// render_part=3; // full_planetary_hex()
//render_part=4; // symmetric planetary_hex_w_rollers()
//render_part=5; // low tooth-count planetar_hex_w_rollers()
// render_part=6; // planetary gear with holes
// render_part=7; // planetary_hex_base
// render_part=8; // planetary gear with base and holes
//render_part=9; // planetary gear with base and holes and nema17 bracket.
//render_part=10; // planetary_hex_key_top()
//render_part=11; // full_planetary_hex with base and top
render_part=12; // planetary_hex_rollers()

function gear_circle_pitch(pitch_d=25.0,num_teeth=15) = 180 * pitch_d / num_teeth;
function gear_pitch_diametrial(pitch_d=25.0, num_teeth=15) = num_teeth / pitch_d;
function gear_addendum(pitch_d=25.0, num_teeth=15) = 1 / gear_pitch_diametrial(pitch_d=pitch_d, num_teeth=num_teeth);
function gear_outer_radius(pitch_d=25.0, num_teeth=15) = (pitch_d/2) + gear_addendum(pitch_d=pitch_d, num_teeth=num_teeth);
function gear_dedendum(pitch_d=25.0, num_teeth=15, clearance=0.2) = gear_addendum(pitch_d=pitch_d,num_teeth=num_teeth) + clearance;
function gear_root_radius(pitch_d=25.0, num_teeth=15, clearance=0.2) = pitch_d/2 - gear_dedendum(pitch_d=pitch_d,num_teeth=num_teeth,clearance=clearance);
function gear_backlash_angle(pitch_d=25.0, backlash=0) = backlash / (pitch_d/2) * 180 / pi();
function gear_half_thick_angle(pitch_d=25.0, num_teeth=15, backlash=0) = (360 / num_teeth - gear_backlash_angle(pitch_d=pitch_d,backlash=backlash) ) / 4;

module half_planetary_hex(planet_d=60.0, shrink=0, rim_thickness=10, twist=0
	, extension=0.1, wall_th=2.0
	, drive_num_teeth=11
	, roller_num_teeth=9
	) {
  animate_angle=360*$t;
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  echo(str("half_planetary_hex: planet_d=",planet_d,", planet_num_teeth=",planet_num_teeth,", shrink=",shrink));
  rotate([0,0,animate_angle]) intersection() {
    union() {
      gear(
	  number_of_teeth=drive_num_teeth
	  , circular_pitch=gear_circle_pitch(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)
	  , rim_thickness=rim_thickness
	  , twist=twist
	  , bore_diameter=0
	  , hub_thickness=rim_thickness
	  , gear_thickness=rim_thickness
      ) ;
	cylinder(r1=0.5*drive_d-shrink,r2=0.5*drive_d-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth),center=false);
	translate([0,0,rim_thickness-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)])
	  cylinder(r2=0.5*drive_d-shrink,r1=0.5*drive_d-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth),center=false);
    }
    cylinder(r1=0.5*drive_d-shrink,r2=0.5*drive_d+rim_thickness-shrink,h=rim_thickness,center=false);
    cylinder(r2=0.5*drive_d-shrink,r1=0.5*drive_d+rim_thickness-shrink,h=rim_thickness,center=false);
  }
  for(i = [0:2] ) assign(rotAngle=360*i/3) {
    rotate([0,0,rotAngle+animate_angle/3]) translate([drive_d/2+roller_d/2,0,0]) rotate([0,0,(drive_num_teeth/roller_num_teeth)*(planet_num_teeth/drive_num_teeth)*rotAngle-2*animate_angle/3]) intersection() {
	union() {
 	  gear(
	    number_of_teeth=roller_num_teeth
	    , circular_pitch=gear_circle_pitch(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)
	    , rim_thickness=rim_thickness
	    , twist=-twist*drive_num_teeth/roller_num_teeth
	    , bore_diameter=0
	    , hub_thickness=rim_thickness
	    , gear_thickness=rim_thickness
	    ) ;
	  cylinder(r1=0.5*roller_d-shrink,r2=0.5*roller_d-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth),center=false);
	  translate([0,0,rim_thickness-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)])
	    cylinder(r2=0.5*roller_d-shrink,r1=0.5*roller_d-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth),center=false);
	}
      cylinder(r1=0.5*roller_d-shrink,r2=0.5*roller_d+rim_thickness-shrink,h=rim_thickness,center=false);
      cylinder(r2=0.5*roller_d-shrink,r1=0.5*roller_d+rim_thickness-shrink,h=rim_thickness,center=false);
    }
  }
  difference() {
    cylinder(r=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+wall_th,h=rim_thickness,center=false);
    translate([0,0,-extension])
	cylinder(r1=planet_d/2+extension+2*shrink,r2=planet_d/2-rim_thickness-extension+2*shrink,h=rim_thickness+2*extension,center=false);
    translate([0,0,-extension])
	cylinder(r2=planet_d/2-extension+2*shrink,r1=planet_d/2-rim_thickness-extension+2*shrink,h=rim_thickness+2*extension,center=false);
    gear( number_of_teeth=planet_num_teeth
	, circular_pitch=gear_circle_pitch(pitch_d=planet_d+2*shrink, num_teeth=planet_num_teeth)
	, rim_thickness=rim_thickness
	, twist=-twist*(roller_num_teeth/planet_num_teeth)*(drive_num_teeth/roller_num_teeth)
	, bore_diameter=0
	, hub_thickness=rim_thickness
	, gear_thickness=rim_thickness
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
  half_planetary_hex(twist=360/15,shrink=0.3,rim_thickness=10,drive_num_teeth=15,roller_num_teeth=9,planet_d=50,extension=0);
}

module half_planetary_hex_w_rollers(planet_d=60.0, drive_num_teeth=15, roller_num_teeth=9, shrink=0, rim_thickness=10, twist=0, extension=0.1, wall_th=2.0) {
  half_planetary_hex(planet_d=planet_d,drive_num_teeth=drive_num_teeth,roller_num_teeth=roller_num_teeth,shrink=shrink,rim_thickness=rim_thickness, twist=twist, wall_th=wall_th);
  animate_angle=360*$t;
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  for(i=[0:2]) assign(rotAngle=360*i/3+60) {
    rotate([0,0,rotAngle+animate_angle/3]) translate([drive_d/2+roller_d/2,0,0]) rotate([0,0,(drive_num_teeth/roller_num_teeth)*(planet_num_teeth/drive_num_teeth)*rotAngle-2*animate_angle/3]) union() {
      translate([0,0,-extension])
	  cylinder(r=0.5*roller_d-shrink-gear_dedendum(pitch_d=roller_d-shrink,num_teeth=roller_num_teeth,clearance=0),h=rim_thickness+2*extension,center=false);
	cylinder(r1=0.5*roller_d-shrink
	  , r2=0.5*roller_d-shrink-gear_dedendum(pitch_d=roller_d-shrink,num_teeth=roller_num_teeth,clearance=0)
	  , h=gear_dedendum(pitch_d=roller_d-shrink,num_teeth=roller_num_teeth,clearance=0)
	  , center=false);
	translate([0,0,rim_thickness-gear_dedendum(pitch_d=roller_d-shrink,num_teeth=roller_num_teeth,clearance=0)])
	  cylinder(r2=0.5*roller_d-shrink
	    , r1=0.5*roller_d-shrink-gear_dedendum(pitch_d=roller_d-shrink,num_teeth=roller_num_teeth,clearance=0)
	    , h=gear_dedendum(pitch_d=roller_d-shrink,num_teeth=roller_num_teeth,clearance=0)
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
  half_planetary_hex_w_rollers(twist=180/9,shrink=0.3,rim_thickness=10,roller_num_teeth=9,drive_num_teeth=15,planet_d=50,extension=0.1);
}

module full_planetary_hex(planet_d=60.0, shrink=0, rim_thickness=10, twist=0
	, extension=0.1, wall_th=2.0
	, drive_num_teeth=11
	, roller_num_teeth=9
	) {
  animate_angle=360*$t;
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  echo(str("full_planetary_hex: planet_d=",planet_d,", planet_num_teeth=",planet_num_teeth,", shrink=",shrink));
  rotate([0,0,animate_angle]) intersection() {
    union() {
      gear(
	  number_of_teeth=drive_num_teeth
	  , circular_pitch=gear_circle_pitch(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)
	  , rim_thickness=rim_thickness
	  , twist=twist
	  , bore_diameter=0
	  , hub_thickness=rim_thickness
	  , gear_thickness=rim_thickness
      ) ;
	cylinder(r1=0.5*drive_d-shrink,r2=0.5*drive_d-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth),center=false);
	translate([0,0,rim_thickness-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)])
	  cylinder(r2=0.5*drive_d-shrink,r1=0.5*drive_d-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth),center=false);
	translate([0,0,-extension])
	  cylinder(r=drive_d/2-gear_dedendum(pitch_d=drive_d-2*shrink,num_teeth=drive_num_teeth)-shrink
	    , h=rim_thickness+2*extension
	    , center=false
	  );
    }
    translate([0,0,-extension])
      cylinder(r1=0.5*drive_d-shrink-extension,r2=0.5*drive_d+rim_thickness-shrink,h=rim_thickness+2*extension,center=false);
    translate([0,0,-extension])
      cylinder(r2=0.5*drive_d-shrink-extension,r1=0.5*drive_d+rim_thickness-shrink,h=rim_thickness+2*extension,center=false);
  }
  for(i = [0:5] ) assign(rotAngle=360*i/6) {
    rotate([0,0,rotAngle+animate_angle/3]) translate([drive_d/2+roller_d/2,0,0]) rotate([0,0,(drive_num_teeth/roller_num_teeth)*(planet_num_teeth/drive_num_teeth)*rotAngle-2*animate_angle/3]) intersection() {
	union() {
 	  gear(
	    number_of_teeth=roller_num_teeth
	    , circular_pitch=gear_circle_pitch(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)
	    , rim_thickness=rim_thickness
	    , twist=-twist*drive_num_teeth/roller_num_teeth
	    , bore_diameter=0
	    , hub_thickness=rim_thickness
	    , gear_thickness=rim_thickness
	    ) ;
	  cylinder(r1=0.5*roller_d-shrink,r2=0.5*roller_d-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth),center=false);
	  translate([0,0,rim_thickness-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)])
	    cylinder(r2=0.5*roller_d-shrink,r1=0.5*roller_d-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)-shrink
		, h=gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth),center=false);
	  translate([0,0,-extension])
	    cylinder(r=roller_d/2-gear_dedendum(pitch_d=roller_d-2*shrink,num_teeth=roller_num_teeth)-shrink
	      , h=rim_thickness+2*extension
	      , center=false
	    );
	}
      translate([0,0,-extension])
	  cylinder(r1=0.5*roller_d-shrink-extension,r2=0.5*roller_d+rim_thickness-shrink+extension,h=rim_thickness+2*extension,center=false);
	translate([0,0,-extension])
	  cylinder(r2=0.5*roller_d-shrink-extension,r1=0.5*roller_d+rim_thickness-shrink+extension,h=rim_thickness+2*extension,center=false);
    }
  }
  difference() {
    cylinder(r=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+wall_th,h=rim_thickness,center=false);
    translate([0,0,-extension])
	cylinder(r1=planet_d/2+extension+2*shrink,r2=planet_d/2-rim_thickness-extension+2*shrink,h=rim_thickness+2*extension,center=false);
    translate([0,0,-extension])
	cylinder(r2=planet_d/2-extension+2*shrink,r1=planet_d/2-rim_thickness-extension+2*shrink,h=rim_thickness+2*extension,center=false);
    gear( number_of_teeth=planet_num_teeth
	, circular_pitch=gear_circle_pitch(pitch_d=planet_d+2*shrink, num_teeth=planet_num_teeth)
	, rim_thickness=rim_thickness
	, twist=-twist*(roller_num_teeth/planet_num_teeth)*(drive_num_teeth/roller_num_teeth)
	, bore_diameter=0
	, hub_thickness=rim_thickness
	, gear_thickness=rim_thickness
	);
  }
}


if(render_part==3) {
  echo("Rendering full_planetary_hex()...");
  full_planetary_hex(twist=360/15,shrink=0.3,rim_thickness=10,drive_num_teeth=15,roller_num_teeth=9,planet_d=50,extension=0.1);

}

module planetary_hex_w_rollers(planet_d=60.0, roller_num_teeth=9, drive_num_teeth=15, shrink=0, rim_thickness=10, twist=0, extension=0.1) {
  union() {
    half_planetary_hex_w_rollers(
	planet_d=planet_d
	, roller_num_teeth=roller_num_teeth
	, drive_num_teeth=drive_num_teeth
	, shrink=shrink
	, rim_thickness=rim_thickness
	, twist=twist
	, extension=0
	);
    translate([0,0,rim_thickness]) rotate([0,0,60])
     half_planetary_hex_w_rollers(
	planet_d=planet_d
	, roller_num_teeth=roller_num_teeth
	, drive_num_teeth=drive_num_teeth
	, shrink=shrink
	, rim_thickness=rim_thickness
	, twist=-twist
	, extension=0
	);
  }
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

module planetary_hex_holes(drive_axle_d=5.0, roller_axle_d=3.0, roller_num_teeth=9, drive_num_teeth=15, rim_thickness=10,planet_d=50, wall_th=2.0, extension=0.1,shrink=0.2) {
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  translate([0,0,-extension]) union() {
    cylinder($fn=16,r1=drive_axle_d/2+extension+2*shrink,r2=drive_axle_d/2+shrink,h=extension+shrink,center=false);
    cylinder($fn=16,r=drive_axle_d/2+shrink,h=2*extension+rim_thickness,center=false);
    translate([0,0,extension+rim_thickness-shrink])
	cylinder($fn=16,r1=drive_axle_d/2+shrink,r2=drive_axle_d/2+extension+2*shrink,h=extension+shrink,center=false);
    translate([0,0,extension]) {
	rotate([0,45,0]) cube(size=[2*shrink,drive_d-4*shrink,2*shrink],center=true);
	rotate([0,45,45]) cube(size=[2*shrink,drive_d-4*shrink,2*shrink],center=true);
	rotate([0,45,90]) cube(size=[2*shrink,drive_d-4*shrink,2*shrink],center=true);
	rotate([0,45,135]) cube(size=[2*shrink,drive_d-4*shrink,2*shrink],center=true);
    }
  }
  for(i=[0:5]) assign(rotAngle=360*i/6) rotate([0,0,rotAngle]) translate([drive_d/2+roller_d/2,0,-extension]) union() {
    cylinder($fn=16,r1=roller_axle_d/2+extension+2*shrink,r2=roller_axle_d/2+shrink,h=extension+shrink,center=false);
    cylinder($fn=16,r=roller_axle_d/2+shrink,h=2*extension+rim_thickness,center=false);
    translate([0,0,extension+rim_thickness-shrink])
	cylinder($fn=16,r1=roller_axle_d/2+shrink,r2=roller_axle_d/2+extension+2*shrink,h=extension+shrink,center=false);
    translate([0,0,extension]) {
	rotate([0,45,0]) cube(size=[2*shrink,roller_d-4*shrink,2*shrink],center=true);
	rotate([0,45,45]) cube(size=[2*shrink,roller_d-4*shrink,2*shrink],center=true);
	rotate([0,45,90]) cube(size=[2*shrink,roller_d-4*shrink,2*shrink],center=true);
	rotate([0,45,135]) cube(size=[2*shrink,roller_d-4*shrink,2*shrink],center=true);
    }
  }
}


if(render_part==6) {
  echo("Rendering symmetric planetary_hex_w_rollers() with planetary_hex_holes...");
  difference() {
    translate([0,0,10]) union() {
      planetary_hex_w_rollers(twist=90/9,shrink=0.4,rim_thickness=5,gear_num_teeth=9,planet_d=global_planet_d);
      mirror([0,0,1]) planetary_hex_w_rollers(twist=90/9,shrink=0.4,rim_thickness=5,gear_num_teeth=9,planet_d=global_planet_d);
    }
    planetary_hex_holes(axle_d=global_axle_d,rim_thickness=20,planet_d=global_planet_d);
  }
}

module planetary_hex_base(drive_axle_d=5.0,roller_axle_d=3.0,planet_d=60.0, roller_num_teeth=9, drive_num_teeth=15, shrink=0.1, rim_thickness=2, wall_th=2.0, extension=0.1) {
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  echo(str("planetary_hex_base: planet_num_teeth=",planet_num_teeth,", drive_d=",drive_d,", roller_d=",roller_d));

  difference() {
    cylinder(r=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+wall_th,h=rim_thickness+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth),center=false);
    translate([0,0,-extension])
	cylinder(r1=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+extension+shrink,r2=planet_d/2+shrink,h=gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+extension,center=false);
    translate([0,0,rim_thickness])
	cylinder(r2=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+extension+shrink,r1=planet_d/2+shrink,h=gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+extension,center=false);
    translate([0,0,-extension])
	cylinder(r=planet_d/2+shrink,h=rim_thickness+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+2*extension,center=false);
  }

  union() {
    cylinder(r1=drive_d/2-shrink-gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),r2=drive_d/2-shrink,h=gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),center=false);
    translate([0,0,gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth)]) cylinder(r=drive_d/2-shrink,h=rim_thickness-gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),center=false);
    translate([0,0,rim_thickness])
	cylinder(r1=drive_d/2-shrink,r2=drive_d/2-shrink-gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),h=gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),center=false);
    cylinder(r=drive_d/2-shrink-gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),h=rim_thickness+gear_dedendum(pitch_d=drive_d,num_teeth=drive_num_teeth),center=false);
    for(i=[0:5]) assign(rotAngle=360*i/6) rotate([0,0,rotAngle]) translate([drive_d/2+roller_d/2,0,0]) {
	cylinder(r1=roller_d/2-shrink-gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),r2=roller_d/2-shrink,h=gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),center=false);
      translate([0,0,gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth)]) cylinder(r=roller_d/2-shrink,h=rim_thickness-gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),center=false);
	translate([0,0,rim_thickness])
	  cylinder(r1=roller_d/2-shrink,r2=roller_d/2-shrink-gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),h=gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),center=false);
	cylinder(r=roller_d/2-shrink-gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),h=rim_thickness+gear_dedendum(pitch_d=roller_d,num_teeth=roller_num_teeth),center=false);
    }
  }
}

if(render_part==7) {
  echo("Rendering planetary_hex_base()...");
  planetary_hex_base(drive_axle_d=5.0,roller_axle_d=3.0,planet_d=global_planet_d, roller_num_teeth=9, drive_num_teeth=15, shrink=0.4, rim_thickness=4, wall_th=2.0, extension=0.1);
}

if(render_part==8) {
  echo("Rendering symmetric planetary_hex_w_rollers() with base planetary_hex_holes...");
  difference() {
    translate([0,0,12]) union() {
      planetary_hex_w_rollers(twist=90/9,shrink=0.4,rim_thickness=5,gear_num_teeth=9,planet_d=global_planet_d);
      mirror([0,0,1]) planetary_hex_w_rollers(twist=90/9,shrink=0.4,rim_thickness=5,gear_num_teeth=9,planet_d=global_planet_d);
      translate([0,0,-12])
	  planetary_hex_base(axle_d=global_axle_d,planet_d=global_planet_d, gear_num_teeth=9, shrink=0.4, rim_thickness=2, wall_th=2.0, extension=0.1);
    }
    planetary_hex_holes(axle_d=global_axle_d,rim_thickness=22,planet_d=global_planet_d);
  }
}

module planetary_hex_nema17(axle_d=5.0,planet_d=40,gear_num_teeth=9,shrink=0.2, bracket_h=10,wall_th=2.0,extension=0.1
	, bolt_d=3.2
	, bolt_head_d=5.7
	, bolt_head_h=4.0
	) {
  $fs=0.1;
  $fa=15;
  difference() {
    union() {
      translate([-42.3/2,-42.3/2,0]) {
	cube(size=[42.3,42.3,bracket_h],center=false);
      }
    }
    translate([0,0,-0.1]) {
      cylinder(r=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=3*gear_num_teeth)+wall_th/2,h=bracket_h+2*extension,center=false);
      translate([31/2,31/2,0]) {
	cylinder(r=bolt_d/2,h=bracket_h+2*extension,center=false);
	translate([0,0,bracket_h+extension-bolt_head_h])
	  cylinder(r=bolt_head_d/2,h=bolt_head_h+extension,center=false);
      }
      translate([-31/2,31/2,0]) {
	cylinder(r=bolt_d/2,h=bracket_h+2*extension,center=false);
	translate([0,0,bracket_h+extension-bolt_head_h])
	  cylinder(r=bolt_head_d/2,h=bolt_head_h+extension,center=false);
      }
      translate([-31/2,-31/2,0]) {
	cylinder(r=bolt_d/2,h=bracket_h+2*extension,center=false);
	translate([0,0,bracket_h+extension-bolt_head_h])
	  cylinder(r=bolt_head_d/2,h=bolt_head_h+extension,center=false);
      }
      translate([31/2,-31/2,0]) {
	cylinder(r=bolt_d/2,h=bracket_h+2*extension,center=false);
	translate([0,0,bracket_h+extension-bolt_head_h])
	  cylinder(r=bolt_head_d/2,h=bolt_head_h+extension,center=false);
      }

    }
  }
}

if(render_part==9) {
  echo("Rendering planetary_hex_w_rollers() with base planetary_hex_holes and nema17 bracket...");
  difference() {
    translate([0,0,12]) union() {
      planetary_hex_w_rollers(twist=90/9,shrink=0.3,rim_thickness=5,gear_num_teeth=9,planet_d=32);
      mirror([0,0,1]) planetary_hex_w_rollers(twist=90/9,shrink=0.3,rim_thickness=5,gear_num_teeth=9,planet_d=32);
      translate([0,0,-12]) {
	  planetary_hex_base(axle_d=5.2,planet_d=32, gear_num_teeth=9, shrink=0.3, rim_thickness=2, wall_th=2.0, extension=0.1);
        planetary_hex_nema17(axle_d=5.2,planet_d=32,gear_num_teeth=9,shrink=0.3, bracket_h=10,wall_th=2.0,extension=0.1
	    , bolt_d=3.2
	    , bolt_head_d=5.7
	    , bolt_head_h=4.0
	    );
	}
    }
    planetary_hex_holes(axle_d=3.2,rim_thickness=22,planet_d=32);
  }
}

module planetary_hex_key_top(planet_d=60.0, roller_num_teeth=9, roller_axle_d=3.0, drive_num_teeth=15, drive_axle_d=5.0, shrink=0.1, rim_thickness=2, wall_th=2.0, extension=0.1, interlock_h=2.0) {
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  translate([0,0,-gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)]) difference() {
    cylinder(r=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+wall_th,h=rim_thickness+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth),center=false);
    translate([0,0,-extension])
      cylinder(r=planet_d/2+shrink,h=rim_thickness+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+2*extension,center=false);
    translate([0,0,-extension])
      cylinder(r2=planet_d/2+shrink-extension
	  , r1=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+shrink+extension
	  , h=gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+2*extension);
  }
  union() {
    difference() {
      cylinder(r1=drive_d/2-shrink,r2=drive_d/2-2*shrink,h=rim_thickness+interlock_h,center=false);
      translate([0,0,rim_thickness]) {
	  cube(size=[drive_d,drive_d,interlock_h+extension],center=false);
	  rotate([0,0,180]) cube(size=[drive_d,drive_d,interlock_h+extension],center=false);
	  cylinder(r1=drive_axle_d/2+shrink,r2=drive_axle_d/2+2*shrink,h=interlock_h+extension,center=false);
      }
	translate([0,0,rim_thickness+interlock_h]) {
	  rotate([0,45,0]) cube(size=[2*shrink,drive_d-2*shrink,2*shrink],center=true);
	  rotate([0,45,90]) cube(size=[2*shrink,drive_d-2*shrink,2*shrink],center=true);
	}
    }
    translate([0,0,-gear_addendum(pitch_d=drive_d,num_teeth=drive_num_teeth)])
	cylinder(r1=drive_d/2-shrink-gear_addendum(pitch_d=drive_d,num_teeth=drive_num_teeth)
	  , r2=drive_d/2-shrink
	  , h=gear_addendum(pitch_d=drive_d,num_teeth=drive_num_teeth)
	  , center=false);
    for(i=[0:5]) assign(rotAngle=360*i/6) rotate([0,0,rotAngle]) translate([drive_d/2+roller_d/2,0,0]) {
	difference() {
        cylinder(r1=roller_d/2-shrink,r2=roller_d/2-2*shrink,h=rim_thickness+interlock_h,center=false);
        translate([0,0,rim_thickness]) {
	    cube(size=[roller_d,roller_d,interlock_h+extension],center=false);
	    rotate([0,0,180]) cube(size=[roller_d,roller_d,interlock_h+extension],center=false);
	    cylinder(r1=roller_axle_d/2+shrink,r2=roller_axle_d/2+2*shrink,h=interlock_h+extension,center=false);
        }
	  translate([0,0,rim_thickness+interlock_h]) {
	    rotate([0,45,0]) cube(size=[2*shrink,roller_d-2*shrink,2*shrink],center=true);
	    rotate([0,45,90]) cube(size=[2*shrink,roller_d-2*shrink,2*shrink],center=true);
	  }
	}
	translate([0,0,-gear_addendum(pitch_d=roller_d,num_teeth=roller_num_teeth)])
	 cylinder(r1=roller_d/2-shrink-gear_addendum(pitch_d=roller_d,num_teeth=roller_num_teeth)
	  , r2=roller_d/2-shrink
	  , h=gear_addendum(pitch_d=roller_d,num_teeth=roller_num_teeth)
	  , center=false);
    }
  }
}

if(render_part==10) {
  echo("Rendering planetary_hex_key_top()...");
  planetary_hex_key_top(axle_d=global_axle_d,planet_d=global_planet_d, roller_num_teeth=9, drive_num_teeth=15, shrink=0.4, rim_thickness=4, wall_th=2.0, extension=0.1);
}

module full_planetary_hex_gears(outer_d=70.0, planet_d=60.0, roller_num_teeth=9, roller_axle_d=3.0, drive_num_teeth=15, drive_axle_d=5.0, shrink=0.1, extension=0.1) {
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  full_h=4.0+10.0+4.0;
  wall_th=(outer_d-planet_d-2*gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth))/2;
  difference() {
    union() {
	echo(str("planetary_hex_rollers: anchor radius=",outer_d/2+roller_axle_d));
	for(i=[0:5]) assign(rotAngle=360*i/6) rotate([0,0,rotAngle]) translate([outer_d/2+roller_axle_d,0,0]) {
	  difference() {
	    cylinder(r=roller_axle_d/2+wall_th/2,h=full_h, center=false);
	    translate([0,0,-extension]) cylinder($fn=16,r=roller_axle_d/2,h=full_h+2*extension,center=false);
	  }
	}
      planetary_hex_base(drive_axle_d=drive_axle_d,roller_axle_d=roller_axle_d,planet_d=planet_d, roller_num_teeth=roller_num_teeth, drive_num_teeth=drive_num_teeth, shrink=shrink, rim_thickness=4, wall_th=wall_th, extension=extension);
	translate([0,0,4.0])
	  full_planetary_hex(twist=180/drive_num_teeth,shrink=shrink,rim_thickness=5,drive_num_teeth=drive_num_teeth,roller_num_teeth=roller_num_teeth,planet_d=planet_d,extension=extension,wall_th=wall_th);
	translate([0,0,4.0+5.0+5.0])
	  mirror([0,0,1]) full_planetary_hex(twist=180/drive_num_teeth,shrink=shrink,rim_thickness=5,drive_num_teeth=drive_num_teeth,roller_num_teeth=roller_num_teeth,planet_d=planet_d,extension=extension,wall_th=wall_th);
	translate([0,0,4.0+5.0+5.0])
	  planetary_hex_key_top(drive_axle_d=drive_axle_d,roller_axle_d=roller_axle_d,planet_d=planet_d, roller_num_teeth=roller_num_teeth, drive_num_teeth=drive_num_teeth, shrink=shrink, rim_thickness=4, wall_th=wall_th, extension=extension, interlock_h=2.0);
	difference() {
	  cylinder(r=outer_d/2,h=4.0+10.0+4.0,center=false);
	  translate([0,0,-extension]) cylinder(r=outer_d/2-wall_th,h=4.0+10.0+4.0+2*extension,center=false);
	}
    }
    planetary_hex_holes(drive_axle_d=drive_axle_d,roller_axle_d=roller_axle_d,planet_d=planet_d, roller_num_teeth=roller_num_teeth, drive_num_teeth=drive_num_teeth, shrink=shrink, rim_thickness=4.0+10.0+4.0, wall_th=wall_th, extension=extension);
    // alignment holes
    translate([0,0,4.0+5.0]) {
	rotate([0,45,30]) cube(size=[1.0,2*planet_d,1.0],center=true);
	rotate([0,45,90]) cube(size=[1.0,2*planet_d,1.0],center=true);
	rotate([0,45,150]) cube(size=[1.0,2*planet_d,1.0],center=true);
    }
  }
}


if(render_part==11) {
  echo("Rendering full_planetary_hex_gears(), with base, top and holes...");
  full_planetary_hex_gears(outer_d=65
	,planet_d=50
	,roller_num_teeth=9
	,roller_axle_d=3.2
	,drive_num_teeth=15
	,drive_axle_d=5.2
	,shrink=0.3
	,extension=0.1
  );
}

module planetary_hex_rollers(outer_d=70, planet_d=60.0, roller_num_teeth=9, roller_axle_d=3.0, drive_num_teeth=15, drive_axle_d=5.0
	, shrink=0.1, rim_thickness=10, extension=0.1, interlock_h=2.0
	, tube_od=Tygon_B_44_3_OD(), tube_id=Tygon_B_44_3_ID(), compress_delta=Tygon_B_44_3_ID()/4
	, compress_mod=2
	) {
  planet_num_teeth=drive_num_teeth+2*roller_num_teeth;
  drive_d=planet_d*drive_num_teeth/planet_num_teeth;
  roller_d=planet_d*roller_num_teeth/planet_num_teeth;
  wall_th=(outer_d-planet_d-2*gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth))/2;
  difference() {
    union() {
	cylinder(r=planet_d/2+tube_od/2+wall_th,h=rim_thickness,center=false);
	echo(str("planetary_hex_rollers: anchor radius=",outer_d/2+roller_axle_d));
	for(i=[1:5]) assign(rotAngle=360*i/6) rotate([0,0,rotAngle]) translate([outer_d/2+roller_axle_d,0,0]) {
	  difference() {
	    cylinder(r=roller_axle_d/2+wall_th/2,h=rim_thickness, center=false);
	    translate([0,0,-extension]) cylinder($fn=16,r=roller_axle_d/2,h=rim_thickness+2*extension,center=false);
	  }
	}
    }
    translate([0,0,-extension])
      cylinder(r=planet_d/2+shrink,h=rim_thickness+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+2*extension,center=false);
    translate([0,0,-extension])
      cylinder(r2=planet_d/2+shrink-extension
	  , r1=planet_d/2+gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+shrink+extension
	  , h=gear_addendum(pitch_d=planet_d,num_teeth=planet_num_teeth)+2*extension);
    translate([0,0,rim_thickness/2-tube_od/2-extension])
	cylinder(r=planet_d/2+tube_od/2,h=tube_od+2*extension,center=false);
    translate([0,0,rim_thickness/2-tube_od])
	cylinder(r1=planet_d/2,r2=planet_d/2+tube_od/2,h=tube_od/2,center=false);
    translate([0,0,rim_thickness/2+tube_od/2])
	cylinder(r1=planet_d/2+tube_od/2,r2=planet_d/2,h=tube_od/2,center=false);
    translate([0,0,rim_thickness/2-tube_od]) rotate([0,0,-45])
	cube(size=[planet_d,planet_d,rim_thickness+2*extension],center=false);
  }
  union() {
    difference() {
      union() {
	  cylinder(r=drive_d/2-2*shrink-tube_od/2,h=rim_thickness+interlock_h,center=false);
	  cylinder(r1=drive_d/2-shrink,r2=drive_d/2-2*shrink,h=rim_thickness/2-tube_od,center=false);
	  translate([0,0,rim_thickness/2-tube_od])
	    cylinder(r1=drive_d/2-2*shrink,r2=drive_d/2-2*shrink-tube_od/2,h=tube_od/2,center=false);
	  translate([0,0,rim_thickness/2+tube_od/2])
	    cylinder(r1=drive_d/2-2*shrink-tube_od/2,r2=drive_d/2-2*shrink,h=tube_od/2,center=false);
	  translate([0,0,rim_thickness/2+tube_od])
	    cylinder(r1=drive_d/2-2*shrink,r2=drive_d/2-shrink,h=rim_thickness/2-tube_od+interlock_h,center=false);
	}
	rotate([0,45,0]) cube(size=[2*shrink,drive_d-2*shrink,2*shrink],center=true);
	rotate([0,45,90]) cube(size=[2*shrink,drive_d-2*shrink,2*shrink],center=true);
	translate([0,0,-extension]) rotate([0,0,90]) {
	  cube(size=[drive_d,drive_d,interlock_h+extension],center=false);
	  rotate([0,0,180]) cube(size=[drive_d,drive_d,interlock_h+extension],center=false);
	  cylinder(r1=drive_axle_d/2+shrink,r2=drive_axle_d/2+2*shrink,h=interlock_h+extension,center=false);
	}
      translate([0,0,rim_thickness]) {
	  cube(size=[drive_d,drive_d,interlock_h+extension],center=false);
	  rotate([0,0,180]) cube(size=[drive_d,drive_d,interlock_h+extension],center=false);
	  cylinder(r1=drive_axle_d/2+shrink,r2=drive_axle_d/2+2*shrink,h=interlock_h+extension,center=false);
      }
	translate([0,0,rim_thickness+interlock_h]) {
	  rotate([0,45,0]) cube(size=[2*shrink,drive_d-2*shrink,2*shrink],center=true);
	  rotate([0,45,90]) cube(size=[2*shrink,drive_d-2*shrink,2*shrink],center=true);
	}
    }
    for(i=[0:5]) assign(rotAngle=360*i/6) rotate([0,0,rotAngle]) translate([drive_d/2+roller_d/2,0,0]) {
	difference() {
	  union() {
	    cylinder(r=roller_d/2-tube_od/2-shrink,h=rim_thickness+interlock_h,center=false);
	    if(i % compress_mod == 0) {
		cylinder(r=roller_d/2-shrink,h=rim_thickness/2-tube_od+tube_id+compress_delta,center=false);
		translate([0,0,rim_thickness/2-tube_od+tube_id+compress_delta])
		  cylinder(r1=roller_d/2-shrink,r2=roller_d/2-tube_od/2+tube_id+compress_delta,h=3*tube_od/2+tube_id+compress_delta-shrink,center=false);
		translate([0,0,rim_thickness/2+tube_od-tube_id-compress_delta])
		  cylinder(r1=roller_d/2-tube_od/2+tube_id+compress_delta,r2=roller_d/2-shrink,h=tube_od/2+tube_id+compress_delta-shrink,center=false);
		translate([0,0,rim_thickness/2+3*tube_od/2-shrink])
		  cylinder(r=roller_d/2-shrink,h=rim_thickness/2-3*tube_od/2+shrink,center=false);
	      translate([0,0,rim_thickness])
		  cylinder(r=roller_d/2-shrink,h=interlock_h,center=false);
	    }
	    if(i % compress_mod != 0) {
		cylinder(r=roller_d/2-shrink,h=rim_thickness/2-tube_od,center=false);
		translate([0,0,rim_thickness/2-tube_od])
		  cylinder(r1=roller_d/2-shrink,r2=roller_d/2-tube_od/2,h=tube_od/2-shrink,center=false);
		translate([0,0,rim_thickness/2+tube_od])
		  cylinder(r1=roller_d/2-tube_od/2,r2=roller_d/2-shrink,h=tube_od/2-shrink,center=false);
		translate([0,0,rim_thickness/2+3*tube_od/2-shrink])
		  cylinder(r=roller_d/2-shrink,h=rim_thickness/2-3*tube_od/2+shrink,center=false);
	      translate([0,0,rim_thickness])
		  cylinder(r=roller_d/2-shrink,h=interlock_h,center=false);
	    }
	  }
	  translate([0,0,-extension]) rotate([0,0,90]) {
	    cube(size=[roller_d,roller_d,interlock_h+extension],center=false);
	    rotate([0,0,180]) cube(size=[roller_d,roller_d,interlock_h+extension],center=false);
	    cylinder(r1=roller_axle_d/2+shrink,r2=roller_axle_d/2+2*shrink,h=interlock_h+extension,center=false);
	  }
	  rotate([0,45,0]) cube(size=[2*shrink,roller_d-2*shrink,2*shrink],center=true);
	  rotate([0,45,90]) cube(size=[2*shrink,roller_d-2*shrink,2*shrink],center=true);
        translate([0,0,rim_thickness]) {
	    cube(size=[roller_d,roller_d,interlock_h+extension],center=false);
	    rotate([0,0,180]) cube(size=[roller_d,roller_d,interlock_h+extension],center=false);
	    cylinder(r1=roller_axle_d/2+shrink,r2=roller_axle_d/2+2*shrink,h=interlock_h+extension,center=false);
        }
	  translate([0,0,rim_thickness+interlock_h]) {
	    rotate([0,45,0]) cube(size=[2*shrink,roller_d-2*shrink,2*shrink],center=true);
	    rotate([0,45,90]) cube(size=[2*shrink,roller_d-2*shrink,2*shrink],center=true);
	  }
	}
    }
  }
}

if(render_part==12) {
  echo("Rendering planetary_hex_rollers()...");
  difference() {
    planetary_hex_rollers(
	outer_d=65
	,planet_d=50
	,roller_num_teeth=9
	,roller_axle_d=3.2
	,drive_num_teeth=15
	,drive_axle_d=5.2
	,shrink=0.3
	,extension=0.1
	, rim_thickness=16, extension=0.1);
    planetary_hex_holes(outer_d=65
	,planet_d=50
	,roller_num_teeth=9
	,roller_axle_d=3.2
	,drive_num_teeth=15
	,drive_axle_d=5.2
	,shrink=0.3
	,extension=0.1
	, rim_thickness=16, extension=0.1);
  }
}
