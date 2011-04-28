// Using Minkowski sums for beveled bottom edges.

//render_part=1; //bevel_mask()
//render_part=2; // test_bevel_minkowski() on cube
//render_part=3; // test_bevel_minkowski() on cylinder
//render_part=4; // test_bevel_minkowski() on holes
render_part=5; // test_bevel_minkowski() on multiple parts

module bevel_mask(extension=0.1,bevel_w=1.0) {
  render() translate([0,bevel_w,0]) difference() {
    translate([0,0,bevel_w]) cube(size=[2*bevel_w,2*bevel_w,2*bevel_w],center=true);
    translate([-bevel_w-extension,-bevel_w,bevel_w]) rotate([-45-90,0,0])
	cube(size=[2*bevel_w+2*extension,2*bevel_w,2*bevel_w],center=false);
  }
}

if(render_part==1) {
  echo("Rendering bevel_mask()...");
  bevel_mask();
}

module test_bevel_minkowski(bevel_w=0.5,resolution=8) {
  for(i=[0:$children-1])
   intersection_for(j=[0:resolution-1]) {
    child(i);
    render() minkowski() {
        child(i);
        rotate([0,0,360*j/resolution]) bevel_mask(bevel_w=bevel_w);
    }
  }
}

if(render_part==2) {
  echo("Rendering test_bevel_minkowski() on cube");
  test_bevel_minkowski(bevel_w=0.5) {
    cube(size=[10,10,10]);
  }
  translate([10,10,0]) cube(size=[10,10,10]);
  cube(size=[0.5,0.5,0.5],center=false);
}

if(render_part==3) {
  echo("Rendering test_bevel_minkowski() on cylinder");
  test_bevel_minkowski(bevel_w=0.5) {
    cylinder(r=5,h=10,center=false);
  }
  translate([0,0,-5]) cube(size=[10,10,10],center=true);
  cube(size=[0.5,0.5,0.5],center=false);
}

if(render_part==4) {
  echo("Rendering test_bevel_minkowski() on part with holes");
  test_bevel_minkowski(bevel_w=0.5) {
    render() difference() {
	cube(size=[10,10,10], center=false);
	translate([5,5,-0.1]) cylinder(r=2.5,h=10+2*0.1,center=false);
    }
  }
}

if(render_part==5) {
  echo("Rendering test_bevel_minkowski() on multiple parts");
  test_bevel_minkowski(bevel_w=0.5) {
    cylinder(r=5,h=10,center=false);
    translate([5,5,0]) cube(size=[10,10,10],center=false);
    translate([-15,-15,0]) render() difference() {
	cube(size=[10,10,10], center=false);
	translate([5,5,-0.1]) cylinder(r=2.5,h=10+2*0.1,center=false);
    }
  }
  // reference cubes
  translate([5-0.5,0,0]) cube(size=[0.5,0.5,0.5],center=false);
  translate([5,5,0]) cube(size=[0.5,0.5,0.5],center=false);
}
