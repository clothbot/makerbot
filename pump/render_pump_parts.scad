//
use <parts.scad>
use <parametric_involute_gear.scad>
use <planetary_gears.scad>

render_part=1; // drive_gear_w_hub_holes_dxf();
//render_part=2; // roller_gear_w_hub_holes_dxf();
//render_part=3; // outer_gear_dxf();
//render_part=4; // outer_gear_w_mount_holes_dxf();
// render_part=5; // outer_tube_retainer_dxf();
// render_part=6; // roller_gear_tube_retainer_dxf();
// render_part=7; // roller_gear_tube_compressor_dxf();
// render_part=8; // roller_gear_rim_dxf();
// render_part=9; // drive_gear_rim_dxf();
// render_part=10; // outer_gear_rim_dxf();
// render_part=11; // outer_tube_retainer_w_exit_dxf();
// render_part=12; // outer_stepper_spacer_dxf();
// render_part=13; // outer_stepper_base_dxf();
// render_part=14; // outer_hex_cell_dxf();
render_part=15; // roller_gear_w_hub_holes_stl();
//render_part=16; // outer_gear_w_mount_holes_stl();
//render_part=17; // drive_gear_w_hub_holes_stl();
// render_part=18; // outer_gear_w_mount_holes_quartered_stl();


if(render_part==1) {
  echo("Rendering drive_gear_w_hub_holes_dxf()...");
  drive_gear_w_hub_holes_dxf();
}

if(render_part==2) {
  echo("Rendering roller_gear_w_hub_holes_dxf()...");
  roller_gear_w_hub_holes_dxf();
}

if(render_part==3) {
  echo("Rendering outer_gear_dxf()...");
  outer_gear_dxf(outer_wall_th=10.0);
}

module outer_gear_mount_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	) {
  $fs=0.1;
  $fa=15.0;
  union()  for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	  difference() {
	    circle(r=hole_d_odd/2+outer_wall_th/2);
	    circle(r=hole_d_odd/2);
	}
    }
}

module outer_gear_w_mount_holes_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	) {
  $fs=0.1;
  $fa=15.0;
  union() {
    //import_dxf(file="outer_gear.dxf");
    outer_gear_dxf(outer_wall_th=outer_wall_th);
    outer_gear_mount_dxf(outer_wall_th=outer_wall_th);
  }
}

if(render_part==4) {
  echo("Rendering outer_gear_w_mount_hole_dxf()...");
  outer_gear_w_mount_holes_dxf();
}

module outer_tube_retainer_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    union() {
      circle(r=drive_d/2+roller_d+outer_wall_th);
      for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
        translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2+outer_wall_th/2);
      }
    }
    circle($fs=0.1,$fa=1.0,r=drive_d/2+roller_d+tube_d/2);
    for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2);
    }
  }
}

if(render_part==5) {
  echo("Rendering outer_tube_retainer_dxf()...");
  outer_tube_retainer_dxf();
}

module roller_gear_tube_retainer_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, roller_gear_axle_d=5.0+0.2
	, hole_offset_even=25.4*0.25
	, hole_offset_odd=sqrt(2)*4
	, hole_n=8
	, alignment_hole_d=1.6
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle($fs=0.1,$fa=1.0,r=roller_d/2-tube_d/2);
    circle($fs=0.1,r=roller_gear_axle_d/2);
    rotate(360/(2*hole_n)) translate([hole_offset_even+hole_d_even/2+alignment_hole_d,0]) circle($fs=0.1,r=alignment_hole_d/2);
    for(i=[0:hole_n-1]) rotate(360*i/hole_n) {
	if(i%2==0) translate([hole_offset_even,0]) {
	  circle($fs=0.1,r=hole_d_even/2);
	}
	if(i%2==1) translate([hole_offset_odd,0]) {
	  circle($fs=0.1,r=hole_d_odd/2);
	}
    }
  }
}

if(render_part==6) {
  echo("Rendering roller_gear_tube_retainer_dxf()...");
  roller_gear_tube_retainer_dxf();
}

