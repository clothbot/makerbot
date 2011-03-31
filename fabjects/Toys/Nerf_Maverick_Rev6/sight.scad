// Sight for Maverick Rev-6
use <sight_mount_cross_section.scad>
use <sight_mount.scad>
render_part=1; // MaverickRev6_Sight_Body()
render_part=2; // MaverickRev6_Sight_Holes()
render_part=3; // MaverickRev6_Sight()

module MaverickRev6_Sight_Body() {
  union() {
    translate([-25.4*(NerfTacticalRail_OuterWidth()/2+0.1),0,0]) cube(size=[25.4*(NerfTacticalRail_OuterWidth()+0.2),25.4*1.0,25.4*0.5],center=false);
    translate([0,0,25.4*0.5]) rotate([-90,0,0]) cylinder(r=25.4*1.0/2,h=25.4*1.0,center=false);
  }
}

if(render_part==1) {
  echo("Rendering MaverickRev6_Sight_Body()...");
  MaverickRev6_Sight_Body();
}

module MaverickRev6_Sight_Holes(extension=0.1) {
  translate([0,-extension,25.4*0.75]) rotate([-90,0,0])
    linear_extrude(height=25.4*1.0+2*extension, convexity=5) {
      union() {
	  circle(r=25.4*3/16);
	  intersection() {
	    rotate(-45-90) square(25.4*3/16);
	    square(25.4*3/8,center=true);
	  }
	}
    }
}

if(render_part==2) {
  echo("Rendering MaverickRev6_Sight_Holes()...");
  MaverickRev6_Sight_Holes();
}

module MaverickRev6_Sight() {
  difference() {
    MaverickRev6_Sight_Body();
    MaverickRev6_Sight_Holes();
  }
}

if(render_part==3) {
  echo("Rendering MaverickRev6_Sight()...");
  MaverickRev6_Sight();
}
