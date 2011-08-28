// Jointed finger for printing on fabric substrate.

module joint1(l=8.0,d=3.0) {
  translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
}

module joint2(l=5.0,d=3.0) {
  translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
}

module joint3(l=3.0) {
  translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
}

module finger(l=8+5+3,d=3.0) {
  joint1(l=8*l/16,d=d);
  translate([0,9*l/16,0]) {
    joint2(l=5*l/16,d=d);
    translate([0,6*l/16,0])
      joint3(l=3*l/16,d=d);
  }
}

finger();
