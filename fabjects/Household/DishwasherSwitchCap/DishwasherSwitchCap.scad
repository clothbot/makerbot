// Dish Washer Switch Cap
//
// - Inserts into the handle of Maytag Model MDB7100AWS Dish Washer.
// - Addresses mechanical wear issue with latching numbs that press down the handle to engage the power switches.

module DishwasherSwitchCap() {
  difference() {
   union() {
    translate([-21.0/2,0,0]) difference() {
      cube(size=[21.0,15.0,7.8],center=false);
	 translate([21.0/2-10.5/2,14.5-3.8,-0.1])
	  cube(size=[10.5,4.8+0.1,7.8+0.2],center=false);
      translate([-0.1,15.0-4.0,0]) rotate([-35,0,0])
	  cube(size=[21.0+0.2,10.0,10.0],center=false);
    }
    translate([-10.5/2,-20,0]) 
	cube(size=[10.5,24.0,7.8-1.5],center=false);
   }
   translate([-(10.5-4)/2,-20.0+2.0,-0.1])
	cube(size=[10.5-4.0,20,7.8+0.2],center=false);
  }
}

DishwasherSwitchCap();
