// Peristaltic Pump Coupler
// Measured from https://www.adafruit.com/products/1150

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

pump_coupler();

