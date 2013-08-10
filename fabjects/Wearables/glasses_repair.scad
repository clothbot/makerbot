// Piece to repair MOREL LIGHTEC glasses arm spring

render_part="arm_spring_clamp_body";
render_part="arm_spring_clamp_holes";
render_part="arm_spring_clamp";

module arm_spring_clamp_body(delta=0.4,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
  translate([0,0,wall_th]) minkowski() {
    union() {
        translate([-outer_w/2,0,0]) cube([outer_w,outer_h,outer_l],center=false);
        translate([-gap_w/2-delta/2,0,0]) cube([gap_w+delta,outer_h+spring_th/4,outer_l],center=false);
        translate([-spring_w/2-delta/2,0,0]) cube([spring_w+delta,outer_h+spring_th,outer_l],center=false);
    }
    sphere(r=wall_th,$fn=8);
  }
}

if(render_part=="arm_spring_clamp_body") {
  arm_spring_clamp_body();
}

module arm_spring_clamp_holes(delta=0.4,outer_h=3.11,outer_w=10.65,outer_l=3.0,gap_w=4.72,wall_th=0.4,spring_th=0.6,spring_w=4.1) {
    translate([0,0,-delta]) union() {
        translate([-outer_w/2,0,0]) cube([outer_w,outer_h,outer_l+2*wall_th+2*delta],center=false);
        translate([-gap_w/2-delta/2,0,0]) cube([gap_w+delta,outer_h+spring_th/4,outer_l+2*wall_th+2*delta],center=false);
        translate([-spring_w/2-delta/2,0,delta+wall_th]) cube([spring_w+delta,outer_h+spring_th,outer_l+wall_th+delta],center=false);
    }
}

if(render_part=="arm_spring_clamp_holes") {
  arm_spring_clamp_holes();
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
