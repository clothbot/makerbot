// Printable Peristaltic Pump

render_part="Bearing_623_2D";
// render_part="Bearing_623";

function Bearing_606_OD()=17.0; // outer diameter
function Bearing_606_ID()=6.0; // inner diameter
function Bearing_606_TH()=6.0; // thickness

module Bearing_606(
  id=Bearing_606_ID()
  , od=Bearing_606_OD()
  , thickness=Bearing_606_TH()
  ) {
  difference() {
    cylinder(r=od/2,h=thickness,center=false);
    translate([0,0,-0.1])
      cylinder(r=id/2,h=thickness+0.2,center=false);
  }
}

function Bearing_623_OD()=10.0; // outer diameter
function Bearing_623_ID()=3.0; // inner diameter
function Bearing_623_TH()=4.0; // thickness

module Bearing_623_2D_OD(
  od=Bearing_623_OD()
  ) {
  $fs=0.1;
  circle($fa=15, r=od/2,center=false);
}
module Bearing_623_2D_ID(
  id=Bearing_623_ID()
  ) {
  $fs=0.1;
  circle($fa=30, r=id/2,center=false);
}

module Bearing_623_2D(
  id=Bearing_623_ID()
  , od=Bearing_623_OD()
  ) {
  $fs=0.1;
  difference() {
    Bearing_623_2D_OD(od=od);   
    Bearing_623_2D_ID(id=id);   
  }
}

module Bearing_623(
  id=Bearing_623_ID()
  , od=Bearing_623_OD()
  , thickness=Bearing_623_TH()
  ) {
  linear_extrude(height=thickness, center=false,convexity=10) 
    Bearing_623_2D(id=id, od=od);
}

module marble_ball(
  diam=25.4*3/8 // 9.525mm
  ) {
  sphere(r=diam/2,center=true);
}

function Tygon_B_44_3_OD()=25.4*3/16; // Outer Diameter
function Tygon_B_44_3_ID()=25.4*1/16; // Inner Diameter
function Tygon_B_44_3_WT()=25.4*1/16; // Wall Thickness
function Tygon_B_44_3_minBR()=25.4*1/8; // minimum Bend Radius

module Tygon_B_44_3_2D(
	od=Tygon_B_44_3_OD()
	, id=Tygon_B_44_3_ID()
	, wall_thickness=Tygon_B_44_3_WT()
	, min_bend_radius=Tygon_B_44_3_minBR()
	) {
  difference() {
    circle(r=od/2);
    circle(r=id/2);
  }
}

module pump_wheel(
	wheel_d=17.0+10.0+3.0
	, wheel_rim_h=12.0
	, wheel_rim_w=6.0
	, ball_inset=1.0
	, ball_d=25.4*3/8
	, ball_n=3
	, tube_od=25.4*3/16
	, tube_id=25.4*1/16
	, motor_bracket_h=2.0
	, bolt_head_h=3.0 // standard M3 head height
	, bolt_head_w=5.5 // standard M3 head width
	, bolt_w=3.0 // standard M3 bolt width
	, motor_axle_w=6.0 // 
	, motor_axle_set_screw_depth=3.0
	) {
  union() {
    difference() {
      cylinder(r=wheel_d/2,h=wheel_rim_h,center=false);
      translate([0,0,-0.1]) cylinder(r=wheel_d/2-wheel_rim_w,h=wheel_rim_h+0.2,center=false);
    }
    difference() {
      cylinder(r=motor_axle_w/2+bolt_head_h+motor_axle_set_screw_depth,h=wheel_rim_h,center=false);
      translate([0,0,-0.1]) cylinder(r=motor_axle_w/2,h=wheel_rim_h+0.2,center=false);
    }
  }

}

module motor_bracket(
	wheel_d=17.0+10.0+3.0
	, ball_inset=1.0
	, ball_d=25.4*3/8
	, tube_od=25.4*3/16
	, tube_id=25.4*1/16
	, motor_bracket_h=2.0
	, bolt_head_h=3.0 // standard M3 head height
	, bolt_head_w=5.5 // standard M3 head width
	, w=3.0 // standard M3 bolt width
	, motor_axle_w=6.0 // 
	) {

}

if(render_part=="Bearing_623_2D") {
  echo("Rendering Bearing_623_2D...");
  Bearing_623_2D();
}

if(render_part=="Bearing_623") {
  echo("Rendering Bearing_623...");
  Bearing_623();
}
