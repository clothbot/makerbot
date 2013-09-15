// Peristaltic Pump Coupler
// Measured from https://www.adafruit.com/products/1150

render_part="pump_coupler";
render_part="pump_roller";
//render_part="pump_roller_insert";

function pump_coupler_id() = 4.38; // mm
function pump_coupler_od() = 22.37; // mm
function pump_base_th() = 1.93; // mm
function pump_base_hub_od() = 7.5; // mm
function pump_base_hub_th() = 2.45; // mm
function pump_peg_od() = 2.75; // mm
function pump_peg_h() = 10.22; // mm
function pump_peg_triangle_h() = 12.5; // mm

function pump_c2peg_r(peg_d=pump_peg_od(),triangle_h=pump_peg_triangle_h()) = 2*triangle_h/3-peg_d/2;

module pump_coupler(
    coupler_id=pump_coupler_id()
    , coupler_od=pump_coupler_od()
    , base_th=pump_base_th()
    , base_hub_od=pump_base_hub_od()
    , base_hub_th=pump_base_hub_th()
    , peg_od=pump_peg_od()
    , peg_h=pump_peg_h()
    , peg_triangle_h=pump_peg_triangle_h()
    ) {
    difference() {
        union() {
          translate([0,0,-base_hub_th]) cylinder(r=base_hub_od/2,h=base_hub_th,center=false,$fn=32);
          translate([0,0,-base_th]) cylinder(r=coupler_od/2,h=base_th,center=false,$fn=64);
          translate([pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h),0,0]) cylinder(r=peg_od/2,h=peg_h,center=false,$fn=16);
          rotate([0,0,120]) translate([pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h),0,0])
            cylinder(r=peg_od/2,h=peg_h,center=false,$fn=16);
          rotate([0,0,-120]) translate([pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h),0,0])
            cylinder(r=peg_od/2,h=peg_h,center=false,$fn=16);
        }
        translate([0,0,-base_hub_th/2]) cylinder(r=coupler_id/2,h=2*base_hub_th,center=true,$fn=32);
    }
}
if(render_part=="pump_coupler") {
    pump_coupler();
}

function pump_roller_h() = 13.6; //mm - to measure
function pump_roller_od() = 11.08; // mm
function pump_roller_id() = pump_roller_od()-2*1.2; // mm
function pump_roller_id_depth() = 4.0; // mm

function pump_roller_peg_hole_id() = 2.75; // mm
function pump_roller_peg_hole_od() = 6.00; // mm
function pump_roller_peg_hole_depth() = 10.00; // mm
function pump_roller_cap_od() = 5.33; // mm
function pump_roller_cap_hole_id() = 9.00; // mm
function pump_roller_cap_depth() = 0.25; // mm
function pump_roller_cap_side_depth() = 6.38; // mm
function pump_roller_cap_wall_th() = 0.9; // mm

function m3_washer_od() = 6.86; // mm
function m3_washer_id() = 3.1; // mm
function m3_washer_th() = 0.6; // mm

module pump_roller( roller_h=pump_roller_h(), roller_od=pump_roller_od(), roller_id=pump_roller_id(), roller_id_depth=pump_roller_id_depth()
    , peg_hole_id=pump_roller_peg_hole_id(), peg_hole_od=pump_roller_peg_hole_od(), peg_hole_depth=pump_roller_peg_hole_depth()
    , cap_od=pump_roller_cap_od(), cap_hole_id=pump_roller_cap_hole_id(), cap_depth=pump_roller_cap_depth()
    , cap_side_depth=pump_roller_cap_side_depth(), cap_wall_th=pump_roller_cap_wall_th()
    ) {
    difference() {
        cylinder(r=roller_od/2,h=roller_h,center=false,$fn=360);
        cylinder(r=peg_hole_id/2,h=2*peg_hole_depth,center=true,$fn=32);
        difference() {
            cylinder(r=roller_id/2,h=2*roller_id_depth,center=true,$fn=32);
            cylinder(r=peg_hole_od/2,h=2*peg_hole_depth,center=true,$fn=32);
        }
        translate([0,0,roller_h]) {
            cylinder(r=cap_hole_id/2,h=2*cap_depth,center=true,$fn=32);
            difference() {
                cylinder(r=cap_hole_id/2,h=2*cap_side_depth,center=true,$fn=32);
                cylinder(r=cap_od/2,h=2*(cap_side_depth+cap_depth),center=true,$fn=32);
            }
        }
    }
}

if(render_part=="pump_roller") {
  echo("Rendering pump_roller()...");
  translate([0,-(pump_roller_od()+2.0),0]) pump_roller();
  pump_roller();
  translate([0,pump_roller_od()+2.0,0]) pump_roller();
}

module pump_roller_insert( roller_h=pump_roller_h(), roller_od=pump_roller_od()
    , peg_hole_id=pump_roller_peg_hole_id(), peg_hole_od=pump_roller_peg_hole_od(), peg_hole_depth=pump_roller_peg_hole_depth()
    , cap_od=pump_roller_cap_od(), cap_hole_id=pump_roller_cap_hole_id(), cap_depth=pump_roller_cap_depth()
    , cap_side_depth=pump_roller_cap_side_depth()/2, cap_wall_th=pump_roller_cap_wall_th()
    , center_hole_d=2.0, shrink_th=0.5, cut_w=0.4, cut_count=3
    , debug=false
    ) {
    if(debug) echo(str("  pump_roller_insert: od = ",cap_hole_id-shrink_th/2));
    if(debug) echo(str("  pump_roller_insert: id = ",cap_od+shrink_th/2));
    if(debug) echo(str("  pump_roller_insert: wall th = ",cap_hole_id-cap_od-shrink_th));
    difference() {
        hull() {
              cylinder(r2=cap_hole_id/2-shrink_th/4,r1=cap_hole_id/2-shrink_th/4-cap_depth,h=cap_depth,center=false,$fn=32);
            translate([0,0,cap_side_depth-2*cap_depth])
              cylinder(r1=cap_hole_id/2-shrink_th/4,r2=cap_hole_id/2-shrink_th/4-cap_depth,h=cap_depth,center=false,$fn=32);
        }
        translate([0,0,cap_side_depth-2*cap_depth])
          cylinder(r1=cap_od/2+shrink_th/4,r2=cap_od/2+shrink_th/4+2*cap_depth,h=2*cap_depth,center=false,$fn=32);
        if(center_hole_d>0) cylinder(r=center_hole_d/2,h=4*cap_depth,center=true,$fn=32);
        translate([0,0,cap_depth]) cylinder(r=cap_od/2+shrink_th/4,h=cap_side_depth,center=false,$fn=32);
        if(cut_count>0) for(i=[0:cut_count-1]) rotate([0,0,i*360/cut_count]) translate([0,-cut_w/2,2*cap_depth])
            cube([cap_hole_id/2,cut_w,cap_side_depth],center=false);
    }
}

if(render_part=="pump_roller_insert") {
    echo("Rendering pump_roller_insert()...");
    translate([0,-(pump_roller_cap_hole_id()+2.0),0]) pump_roller_insert(center_hole_d=0,cap_depth=2*pump_roller_cap_depth());
    pump_roller_insert(debug=true,center_hole_d=0,cap_depth=2*pump_roller_cap_depth());
    translate([0,pump_roller_cap_hole_id()+2.0,0]) pump_roller_insert(center_hole_d=0,cap_depth=2*pump_roller_cap_depth());
}

