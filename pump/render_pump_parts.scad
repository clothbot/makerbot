//
use <parts.scad>
use <parametric_involute_gear.scad>
use <planetary_gears.scad>

//render_part=1; // drive_gear_w_hub_holes_dxf();
//render_part=2; // roller_gear_w_hub_holes_dxf();
//render_part=3; // outer_gear_dxf();
//render_part=4; // outer_gear_w_mount_holes_dxf();
// render_part=5; // outer_tube_retainer_dxf();
// render_part=6; // roller_gear_tube_retainer_dxf();
// render_part=7; // roller_gear_tube_compressor_dxf();
// render_part=8; // roller_gear_rim_dxf();
// render_part=9; // drive_gear_rim_dxf();
// render_part=10; // outer_gear_rim_dxf();
render_part=11; // outer_tube_retainer_w_exit_dxf();

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
    for(i=[0:2*roller_n-1]) rotate(360*i/(2*roller_n)) {
      translate([drive_d/2+roller_d+outer_wall_th+hole_d_odd/2,0]) 
	  difference() {
	    circle(r=hole_d_odd/2+outer_wall_th/2);
	    circle(r=hole_d_odd/2);
	}
    }
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
    circle(r=drive_d/2+roller_d+tube_d/2);
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
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle(r=roller_d/2-tube_d/2);
    circle($fs=0.1,r=roller_gear_axle_d/2);
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
	, tube_compress=0.5
	, roller_gear_axle_d=5.0+0.2
	, hole_offset_even=25.4*0.25
	, hole_offset_odd=sqrt(2)*4
	, hole_n=8
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle(r=roller_d/2-tube_d/2+tube_id+tube_compress);
    circle($fs=0.1,r=roller_gear_axle_d/2);
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
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle(r=roller_d/2);
    circle($fs=0.1,r=roller_gear_axle_d/2);
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
	) {
  $fs=0.1;
  $fa=15.0;
  difference() {
    circle(r=drive_d/2);
    circle($fs=0.1,r=roller_gear_axle_d/2);
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
    circle(r=drive_d/2+roller_d);
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
    circle(r=drive_d/2+roller_d+tube_d/2);
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

