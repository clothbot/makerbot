// Printable Sewing Machine - Sewing Mechanism
// Version 20100519

// Copyright 2010, by Andrew Plumb
// Licensed under the Attribution - Creative Commons license
//   http://creativecommons.org/licenses/by/3.0/

// For more information about OpenSCAD:
//   - see http://www.openscad.org/

// To Do:
// - finish modeling based on stitch formation description
//   http://en.wikipedia.org/wiki/Sewing_machine

$fa=15;
$fs=0.1;

bobbin_od=20.0; // outer diameter
bobbin_id=6.0; // inner diameter
bobbin_sd=8.0; // shaft diameter (on which thread is wrapped)
bobbin_h=12.0; // total height
bobbin_w=1.25; // width of outer bobbin lip/washer

608_id = 8.0;
608_od = 22.0;
608_w = 7.0;

shuttle_id=22.0; // match 608 Bearing OD
shuttle_od=25.0; // almost 25.4=1"
shuttle_beltw=2.0; // drive belt width
shuttle_beltd=1.0; // drive belt depth
shuttle_hookd=2.0; // hook depth 
shuttle_ih=bobbin_h+shuttle_hookd/2; // internal hole height
shuttle_wallw=(shuttle_od-shuttle_id)/2; // wall width

//render_part=1; // bobbin
// render_part=2; // hook_hole_2D
render_part=3; // hook_hole_3D
// render_part=4; // shuttle
// render_part=5; // shuttle bobbin housing

module bobbin(
	od=bobbin_od
	, id=bobbin_id
	, sd=bobbin_sd
	, h=bobbin_h
	, w=bobbin_w
	) {
  difference () {
    union () {
	cylinder(r=sd/2
	  , h=h
	  , center=false);
	cylinder(r=od/2
	  , h=w
	  , center=false);
	translate([0,0,h-w])
	  cylinder(r=od/2
	    , h=w
	    , center=false);
    }
    translate([0,0,-0.1])
	cylinder(r=id/2
	  , h=h+0.2
	  , center=false);
  }
}

module hook_hole_2D(
	od=shuttle_od
	, id=shuttle_id
	, ih=shuttle_ih
	, hookd=shuttle_hookd
	) {
  difference () {
    union () {
	circle(r=id/2);
	translate([id/2,0])
	  circle(r=(od-id));
    }
    translate([id/2,0]) rotate([0,0,45])
	square(size=2*hookd);
  }
}

module hook_hole_3D(
	od=shuttle_od
	, id=shuttle_id
	, ih=shuttle_ih
	, hookd=shuttle_hookd
	) {
  linear_extrude(height=ih
	, center=false
	, convexity = 10
	, twist = -90)
    hook_hole_2D(
	od=od
	, id=id
	, hookd=hookd
	);
}

module shuttle(
	id=shuttle_id
	, od=shuttle_od
	, beltw=shuttle_beltw
	, beltd=shuttle_beltd
	, hookd=shuttle_hookd
	, ih=shuttle_ih
	, wallw=shuttle_wallw
	) {
  difference () {
    union () {
	cylinder(r=od/2-beltd
	  , h=wallw+beltd+beltw+beltd+wallw+ih
	  , center=false);
	cylinder(r=od/2
	  , h=wallw
	  , center=false);
	translate([0,0,wallw])
	  cylinder(r1=od/2
	    , r2=od/2-beltd
	    , h=beltd
	    , center=false);
	translate([0,0,wallw+beltd+beltw])
	  cylinder(r1=od/2-beltd
	    , r2=od/2
	    , h=beltd
	    , center=false);
	translate([0,0,wallw+beltd+beltw+beltd])
	  cylinder(r=od/2
	    , h=wallw
	    , center=false);
	translate([0,0,wallw+beltd+beltw+beltd+wallw])
	  cylinder(r=od/2
	    , h=ih
	    , center=false);
    }
    translate([0,0,wallw+beltd+beltw+beltd+wallw])
	cylinder(r=id/2
	  , h=ih+0.1
	  , center=false);
    translate([0,0,wallw+beltd+beltw+beltd+wallw+ih-hookd])
	rotate([45,0,0])
	  scale([od,od,hookd]) cube(size=1.0,center=false);
    translate([0,0,wallw+beltd+beltw+beltd+wallw+ih-hookd])
	rotate([5,0,0])
	  scale([od,od,od]) cube(size=1.0,center=false);
  }
}
    
if(render_part==1) {
  echo("Rendering bobbin...");
  bobbin();
}

if(render_part==2) {
  echo("Rendering hook_hole_2D...");
  hook_hole_2D();
}


if(render_part==3) {
  echo("Rendering hook_hole_3D...");
  hook_hole_3D();
}

if(render_part==4) {
  echo("Rendering shuttle...");
  shuttle();
}
