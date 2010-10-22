// Generic Parts

module TearDrop_2D(diameter=1.0) {
  $fa=15.0;
  $fs=0.1;
  circle(r=diameter/2);
  rotate(45) square(size=diameter/2,center=false);
}

module TearDrop_Truncated_2D(diameter=1.0) {
  $fa=15.0;
  $fs=0.1;
  difference() {
    union() {
      circle(r=diameter/2);
      rotate(45) square(size=diameter/2,center=false);
    }
    translate([-diameter/2,diameter/2]) square(size=diameter);
  }
}

