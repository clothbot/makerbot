// new 3-phase peristaltic pump design
//render_part=1; // CircleTrunc
render_part=2; // MarbleRunner
render_part=3; // MarblePumpRotorPhase

use <parts.scad>

module CircleTeardrop(r=Marble_D()/2,a=135) {
  circle($fs=0.1,r=r,center=false);
  rotate(a) square(size=r);
}

module CircleTrunc(r=Marble_D()/2,a=45) {
  circle($fs=0.1,r=r,center=false);
  rotate(a) difference () {
    square(size=[r,r],center=false);
    rotate(45) translate([r,-r/2]) square(size=r);
  }
}

module MarbleRunner( extension=0.1
	, tube_od=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compression=1.0
	, marble_d=Marble_D()
	, show_marbles=0
	) {
  rotate([0,90,0]) {
	cylinder($fs=0.1,r=tube_od/2,h=2*marble_d,center=true);
	translate([0,0,-marble_d]) linear_extrude(height=2*marble_d)
	  CircleTeardrop(r=tube_od/2,a=135);
  }
  translate([0,tube_od/2-tube_id/2-tube_compression+marble_d/2,0]) {
	// rotate_extrude(convexity=10) CircleTrunc(r=marble_d/2);
	translate([0,-marble_d/2-tube_compression-tube_od/2,0]) rotate([-90,0,0]) linear_extrude(height=1.75*marble_d+tube_compression/2+tube_od/2, center=false, convexity=0)
	  CircleTrunc(r=marble_d/2,a=-135);
    if(show_marbles==1) {
	sphere($fs=0.1,r=marble_d/2,center=true);
	rotate([35,0,0]) translate([0,marble_d,0])
	  sphere($fs=0.1,r=marble_d/2,center=true);
	rotate([35,120,0]) translate([0,marble_d,0])
	  sphere($fs=0.1,r=marble_d/2,center=true);
	rotate([35,-120,0]) translate([0,marble_d,0])
	  sphere($fs=0.1,r=marble_d/2,center=true);
    }
	rotate([-90,0,0]) rotate_extrude(convexity=10)
	  rotate([0,0,55]) translate([marble_d,0,0]) {
	    CircleTrunc(r=marble_d/2,a=-90+45-55);
	  }
  }
}

module MarblePumpRotorPhase( extension=0.1
	, tube_od=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compress=1.0
	, marble_d=Marble_D()
	, axle_d=Bearing_623_ID()
	, bolt_d=3.0
	, rotor_d=Bearing_623_OD()+6*Marble_D()
	, rotor_h=1.5*Marble_D()
	) {
  difference() {
    cylinder(r=rotor_d/2,h=rotor_h,center=false);
    for(i=[0:5]) assign(rotAngle=360*i/6) {
	rotate([0,0,rotAngle]) {
	  translate([3*rotor_d/8,0,-extension])
	    cylinder($fs=0.1,r=bolt_d/2,h=rotor_h+2*extension);
	  rotate([0,0,30]) translate([1.2*marble_d,0,0])
	    sphere(r=marble_d/2);
	    //rotate_extrude(convexity=10)
	      //CircleTrunc(r=marble_d/2);
	  rotate([0,0,30]) translate([1.2*marble_d,0,rotor_h])
	    sphere(r=marble_d/2);
	    //rotate_extrude(convexity=10)
	      //CircleTrunc(r=marble_d/2,a=180);
	}
    }
    translate([0,0,-extension])
	cylinder($fs=0.1,r=axle_d/2,h=rotor_h+2*extension);
    translate([0,-rotor_d/2,0])
	MarbleRunner();
    translate([0,rotor_d/2,0])
	rotate([0,0,180]) MarbleRunner();
    rotate_extrude(convexity=10) translate([rotor_d/2,0,0]) 
	CircleTeardrop(r=tube_od/2,a=45);
    translate([0,0,rotor_h]) rotate([0,0,120]) {
	translate([0,-rotor_d/2,0])
	  MarbleRunner();
	translate([0,rotor_d/2,0])
	  rotate([0,0,180]) MarbleRunner();
	rotate_extrude(convexity=10) translate([rotor_d/2,0,0]) 
	  CircleTeardrop(r=tube_od/2,a=45-180);
    }
  }
}

if(render_part==1) {
  echo("Rendering CircleTrunc()...");
  CircleTrunc();
}


if(render_part==2) {
  echo("Rendering MarbleRunner()...");
  MarbleRunner();
}

if(render_part==3) {
  echo("Rendering MarblePumpRotorPhase()...");
  MarblePumpRotorPhase();
}
