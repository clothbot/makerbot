// SewableSockets Library
// Version 20100413

// Copyright 2010, by Andrew Plumb
// Licensed under the Attribution - Creative Commons license
//   http://creativecommons.org/licenses/by/3.0/

// For more information about OpenSCAD:
//   - see http://www.openscad.org/

$fa=9;
$fs=0.1;

scale_1in=25.4;

// render_part=1; // DIP Socket Holes
// render_part=2; // DIP Socket Body
render_part=3; // DIP Socket

module dip_socket_holes(
	socketHeight=5.0
	, pinCount=28
	, pinSpace=0.1*scale_1in
	, pinHoleWidth=0.1*scale_1in/4
	, pinHoleDepth=0.15*scale_1in
	, pinRowSpace=3.25*0.1*scale_1in
	, pkgLength=14.0*0.1*scale_1in
	, pkgWidth=3.0*0.1*scale_1in
	) {
  union () {
    for( i=[0:(pinCount/2-1)] ) {
      assign(pinPos=pinSpace*i) {
	translate([pinPos,pinRowSpace/2,-pinHoleDepth])
	  cylinder(r1=pinHoleWidth/2
		, r2=pinHoleWidth
		, h=pinHoleDepth
		, center=false
		);
	translate([pinPos,pinRowSpace/2,0]) {
	  sphere(r=pinHoleWidth);
	  rotate([-135,0,0]) {
	    scale([pinHoleWidth,pinHoleWidth,1.414*socketHeight])
		rotate([0,0,-135]) translate([-1.414*pinHoleWidth/2,-1.414*pinHoleWidth/2,0])
		  cube(size=1.0,center=false);
	  }
	}
	translate([pinPos, pinRowSpace/2, -socketHeight]) {
	  scale([pinHoleWidth,pinHoleWidth,socketHeight])
		rotate([0,0,-135]) translate([-1.414*pinHoleWidth/2,-1.414*pinHoleWidth/2,0])
		  cube(size=1.0,center=false);
	  translate([0,0,-pinHoleWidth/2]) cylinder(r1=pinHoleWidth
		, r2=0
		, h=2*pinHoleWidth
		, center=false
		);
	  rotate([-90,0,0]) {
	    scale([pinHoleWidth,pinHoleWidth,socketHeight+pinHoleWidth])
		rotate([0,0,-135]) translate([-1.414*pinHoleWidth/2,-1.414*pinHoleWidth/2,0])
		  cube(size=1.0,center=false);
	  }
	 }

	translate([pinPos,-pinRowSpace/2,-pinHoleDepth])
	  cylinder(r1=pinHoleWidth/2
		, r2=pinHoleWidth
		, h=pinHoleDepth
		, center=false
		);
	translate([pinPos,-pinRowSpace/2,0]) {
	  sphere(r=pinHoleWidth);
	  rotate([135,0,0]) {
	    scale([pinHoleWidth,pinHoleWidth,1.414*socketHeight])
		rotate([0,0,-135]) translate([-1.414*pinHoleWidth/2,-1.414*pinHoleWidth/2,0])
		  cube(size=1.0,center=false);
	  }
	}
	translate([pinPos, -pinRowSpace/2, -socketHeight]) {
	  scale([pinHoleWidth,pinHoleWidth,socketHeight])
		rotate([0,0,-135]) translate([-1.414*pinHoleWidth/2,-1.414*pinHoleWidth/2,0])
		  cube(size=1.0,center=false);
	  translate([0,0,-pinHoleWidth/2]) cylinder(r1=pinHoleWidth
		, r2=0
		, h=2*pinHoleWidth
		, center=false
		);
	  rotate([90,0,0]) {
	    scale([pinHoleWidth,pinHoleWidth,socketHeight+pinHoleWidth])
		rotate([0,0,-135]) translate([-1.414*pinHoleWidth/2,-1.414*pinHoleWidth/2,0])
		  cube(size=1.0,center=false);
	  }
	 }

	}
    }
  }
}

module dip_socket_body(
	socketHeight=5.0
	, pinCount=28
	, pinSpace=0.1*scale_1in
	, pinHoleWidth=0.1*scale_1in/4
	, pinHoleDepth=0.15*scale_1in
	, pinRowSpace=3.25*0.1*scale_1in
	, pkgLength=14.0*0.1*scale_1in
	, pkgWidth=3.0*0.1*scale_1in
	) {
  union () {
    translate([-pinSpace,-(pinRowSpace+2*socketHeight)/2,-socketHeight])
      scale([(pinCount+2)*pinSpace/2,pinRowSpace+2*socketHeight,socketHeight])
	   cube(size=1.0, center=false);
  }
}

module dip_socket() {
  difference () {
	dip_socket_body();
	dip_socket_holes();
  }
}

if( render_part==1 ) {
  echo("Rendering dip_socket_holes()...");
  dip_socket_holes();
}

if( render_part==2 ) {
  echo("Rendering dip_socket_body()...");
  dip_socket_body();
}

if( render_part==3 ) {
  echo("Rendering dip_socket()...");
  dip_socket();
}