module roller_gear_tube_compressor_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compress=Tygon_B_44_3_ID()/10
	, roller_gear_axle_d=5.0+0.2
	, hole_offset_even=25.4*0.25
	, hole_offset_odd=sqrt(2)*4
	, hole_n=8
	, alignment_hole_d=1.6
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle($fs=0.1,$fa=1.0,r=roller_d/2-tube_d/2+tube_id+tube_compress);
    circle($fs=0.1,r=roller_gear_axle_d/2);
    rotate(360/(2*hole_n)) translate([hole_offset_even+hole_d_even/2+alignment_hole_d,0]) circle($fs=0.1,r=alignment_hole_d/2);
    for(i=[0:hole_n-1]) rotate(360*i/hole_n) {
	if(i%2==0) translate([hole_offset_even,0]) {
	  circle($fs=0.1,r=hole_d_even/2);
	}
	if(i%2==1) translate([hole_offset_odd,0]) {
	  circle($fs=0.1,r=hole_d_odd/2);
	}
    }
  }
}

if(render_part==7) {
  echo("Rendering roller_gear_tube_compressor_dxf()...");
  roller_gear_tube_compressor_dxf();
}

module roller_gear_rim_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compress=0.5
	, roller_gear_axle_d=5.0+0.2
	, hole_offset_even=25.4*0.25
	, hole_offset_odd=sqrt(2)*4
	, hole_n=8
	, shrink=0.1
	, alignment_hole_d=1.6
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle($fs=0.1, $fa=1.0, r=roller_d/2-shrink);
    circle($fs=0.1,r=roller_gear_axle_d/2);
    rotate(360/(2*hole_n)) translate([hole_offset_even+hole_d_even/2+alignment_hole_d,0]) circle($fs=0.1,r=alignment_hole_d/2);
    for(i=[0:hole_n-1]) rotate(360*i/hole_n) {
	if(i%2==0) translate([hole_offset_even,0]) {
	  circle($fs=0.1,r=hole_d_even/2);
	}
	if(i%2==1) translate([hole_offset_odd,0]) {
	  circle($fs=0.1,r=hole_d_odd/2);
	}
    }
  }
}

if(render_part==8) {
  echo("Rendering roller_gear_rim_dxf()...");
  roller_gear_rim_dxf();
}

module drive_gear_rim_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compress=0.5
	, roller_gear_axle_d=5.0+0.2
	, hole_offset_even=25.4*0.25
	, hole_offset_odd=sqrt(2)*4
	, hole_n=8
	, shrink=0.1
	, alignment_hole_d=1.6
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle($fs=0.1,$fa=1.0,r=drive_d/2-shrink);
    circle($fs=0.1,r=roller_gear_axle_d/2);
    rotate(360/(2*hole_n)) translate([hole_offset_even+hole_d_even/2+alignment_hole_d,0]) circle($fs=0.1,r=alignment_hole_d/2);
    for(i=[0:hole_n-1]) rotate(360*i/hole_n) {
	if(i%2==0) translate([hole_offset_even,0]) {
	  circle($fs=0.1,r=hole_d_even/2);
	}
	if(i%2==1) translate([hole_offset_odd,0]) {
	  circle($fs=0.1,r=hole_d_odd/2);
	}
    }
  }
}

if(render_part==9) {
  echo("Rendering drive_gear_rim_dxf()...");
  drive_gear_rim_dxf();
}

module outer_gear_rim_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, shrink=0.1
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    union() {
      circle(r=drive_d/2+roller_d+outer_wall_th);
      for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
        translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2+outer_wall_th/2);
      }
    }
    circle($fs=0.1, $fa=1.0, r=drive_d/2+roller_d+shrink);
    for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2);
    }
  }
}

if(render_part==10) {
  echo("Rendering outer_gear_rim_dxf()...");
  outer_gear_rim_dxf();
}

