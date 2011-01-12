// Constructor for building matching gears.
//render_part=1; // gear_generator_positive()
render_part=2; // gear_generator_negative()


module gear_generator_positive( clearance=0.1
	, pos_pitch_circle_d=27
	, pos_num_teeth=27
	, pos_addendum=0.5
	, pos_dedendum=0.5
	, neg_pitch_circle_d=33
	, neg_num_teeth=33
	) {
  // child(0) is the hub object
  // child(1) is tooth object
  union() {
    child(0);
    for(tooth_i=[0:pos_num_teeth-1]) assign(rotAngle=360*tooth_i/pos_num_teeth) {
      rotate([0,0,rotAngle]) translate([pos_pitch_circle_d/2,0,0]) {
	child(1);
      }
    }
  }
}

module gear_generator_negative( clearance=0.1
	, pos_pitch_circle_d=27
	, pos_num_teeth=27
	, neg_pitch_circle_d=33
	, neg_num_teeth=33
	, neg_addendum=0.5
	, neg_dedendum=0.5
	, steps_per_tooth=8
	) {
  outer_d=2*pos_pitch_circle_d+neg_pitch_circle_d;
  outer_num_teeth=outer_d*neg_num_teeth/neg_pitch_circle_d;
  pos_angle_ratio=(neg_pitch_circle_d/(neg_pitch_circle_d+pos_pitch_circle_d))*(pos_pitch_circle_d/(2*pos_pitch_circle_d))*(pos_num_teeth/outer_num_teeth);
  // child(0) is the hub blank
  // child(1) is the positive gear
  difference() {
    child(0);
    for(tooth_i=[0:neg_num_teeth-1])
      for(tooth_step=[0:steps_per_tooth-1]) 
	assign(rotAngle=360*tooth_i/neg_num_teeth+360*tooth_step/(neg_num_teeth*steps_per_tooth))
	  rotate(rotAngle) translate([pos_pitch_circle_d/2+neg_pitch_circle_d/2,0,0])
	    rotate(-rotAngle*outer_d/neg_pitch_circle_d) child(1);
  }
}

module test_gear_generator_positive() {
  gear_generator_positive( clearance=0.1
	, pos_pitch_circle_d=27
	, pos_num_teeth=27
	, pos_addendum=0.5
	, pos_dedendum=0.5
	, neg_pitch_circle_d=33
	, neg_num_teeth=33
	) {
    // child(0) is the hub object
    cylinder(r=27/2,h=4.0,center=true);
    // child(1) is tooth object
    cube(size=[1.0,1.0,2.0],center=true);
  }
}

if(render_part==1) {
  echo("Rendering gear_generator_positive()...");
  test_gear_generator_positive();
}

if(render_part==2) {
  echo("Rendering gear_generator_negative()...");
  translate([27/2,0,0]) 
  gear_generator_negative( clearance=0.1
	, pos_pitch_circle_d=27
	, pos_num_teeth=27
	, neg_pitch_circle_d=33
	, neg_num_teeth=33
	, neg_addendum=0.5
	, neg_dedendum=0.5
	, steps_per_tooth=8
	) {
    // child(0) is the hub object
    cylinder(r=33/2,h=6.0,center=true);
    test_gear_generator_positive();
  }
}
