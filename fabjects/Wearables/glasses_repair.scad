// Piece to repair MOREL LIGHTEC glasses arm spring

global_wall_th=0.4;

render_part="arm_spring_clamp_holes";
//render_part="arm_spring_clamp_body";
render_part="arm_spring_clamp_min_body";
render_part="arm_spring_clamp_min";
//render_part="arm_spring_clamp";
//render_part="arm_spring_clamp_multiples";
render_part="arm_spring_clamp_min_multiples";

module arm_spring_clamp_holes(delta=0.4,offset_spring=0.4,extend_bottom=0.1,extend_top=0.1
	,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
    translate([0,0,-extend_bottom]) union() {
        translate([-(outer_w+delta)/2,0,0]) cube([outer_w+delta,outer_h,outer_l+2*wall_th+extend_bottom+extend_top],center=false);
        translate([-gap_w/2-delta/2,0,0]) cube([gap_w+delta,outer_h+spring_th/4,outer_l+2*wall_th+extend_bottom+extend_top],center=false);
        translate([-spring_w/2-delta/2,0,offset_spring+wall_th+extend_bottom])
		cube([spring_w+delta,outer_h+spring_th,outer_l+extend_top+wall_th-offset_spring],center=false);
        translate([0,outer_h,offset_spring+wall_th+extend_bottom])
		rotate([45,0,0]) cube([spring_w+delta,sqrt(2)*spring_th,sqrt(2)*spring_th],center=true);
        translate([-outer_w/2,0]) cylinder(r=delta/2,h=outer_l+2*wall_th+extend_bottom+extend_top,center=false,$fn=8);
        translate([-outer_w/2,outer_h]) cylinder(r=delta/2,h=outer_l+2*wall_th+extend_bottom+extend_top,center=false,$fn=8);
        translate([outer_w/2,outer_h]) cylinder(r=delta/2,h=outer_l+2*wall_th+extend_bottom+extend_top,center=false,$fn=8);
        translate([outer_w/2,0]) cylinder(r=delta/2,h=outer_l+2*wall_th++extend_bottom+extend_top,center=false,$fn=8);
    }
}

if(render_part=="arm_spring_clamp_holes") {
  arm_spring_clamp_holes();
}

module arm_spring_clamp_body(delta=0.4,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
  translate([0,0,wall_th]) minkowski() {
    union() {
        translate([-outer_w/2,0,0]) cube([outer_w,outer_h,outer_l],center=false);
        translate([-gap_w/2-delta/2,0,0]) cube([gap_w+delta,outer_h+spring_th/4,outer_l],center=false);
        translate([-spring_w/2-delta/2,0,0]) cube([spring_w+delta,outer_h+spring_th,outer_l],center=false);
    }
    render() union() {
	translate([0,0,delta/2]) sphere(r=wall_th+delta/2,$fn=8);
	cylinder(r=wall_th/2+1.5*delta,h=2*wall_th,$fn=8,center=true);
    }
  }
}

if(render_part=="arm_spring_clamp_body") {
  arm_spring_clamp_body();
}

module arm_spring_clamp_min_body(delta=0.4,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
  minkowski() {
	translate([0,0,wall_th]) arm_spring_clamp_holes(delta=delta,offset_spring=0,outer_h=outer_h,outer_l=outer_l-2*wall_th,gap_w=gap_w,wall_th=wall_th,spring_th=spring_th,spring_w=spring_w,extend_bottom=0,extend_top=0);
	render() hull() {
	  cube([wall_th,2*wall_th,2*wall_th],center=true);
	  cube([2*wall_th,wall_th,2*wall_th],center=true);
	}
  }
}

if(render_part=="arm_spring_clamp_min_body") {
  arm_spring_clamp_min_body();
}

module arm_spring_clamp_min(delta=0.4,offset_spring=0.4,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
  difference() {
	arm_spring_clamp_min_body(delta=delta,outer_h=outer_h,outer_w=outer_w,outer_l=outer_l,gap_w=gap_w,wall_th=wall_th,spring_th=spring_th,spring_w=spring_w);
	arm_spring_clamp_holes(delta=delta,offset_spring=offset_spring,outer_h=outer_h,outer_w=outer_w,outer_l=outer_l,gap_w=gap_w,wall_th=wall_th,spring_th=spring_th,spring_w=spring_w);
  }
}

if(render_part=="arm_spring_clamp_min") {
  arm_spring_clamp_min(wall_th=2*global_wall_th,delta=0.5,outer_h=2.6);
}

module arm_spring_clamp(delta=0.4,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
    difference() {
        arm_spring_clamp_body(delta=delta,outer_h=outer_h,outer_w=outer_w,outer_l=outer_l,gap_w=gap_w,wall_th=wall_th,spring_th=spring_th,spring_w=spring_w);
        arm_spring_clamp_holes(delta=delta,outer_h=outer_h,outer_w=outer_w,outer_l=outer_l,gap_w=gap_w,wall_th=wall_th,spring_th=spring_th,spring_w=spring_w);
    }
}

if(render_part=="arm_spring_clamp") {
  arm_spring_clamp(wall_th=0.8);
}

if(render_part=="arm_spring_clamp_multiples") {
  for(i=[-1:1]) translate([0,i*10.0])
    arm_spring_clamp(wall_th=5*global_wall_th,delta=0.5,outer_h=2.6);
}

if(render_part=="arm_spring_clamp_min_multiples") {
  for(i=[-1:1]) translate([0,i*8.0])
    arm_spring_clamp_min(wall_th=3*global_wall_th,delta=0.5,outer_h=2.7,outer_l=4.0);
}
