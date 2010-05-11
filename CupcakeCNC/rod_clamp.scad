// Rod Clamp
// - to replace MakerBot Rod Cover
// GPL license to match MakerBot and RepRap projects
// By Andrew Plumb

$fa=15;
$fs=0.1;
debug=0;

// render_part=1; // rod_cover_2D
// render_part=2; // rod_cover_3D
// render_part=3; // rod_clamp_outer
// render_part=4; // rod_clamp_inner
 render_part=5; // rod_clamp


module rod_cover_2D() {
  difference () {
   union () {
    translate([10,10]) circle(r=10);
    translate([10,-10]) circle(r=10);
    translate([-10,-10]) circle(r=10);
    translate([-10,10]) circle(r=10);
    translate([10,0]) square(size=20,center=true);
    translate([-10,0]) square(size=20,center=true);
    translate([0,10]) square(size=20,center=true);
    translate([0,-10]) square(size=20,center=true);
   }
    translate([10,10]) circle(r=3.0/2);
    translate([10,-10]) circle(r=3.0/2);
    translate([-10,-10]) circle(r=3.0/2);
    translate([-10,10]) circle(r=3.0/2);
  }
}

module rod_cover_3D(
  h=4.0
  ) {
  linear_extrude(
	height=h
	, center=false
	, convexity=10
  ) rod_cover_2D();
}

module rod_clamp_outer(
  oh=6.0 // Outer height/thickness of clamp
  , ih=3.0 // Inner height of clamp pass-through
  , id=6.0 // Inner Diameter (rod diameter)
  , od=8.0 // Outer Diameter (clamp diameter)
  , gap_clamp=0.5 // Gap between clamp and bracket
  ) {
  if(debug==1) {
    cylinder(r=od/2,h=ih,center=false);
  }
  difference () {
    rod_cover_3D(
	h=oh
	);
    union () {
	translate([0,0,ih])
	 cylinder(r2=od/2+(oh-ih)
	  , r1=od/2+gap_clamp/2
	  , h=oh-ih
	  , center=false
	 );
	translate([0,0,-0.1]) {
	  cylinder(h=2*0.1+oh
		, r=od/2+gap_clamp/2 );

	 rotate([0,0,45])
	  scale([od/2+gap_clamp/2,od/2+gap_clamp/2,od/2+2*0.1+ih/4])
		cube(size=1.0,center=false);
	 translate([-2.5-gap_clamp/2,0,0])
	  scale([5.0+gap_clamp,10.0+gap_clamp/2,od/2+2*0.1+ih/4])
		cube(size=1.0,center=false);
	}
	translate([0,0,ih])
	  cylinder( r1=od/2
		, r2=od/2+(oh-ih)+gap_clamp/2
		, h=oh-ih+gap_clamp/2
		, center=false);
    }
  }
}

module rod_clamp_inner(
  oh=6.0 // Outer height/thickness of clamp
  , ih=3.0 // Inner height of clamp pass-through
  , id=6.0 // Inner Diameter (rod diameter)
  , od=8.0 // Outer Diameter (clamp diameter)
  , gap_clamp=0.5 // Gap between clamp and bracket
  ) {
 difference () {
  union () {
   cylinder(h=oh+ih+gap_clamp
	, r=od/2-gap_clamp/2
	, center=false
	);
   translate([0,0,oh])
	cylinder(r1=od/2-gap_clamp/2
	  , r2=od/2+ih+gap_clamp/2
	  , h=ih+gap_clamp
	  , center=false
	);
   rotate([0,0,45])
	scale([od/2-gap_clamp/2,od/2-gap_clamp/2,ih+oh+gap_clamp])
	  cube(size=1.0,center=false);
   translate([-2.5+gap_clamp/2,0,0])
	scale([5.0-gap_clamp,10.0-gap_clamp/2,ih+oh+gap_clamp])
	  cube(size=1.0,center=false);
  }
  union () {
   translate([0,0,-0.1]) {
	cylinder(h=2*0.1+oh+ih+gap_clamp
	  , r=id/2
	  , center=false);
	cylinder(r2=0
	  , r1=id/2+(od-id)/4
	  , h=id/2+(od-id)/4
	  , center=false
	);
   }
   translate([0,0,-0.1]) {
	scale([gap_clamp,2*od,od]) cube(size=1.0,center=false);
   }
  }
 }
}

module rod_clamp(
  oh=6.0 // Outer height/thickness of clamp
  , ih=3.0 // Inner height of clamp pass-through
  , id=6.0 // Inner Diameter (rod diameter)
  , od=8.0 // Outer Diameter (clamp diameter)
  , gap_clamp=0.5 // Gap between clamp and bracket
  ) {
  rod_clamp_inner(
	oh=oh
	, ih=ih
	, id=id
	, od=od-0.05*od
	, gap_clamp=gap_clamp
	);
  rod_clamp_outer(
	oh=oh
	, ih=ih
	, id=id
	, od=od
	, gap_clamp=gap_clamp
	);
}


if(render_part==1) {
  echo("Rendering rod_cover_2D...");
  rod_cover_2D();
}

if(render_part==2) {
  echo("Rendering rod_cover_3D...");
  rod_cover_3D();
}

if(render_part==3) {
  echo("Rendering rod_clamp_outer...");
  rod_clamp_outer(
	id=8.0
	, od=11.0);
}

if(render_part==4) {
  echo("Rendering rod_clamp_inner...");
  rod_clamp_inner(
	id=8.0
	, od=11.0);
}

if(render_part==5) {
  echo("Rendering rod_clamp...");
  rod_clamp(
	id=8.0
	, od=14.0
	, gap_clamp=0.25);
}