module outer_tube_retainer_w_exit_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    union() {
      difference() {
	  circle(r=drive_d/2+roller_d+outer_wall_th);
	  intersection() {
	  	rotate(-45-180/(2*roller_n)) square(drive_d+roller_d+tube_d+outer_wall_th);
		rotate(-45+180/(2*roller_n)) square(drive_d+roller_d+tube_d+outer_wall_th);
	  }
	}
	rotate(-360/(2*roller_n)) translate([drive_d/2+roller_d+tube_d/2+(outer_wall_th-tube_d/2)/2,0])
	  circle(r=(outer_wall_th-tube_d/2)/2);
	rotate(360/(2*roller_n)) translate([drive_d/2+roller_d+tube_d/2+(outer_wall_th-tube_d/2)/2,0])
	  circle(r=(outer_wall_th-tube_d/2)/2);
      for(i=[0:2*roller_n-1]) if(i!=0) rotate(360*i/(2*roller_n)) {
        translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2+outer_wall_th/2);
      }
    }
    circle($fs=0.1,$fa=1.0,r=drive_d/2+roller_d+tube_d/2);
    for(i=[0:2*roller_n-1]) if(i!=0) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2);
    }
  }
}

if(render_part==11) {
  echo("Rendering outer_tube_retainer_w_exit_dxf()...");
  outer_tube_retainer_w_exit_dxf();
}

module outer_stepper_spacer_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, shrink=0.1
	, drive_hub_d=25.4*0.75
	, stepper_axle_d=5.0
	, stepper_bearing_d=22.0
	, stepper_bolt_head_d=5.5
	, stepper_bolt_d=3.0
	, stepper_bolt_space_dx=31
	, stepper_bolt_space_dy=31
	, stepper_case_dx=42.3
	, stepper_case_dy=42.3
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    union() {
      circle(r=drive_d/2+roller_d+outer_wall_th);
      for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
        translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2+outer_wall_th/2);
      }
    }
    circle($fs=0.1, $fa=1.0, r=drive_hub_d/2+shrink);
    translate([stepper_bolt_space_dx/2,stepper_bolt_space_dy/2]) circle(r=stepper_bolt_head_d/2+shrink);
    translate([-stepper_bolt_space_dx/2,stepper_bolt_space_dy/2]) circle(r=stepper_bolt_head_d/2+shrink);
    translate([-stepper_bolt_space_dx/2,-stepper_bolt_space_dy/2]) circle(r=stepper_bolt_head_d/2+shrink);
    translate([stepper_bolt_space_dx/2,-stepper_bolt_space_dy/2]) circle(r=stepper_bolt_head_d/2+shrink);
    for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2);
    }
  }
}

if(render_part==12) {
  echo("Rendering outer_stepper_spacer_dxf()...");
  outer_stepper_spacer_dxf();
}

module outer_stepper_base_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, shrink=0.1
	, drive_hub_d=25.4*0.75
	, stepper_axle_d=5.0
	, stepper_bearing_d=22.0
	, stepper_bolt_head_d=5.5
	, stepper_bolt_d=3.0
	, stepper_bolt_space_dx=31
	, stepper_bolt_space_dy=31
	, stepper_case_dx=42.3
	, stepper_case_dy=42.3
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    union() {
      circle(r=drive_d/2+roller_d+outer_wall_th);
      for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
        translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2+outer_wall_th/2);
      }
    }
    circle($fs=0.1, $fa=1.0, r=stepper_bearing_d/2+shrink);
    translate([stepper_bolt_space_dx/2,stepper_bolt_space_dy/2]) circle(r=stepper_bolt_d/2+shrink);
    translate([-stepper_bolt_space_dx/2,stepper_bolt_space_dy/2]) circle(r=stepper_bolt_d/2+shrink);
    translate([-stepper_bolt_space_dx/2,-stepper_bolt_space_dy/2]) circle(r=stepper_bolt_d/2+shrink);
    translate([stepper_bolt_space_dx/2,-stepper_bolt_space_dy/2]) circle(r=stepper_bolt_d/2+shrink);
    for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	    circle(r=hole_d_odd/2);
    }
  }
}

if(render_part==13) {
  echo("Rendering outer_stepper_base_dxf()...");
  outer_stepper_base_dxf();
}

