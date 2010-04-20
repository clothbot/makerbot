// MakerBeam Library
// Version 20100417

// Copyright 2010, by Andrew Plumb
// Licensed under the Attribution - Creative Commons license
//   http://creativecommons.org/licenses/by/3.0/

// - Uses smallest length MakerBeam Mini-T beams

// For more information about OpenSCAD:
//   - see http://www.openscad.org/
// For more information about MakerBeam:
//   - see http://www.makerbeam.com/

// To Do:
// - make corner pieces with integrated bearing brackets.

$fa=9;
$fs=0.1;

scale_1in=25.4;

// render_part=3; // The part the Flex-Shaft screws into.
// render_part=6; // An optional part to bolt on the Flex-Shaft handle
// render_part=9; // The Mini-T to Z-platform M5 bolt hold adapter part
// render_part=10; // mini_t_socket
// render_part=11; // bearing_hole
// render_part=12; // cube_corner
// render_part=13; // nut_blank
// render_part=14; // m3_nut
 render_part=15; // cu_pipe_socket

module mini_t_socket(
	rotAngle=0
	, mini_t_b=8.0
	, mini_t_z=12.0
	, mini_t_r=15.0/2
	, mini_t_d=15.0
	, mini_t_wall=0.1*scale_1in
	, mini_t_rwall=0.1*scale_1in
	, mini_t_delta=0.1*scale_1in-2.0
	, mini_t_rdelta=0
  ) {
  difference () {
    union () {
	    rotate([0,0,rotAngle])translate([mini_t_r-mini_t_d/2-mini_t_rwall,-mini_t_b/2,0]) {
		scale([mini_t_d+mini_t_rwall,mini_t_b,mini_t_z]) cube(size=1.0,center=false);
	    }
	    rotate([0,0,rotAngle])
		translate([mini_t_r-mini_t_rwall/2
		  , 0
		  , mini_t_z
		])
		rotate([45,0,0])
		  scale([mini_t_d+mini_t_rwall,10.0+2*mini_t_wall,10.0+2*mini_t_wall])
			cube(size=1.0,center=true);
    }
    union () {
	    rotate([0,0,rotAngle])
		translate([mini_t_r
			, 0.0
			, mini_t_z
		]) rotate([45,0,0]) {
		  translate([mini_t_wall,0,0]) scale([mini_t_d+2*mini_t_wall,10.0+mini_t_delta,10.0+mini_t_delta])
		    difference () {
			  cube(size=1.0,center=true);
			  translate([-0.5,-0.5,0]) scale([2,1,1]) sphere(r=0.25/2, center=true, $fn=9);
			  translate([0.125,-0.5,0]) scale([2,2,2]) sphere(r=0.25/4, center=true, $fn=9);
			  translate([-0.5,0,-0.5]) scale([2,1,1]) sphere(r=0.25/2, center=false, $fn=9);
			  translate([0.125,0,-0.5]) scale([2,2,2]) sphere(r=0.25/4, center=false, $fn=9);
		    }
		  if( mini_t_rdelta > 0 ) translate([-mini_t_d/2-mini_t_wall,0,0]) scale([2*mini_t_rdelta,10.0+mini_t_delta,10.0+mini_t_delta])
		    difference () {
			cube(size=1.0,center=true);
			  translate([0,-0.5,0]) scale([4,1,1]) sphere(r=0.25/2, center=true, $fn=9);
			  translate([0,0,-0.5]) scale([4,1,1]) sphere(r=0.25/2, center=false, $fn=9);
		    }
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

module nut_blank(
	nut_w=5.5
	, nut_h=2.5
	) {
  scale([nut_w,nut_w,nut_h]) import_stl("../libraries/primitives/unit_hexagon.stl");
}

module m3_nut(
	nut_h=3.0
	, nut_wdelta=0.1
	, bolt_rdelta=0.05
	, bolt_hdelta=0.01
	) {
  difference () {
	nut_blank(
	  nut_w=5.5+nut_wdelta
	  , nut_h=nut_h
	);
	translate([0,0,-bolt_hdelta/2]) cylinder(r=3.0/2+bolt_rdelta,
	  , h=nut_h+bolt_hdelta
	  , center=false );
  }
}

module bearing_hole(
	captive_nut_w=5.5
	, captive_nut_l=6.4
	, captive_nut_h=3.0
	, captive_nut_count=4
	, captive_bolt_d=3.0
	, captive_bolt_l=16.0
	, axle_h_up=10.0
	, axle_h_dn=5.0
	, bearing_id=8.0
	, bearing_od=22.0
	, bearing_h=7.0
	) {
  union () {
    cylinder(r=bearing_od/2
	, h=bearing_h
	, center=true);
    cylinder(r=bearing_id/2
	, h=axle_h_up
	, center=false);
    rotate([180,0,0]) cylinder(r=bearing_id/2
	, h=axle_h_dn
	, center=false);
    for( i=[0:captive_nut_count-1] ) {
	assign(rotAngle=i*360/captive_nut_count) {
	 rotate([0,0,rotAngle]) {
	  translate([bearing_id/2,-captive_nut_w/2,-bearing_h/2]) {
	    scale([bearing_od/2-bearing_id/2+captive_nut_h,captive_nut_w,bearing_h])
	      cube(size=1.0, center=false);
	  }
	 }
	 rotate([90,0,rotAngle+90]) {
	  cylinder( r=captive_bolt_d/2
		, h=bearing_od/2-bearing_id/2+captive_bolt_l
		, center=false);
	 }
	}
    }
  }

}

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

module cube_corner() {
 difference () {
  union () {
    cylinder(r=26/2+0.1*scale_1in, h=24.0, center=false);
    translate([0,0,19]) for ( i=[0:2] ) {
	assign(rotAngle=i*360/3-45) {
	  rotate([90,0,rotAngle]) {
	   translate([0,0,29.0/2])
	    cylinder(
		r1=8.0
		, r2=6.0
		, h=2.0
		, center=false);
	   translate([0,0,23.0/2])
	    cylinder(
		r=8.0
		, h=3.0
		, center=false);
	  }
	}
    }
    translate([0.707*18/2,0.707*18/2,0]) rotate([0,-90,-135]) 
	mini_t_socket(rotAngle=0
		, mini_t_b=1.414*8.0
		, mini_t_z=1.414*10.0
		, mini_t_r=20.0/2+3.0
		, mini_t_d=20.0
		, mini_t_wall=0.1*scale_1in
		, mini_t_rwall=3.0
		, mini_t_rdelta=10.0
	);
    rotate([0,0,-90]) translate([26.0/2,0,0]) 
	mini_t_socket(rotAngle=0
		, mini_t_z=12.0
		, mini_t_r=7.5+0.1*scale_1in
		, mini_t_d=15.0
		, mini_t_wall=0.1*scale_1in
		, mini_t_rwall=5.0
	);
    rotate([0,0,-180]) translate([26.0/2,0,0]) 
	mini_t_socket(rotAngle=0
		, mini_t_z=12.0
		, mini_t_r=7.5+0.1*scale_1in
		, mini_t_d=15.0
		, mini_t_wall=0.1*scale_1in
		, mini_t_rwall=5.0
	);
  }
  union () {
    rotate([0,0,180+45]) translate([0,0,24.0-10.0/2])
	bearing_hole(captive_nut_count=3
		, captive_bolt_l=16.0
		, bearing_h=11.0
		, axle_h_up=12.0
		, axle_h_dn=20.0
		, bearing_id=17.0
		, bearing_od=23.0
	);
  }
 }
}

module cu_pipe_socket (
	rotAngle=0
	, cu_pipe_id=0.5*scale_1in
	, cu_pipe_od=(2/3)*scale_1in
	, cu_pipe_b=(2/3)*scale_1in
	, cu_pipe_z=(2/3)*scale_1in
	, cu_pipe_r=15.0/2
	, cu_pipe_d=(2/3)*scale_1in
	, cu_pipe_wall=0.1*scale_1in
	, cu_pipe_rwall=0.1*scale_1in
	, cu_pipe_delta=0.1*scale_1in-2.0
	, cu_pipe_rdelta=0
  ) {
  difference () {
    union () {
	    rotate([0,0,rotAngle])translate([cu_pipe_r-cu_pipe_d/2-cu_pipe_rwall,-cu_pipe_b/2,0]) {
		scale([cu_pipe_d+cu_pipe_rwall,cu_pipe_b,cu_pipe_z]) cube(size=1.0,center=false);
	    }
	    rotate([0,0,rotAngle])
		translate([cu_pipe_r-cu_pipe_rwall/2
		  , 0
		  , cu_pipe_z
		])
		rotate([45,0,0])
		  scale([cu_pipe_d+cu_pipe_rwall,cu_pipe_od/2+2*cu_pipe_wall,cu_pipe_od/2+2*cu_pipe_wall])
			rotate([0,90,0]) cylinder(r=1.0,h=1.0,center=true);
    }
    union () {
	    rotate([0,0,rotAngle])
		translate([cu_pipe_r
			, 0.0
			, cu_pipe_z
		]) rotate([45,0,0]) {
		  translate([cu_pipe_wall,0,0]) scale([cu_pipe_d+2*cu_pipe_wall,cu_pipe_od/2+cu_pipe_delta,cu_pipe_od/2+cu_pipe_delta]) {
		   difference () {
		    rotate([-45,0,0]) {
		      rotate([0,90,0]) cylinder(r=1.0,h=1.0,center=true);
		      rotate([45,0,0]) translate([-0.5,0,0]) cube(size=1.0,center=false);
		    }
		    rotate([-45,0,0]) translate([0,0,1.55]) cube(size=1.1,center=true);
		   }
		  }
		  if( cu_pipe_rdelta > 0 ) translate([-cu_pipe_d/2-cu_pipe_wall,0,0]) scale([cu_pipe_d+2*cu_pipe_wall,cu_pipe_od/2+cu_pipe_delta,cu_pipe_od/2+cu_pipe_delta])
		   difference () {
		    rotate([-45,0,0]) {
		      rotate([0,90,0]) cylinder(r=1.0,h=1.0,center=true);
		      rotate([45,0,0]) translate([-0.5,0,0]) cube(size=1.0,center=false);
		    }
		    rotate([-45,0,0]) translate([0,0,1.55]) cube(size=1.1,center=true);
		   }
		  cylinder(r=1.6
			, h=2*cu_pipe_od+cu_pipe_delta
			, center=true
		  );
		  rotate([90,0,0]) cylinder(r=1.6
			, h=2*cu_pipe_od+cu_pipe_delta
			, center=true
		  );
	    }
		cylinder(r=3.0/2, h=cu_pipe_z, center=true);
		translate([0,0,cu_pipe_r-3.0]) nut_blank(nut_h=4.0);
		translate([cu_pipe_r,0,0]) {
		  cylinder(r=3.0/2, h=cu_pipe_z, center=true);
		  translate([0,0,cu_pipe_r-3.0]) nut_blank(nut_h=4.0);
		}
    }
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

if( render_part==10 ) {
  echo("Rendering mini_t_socket() with 10*10*10 reference cube...");
  rotate([0,-90,-135]) mini_t_socket(rotAngle=0
	, mini_t_z=1.414*10.0
	, mini_t_r=10
	, mini_t_d=20.0
	, mini_t_wall=0.1*scale_1in
	, mini_t_rwall=0.1*scale_1in
	, mini_t_rdelta=10.0
  );
  rotate([0,-90,45]) mini_t_socket(rotAngle=0
	, mini_t_z=1.414*10.0
	, mini_t_r=0
	, mini_t_d=10.0
	, mini_t_wall=3.0
	, mini_t_rwall=1.0
  );
//  cube(size=10.0);
}

if( render_part==11 ) {
  echo("Rendering bearing_hole()...");
  bearing_hole(captive_nut_count=3
		, captive_bolt_l=16.0
	);
}

if( render_part==12 ) {
  echo("Rendering cube_corner()...");
  cube_corner();
}

if( render_part==13 ) {
  echo("Rendering nut_blank()...");
  nut_blank();
}

if( render_part==14 ) {
  echo("Rendering m3_nut()...");
  m3_nut(	nut_h=2.5
	, bolt_rdelta=-0.05
  );
}

if( render_part==15 ) {
  echo("Rendering cu_pipe_socket()...");
  cu_pipe_socket( cu_pipe_rwall=0.1*scale_1in
	, cu_pipe_rdelta=10.0);

}

