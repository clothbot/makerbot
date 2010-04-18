// SewableSockets Library
// Version 20100416

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
// render_part=4; // pin_hole

module pin_hole(
	rotAngle=0
	, holeHeight=5.0
	, pinSpace=0.1*scale_1in
	, pinHoleWidth=0.1*scale_1in/4
	, pinHoleDepth=0.15*scale_1in
	) {
  rotate([0,0,rotAngle]) union () {
    translate([0,0,-pinSpace/2])
	cylinder(r2=pinSpace
	  , r1=0
	  , h=pinSpace
	  , center=false);
    translate([0,0,-holeHeight]) {
	rotate([0,0,0])
	 scale([sqrt(2)*pinHoleWidth,sqrt(2)*pinHoleWidth,holeHeight])
	  translate([-0.5,-0.5,0]) cube(size=1.0, center=false);
	rotate([90,0,0]) rotate([0,0,45]) {
	 scale([pinHoleWidth,pinHoleWidth,holeHeight])
	  translate([-0.5,-0.5,0]) cube(size=1.0, center=false);
	}
	translate([0,0,-pinHoleWidth/2]) {
	  cylinder(r1=2*pinHoleWidth
		, r2=0
		, h=2*pinHoleWidth
		, center=false);
	  translate([0,-holeHeight+pinHoleWidth/2,0])
	    cylinder(r1=2*pinHoleWidth
		, r2=0
		, h=2*pinHoleWidth
		, center=false);
	}
	translate([0,-holeHeight,0]) {
	   rotate([-45,0,0]) rotate([0,0,0]) 
	    scale([sqrt(2)*pinHoleWidth,sqrt(2)*pinHoleWidth,sqrt(2)*holeHeight])
	     translate([-0.5,-0.5,0]) cube(size=1.0, center=false);
	}
    }
  }
}


module dip_socket_holes(
	socketHeight=5.0
	, pinCount=28
	, pinSpace=0.1*scale_1in
	, pinHoleWidth=0.1*scale_1in/3
	, pinHoleDepth=0.15*scale_1in
	, pinRowSpace=3.25*0.1*scale_1in
	, pkgLength=14.0*0.1*scale_1in
	, pkgWidth=3.0*0.1*scale_1in
	) {
  union () {
    translate([0,0,-socketHeight-pinHoleWidth]) rotate([0,0,-135]) {
	cylinder(r=pinRowSpace/8,h=socketHeight+2*pinHoleWidth,center=false);
	scale([pinRowSpace/8,pinRowSpace/8,socketHeight+2*pinHoleWidth]) cube(size=1.0);
    }
    for( i=[0:(pinCount/2-1)] ) {
      assign(pinPos=pinSpace*i) {
	  translate([pinPos,pinRowSpace/2,0])
	    pin_hole(rotAngle=180);

	  translate([pinPos,-pinRowSpace/2,0])
	    pin_hole(rotAngle=0);
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

if( render_part==4 ) {
  echo("Rendering pin_hole()...");
  pin_hole();
}
