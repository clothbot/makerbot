// Unit Teardrop Truncated

$fa=9;
$fs=0.1;

scale_1in=25.4;

module unit_teardrop_trunc(
        teardrop_w=1.0
        , teardrop_h=1.0
        ) {
  rotate([90,0,-90]) difference () {
    rotate([0,0,45]) union() {
      rotate([0,0,90]) cylinder(r=teardrop_w/2,h=teardrop_h,center=false,$fn=36);
      translate([0,0,0]) scale([teardrop_w/2,teardrop_w/2,teardrop_h]) cube(size=1.0,center=false);
    }
    translate([0,teardrop_w,teardrop_h/2]) scale([teardrop_w,teardrop_w,1.01*teardrop_h]) cube(size=1.0,center=true);
  }
}

unit_teardrop_trunc();