module outer_hex_cell_dxf(
	roller_d=27
	, drive_d=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, tube_d=Tygon_B_44_3_OD()
	, hex_w=70.0
	, hex_th=6.0
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    intersection_for(i=[0:2]) 
      rotate(360*i/3) square(size=[2*hex_w,4*hex_w],center=true);
    intersection_for(i=[0:2]) 
      rotate(360*i/3) square(size=[2*hex_w-2*hex_th,4*hex_w],center=true);
    for(i=[0:5]) rotate(360*i/6+30) {
	translate([2*hex_w/sqrt(3),0]) circle(r=hole_d_odd/2);
    }
    for(i=[0:5]) rotate(360*i/6) {
	translate([hex_w-hex_th/2,0]) circle(r=hole_d_odd/2);
    }
  }
}

if(render_part==14) {
  echo("Rendering outer_hex_cell_dxf()...");
  outer_hex_cell_dxf();
}

module bevel_mask(extension=0.1
	, bevel_id=10.0
	, mask_h=4.0
	, bevel_middle_extend=0.5
	) {
  union() {
    translate([0,0,-extension]) cylinder(
	r1=bevel_id/2-extension
	, r2=bevel_id/2+mask_h/4+extension
	, h=mask_h/4+2*extension
	);
    translate([0,0,mask_h/4-extension]) cylinder(
	r1=bevel_id/2+mask_h/4+extension+bevel_middle_extend
	, r2=bevel_id/2-extension+bevel_middle_extend
	, h=mask_h/4+2*extension
	);
    translate([0,0,mask_h/2-extension]) cylinder(
	r1=bevel_id/2-extension+bevel_middle_extend
	, r2=bevel_id/2+mask_h/4+extension+bevel_middle_extend
	, h=mask_h/4+2*extension
	);
    translate([0,0,3*mask_h/4-extension]) cylinder(
	r1=bevel_id/2+mask_h+extension
	, r2=bevel_id/2-extension
	, h=mask_h/4+2*extension
	);
  }
}

module roller_gear_w_hub_holes_stl(extension=0.1
	, roller_d=27
	, roller_gear_num_teeth=27
	, h=4.5
	, twist_num_teeth=1
	) {
  $fs=0.1;
  $fa=1.0;
  difference() {
    union() {
	linear_extrude(height=h/2,twist=360*twist_num_teeth/roller_gear_num_teeth,convexity=10)
        roller_gear_dxf();
	translate([0,0,h/2]) linear_extrude(height=h/2,twist=-360*twist_num_teeth/roller_gear_num_teeth,convexity=10)
        rotate(360*twist_num_teeth/roller_gear_num_teeth) roller_gear_dxf();
    }
    translate([0,0,-extension]) linear_extrude(height=h+2*extension,convexity=10)
      roller_gear_hub_holes_dxf();
  }
}

if(render_part==15) {
  echo("Rendering roller_gear_w_hub_holes_stl()...");
  intersection() {
    bevel_mask(extension=0.1 , bevel_id=27 , mask_h=4.5);
    roller_gear_w_hub_holes_stl();
  }
}

module outer_gear_w_mount_holes_stl(extension=0.1
	, roller_d=27
	, roller_gear_num_teeth=27
	, drive_d=33
	, drive_gear_num_teeth=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, h=4.5
	, twist_num_teeth=1
	) {
  $fs=0.1;
  $fa=15.0;
  union() {
    linear_extrude(height=h/2,twist=-360*twist_num_teeth/(2*roller_gear_num_teeth+drive_gear_num_teeth), convexity=10)
	outer_gear_dxf(outer_wall_th=outer_wall_th);
    translate([0,0,h/2]) linear_extrude(height=h/2,twist=360*twist_num_teeth/(2*roller_gear_num_teeth+drive_gear_num_teeth), convexity=10)
	rotate(-360*twist_num_teeth/(2*roller_gear_num_teeth+drive_gear_num_teeth)) outer_gear_dxf(outer_wall_th=outer_wall_th);
    linear_extrude(height=h,convexity=10) outer_gear_mount_dxf(outer_wall_th=outer_wall_th);
  }
}

if(render_part==16) {
  echo("Rendering outer_gear_w_mount_holes_stl()...");
  outer_gear_w_mount_holes_stl();
}

