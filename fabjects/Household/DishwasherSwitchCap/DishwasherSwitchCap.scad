// Dish Washer Switch Cap

module DishwasherSwitchCap() {
  union() {
    translate([-21.0/2,0,0]) difference() {
      cube(size=[21.0,14.5,7.8],center=false);
	 translate([21.0/2-9.5/2,14.5-1.77,-0.1])
	  cube(size=[9.5,1.77+0.1,7.8+0.2],center=false);
      translate([-0.1,14.5-3.5,0]) rotate([-30,0,0])
	  cube(size=[21.0+0.2,10.0,10.0],center=false);
    }
    translate([-10.5/2,-20,0])
	cube(size=[10.5,24.0,7.8-1.5],center=false);
  }
}

DishwasherSwitchCap();
