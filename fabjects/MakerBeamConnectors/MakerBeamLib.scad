// MakerBeam Library
// Version 20100228

// Copyright 2010, by Andrew Plumb
// Licensed under the Attribution - Creative Commons license
//   http://creativecommons.org/licenses/by/3.0/

// - Uses smallest length MakerBeam Mini-T beams
// - Fits diagonally on my Batch 1 MakerBot Z-platform

// For more information about OpenSCAD:
//   - see http://www.openscad.org/
// For more information about MakerBeam:
//   - see http://www.makerbeam.com/

// To Do:
//  -  Drop the Mini-T mount points down and difference off the bottom
//   protrusion so the first layer extends all the way to their tips.
//   - Current version's are bit too high, don't appear in 1st layer and warp
//    a little.

$fa=9;
$fs=0.1;

scale_1in=25.4;

 render_part=3; // The part the Flex-Shaft screws into.
// render_part=6; // An optional part to bolt on the Flex-Shaft handle
// render_part=9; // The Mini-T to Z-platform M5 bolt hold adapter part



module dremel_flexshaft_mount_body(
	arms=6
	, mini_t_z=12.0
	, mini_t_r=20.0
	, mini_t_d=10.0
	, mini_t_wall=0.1*scale_1in
  ) {
  union () {
	difference() { 
	  cylinder(
	    r=0.75*scale_1in
	    , h=1.7*0.25*scale_1in
	    , center=false
	  );
	  translate([0,0,0.25*scale_1in])
		cylinder(
		  r=0.5*scale_1in
		  , h=0.25*scale_1in+0.1
		  , center=false
		);
	}
	for( i=[0:arms-1] ) {
	  assign(rotAngle=i*360/arms) {
	    rotate([0,0,rotAngle])translate([mini_t_r-mini_t_d/2,-4.0,0]) {
		scale([mini_t_d,8.0,mini_t_z]) cube(size=1.0,center=false);
	    }
	    rotate([0,0,rotAngle])
		translate([mini_t_r
		  , 0
		  , mini_t_z
		])
		rotate([45,0,0])
		  scale([mini_t_d,10.0+2*mini_t_wall,10.0+2*mini_t_wall])
			cube(size=1.0,center=true);
	  }
	}
  }
}

module dremel_flexshaft_mount_holes(
	arms=6
	, mini_t_z=12.0
	, mini_t_r=20.0
	, mini_t_d=10.0
  ) {
  union () {
	translate([0,0,-0.5*scale_1in]) cylinder(
	  r=0.25*scale_1in
	  , h=1.0*scale_1in
	  , center=false
	);
	for( i=[0:arms-1] ) {
	  assign(rotAngle=i*360/arms) {
	    rotate([0,0,rotAngle])
		translate([mini_t_r
			, 0.0
			, mini_t_z
		]) rotate([45,0,0]) {
		  translate([2.0,0,0]) scale([mini_t_d,10.2,10.2])
			cube(size=1.0,center=true);
		  cylinder(r=1.6
			, h=20.0
			, center=true
		  );
		  rotate([90,0,0]) cylinder(r=1.6
			, h=20.0
			, center=true
		  );
	    }
	  }
	}
  }
}

module dremel_flexshaft_mount() {
  difference () {
    dremel_flexshaft_mount_body(mini_t_z=10.0);
    dremel_flexshaft_mount_holes(mini_t_z=10.0);
    translate([0,0,-10.0])
	cylinder(r=50.0,h=10.0,center=false);
  }
}

module handle_body(arms=6) {
  union () {
	translate([0,0,0]) cylinder(
	  r=(1.0+0.5)*scale_1in/2
	  , h=1.0*scale_1in
	  , center=false
	);
	for( i=[0:arms-1] ) {
	  assign(rotAngle=i*360/arms) {
	    rotate([0,0,rotAngle])translate([20.0+2.5,0,5.0/2]) {
		scale([11.0,8.0,5.0]) cube(size=1.0,center=true);
	    }
	    rotate([45,0,rotAngle])
		translate([22.0
			,1.414*10.0/2+0.47
			,1.414*10.0/2+0.47
		])
		  scale([12.0,10.0+2*0.1*scale_1in,10.0+2*0.1*scale_1in])
			cube(size=1.0,center=true);
	  }
	}
  }
}

