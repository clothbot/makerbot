// new 3-phase peristaltic pump design
//render_part=1; // CircleTrunc
// render_part=2; // MarbleRunner
// render_part=3; // MarblePumpRotorPhase
// render_part=4; // MarblePumpRotorPhase_Body
// render_part=5; // MarblePumpRotorPhase_Holes
render_part=6; // MarblePumpRotorPhase_Combined


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
	, wall_th=0
	) {
  rotate([0,90,0]) {
	cylinder($fs=0.1,r=tube_od/2+wall_th,h=2*marble_d,center=true);
	translate([0,0,-marble_d]) linear_extrude(height=2*marble_d)
	  CircleTeardrop(r=tube_od/2+wall_th,a=135);
  }
  translate([0,tube_od/2-tube_id/2-tube_compression+marble_d/2,0]) {
	// rotate_extrude(convexity=10) CircleTrunc(r=marble_d/2);
	translate([0,-marble_d/2-tube_compression-tube_od/2,0]) rotate([-90,0,0]) linear_extrude(height=1.75*marble_d+tube_compression/2+tube_od/2, center=false, convexity=0)
	  CircleTrunc(r=marble_d/2+wall_th,a=-135);
    if(show_marbles==1) {
	sphere($fs=0.1,r=marble_d/2+wall_th,center=true);
	rotate([35,0,0]) translate([0,marble_d,0])
	  sphere($fs=0.1,r=marble_d/2+wall_th,center=true);
	rotate([35,120,0]) translate([0,marble_d,0])
	  sphere($fs=0.1,r=marble_d/2+wall_th,center=true);
	rotate([35,-120,0]) translate([0,marble_d,0])
	  sphere($fs=0.1,r=marble_d/2+wall_th,center=true);
    }
	rotate([-90,0,0]) rotate_extrude(convexity=10)
	  rotate([0,0,55]) translate([marble_d,0,0]) {
	    CircleTrunc(r=marble_d/2+wall_th,a=-90+45-55);
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

module MarblePumpRotorPhase_Body( extension=0.1
	, tube_od=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compress=1.0
	, marble_d=Marble_D()
	, axle_d=Bearing_623_ID()
	, bolt_d=3.0
	, rotor_d=Bearing_623_OD()+6*Marble_D()
	, rotor_h=1.5*Marble_D()
	, wall_th=2.0
	) {
  intersection() {
   cylinder(r=rotor_d/2,h=rotor_h,center=false);
   union() {
    difference() {
      cylinder(r=rotor_d/2,h=rotor_h,center=false);
      translate([0,0,-extension])
	  cylinder(r=rotor_d/2-wall_th-tube_od/2,h=rotor_h+2*extension,center=false);
    }
    for(i=[0:5]) assign(rotAngle=360*i/6) {
	rotate([0,0,rotAngle]) {
	  rotate([0,90,0])
	    cylinder(r=marble_d/4,h=rotor_d/2,center=false);
	  translate([0,0,rotor_h]) rotate([0,90,0])
	      cylinder(r=marble_d/4,h=rotor_d/2,center=false);
	  translate([3*rotor_d/8,0,-extension])
	    cylinder($fs=0.1,r=bolt_d/2+wall_th,h=rotor_h+2*extension);
	  rotate([0,0,30]) translate([1.2*marble_d,0,0]) {
	    sphere(r=marble_d/2+wall_th);
	    cylinder(r=marble_d/(sqrt(2)*2)+wall_th,h=rotor_h,center=false);
	    //rotate_extrude(convexity=10)
	      //CircleTrunc(r=marble_d/2);
	  }
	  rotate([0,0,30]) translate([1.2*marble_d,0,rotor_h])
	    sphere(r=marble_d/2+wall_th);
	    //rotate_extrude(convexity=10)
	      //CircleTrunc(r=marble_d/2,a=180);
	}
    }
    cylinder($fs=0.1,r=axle_d/2+wall_th,h=rotor_h);
    translate([0,-rotor_d/2,0])
	MarbleRunner(wall_th=wall_th);
    translate([-Marble_D()/2,-0.5*rotor_d,0])
      cube(size=[Marble_D(),rotor_d/2,rotor_h],center=false);
    rotate([0,0,180]) translate([-Marble_D()/2,-0.5*rotor_d,0])
      cube(size=[Marble_D(),rotor_d/2,rotor_h],center=false);
    rotate([0,0,-60]) translate([-Marble_D()/2,-0.5*rotor_d,0])
      cube(size=[Marble_D(),rotor_d/2,rotor_h],center=false);
    rotate([0,0,120]) translate([-Marble_D()/2,-0.5*rotor_d,0])
      cube(size=[Marble_D(),rotor_d/2,rotor_h],center=false);
    translate([0,rotor_d/2,0])
	rotate([0,0,180]) MarbleRunner(wall_th=wall_th);
    rotate_extrude(convexity=10) translate([rotor_d/2,0,0]) 
	CircleTeardrop(r=tube_od/2+wall_th,a=45);
    translate([0,0,rotor_h]) rotate([0,0,120]) {
	translate([0,-rotor_d/2,0])
	  MarbleRunner(wall_th=wall_th);
	translate([0,rotor_d/2,0])
	  rotate([0,0,180]) MarbleRunner(wall_th=wall_th);
	rotate_extrude(convexity=10) translate([rotor_d/2,0,0]) 
	  CircleTeardrop(r=tube_od/2+wall_th,a=45-180);
    }
   }
  }
}

module MarblePumpRotorPhase_Holes( extension=0.1
	, tube_od=Tygon_B_44_3_OD()
	, tube_id=Tygon_B_44_3_ID()
	, tube_compress=1.0
	, marble_d=Marble_D()
	, axle_d=Bearing_623_ID()
	, bolt_d=3.0
	, rotor_d=Bearing_623_OD()+6*Marble_D()
	, rotor_h=1.5*Marble_D()
	) {
  union() {
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

module MarblePumpRotorPhase_Combined() {
  difference() {
    MarblePumpRotorPhase_Body();
    MarblePumpRotorPhase_Holes();
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

if(render_part==4) {
  echo("Rendering MarblePumpRotorPhase_Body()...");
  MarblePumpRotorPhase_Body();
}

if(render_part==5) {
  echo("Rendering MarblePumpRotorPhase_Holes()...");
  MarblePumpRotorPhase_Holes();
}

if(render_part==6) {
  echo("Rendering MarblePumpRotorPhase_Combined()...");
  MarblePumpRotorPhase_Combined();
}

