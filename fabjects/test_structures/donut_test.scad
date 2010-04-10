
$fa=9;
$fs=0.1;

scale_1in=25.4;

module donut_test(
	irad=9.0
	, orad=11.0
	, height=2.0
	) {
  difference() {
    cylinder(r=orad,h=height,center=false);
    translate([0,0,-0.005*height]) 
	cylinder(r=irad,h=height+0.01*height,center=false);
  }
}

donut_test(irad=14,orad=16,height=2);

donut_test(irad=10,orad=12,height=2);

donut_test(irad=6,orad=8,height=2);

donut_test(irad=2,orad=4,height=2);
