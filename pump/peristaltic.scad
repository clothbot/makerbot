// Printable Peristaltic Pump

 render_part="bearing_623_2D";
// render_part="bearing_623";

module bearing_606(
  id=6.0
  , od=17.0
  , thickness=6.0
  ) {
  difference() {
    cylinder(r=od/2,h=thickness,center=false);
    translate([0,0,-0.1])
      cylinder(r=id/2,h=thickness+0.2,center=false);
  }
}

module bearing_623_2D(
  id=3.0
  , od=10.0
  ) {
  $fs=0.1;
  difference() {
    circle($fa=15, r=od/2,center=false);
    circle($fa=30, r=id/2,center=false);
  }
}

module bearing_623(
  id=3.0
  , od=10.0
  , thickness=4.0
  ) {
  linear_extrude(height=thickness, center=false,convexity=10) 
    bearing_623_2D(id=id, od=od);
}

module marble_ball(
  diam=25.4*3/8 // 9.525mm
  ) {
  sphere(r=diam/2,center=true);
}

module tygon_B_44_3(
	od=25.4*3/16
	, id=25.4*1/16
	, wall_thickness=25.4*1/16
	, min_bend_radius=25.4*1/8
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

if(render_part=="bearing_623_2D") {
  echo("Rendering bearing_623_2D...");
  bearing_623_2D();
}

if(render_part=="bearing_623") {
  echo("Rendering bearing_623...");
  bearing_623();
}

