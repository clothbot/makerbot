// Simple cooling test

hull() {
  translate([0,0,0.5]) cube([20,20,1.0],center=true);
  cylinder($fn=8,r=0.5,h=10,center=false);
}