module drive_gear_w_hub_holes_stl(extension=0.1
	, drive_d=33
	, drive_gear_num_teeth=33
	, h=4.5
	, twist_num_teeth=1
	) {
  $fs=0.1;
  $fa=1.0;
  difference() {
    union() {
	linear_extrude(height=h/2,twist=-360*twist_num_teeth/drive_gear_num_teeth,convexity=10)
        drive_gear_dxf();
	translate([0,0,h/2]) linear_extrude(height=h/2,twist=360*twist_num_teeth/drive_gear_num_teeth,convexity=10)
        rotate(-360*twist_num_teeth/drive_gear_num_teeth) drive_gear_dxf();
    }
    translate([0,0,-extension]) linear_extrude(height=h+2*extension,convexity=10)
      drive_gear_hub_holes_dxf();
  }
}

if(render_part==17) {
  echo("Rendering drive_gear_w_hub_holes_stl()...");
  intersection() {
    bevel_mask(extension=0.1 , bevel_id=33 , mask_h=4.5);
    drive_gear_w_hub_holes_stl();
  }
}

module outer_ring_wedge_mask(
	wedge_r=(2*27+33)+(3.0+0.2)+2*10.0+0.1
        , start_angle=360/24
        , end_angle=360/4+360/24
        ) {
  if((end_angle-start_angle)<=90) {
    intersection() {
      rotate(start_angle) square(size=wedge_r,center=false);
      rotate(end_angle-90) square(size=wedge_r,center=false);
      circle(r=wedge_r);
    }
  }
  if((end_angle-start_angle)>90) {
    intersection() {
      union() {
	rotate(start_angle) square(size=wedge_r,center=false);
	rotate(end_angle-90) square(size=wedge_r,center=false);
      }
      circle(r=wedge_r);
    }
  }
}

module outer_gear_w_mount_holes_quarter_stl(extension=0.1
	, roller_d=27
	, roller_gear_num_teeth=27
	, drive_d=33
	, drive_gear_num_teeth=33
	, roller_n=6
	, outer_wall_th=10.0
	, hole_d_even=25.4*0.1120
	, hole_d_odd=3.0+0.2
	, h=4.5
	, twist_num_teeth=1
	, start_angle=360/24
	, end_angle=360/4+360/24
	) {
  $fs=0.1;
  $fa=15.0;
  union() {
    linear_extrude(height=h/2,twist=-360*twist_num_teeth/(2*roller_gear_num_teeth+drive_gear_num_teeth), convexity=10)
	intersection() {
	  outer_ring_wedge_mask(
		wedge_r=(2*roller_d+drive_d)/2+hole_d_odd+2*outer_wall_th+extension
		, start_angle=start_angle
		, end_angle=end_angle
		);
	  outer_gear_dxf(outer_wall_th=outer_wall_th);
	}
    translate([0,0,h/2]) linear_extrude(height=h/2,twist=360*twist_num_teeth/(2*roller_gear_num_teeth+drive_gear_num_teeth), convexity=10)
     rotate(360*twist_num_teeth/(2*roller_gear_num_teeth+drive_gear_num_teeth)) 
	intersection() {
	  outer_ring_wedge_mask(
		wedge_r=(2*roller_d+drive_d)/2+hole_d_odd+2*outer_wall_th+extension
		, start_angle=start_angle
		, end_angle=end_angle
		);
	  outer_gear_dxf(outer_wall_th=outer_wall_th);
	}

    linear_extrude(height=h,convexity=10)
      intersection() {
	  outer_ring_wedge_mask(
		wedge_r=(2*roller_d+drive_d)/2+hole_d_odd+2*outer_wall_th+extension
		, start_angle=start_angle
		, end_angle=end_angle
		);
	  outer_gear_mount_dxf(outer_wall_th=outer_wall_th);
	}
  }
}

if(render_part==18) {
  echo("Rendering outer_gear_w_mount_holes_quartered_stl()...");
  for(i=[0:3]) {
    translate([(-27-33)+25*(i-1),0,0]) rotate(-360/24-180/4-360*i/4) 
	outer_gear_w_mount_holes_quarter_stl(start_angle=360/24+360*i/4, end_angle=360*(i+1)/4+360/24);
  }
}

