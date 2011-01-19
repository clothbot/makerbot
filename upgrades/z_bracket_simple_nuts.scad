// Z-Bracket - Simple with Nut Holes

render_part=0; // Calibration_Part();
render_part=1; // Z_Bracket_Holes_2D();
hole_widen=0.0;
// hole_widen=1.0;
// 608 Bearing Dimensions
bearing_608_od=22.0+hole_widen;
bearing_608_id=8.0;
bearing_608_h=7.0;
// ISO Metric Hardware
m3_d=3.0+hole_widen;
m3_scs_head_h=3.0;
m3_scs_head_d=5.5+hole_widen;
m3_scs_head_hex_w=2.5;
m3_nut_din934_w=5.5+hole_widen;
m3_nut_din934_h=2.4;
// MakerBot Cupcake Z-Bracket Critical Dimensions
z_bracket_w = 40.0; // Z Bracket Width
z_bracket_l = 40.0; // Z Bracket Length
z_bracket_h = 5.0+2*m3_nut_din934_h;
z_bracket_corner_r = 10.0; // Z Bracket Corner Radius
z_bracket_top_m3_x_offset=10.0; // Z Bracket M3 Bolt hole position, x offset from center
z_bracket_top_m3_y_offset=10.0; // Z Bracket M3 Bolt hole position, y offset from center

module Nut_Hole_2D(w=1.0) {
  intersection_for(i=[0:2]) {
    rotate([0,0,360*i/3]) square(size=[2*w,w],center=true);
  }
}

module Nut_Hole(w=1.0,h=1.0) {
  linear_extrude(height=h,center=false,convexity=10) {
    Nut_Hole_2D(w=w);
  }
}

module TearDrop_2D(diameter=1.0) {
  $fa=15.0;
  $fs=0.1;
  circle(r=diameter/2);
  rotate(45) square(size=diameter/2,center=false);
}

module TearDrop_Truncated_2D(diameter=1.0) {
  $fa=15.0;
  $fs=0.1;
  difference() {
    union() {
      circle(r=diameter/2);
      rotate(45) square(size=diameter/2,center=false);
    }
    translate([-diameter/2,diameter/2]) square(size=diameter);
  }
}

module Z_Bracket_Holes_2D() {
  $fa=15.0;
  $fs=0.1;
  union() {
    circle(r=bearing_608_od/2,center=true);
    translate([z_bracket_top_m3_x_offset,z_bracket_top_m3_y_offset])
      circle(r=m3_d/2,center=true);
    translate([-z_bracket_top_m3_x_offset,z_bracket_top_m3_y_offset])
      circle(r=m3_d/2,center=true);
    translate([-z_bracket_top_m3_x_offset,-z_bracket_top_m3_y_offset])
      circle(r=m3_d/2,center=true);
    translate([z_bracket_top_m3_x_offset,-z_bracket_top_m3_y_offset])
      circle(r=m3_d/2,center=true);
  }
}

module Z_Bracket_2D() {
  $fa=15.0;
  $fs=0.1;
  difference() {
   union() {
    square(size=[z_bracket_w-2*z_bracket_corner_r,z_bracket_l],center=true);
    square(size=[z_bracket_w,z_bracket_l-2*z_bracket_corner_r],center=true);
    translate([z_bracket_w/2-z_bracket_corner_r,z_bracket_w/2-z_bracket_corner_r])
      circle(r=z_bracket_corner_r,center=true);
    translate([z_bracket_w/2-z_bracket_corner_r,-(z_bracket_w/2-z_bracket_corner_r)])
      circle(r=z_bracket_corner_r,center=true);
    translate([-(z_bracket_w/2-z_bracket_corner_r),-(z_bracket_w/2-z_bracket_corner_r)])
      circle(r=z_bracket_corner_r,center=true);
    translate([-(z_bracket_w/2-z_bracket_corner_r),z_bracket_w/2-z_bracket_corner_r])
      circle(r=z_bracket_corner_r,center=true);
   }
   Z_Bracket_Holes_2D();
  }
}

module Calibration_Part() {
  $fa=15.0;
  $fs=0.1;
  linear_extrude(height=m3_nut_din934_h,convexity=10,center=false) difference() {
    Z_Bracket_2D();
    translate([z_bracket_top_m3_x_offset,z_bracket_top_m3_y_offset])
      rotate([0,0,-45]) 
	Nut_Hole_2D(w=m3_nut_din934_w);
    translate([-z_bracket_top_m3_x_offset,-z_bracket_top_m3_y_offset])
	circle(r=m3_scs_head_d/2);
  }
}

module Z_Bracket_Simple_Nut(extension=0.1) {
  $fa=15.0;
  $fs=0.1;
  difference() {
    linear_extrude(height=z_bracket_h, center=false, convexity=10)
      Z_Bracket_2D();
    translate([0,0,z_bracket_h-m3_nut_din934_h])
      cylinder(r1=bearing_608_od/2
        , r2=bearing_608_od/2+m3_nut_din934_h
        , h=2*m3_nut_din934_h
        , center=false);
    translate([z_bracket_top_m3_x_offset
        , z_bracket_top_m3_y_offset
        , z_bracket_h-m3_nut_din934_h])
      rotate([0,0,-45]) 
	Nut_Hole(w=m3_nut_din934_w,h=m3_nut_din934_h+extension);
    translate([z_bracket_top_m3_x_offset
        , -z_bracket_top_m3_y_offset
        , z_bracket_h-m3_nut_din934_h])
      rotate([0,0,-45+90]) 
	Nut_Hole(w=m3_nut_din934_w,h=m3_nut_din934_h+extension);
    translate([-z_bracket_top_m3_x_offset
        , -z_bracket_top_m3_y_offset
        , z_bracket_h-m3_nut_din934_h])
      rotate([0,0,-45+180]) 
	Nut_Hole(w=m3_nut_din934_w,h=m3_nut_din934_h+extension);
    translate([-z_bracket_top_m3_x_offset
        , z_bracket_top_m3_y_offset
        , z_bracket_h-m3_nut_din934_h])
      rotate([0,0,-45+270]) 
	Nut_Hole(w=m3_nut_din934_w,h=m3_nut_din934_h+extension);
    for(i=[0:3]) {
      translate([0,0,z_bracket_h/2]) rotate([90,0,360*i/4]) {
        linear_extrude(height=bearing_608_od/2+m3_nut_din934_h+0.1, center=false, convexity=10)
          Nut_Hole_2D(w=m3_nut_din934_w);
        linear_extrude(height=z_bracket_w,center=false, convexity=10)
          circle(r=m3_d/2+0.1);
        translate([0,0,z_bracket_w/2-m3_scs_head_h])
          linear_extrude(height=m3_scs_head_h+0.1,center=false,convexity=10)
            TearDrop_Truncated_2D(diameter=m3_scs_head_d);
      }
    }
  }
}

if(render_part==0) {
  echo("Rendering Calibration_Part()...");
  Calibration_Part();
}

if(render_part==1) {
  echo("Rendering Z_Bracket_Simple_Nut()...");
  Z_Bracket_Simple_Nut();
}

