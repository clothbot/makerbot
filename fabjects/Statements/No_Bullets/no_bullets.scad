// No Bullets
//   Without models there is no ammunition with which to make a statement.

module bullet_stl() {
  import(file="bullet.stl",scale=25.4);
}

module pendant_no(no_r=15,single_sided=true) {
  rotate([90,0,0]) difference() {
    union() {
      // cylinder($fn=64,r=100,h=20,center=true);
      render() rotate_extrude() translate([100-no_r/2,00]) circle(r=no_r);
      rotate([-90,0,0]) translate([0,0,100]) {
        cylinder(r=2*no_r,h=no_r,center=false);
        sphere(r=2*no_r,center=true);
        translate([0,0,no_r]) sphere(r=2*no_r,center=true);
      }
    }
    //cylinder(r=80,h=21,center=true);
    rotate([-90,0,0]) cylinder(r=no_r/2,h=150,center=false);
    translate([0,0,-2*no_r]) cylinder(r=100+3*no_r,h=no_r,center=false);
  }
}

module no_bullets(no_r=15, single_sided=true) {
  union() {
    pendant_no(no_r=no_r);
    rotate([90,0,0])
      rotate([0,0,45]) scale(60) translate([0,-0.15,-0.165]) {
        bullet_stl();
        //translate([0.4,0,0]) bullet_stl();
        //translate([-0.4,0,0]) bullet_stl();
      }
    rotate([0,45,0]) cylinder(r=no_r,h=2*(100-no_r/2),center=true);
    if(single_sided) rotate([90,0,0]) translate([0,0,-no_r]) difference() {
      cylinder(r=100-no_r/2,h=no_r,center=false);
      translate([0,100,-no_r]) cylinder(r=2.5*no_r,h=3*no_r,center=false);
    }

    rotate([90,0,0]) translate([0,0,-no_r/2]) {
      difference() {
        cylinder(r=5*(100-no_r/2)/8,h=3*no_r/4,center=false);
        translate([0,0,-0.1]) cylinder(r=(100-no_r/2)/2,h=no_r+0.2,center=false);
      }
      difference() {
        cylinder(r=3*(100-no_r/2)/8,h=3*no_r/4,center=false);
        translate([0,0,-0.1]) cylinder(r=(100-no_r/2)/4,h=no_r+0.2,center=false);
      }
    }
  }
}

scale(0.1) no_bullets(single_sided=true);
