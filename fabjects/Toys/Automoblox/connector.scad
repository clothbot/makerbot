// Connector for connecting Automoblox parts.

render_part=1; // Automoblox_Connector()

module Automoblox_Connector(length=15.0) {
  cylinder(r=6.8/2,h=4.0,center=true);
  cylinder(r=7.0/2,h=1.0,center=true);
  difference() {
    union() {
      cylinder(r=6.67/2,h=length,center=true);
      translate([0,0,length/2-0.5]) cylinder(r=7.0/2,h=1.0,center=true);
      translate([0,0,-length/2+0.5]) cylinder(r1=6.67/2,r2=7.0/2,h=1.0,center=true);
    }
    cylinder(r=5.0/2,h=2*8,center=true);
    translate([0,0,5.1]) cube(size=[8.0,1.0,5.2],center=true);
    translate([0,0,-5.1]) cube(size=[8.0,1.0,5.2],center=true);
  }
}

if(render_part==1) {
  echo("Rendering Automoblox_Connector()...");
  Automoblox_Connector();
}

