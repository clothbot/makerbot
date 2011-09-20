// Skull and Bullets
//   Without models there is no statement.

module bullet_stl() {
  import(file="bullet.stl",scale=25.4);
}

module skull_stl() {
  import(file="skull.stl",scale=25.4);
}

module skull_and_bullets() {
  union() {
    scale([1,1,1]) skull_stl();
    rotate([0,0,45]) translate([0,-2.0,0.4]) scale([8.5,8.5,5]) bullet_stl();
    rotate([0,0,-45]) translate([0,-2.0,0.4]) scale([8.5,8.5,5]) bullet_stl();
  }
}

skull_and_bullets();
