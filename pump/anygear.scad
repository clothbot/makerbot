// anygear.scad
// - generate a gear and its mate from any tooth pattern

//render_part=1; // test_anygear()
render_part=2; // test_tooth_mate()
//render_part=3; // test_anygear_inverse()
function pi()=3.14159265358979323846264338327950288419716939937;

module anygear_body(
	pitch_d
	, root_d
	, num_teeth
	) {
  union() {
	child(0); // inner hub shape
	for(i=[0:num_teeth-1]) rotate(360*i/num_teeth) {
	  translate([pitch_d/2,0])
	    child(1);
	}
  }
}

module anygear_holes(
	pitch_d
	, num_teeth
	) {
  union() {
	child(0); // inner hub holes
	for(i=[0:num_teeth-1]) rotate(360*i/num_teeth+180/num_teeth) {
	  translate([pitch_d/2,0])
	    child(1);
	}
  }
}

module test_hub_body(
	root_d=25.0
	, root_th=2.5
	, inner_d=10.0
	, spoke_w=5.0
	, spoke_l=23/2
	,num_spokes=7
	) {
  union() {
    circle(r=inner_d/2);
    rotate(-45) square(size=[inner_d/2,inner_d/2],center=false);
    for(i=[0:num_spokes-1]) rotate(360*i/num_spokes) {
      translate([0,-spoke_w/2]) square(size=[spoke_l,spoke_w],center=false);
    }
    difference() {
	circle(r=root_d/2);
	circle(r=root_d/2-root_th);
    }
  }
}

module test_tooth(
	root_d=25.0
	, num_teeth=13
	, addendum=2.0
	, dedendum=3.0
	) {
  $fs=0.1;
  $fa=10.0;
  tooth_w=pi()*root_d/(2*num_teeth);
  pitch_d=root_d+2*dedendum;
  outer_d=root_d+2*dedendum+2*addendum;
  tooth_l=addendum+dedendum;
  scale([tooth_w,tooth_l]) {
    intersection() {
	square(1.0,center=true);
	translate([-0.5,0]) circle(r=1.0);
	translate([0.5,0]) circle(r=1.0);
    }
  }
}

module mate_tooth(
	root_d=25.0
	, num_teeth=13
	, addendum=2.0
	, dedendum=3.0
	, tooth_angle_res_steps=11
	) {
  $fs=0.1;
  $fa=10.0;
  tooth_w=pi()*root_d/(2*num_teeth);
  pitch_d=root_d+2*dedendum;
  outer_d=root_d+2*dedendum+2*addendum;
  tooth_l=addendum+dedendum;
  tooth_angle=360/num_teeth;
  difference() {
    child(0);  // tooth blank object
    // tooth assumed to be centered on root circle, oriented y-axis thru center line
    for(i=[0:tooth_angle_res_steps-1]) translate([0,-root_d/2,0])
      rotate([0,0,-tooth_angle+tooth_angle*i/tooth_angle_res_steps]) translate([0,root_d+2*dedendum,0])
        rotate([0,0,180-tooth_angle+tooth_angle*i/tooth_angle_res_steps]) translate([0,root_d/2+dedendum,0])
	  child(1);
  }
}

module test_anygear() {
    anygear_body(
	pitch_d=25.0
	, num_teeth=13
	) {
      test_hub_body(
	  root_d=25.0
	  , root_th=2.5
	  , inner_d=10.0
	  , spoke_w=5.0
	  , spoke_l=23/2
	  ,num_spokes=6
	);
      test_tooth(
	root_d=25.0
	, num_teeth=13
	, addendum=1.0
	, dedendum=2.0
	);
    }
}

if(render_part==1) {
  echo("Rendering test_anygear()...");
  test_anygear();
}

module test_tooth_mate() {
  mate_tooth() {
    translate([0,-2]) square(size=[5,5],center=true);
    test_tooth();
  }
}

if(render_part==2) {
  echo("Rendering test_tooth_mate()...");
  test_tooth_mate();
}
