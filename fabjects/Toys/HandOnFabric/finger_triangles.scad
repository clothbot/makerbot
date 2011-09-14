// Finger variant constructed with triangle cross-sections.
//render_part=0; // tri_equ, equilateral triangle
 render_part=1; // joint_core()
render_part=2; // joint_side()
render_part=3; // joint_end()
render_part=4; // joint1()
//render_part=5; // joint1() animated
render_part=6; // finger()

module tri_equ(l=3.0) {
  scale([l,l])
    polygon(points=[[-0.5,0],[0.5,0],[0,sqrt(3)/2]], paths=[[0,1,2]]);
}

if(render_part==0) {
  echo("Rendering tri_equ()...");
  tri_equ();
}

module joint_core(l=8.0,d=3.0,s=0.1,a=45
	,bolt_d=3.0,bolt_base=false,bolt_tip=false
	,bevel_base=true,bevel_tip=true) {
  difference() {
    union() {
      translate([-d/3,0,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      translate([d/3,0,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      //translate([0,0,(sqrt(3)/3)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/3,h=l,center=false);
      translate([0,0,(sqrt(3)/2)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
    }
    mirror([0,0,1]) translate([-d-s,-s,0]) cube(size=[2*d+2*s,l+2*s,2*d],center=false);
//    translate([0,-s,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([0,-s,(sqrt(3)/2)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([-d/3,-s,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([d/3,-s,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    // translate([0,-s,(sqrt(3)/3)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    //translate([0,-s,(sqrt(3)/3)*d/4]) rotate([-90,90,0]) cylinder($fn=3,r=(sqrt(3)/3)*d/4,h=l+2*s,center=false);
    translate([0,l/2,0]) rotate([-90,0,90]) cylinder($fn=6,r=d/8,h=l+2*s,center=true);
    // End slice angle
    if(bevel_base) translate([-d,0,0]) rotate([a,0,0]) cube(size=[2*d,2*d,2*d],center=false);
    if(bevel_tip) translate([d,l,0]) rotate([a,0,180]) cube(size=[2*d,2*d,2*d],center=false);
    if(bolt_base) translate([0,1.5*bolt_d,-s]) cylinder($fn=8,r=bolt_d/2,h=2*d+2*s,center=false);
    if(bolt_tip) translate([0,l-1.5*bolt_d,-s]) cylinder($fn=8,r=bolt_d/2,h=2*d+2*s,center=false);
  }
}

if(render_part==1) {
  echo("Rendering joint_core()...");
  joint_core(l=8*(8+5+3)/16,d=3.0);
}


module joint_side(l=8.0,d=0.3,s=0.1,a=45,bevel_base=true,bevel_tip=true) {
  translate([d/3,0,0]) difference() {
    union() {
      // rotate([90,0,180]) linear_extrude(height=l) tri_equ(l=d/2);
      rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      translate([0,0,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      // Debug:
      //translate([-d/4,0,0]) cylinder(r=s,h=d,center=false);
    }
    mirror([0,0,1]) translate([-d/4-s,-s,0]) cube(size=[d/2+2*s,l+2*s,d/2],center=false);
    translate([0,-s,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([0,-s,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false); 
    translate([0,-s,(sqrt(3)/2)*d/2]) rotate([0,60,0]) translate([-d/2,0,0]) cube(size=[d,l+2*s,d],center=false);
    translate([0,l/2,0]) rotate([-90,0,90]) cylinder($fn=6,r=d/8,h=l+2*s,center=true);
    if(bevel_base) translate([-d,0,0]) rotate([a,0,0]) cube(size=[2*d,2*d,2*d],center=false);
    if(bevel_tip) translate([d,l,0]) rotate([a,0,180]) cube(size=[2*d,2*d,2*d],center=false);
    if(bevel_base) translate([-d/4,0,-s]) rotate([0,0,-90+30]) cube(size=[2*d,2*d,2*d],center=false);
    if(bevel_tip) translate([-d/4,l,-s]) rotate([0,0,-30]) cube(size=[2*d,2*d,2*d],center=false);

  }
}

if(render_part==2) {
  echo("Rendering joint_side()...");
  joint_side(l=8*(8+5+3)/16,d=3.0);
}

module joint_end(l=8.0,d=0.3,s=0.1,a=45,bevel_base=true,bevel_tip=true) {
  translate([d/3,0,0]) difference() {
    union() {
      // rotate([90,0,180]) linear_extrude(height=l) tri_equ(l=d/2);
      rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      //translate([d/3,0,(sqrt(3)/2)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      translate([0,0,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
    }
    mirror([0,0,1]) translate([-d/4-s,-s,0]) cube(size=[d/2+2*s,l+2*s,d/2],center=false);
    translate([0,-s,0]) rotate([-90,0,0])
      cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    //translate([d/3,-s,(sqrt(3)/2)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([0,l/2,0]) rotate([-90,0,90])
      cylinder($fn=6,r=d/8,h=l+2*s,center=true);
    translate([0,-s,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false); 
    translate([0,-s,(sqrt(3)/2)*d/2]) rotate([0,-60,0]) translate([-d/2,0,0]) cube(size=[d,l+2*s,d],center=false);
    //translate([-d,d/4,0]) rotate([a,0,0]) cube(size=[2*d,2*d,2*d],center=false);
    // translate([-d,d/2,0]) rotate([180-a,0,0]) cube(size=[2*d,2*d,2*d],center=false);
    //translate([d,l,0]) rotate([a,0,180]) cube(size=[2*d,2*d,2*d],center=false);
    translate([-d/4,0,-s]) rotate([0,0,-90+30]) cube(size=[2*d,2*d,2*d],center=false);
    translate([-d/4,l,-s]) rotate([0,0,-30]) cube(size=[2*d,2*d,2*d],center=false);
  }
}

if(render_part==3) {
  echo("Rendering joint_end()...");
  joint_end(l=8*(8+5+3)/16,d=3.0);
}

module joint1(l=8.0,d=3.0,s=0.1,close_angle=60
	,bolt_d=3.0,bolt_base=false,bolt_tip=false
	,bevel_base=true,bevel_tip=true) {
  joint_core(l=l,d=d,s=s,bolt_d=bolt_d
	,bolt_base=bolt_base,bolt_tip=bolt_tip
	,bevel_base=bevel_base,bevel_tip=bevel_tip);
  translate([d/2+s,0,0]) rotate([0,-close_angle,0]) joint_side(l=l,d=d,s=s,bevel_base=bevel_base,bevel_tip=bevel_tip);
  translate([d/2+s,d/4,0]) rotate([0,-close_angle,0])
    translate([d/2+s,0,0]) rotate([0,-close_angle,0]) joint_end(l=l-d/2,d=d,s=s,bevel_base=bevel_base,bevel_tip=bevel_tip);
  translate([-d/2-s,0,0]) mirror([1,0,0]) rotate([0,-close_angle,0])
    joint_side(l=l,d=d,s=s,bevel_base=bevel_base,bevel_tip=bevel_tip);
//  translate([-d/2-s-d/2-s,0,0]) mirror([1,0,0]) rotate([0,-close_angle,0]) joint_end(l=l,d=d,s=s,bevel_base=bevel_base,bevel_tip=bevel_tip);
  mirror([1,0,0]) translate([d/2+s,d/4,0]) rotate([0,-close_angle,0])
    translate([d/2+s,0,0]) rotate([0,-close_angle,0]) joint_end(l=l-d/2,d=d,s=s,bevel_base=bevel_base,bevel_tip=bevel_tip);
}

if(render_part==4) {
  echo("Rendering joint1()...");
  joint1(l=8*(8+5+3)/16,d=3.0,close_angle=0);
}

if(render_part==5) {
  echo("Rendering joint1()...");
  joint1(l=8*(8+5+3)/16,d=3.0,close_angle=60*$t);
}

module finger(l=8+5+3,d=3.0,s=0.2,bolt_d=1.6) {
  translate([0,-(8+s)*l/16,0])
    //wrist_joint(l=8*l/16,d=d,bolt_d=bolt_d);
    joint1(l=8*l/16,d=d,close_angle=0
	,bolt_d=bolt_d,bolt_base=true,bolt_tip=false
	,bevel_base=false,bevel_tip=true);
  joint1(l=8*l/16,d=d,close_angle=0,bevel_base=true,bevel_tip=true);
  translate([0,(8+s)*l/16,0]) {
    // joint2(l=5*l/16,d=d);
    joint1(l=5*l/16,d=d,close_angle=0,bevel_base=true,bevel_tip=true);
    translate([0,(5+s)*l/16,0])
      // joint3(l=3*l/16,d=d,bolt_d=bolt_d);
      joint1(l=5*l/16,d=d,close_angle=0
		,bolt_d=bolt_d,bolt_base=false,bolt_tip=true
		,bevel_base=true,bevel_tip=false);
  }
}

if(render_part==6) {
  echo("Rendering finger()...");
  finger(l=64,d=12.0,bolt_d=3.0);
}

