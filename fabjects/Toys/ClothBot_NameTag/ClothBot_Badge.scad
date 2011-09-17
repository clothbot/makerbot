// ClothBot Badge
// ...because I need one.
// ...and it should be printed on cloth
// ...just because.


use <OpenHardwareLogo.scad>

difference() {
  union() {
    linear_extrude(height=2.0) scale(3.0) translate([-4,-4]) render() import($fs=0.1,file="LCBlock_2x2_CLOTHBOT.dxf",scale=1.0);
    linear_extrude(height=3.0) scale(4.0) translate([-4,-4]) render() import($fs=0.1,file="CLOTHBOT_Letters.dxf",scale=1.0);
    translate([0,26,0]) linear_extrude(height=2.0) scale(0.1) render() oshw_logo_2d(scale=1.0);
    translate([0,26,1.0]) linear_extrude(height=2.0) render() import($fs=0.1,file="OpenHardwareLogo_Shell.dxf",scale=0.1);
  }
  translate([0,0,-0.1])
    linear_extrude(height=1.0+0.1) scale(4.0) translate([-4,-4]) render() import($fs=0.1,file="CLOTHBOT_Letters.dxf",scale=1.0);

}
