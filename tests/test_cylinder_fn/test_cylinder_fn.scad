h=3.2;
r=5.5/2;
fn=4;

module outer_circle(r=10,fn=6) {
  scale([r,r]) render() intersection_for(i=[0:fn-1]) {
    rotate(360*i/fn) translate([-2,-1])
      square(size=[4,3],center=false);
  }
}

module test_cylinder_fn(h=5,r=10,fn=6) {
  union() {
    cylinder(h=h,r=r,$fn=fn,center=false);
    translate([0,0,-1.5*h]) linear_extrude(height=h)
	outer_circle(r=r,fn=fn);
  }
}

step_start=3;
step_size=1;
step_n=16;
row_n=4;
for(i=[step_start:step_size:(step_n+step_start-1)*step_size]) translate([4*r*((i-step_start)%row_n),4*r*(i-(i-step_start)%row_n-step_start)/row_n,0]) {
  if(i==step_start || i==4 || i==(step_n+step_start-1))
	translate([-r,-r,-3*h]) cube(size=[2*r,2*r,h],center=false);
  test_cylinder_fn(h=h,r=r,fn=i);
}
