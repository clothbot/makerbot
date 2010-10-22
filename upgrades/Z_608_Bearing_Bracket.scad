// Bracket for Z-axis 608 Bearings

use <Calibration.scad>
use <Generic.scad>
use <Bearing_608.scad>
use <ISO_Metric_Hardware.scad>

//render_part="Z_Bracket_Simple";
render_part=1;

function Z_Bracket_W() = 40.0; // Z Bracket Width
function Z_Bracket_L() = 40.0; // Z Bracket Length
function Z_Bracket_Corner_R() = 10.0; // Z Bracket Corner Radius
// function Z_Bracket_H() = Bearing_608_H()+M3_SCS_Head_H();
function Z_Bracket_H() = 5.0+M3_SCS_Head_H();
function Z_Bracket_Top_M3_X_Offset() = 10.0; // Offset from center.
function Z_Bracket_Top_M3_Y_Offset() = 10.0; // Offset from center.

module Z_Bracket_Holes_2D() {
  $fa=15.0;
  $fs=0.1;
  union() {
   circle(r=Bearing_608_OD()/2,center=true);
   translate([Z_Bracket_Top_M3_X_Offset(),Z_Bracket_Top_M3_Y_Offset()])
     circle(r=M3_Diam()/2,center=true);
   translate([Z_Bracket_Top_M3_X_Offset(),-Z_Bracket_Top_M3_Y_Offset()])
     circle(r=M3_Diam()/2,center=true);
   translate([-Z_Bracket_Top_M3_X_Offset(),-Z_Bracket_Top_M3_Y_Offset()])
     circle(r=M3_Diam()/2,center=true);
   translate([-Z_Bracket_Top_M3_X_Offset(),Z_Bracket_Top_M3_Y_Offset()])
     circle(r=M3_Diam()/2,center=true);
  }
}

module Z_Bracket_2D() {
  difference() {
   union() {
    square(size=[Z_Bracket_W()-2*Z_Bracket_Corner_R(),Z_Bracket_L()],center=true);
    square(size=[Z_Bracket_W(),Z_Bracket_L()-2*Z_Bracket_Corner_R()],center=true);
    translate([Z_Bracket_W()/2-Z_Bracket_Corner_R(),Z_Bracket_W()/2-Z_Bracket_Corner_R()])
      circle(r=Z_Bracket_Corner_R(),center=true);
    translate([Z_Bracket_W()/2-Z_Bracket_Corner_R(),-(Z_Bracket_W()/2-Z_Bracket_Corner_R())])
      circle(r=Z_Bracket_Corner_R(),center=true);
    translate([-(Z_Bracket_W()/2-Z_Bracket_Corner_R()),-(Z_Bracket_W()/2-Z_Bracket_Corner_R())])
      circle(r=Z_Bracket_Corner_R(),center=true);
    translate([-(Z_Bracket_W()/2-Z_Bracket_Corner_R()),Z_Bracket_W()/2-Z_Bracket_Corner_R()])
      circle(r=Z_Bracket_Corner_R(),center=true);
   }
   Z_Bracket_Holes_2D();
  }
}

module Z_Bracket_Simple() {
  $fa=15.0;
  $fs=0.1;
  difference() {
    linear_extrude(height=Z_Bracket_H(), center=false, convexity=10)
      Z_Bracket_2D();
    translate([0,0,Z_Bracket_H()-M3_SCS_Head_H()])
      cylinder(r1=Bearing_608_OD()/2
	, r2=Bearing_608_OD()/2+M3_SCS_Head_H()
	, h=2*M3_SCS_Head_H()
	, center=false);
    translate([Z_Bracket_Top_M3_X_Offset()
	, Z_Bracket_Top_M3_Y_Offset()
	, Z_Bracket_H()-M3_SCS_Head_H()])
      M3_SCS_Head_Hole();
    translate([Z_Bracket_Top_M3_X_Offset()
	, -Z_Bracket_Top_M3_Y_Offset()
	, Z_Bracket_H()-M3_SCS_Head_H()])
      M3_SCS_Head_Hole();
    translate([-Z_Bracket_Top_M3_X_Offset()
	, -Z_Bracket_Top_M3_Y_Offset()
	, Z_Bracket_H()-M3_SCS_Head_H()])
      M3_SCS_Head_Hole();
    translate([-Z_Bracket_Top_M3_X_Offset()
	, Z_Bracket_Top_M3_Y_Offset()
	, Z_Bracket_H()-M3_SCS_Head_H()])
      M3_SCS_Head_Hole();
    for(i=[0:3]) {
      translate([0,0,Bearing_608_H()/2]) rotate([90,0,360*i/4]) {
	linear_extrude(height=Bearing_608_OD()/2+M3_Nut_DIN934_H()+0.1, center=false, convexity=10)
	  M3_Nut_DIN934_2D();
	linear_extrude(height=Z_Bracket_W(),center=false, convexity=10)
	  circle(r=M3_Diam()/2+0.1);
	translate([0,0,Z_Bracket_W()/2-M3_SCS_Head_H()])
	  linear_extrude(height=M3_SCS_Head_H()+0.1,center=false,convexity=10)
	    TearDrop_Truncated_2D(diameter=M3_SCS_Head_D());
      }
    }
  }
}

module Z_Bracket_Calibration() {
  $fa=15.0;
  $fs=0.1;
  union() {
   difference() {
    cube(size=[25,30,2],center=false);
    translate([25/2,25/2,-0.1]) {
	Bearing_608();
	cylinder(r=Bearing_608_ID()/2+0.1,h=3.0,center=false);
    }
    translate([25-5,30-4,-0.1]) { 
	linear_extrude(height=3,center=false, convexity=10) M3_Nut_DIN934_2D();
	cylinder(r=M3_Diam()/2+0.1,h=3.0,center=false);
    }
    translate([5,30-4,-0.1])  M3_SCS_Head_Hole();
   }
   translate([25/2,25/2,0]) difference() {
    cylinder(r=8.0,h=2.0,center=false);
    translate([0,0,-0.1]) cylinder(r=M3_Diam()/2,h=3.0,center=false);
   }
  }
}

if(render_part==1) {
  echo("Rendering Z_Bracket_Simple...");
  Z_Bracket_Simple();
}

