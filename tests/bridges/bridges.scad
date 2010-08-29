// Bridges
bridge_length=5.0;
bridge_width=5.0;
bridge_height=4.0;
bridge_thick=2.0;
bridge_count=1;

for(i=[0:bridge_count-1]) {
  rotate([0,0,180*i/bridge_count]) union() {
    translate([10,0,0]) cube(size=[5,bridge_width,bridge_height+bridge_thick],center=false);
    translate([15+bridge_length,0,0]) cube(size=[5,bridge_width,bridge_height+bridge_thick],center=false);
    translate([10,0,bridge_height]) cube(size=[10+bridge_length,bridge_width,bridge_thick],center=false);
  }
}

