// Unit Hexagon

$fa=9;
$fs=0.1;

scale_1in=25.4;

module unit_hexagon(
        hexagon_w=1.0
        , hexagon_h=1.0
        ) {
  intersection () {
    translate([-hexagon_w,-hexagon_w/2,0]) scale([2*hexagon_w,hexagon_w,hexagon_h])  cube(size=1.0, center=false);
    rotate([0,0,60])
        translate([-hexagon_w,-hexagon_w/2,0]) scale([2*hexagon_w,hexagon_w,hexagon_h]) cube(size=1.0, center=false);
    rotate([0,0,120])
        translate([-hexagon_w,-hexagon_w/2,0]) scale([2*hexagon_w,hexagon_w,hexagon_h]) cube(size=1.0, center=false);
  }
}

unit_hexagon();

