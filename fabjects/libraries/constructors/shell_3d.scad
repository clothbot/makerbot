// shell_3d() module

module shell_3d(th=0.1,N=4) {
 for(i=[0:$children-1]) union() {
  // Top
  render() difference() {
    child(i);
    translate([0,0,-th]) child(i);
  }
  // Bottom
  render() difference() {
    child(i);
    translate([0,0,th]) child(i);
  }
  // In XY plane
  for(i=[0:N-1]) assign(rotAngle=360*i/N) {
    render() difference() {
      child(i);
      translate([th*cos(rotAngle),th*sin(rotAngle),0]) child(i);
    }
  }
  // In Top half at 45 degrees
  for(i=[0:N-1]) assign(rotAngle=360*(i+0.5)/N) {
    render() difference() {
      child(i);
      translate([th*sqrt(0.5)*cos(rotAngle),th*sqrt(0.5)*sin(rotAngle),th*sqrt(0.5)]) child(i);
    }
  }
  // In Bottom half at 45 degrees
  for(i=[0:N-1]) assign(rotAngle=360*(i+0.5)/N) {
    render() difference() {
      child(i);
      translate([th*sqrt(0.5)*cos(rotAngle),th*sqrt(0.5)*sin(rotAngle),-th*sqrt(0.5)]) child(i);
    }
  }
 }
}

difference() {
  union() {
    shell_3d(th=0.5,N=3) {
     sphere(r=10.0,center=true);
     cube(14.0,center=true);
    }
    translate([0,0,20]) shell_3d(th=0.5,N=3) union() {
     sphere(r=10.0,center=true);
     cube(14.0,center=true);
    }
  }
  cube(size=[10.0,10.0,20.0],center=false);
}
