// Skull and Bullets
//   Without models there is no ammunition with which to make a statement.

module bullet_stl() {
  import(file="bullet.stl",scale=25.4);
}

module skull_stl() {
  import(file="skull_centered.stl",scale=1.0);
}

module skull_and_bullets() {
  union() {
    translate([0,2.5,-45]) scale([1,0.6,1]) skull_stl();
    rotate([90,0,0]) difference() {
      union() {
        cylinder($fn=64,r=100,h=20,center=true);
        rotate([-90,0,0]) translate([0,0,100]) {
          cylinder(r=20,h=10,center=false);
          sphere(r=20,center=true);
          translate([0,0,10]) sphere(r=20,center=true);
        }
      }
      cylinder(r=80,h=21,center=true);
	 rotate([-90,0,0]) cylinder(r=10,h=150,center=false);
    }
    rotate([90,0,0]) union() {
      rotate([0,0,55]) scale(110) translate([0,-0.15,-0.165]) bullet_stl();
      rotate([0,0,-55]) scale(110) translate([0,-0.15,-0.165]) bullet_stl();
    }
  }
}

skull_and_bullets();
