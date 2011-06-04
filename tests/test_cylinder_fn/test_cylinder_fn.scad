h=3.2;
r=5.5/2;
fn=4;
module test_cylinder_fn(h=5,r=10,fn=6) {
  union() {
    cylinder(h=h,r=r,$fn=fn,center=false);
    intersection_for(i=[0:fn-1]) {
      rotate([0,0,360*i/fn]) translate([-2*r,-r,-h])
	cube(size=[4*r,3*r,h],center=false);
    }
  }
}

step_start=4;
step_size=1;
step_n=16;
row_n=4;
for(i=[step_start:step_size:(step_n+step_start-1)*step_size]) translate([2.5*r*((i-step_start)%row_n),2.5*r*(i-(i-step_start)%row_n-step_start)/row_n,0])
  test_cylinder_fn(h=h,r=r,fn=i);
translate([-r,-r,-3*h]) cube(size=[2*r,2*r,h],center=false);