module handle_holes(arms=6) {
  union () {
	translate([0,0,-1.0*scale_1in/2]) cylinder(
	  r=0.5*scale_1in
	  , h=2.0*scale_1in
	  , center=false
	);
	for( i=[0:arms-1] ) {
	  assign(rotAngle=i*360/arms) {
	    rotate([45,0,rotAngle]) {
		translate([23.0
			,1.414*10.0/2+0.47
			,1.414*10.0/2+0.47
		])
		  scale([12.0,10.2,10.2])
			cube(size=1.0,center=true);
		translate([23.0
			,1.414*10.0/2+0.47
			,1.414*10.0/2+0.47]) {
		  cylinder(r=1.6
			, h=20.0
			, center=true
		  );
		  rotate([90,0,0]) cylinder(r=1.6
			, h=20.0
			, center=true
		  );
		}
	    }
	    rotate([0,0,rotAngle]) {
		translate([0,0,0.8*scale_1in]) {
		  rotate([90,rotAngle,0]) cylinder(r=1.5,h=2.0*scale_1in,center=false);
		  translate([0,1.0*scale_1in/2,0])
		    scale([6.5,5.5,0.5*scale_1in+3.0]) cube(size=1.0, center=true);
		}
	    }
	  }
	}
  }
}

module flex_handle() {
  difference () {
    handle_body();
    handle_holes();
  }
}

module bracket_body(arms=3) {
  union () {
	cylinder(
	  r=12.0
	  , h=11.0
	  , center=false
	);
	for( i=[0:arms-1] ) {
	  assign(rotAngle=i*360/arms) {
	    rotate([0,0,rotAngle])translate([12.0+2.5,0,5.0/2]) {
		scale([7.0,8.0,5.0]) cube(size=1.0,center=true);
	    }
	    rotate([45,0,rotAngle]) {
		translate([12.0
			,1.414*10.0/2+0.47
			,1.414*10.0/2+0.47
		])
		  scale([12.0,10.0+2*0.1*scale_1in,10.0+2*0.1*scale_1in])
			cube(size=1.0,center=true);
	    }
	  }
	}
  }
}

module bracket_holes(arms=3) {
  union () {
	translate([0,0,-0.1]) cylinder(
	  r=2.5
	  , h=11.0+0.2
	  , center=false
	);
	translate([0,0,5.0]) cylinder(
	  r=6.0
	  , h=6.0+0.1
	  , center=false
	);
	for( i=[0:arms-1] ) {
	  assign(rotAngle=i*360/arms) {
	    rotate([45,0,rotAngle]) {
		translate([13.0
			,1.414*10.0/2+0.47
			,1.414*10.0/2+0.47
		])
		  scale([12.0,10.2,10.2])
			cube(size=1.0,center=true);
		translate([13.0
			,1.414*10.0/2+0.47
			,1.414*10.0/2+0.47]) {
		  cylinder(r=1.6
			, h=20.0
			, center=true
		  );
		  rotate([90,0,0]) cylinder(r=1.6
			, h=20.0
			, center=true
		  );
		}
	    }
	  }
	}
  }
}

module flex_bracket() {
  difference () {
    bracket_body();
    bracket_holes();
  }
}


if( render_part==1 ) {
  echo("Rendering dremel_flexshaft_mount_body()...");
  dremel_flexshaft_mount_body();
}


if( render_part==2 ) {
  echo("Rendering dremel_flexshaft_mount_holes()...");
  dremel_flexshaft_mount_holes();
}

if( render_part==3 ) {
  echo("Rendering dremel_flexshaft_mount()...");
  dremel_flexshaft_mount();
}

if( render_part==4 ) {
  echo("Rendering handle_body()...");
  handle_body();
}


if( render_part==5 ) {
  echo("Rendering handle_holes()...");
  handle_holes();
}

if( render_part==6 ) {
  echo("Rendering flex_handle()...");
  flex_handle();
}

if( render_part==7 ) {
  echo("Rendering bracket_body()...");
  bracket_body();
}


if( render_part==8 ) {
  echo("Rendering bracket_holes()...");
  bracket_holes();
}

if( render_part==9 ) {
  echo("Rendering bracket_handle()...");
  flex_bracket();
}

