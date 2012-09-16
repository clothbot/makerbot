// Vent channels to pass air over stepper motors from electronics fan.

//render_part="channel_section_2d";
//render_part="channel_inner_mask_2d";
render_part="channel_section";

vent_xy=29.82; // From laser cut DXF source files
vent2stepper=186.5;

channel_th=2.0; // Channel wall thickness

module channel_section_2d(vent_xy=vent_xy,channel_th=channel_th) {
  hull() {
    translate([0,vent_xy-channel_th]) square([channel_th,2*channel_th],center=false);
    translate([vent_xy-channel_th,0]) square([2*channel_th,channel_th],center=false);
  }
  hull() {
    translate([0,vent_xy/2]) square([channel_th,channel_th],center=false);
    translate([0,vent_xy]) square([channel_th,channel_th],center=false);
  }
  hull() {
    translate([vent_xy/2,0]) square([channel_th,channel_th],center=false);
    translate([vent_xy,0]) square([channel_th,channel_th],center=false);
  }
}

if(render_part=="channel_section_2d") {
  echo("Rendering channel_section_2d()...");
  channel_section_2d();
}

module channel_inner_mask_2d(vent_xy=vent_xy,channel_th=channel_th) {
  polygon(points=[ [0,0],[0,vent_xy],[vent_xy,0] ],paths=[[0,1,2]]);
}

if(render_part=="channel_inner_mask_2d") {
  echo("Rendering channel_inner_mask_2d()...");
  channel_inner_mask_2d();
}

module channel_section(h=60.0,vent_xy=vent_xy,channel_th=channel_th) {
  difference() {
    union() {
      linear_extrude(height=h) render() channel_section_2d(vent_xy=vent_xy,channel_th=channel_th);
      translate([0,0,h-2*channel_th]) linear_extrude(height=3*channel_th) render() intersection() {
	  channel_section_2d(vent_xy=vent_xy,channel_th=2*channel_th);
	  channel_inner_mask_2d(vent_xy=vent_xy,channel_th=channel_th);
	  translate([channel_th,channel_th]) channel_inner_mask_2d(vent_xy=vent_xy-channel_th,channel_th=channel_th);
      }
    }
    translate([0,0,-channel_th]) linear_extrude(height=2*channel_th) render() intersection() {
	channel_section_2d(vent_xy=vent_xy,channel_th=2*channel_th);
	channel_inner_mask_2d(vent_xy=vent_xy,channel_th=channel_th);
	translate([channel_th,channel_th]) channel_inner_mask_2d(vent_xy=vent_xy-channel_th,channel_th=channel_th);
    }
  }
}

if(render_part=="channel_section") {
  echo("Rendering channel_section()...");
  for(i=[0:3]) rotate([0,0,i*360/4]) translate([channel_th,channel_th,0]) 
    channel_section();
}

