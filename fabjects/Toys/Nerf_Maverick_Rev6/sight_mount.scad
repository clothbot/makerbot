// Sight Mount
// scale 1 unit = 1mm
// render_part=1; // MaverickRev6_SightMount
render_part=2; // Printable MaverickRev6_SightMount

use <sight_mount_cross_section.scad>
use <sight_mount_side_profile.scad>

module MaverickRev6_SightMount() {
  intersection() {
    linear_extrude(height=25.4*3.5, convexity=10, center=false) scale([25.4,25.4])
	MaverickRev6_SightMount_XSection();
    translate([25.4*0.7/2,0,0]) rotate([0,-90,0])
      linear_extrude(height=25.4*0.7, convexity=10, center=false) scale([25.4,25.4])
	MaverickRev6_SightMount_SideProfile();
  }
}

if(render_part==1) {
  echo("Rendering MaverickRev6_SightMount()...");
  MaverickRev6_SightMount();
}

if(render_part==2) {
  echo("Rendering printable MaverickRev6_SightMount()...");
  translate([0,-25.4*3.5/2,25.4*0.25]) rotate([-90,0,0]) MaverickRev6_SightMount();
}

