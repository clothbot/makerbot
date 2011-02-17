// Faceplate Clip - Socket and Peg

$fs=0.1;
$fa=15;

render_part=1; // FaceplateSocket_Peg()

module Faceplate_Socket_Peg_Body(extension=0.1
	, base_width=12.0
	, base_length=60.0
	, base_height=2.0
	, peg_outer_length=22.5
	, peg_width=10.0
	, peg_height=13.0
  ) {
  union() {
    translate([-base_length/2,-base_width/2,0]) cube(size=[base_length,base_width,base_height],center=false);
    translate([-peg_outer_length/2+peg_width/2,-peg_width/2,0])
	cube(size=[peg_outer_length-peg_width,peg_width,peg_height+base_height],center=false);
    translate([-peg_outer_length/2+peg_width/2,0,0])
	cylinder(r=peg_width/2,h=peg_height+base_height,center=false);
    translate([peg_outer_length/2-peg_width/2,0,0])
	cylinder(r=peg_width/2,h=peg_height+base_height,center=false);
  }
}

module Faceplate_Socket_Peg_Holes(extension=0.1
	, base_height=2.0
	, peg_height=13.0
	, base_slot_separation=30.0
	, base_slot_width=25.4/8
	, base_slot_length=11.0
	) {
  union() {
    translate([base_slot_separation/2+base_slot_width/2,-base_slot_width/2,-extension])
      cube(size=[base_slot_length-base_slot_width,base_slot_width,2*extension+base_height],center=false);
    translate([base_slot_separation/2+base_slot_width/2,0,-extension])
      cylinder(r=base_slot_width/2,h=2*extension+base_height,center=false);
    translate([base_slot_separation/2+base_slot_length-base_slot_width/2,0,-extension])
      cylinder(r=base_slot_width/2,h=2*extension+base_height,center=false);
  }
  union() {
    translate([-base_slot_separation/2-base_slot_length+base_slot_width/2,-base_slot_width/2,-extension])
      cube(size=[base_slot_length-base_slot_width,base_slot_width,2*extension+base_height],center=false);
    translate([-base_slot_separation/2-base_slot_length+base_slot_width/2,0,-extension])
      cylinder(r=base_slot_width/2,h=2*extension+base_height,center=false);
    translate([-base_slot_separation/2-base_slot_width/2,0,-extension])
      cylinder(r=base_slot_width/2,h=2*extension+base_height,center=false);
  }
  translate([0,0,-extension]) cylinder(r=base_slot_width/2,h=2*extension+base_height+peg_height,center=false);
}

module Faceplate_Socket_Peg() {
  difference() {
    Faceplate_Socket_Peg_Body();
    Faceplate_Socket_Peg_Holes();
  }
}

if(render_part==1) {
  echo("Rendering Faceplate_Socket_Peg()...");
  Faceplate_Socket_Peg();
}

