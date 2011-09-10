// Jointed finger for printing on fabric substrate.



module joint1(l=8.0,d=3.0) {
 difference() {
  union() {
   intersection() {
    translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
    translate([0,0,0.5*d/3])
     rotate([0,45,0]) cube(size=[sqrt(2)*d/2,2*l,sqrt(2)*d/2],center=true);
    translate([0,l/2,0.5*d/3])
     rotate([45,0,0]) cube(size=[2*d,sqrt(2)*l/2,sqrt(2)*l/2],center=true);
   }
   translate([0,l/2,d/3]) rotate([90,0,0])
     cylinder($fn=6,r=d/3,h=l/2,center=true);
  }
  translate([0,-0.1,d/3]) rotate([-90,0,0]) 
    cylinder($fn=6,r=d/6,h=l+0.2,center=false);
  translate([0,-0.1,0]) rotate([-90,0,0])
    cylinder($fn=6,r=d/12,h=l+0.2,center=false);
  translate([0,l/2,0]) rotate([-90,0,90])
    cylinder($fn=6,r=d/12,h=l+0.2,center=true);
 }
}

module joint2(l=5.0,d=3.0) {
 difference() {
  union() {
   intersection() {
    translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
    translate([0,0,0.5*d/3])
     rotate([0,45,0]) cube(size=[sqrt(2)*d/2,2*l,sqrt(2)*d/2],center=true);
    translate([0,l/2,0.5*d/3])
     rotate([45,0,0]) cube(size=[2*d,sqrt(2)*l/2,sqrt(2)*l/2],center=true);
   }
   translate([0,l/2,d/3]) rotate([90,0,0])
     cylinder($fn=6,r=d/3,h=l/2,center=true);
  }
  translate([0,-0.1,d/3]) rotate([-90,0,0]) 
    cylinder($fn=6,r=d/6,h=l+0.2,center=false);
  translate([0,-0.1,0]) rotate([-90,0,0])
    cylinder($fn=6,r=d/12,h=l+0.2,center=false);
 }
}

module joint3(l=3.0,d=3.0,bolt_d=1.6) {
 difference() {
  union() {
   intersection() {
    translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
    translate([0,0,0.5*d/3])
     rotate([0,45,0]) cube(size=[sqrt(2)*d/2,2*l,sqrt(2)*d/2],center=true);
    translate([0,l/2,0.5*d/3])
     rotate([45,0,0]) cube(size=[2*d,sqrt(2)*l/2,sqrt(2)*l/2],center=true);
   }
   translate([0,l/2-bolt_d/2,d/3]) rotate([90,0,0])
     cylinder($fn=6,r=d/3,h=l/2-bolt_d,center=true);
  }
  translate([0,-0.1,d/3]) rotate([-90,0,0])
    cylinder($fn=6,r=d/6,h=l+0.2,center=false);
  translate([0,-0.1,0]) rotate([-90,0,0])
    cylinder($fn=6,r=d/12,h=l+0.2,center=false);
  translate([0,d-3*bolt_d/2,-0.1])
    cylinder($fn=12,r=bolt_d/2,h=d+0.2,center=false);
 }
}

module wrist_joint(l=8.0,d=3.0,bolt_d=1.6) {
 difference() {
  union() {
   intersection() {
    translate([-d/2,0,0]) cube(size=[d,l,d/3],center=false);
    translate([0,0,5*d/8])
     rotate([0,45,0]) cube(size=[sqrt(2)*d,2*l,sqrt(2)*d],center=true);
    translate([0,l/2,0.5*d/3])
     rotate([45,0,0]) cube(size=[2*d,sqrt(2)*l/2,sqrt(2)*l/2],center=true);
   }
   translate([0,l/2+bolt_d/2,d/3]) rotate([90,0,0])
     cylinder($fn=6,r=d/3,h=3*l/4-bolt_d,center=true);
  }
  translate([0,-0.1,d/3]) rotate([-90,0,0])
    cylinder($fn=6,r=d/6,h=l+0.2,center=false);
  translate([0,-0.1,0]) rotate([-90,0,0])
    cylinder($fn=6,r=d/12,h=l+0.2,center=false);
  translate([0,3*bolt_d/2,-0.1])
    cylinder($fn=12,r=bolt_d/2,h=d+0.2,center=false);
  translate([0,l/2,0]) rotate([-90,0,90])
    cylinder($fn=6,r=d/12,h=l+0.2,center=true);
 }
}
  
module finger(l=8+5+3,d=3.0,s=0.2,bolt_d=1.6) {
  translate([0,-(8+s)*l/16,0])
    wrist_joint(l=8*l/16,d=d,bolt_d=bolt_d);
  joint1(l=8*l/16,d=d);
  translate([0,(8+s)*l/16,0]) {
    joint2(l=5*l/16,d=d);
    translate([0,(5+s)*l/16,0])
      joint3(l=3*l/16,d=d,bolt_d=bolt_d);
  }
}


module hand(finger_l=32,finger_d=6.0) {
  translate([-1.5*(finger_d+2.0),5.0,0]) finger(l=finger_l,d=finger_d);
  translate([-0.5*(finger_d+2.0),5.0,0]) finger(l=finger_l,d=finger_d);
  translate([0.5*(finger_d+2.0),5.0,0]) finger(l=finger_l,d=finger_d);
  translate([1.5*(finger_d+2.0),5.0,0]) finger(l=finger_l,d=finger_d);
}

rotate([0,0,-90]) finger(l=64,d=12.0,bolt_d=3.0);

// hand();

