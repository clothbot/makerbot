// No Bullets
//   Without models there is no ammunition with which to make a statement.

module bullet_stl() {
  import(file="bullet.stl",scale=25.4);
}

module pendant_no() {
  rotate([90,0,0]) difference() {
    union() {
      // cylinder($fn=64,r=100,h=20,center=true);
      render() rotate_extrude() translate([95,00]) circle(r=10);
      rotate([-90,0,0]) translate([0,0,100]) {
        cylinder(r=20,h=10,center=false);
        sphere(r=20,center=true);
        translate([0,0,10]) sphere(r=20,center=true);
      }
    }
    //cylinder(r=80,h=21,center=true);
    rotate([-90,0,0]) cylinder(r=10,h=150,center=false);
  }
}

module no_bullets() {
  union() {
    pendant_no();
    rotate([90,0,0])
      rotate([0,0,45]) scale(60) translate([0,-0.15,-0.165]) {
        bullet_stl();
        translate([0.4,0,0]) bullet_stl();
        translate([-0.4,0,0]) bullet_stl();
      }
    rotate([0,45,0]) cylinder(r=10,h=2*95,center=true);
  }
}

no_bullets();
