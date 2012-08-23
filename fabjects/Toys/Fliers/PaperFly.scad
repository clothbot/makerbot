/*

Dervived from the Bukobot Fly by Diego Porqueras - Deezmaker (http://deezmaker.com)
  See http://www.thingiverse.com/thing:22268

This adaptation is for printing a PLA skeleton directly on paper for a hybrid flier.

This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

$fn= 60; // Smoothness setting

wing_front_thickness = 0.4; // Wing thickness
wing_back_thickness = 0.4; // Tail Thickness
wing_span = 160/2; // half of the wing span actually
wing_rib_angle = 25.5;
//wing_rib_angle = 30;
wing_bone_r=2*wing_front_thickness;
nose_distance = 42;
nose_size = 8;

module shell_2d(th=0.2,resolution=8) {
  for(i=[0:resolution-1]) assign(rotAngle=360*i/resolution) for(j=[0:$children-1]) {
    difference() {
      child(j);
	 translate([th*cos(rotAngle),th*sin(rotAngle)]) child(j);
    }
  }
}

module Wing_2D(wing_front_thickness=wing_front_thickness
	, wing_span=wing_span
	, side=1
	) {
	hull() {
		circle(r=1,center=0);
		translate([-60,side*wing_span])scale([1,2]) circle(r=17,center=0);
		translate([-70,0]) circle(r=1,center=0);
	}
}

module Wing(wing_front_thickness=wing_front_thickness
	, wing_span=wing_span
	, side=1
	) {
  linear_extrude(height=wing_front_thickness)
	Wing_2D(wing_span=wing_span,side=side);
}

module Wing_Skeleton(wing_bone_r=wing_bone_r
	, wing_bone_count=3
	, wing_front_thickness=wing_front_thickness
	, wing_span=wing_span
	, side=1
	) {
	intersection() {
		Wing(wing_front_thickness=wing_bone_r,wing_span=wing_span,side=side);
		union() {
		  for(i=[0:wing_bone_count-1]) {
		    translate([-0.5*70*(i+0.5)/wing_bone_count-wing_bone_r,side*wing_span*(i+0.5)/wing_bone_count,0]) {
		      rotate([90,0,-90]) cylinder(r1=wing_bone_r,r2=wing_front_thickness,h=70-0.5*70*(i+0.5)/wing_bone_count,center=false);
		    }
		  }
		  translate([-0.5*70*(wing_bone_count-0.5)/wing_bone_count-wing_bone_r,side*wing_span*(wing_bone_count-0.5)/wing_bone_count,0]) {
		    rotate([90,0,-90-side*35]) cylinder(r1=wing_bone_r,r2=wing_front_thickness,h=sqrt(2)*(70-0.5*70*(wing_bone_count-0.5)/wing_bone_count),center=false);
		  }
		  linear_extrude(height=wing_front_thickness) shell_2d(th=2*wing_bone_r)
			Wing_2D(wing_span=wing_span,side=side);
		}
	}
}

module Tail(wing_back_thickness=wing_back_thickness
	, side=1
	) {
// Tail
	hull() {
		cylinder(r=1,h=wing_back_thickness,center=0);
		translate([-30,side*40,0])cylinder(r=10,h=wing_back_thickness,center=0);
		translate([-30,0,0])cylinder(r=10,h=wing_back_thickness,center=0);
	}
}

module Rudder() {
//Rudder
	translate([-7,0,0])
	hull() {
		translate([-10,0,28])cube([20,1,1],true);
		translate([0,0,1])cube([60,1,1],true);
	}
}

module Flap(wing_back_thickness=wing_back_thickness) {
// Flap
  translate([-44,0,0]){
	hull() {
		translate([0,25,0])cylinder(r=3,h=wing_back_thickness,center=0);
		translate([0,-25,0])cylinder(r=3,h=wing_back_thickness,center=0);
	}
	translate([5,25,.2])cube([10,5,.3],true);
	translate([5,-25,.2])cube([10,5,.3],true);
	translate([5,0,.2])cube([10,5,.3],true);
  }
}

module Fuselage(
	wing_rib_angle=wing_rib_angle
	, wing_span=wing_span
	, wing_bone_r=wing_bone_r
	, wing_front_thickness=wing_front_thickness
	) {
// Fuselage
  difference() {
	union() {
// Wing Ribs / Leading edge

	translate([wing_bone_r,0,wing_bone_r/2]) {
		for ( i = [0 , 1 ] ) {
			mirror([0,i,0])rotate([-90,0,wing_rib_angle])scale([1,.6,1])cylinder(r=wing_bone_r,h=0.5*wing_span/sin(wing_rib_angle),center=0);
		}
	}

// Nose
	hull() {
		translate([42,0,2.5])scale([1,1.1,.6])sphere(r=8);
		translate([-10,0,1])sphere(r=1.5);
	}

// Fuselage beam
	hull() {
		translate([-10,0,1])sphere(r=1.5);
		translate([-116,0,1])sphere(r=1.5);
	}
	} // End Union

// Hook Hole
	translate([38,0,3])rotate([0,15,0])cylinder(r=1.5,h=25,center=true);

// Nose and bottom trimmer
	translate([-20,0,-25])cube([200,300,50],true);
	translate([50,0,16])cube([100,50,20],true);

  }
}


for ( i = [-1 , 1 ] ) {
  //Wing(side=i);
  Wing_Skeleton(side=i);
}
translate([-80,0,0]) {
  for ( i = [-1 , 1 ] ) {
    Tail(side=i);
  }
  Rudder();
  Flap();
} // End Tail - Translate
Fuselage();
