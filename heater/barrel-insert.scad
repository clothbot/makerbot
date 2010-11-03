// Insert for barrel to heat incoming filament from the inside out.

render_part=3;

module barrel_insert(
	barrel_d=6.0
	, bore_d=3.0
	, thru_d=1.0
	, channel_d=1.0
	, insert_h=6.0
	, spacer_h=1.0
	, sidehole_n=4
	) {
  $fa=15.0;
  $fs=0.1;
  difference() {
    union() {
      cylinder(r=bore_d/2,h=insert_h+spacer_h,center=false);
      cylinder(r2=barrel_d/2,r1=barrel_d/2-spacer_h,h=spacer_h,center=false);
    }
    translate([0,0,-0.1])
      cylinder(r=thru_d/2,h=0.2+insert_h+spacer_h,center=false);
    translate([0,0,-thru_d])
      cylinder(r1=2*thru_d,r2=0,h=2*thru_d,center=false);
    translate([0,0,spacer_h+insert_h/4]) {
      difference() {
        cylinder(r=barrel_d/2,h=3*insert_h/4+spacer_h,center=false);
        cylinder(r1=bore_d/2,r2=thru_d/2,h=3*insert_h/4,center=false);
      }
    }
    translate([0,0,spacer_h+channel_d]) {
      for(i=[0:sidehole_n-1]) assign(rotA=360*i/sidehole_n) {
	   rotate([0,0,rotA]) translate([bore_d/2,0,0]) {
	     cylinder(r=thru_d/2,h=insert_h,center=false);
	     sphere(r=thru_d/2,center=true);
		rotate([0,-150,0])
		  cylinder(r=thru_d/2,h=2*spacer_h,center=false);
	   }
	 }
    }
  }
}

module barrel_insert_holes(
	barrel_d=6.5
	, bore_d=3.0
	, thru_d=1.0
	, channel_d=1.0
	, insert_h=9.0
	, spacer_h=1.0
	, sidehole_n=3
	) {
  $fa=15.0;
  $fs=0.1;
  union() {
    cylinder(r=thru_d/2,h=2*insert_h/3, center=false);
    cylinder(r1=bore_d/2,r2=thru_d/2,h=2*insert_h/3,center=false);
    translate([0,0,-0.1]) cylinder(r=5.0/2,h=1.8+0.1,center=false);
    translate([0,0,insert_h/3]) {
      for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n) {
        rotate([0,45,rotAngle]) {
		cylinder(r=channel_d/2,h=bore_d,center=false);
		translate([0,0,bore_d])
		  sphere(r=channel_d/2);
        }
      }
    }
    translate([0,0,2*insert_h/3]) {
      sphere(r=thru_d/2);
      for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n+180/sidehole_n) {
        rotate([0,45,rotAngle]) {
		cylinder(r=channel_d/2,h=bore_d,center=false);
		translate([0,0,bore_d])
		  sphere(r=channel_d/2);
        }
      }
    }    
  }
}

module barrel_insert_body(
	barrel_d=6.5
	, bore_d=3.0
	, thru_d=1.0
	, channel_d=1.0
	, insert_h=9.0
	, spacer_h=3.0
	, sidehole_n=6
	, insert_n=3
	) {
  $fa=15.0;
  $fs=0.1;
  union() {
     translate([0,0,spacer_h]) {
	  intersection() {
		translate([0,0,-channel_d/2]) cylinder(r=bore_d/2,h=insert_h+channel_d/2,center=false);
		scale([bore_d/2,bore_d/2,insert_h]) sphere(r=1.0);
		union() {
		  linear_extrude($fa=5, height=insert_h,center=false,convexity=10,twist=360/insert_n) union() {
		    for(i=[0:insert_n-1]) assign(rotAngle=i*360/insert_n)
			rotate(rotAngle) translate([0,bore_d/2-channel_d/2])
			  scale([channel_d/2,0.75*channel_d]) circle(r=1.0);
			  // square(size=[2*channel_d,bore_d],center=false);
		  }
		  linear_extrude($fa=5,height=insert_h,center=false,convexity=10,twist=-360/insert_n) union() {
		    for(i=[0:insert_n-1]) assign(rotAngle=i*360/insert_n+180/insert_n)
			rotate(rotAngle) translate([0,bore_d/2-channel_d/2])
			  scale([channel_d/2,0.75*channel_d]) circle(r=1.0);
			  // square(size=[2*channel_d,bore_d],center=false);
		  }
		  translate([0,0,5*insert_h/6]) sphere(r=insert_h/6);
		}
	  }

	}
	translate([0,0,spacer_h]) {
	    for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n)
		rotate([90,0,rotAngle]) {
		  cylinder(r=channel_d/2,h=barrel_d/2-channel_d,center=false);
		  //translate([0,0,barrel_d/2-channel_d]) sphere(r=channel_d/2);
		}
	  rotate_extrude(convexity=10) translate([barrel_d/2-channel_d,0])
		circle(r=channel_d/2,center=true);
	}
	rotate_extrude(convexity=10) translate([barrel_d/2-channel_d,0])
		circle(r=channel_d/2,center=true);
    intersection() {
	cylinder(r=barrel_d/2,h=spacer_h,center=false);
	union() {
//	  translate([0,0,spacer_h/2]) {
//	    for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n)
//		rotate([90,0,rotAngle]) {
//		  cylinder(r=channel_d/2,h=barrel_d/2-channel_d,center=false);
//		  translate([0,0,barrel_d/2-channel_d]) sphere(r=channel_d/2);
//		}
//	  }
	  linear_extrude(height=spacer_h,center=false,convexity=10,twist=180/sidehole_n) union() {
	    for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n+180/sidehole_n)
		rotate(rotAngle) translate([0,barrel_d/2-channel_d])
		  circle(r=channel_d/2);
	  }
	  linear_extrude(height=spacer_h,center=false,convexity=10,twist=-180/sidehole_n) union() {
	    for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n-180/sidehole_n)
		rotate(rotAngle) translate([0,barrel_d/2-channel_d])
		  circle(r=channel_d/2);
	  }
	}
    }
	scale([spacer_h/3,spacer_h/3,spacer_h/2]) sphere(r=1.0);
	for(i=[0:sidehole_n-1]) assign(rotAngle=i*360/sidehole_n+180/sidehole_n)
		rotate([90,0,rotAngle]) {
		  cylinder(r=channel_d/2,h=barrel_d/2-channel_d,center=false);
		  //translate([0,0,barrel_d/2-channel_d]) sphere(r=channel_d/2);
	}
  }
}

if( render_part==0 ) {
  barrel_insert();
}
if( render_part==1 ) {
  translate([10,10,0]) barrel_insert();
  translate([10,-10,0]) rotate([-90,0,0]) barrel_insert();
  translate([-10,-10,0]) rotate([180,0,0]) barrel_insert();
  translate([-10,10,0]) rotate([0,90,0]) barrel_insert();
  for(i=[0:4])
    translate([0,0,2*i]) 
	linear_extrude(height=0.2, convexity=10, center=true)
	  projection(cut=true) translate([0,0,i*0.5])
	    rotate([-90,0,0]) barrel_insert();
}
if( render_part==2) {
  echo("Rendering barrel_insert_holes...");
  barrel_insert_holes();
}
if( render_part==3) {
  echo("Rendering barrel_insert_body...");
  barrel_insert_body();
}
