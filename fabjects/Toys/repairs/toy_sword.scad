// Fix for toy costume sword.

render_part="scabbard2blade_body";
render_part="scabbard2blade_holes";
render_part="scabbard2blade";

scabbard_w=28.0;
scabbard_h=7.5;
scabbard_l=17.25;
scabbard_bolt_offset=8.0;
scabbard_bolt_d=3.2;

blade_w=26.2;
blade_h=3.9;
blade_l=14.7;
global_wall_th=0.4;

module scabbard2blade_body(wall_th=0.4
    ,scab_w=scabbard_w,scab_h=scabbard_h,scab_l=scabbard_l
    ,scab_bolt_offset=scabbard_bolt_offset,scab_bolt_d=scabbard_bolt_d
    ,blade_w=blade_w,blade_h=blade_h,blade_l=blade_l
    ) {
  hull() {
    translate([-(scab_w+2*wall_th)/2,-(scab_h+2*wall_th)/2]) cube([scab_w+2*wall_th,scab_h+2*wall_th,scab_l+wall_th],center=false);
    translate([-(blade_w+2*wall_th)/2,-(blade_h+2*wall_th)/2,scab_l+wall_th]) cube([blade_w+2*wall_th,blade_h+2*wall_th,blade_l],center=false);
  }
}

if(render_part=="scabbard2blade_body") {
    scabbard2blade_body();
}

module scabbard2blade_holes(wall_th=0.4
    ,scab_w=scabbard_w,scab_h=scabbard_h,scab_l=scabbard_l
    ,scab_bolt_offset=scabbard_bolt_offset,scab_bolt_d=scabbard_bolt_d
    ,blade_w=blade_w,blade_h=blade_h,blade_l=blade_l
    ,extend_bottom=0.1,extend_top=0.1
    ) {
    translate([-scab_w/2,-scab_h/2,-extend_bottom]) cube([scab_w,scab_h,scab_l+extend_bottom],center=false);
    translate([-blade_w/2,-blade_h/2,scab_l+wall_th]) cube([blade_w,blade_h,blade_l+extend_top],center=false);
    translate([0,0,scab_l-scab_bolt_offset-scab_bolt_d/2]) rotate([90,0,0]) cylinder(r=scab_bolt_d/2,h=2*scab_w,center=true,$fn=8);
}

if(render_part=="scabbard2blade_holes") {
    scabbard2blade_holes();
}

module scabbard2blade(wall_th=0.4
    ,scab_w=scabbard_w,scab_h=scabbard_h,scab_l=scabbard_l
    ,scab_bolt_offset=scabbard_bolt_offset,scab_bolt_d=scabbard_bolt_d
    ,blade_w=blade_w,blade_h=blade_h,blade_l=blade_l
    ,extend_bottom=0.1,extend_top=0.1
    ) {
  difference() {
    scabbard2blade_body(wall_th=wall_th,scab_w=scab_w,scab_h=scab_h,scab_l=scab_l,scab_bolt_offset=scab_bolt_offset,scab_bolt_d=scab_bolt_d
        ,blade_w=blade_w,blade_h=blade_h,blade_l=blade_l);
    scabbard2blade_holes(wall_th=wall_th,scab_w=scab_w,scab_h=scab_h,scab_l=scab_l,scab_bolt_offset=scab_bolt_offset,scab_bolt_d=scab_bolt_d
        ,blade_w=blade_w,blade_h=blade_h,blade_l=blade_l,extend_bottom=extend_bottom,extend_top=extend_top);
  }
}

if(render_part=="scabbard2blade") {
    scabbard2blade(wall_th=4*global_wall_th);
}

