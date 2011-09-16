// Raceway Targets
//
// Changes:
//   2011/09/16
//    - Added Froggie (Cleaned).

stand_w=50;
stand_l=75;
stand_th=3.0;
stand_peg_d=2.0;
hinge_w=3*50/4;
hinge_inset=75/4;
slot_l=75;
card_th=0.6;
card_cut_angle=45;

//render_part=1; // Uncomment to generate a stand();
//render_part=2; // Uncomment to generate a hinge();
//render_part=3; // Uncomment to generate a stand and hinge();
//render_part=4; // Uncomment to generate card_hinge();
//render_part=5; // Uncomment to generate a SlowChildren
//render_part=6; // Uncomment to generate a LittleOldLady; doesn't work with this dxf.
render_part=8; // Uncomment to generate Froggie

module stand(w=50,l=75,slot_w=3*50/4,slot_inset=75/4,slot_l=75,h=5.0,plate_angle=10,plate_l=15.0,peg_d=3.0,space=1.0) {
  difference() {
    union() {
      translate([-w/2,0,0]) cube(size=[w,l,h],center=false);
      translate([-3*w/8,0,h]) rotate([plate_angle,0,0])
        translate([0,0,-h]) cube(size=[3*w/4,plate_l,h],center=false);
    }
    translate([-slot_w/2,slot_inset,-0.1]) cube(size=[slot_w,slot_l,2*0.1+h],center=false);
    translate([-slot_w/2,slot_inset+h,h/2]) sphere($fs=0.1,r=peg_d/2,center=true);
    translate([ slot_w/2,slot_inset+h,h/2]) sphere($fs=0.1,r=peg_d/2,center=true);
    translate([-slot_w/2-peg_d/2-space/2,slot_inset+h+1.5*peg_d,-0.1]) cube(size=[slot_w+peg_d+space,slot_l,2*0.1+h],center=false);
    translate([-w/2+3*peg_d,3*peg_d,-0.1]) cylinder($fn=8,r=peg_d,h=2*stand_th,center=false);
    translate([w/2-3*peg_d,3*peg_d,-0.1]) cylinder($fn=8,r=peg_d,h=2*stand_th,center=false);
  }
}

if(render_part==1) {
  stand(w=stand_w,l=stand_l,h=stand_th,slot_inset=hinge_inset,peg_d=stand_peg_d);
}

module hinge(w=3*50/4,l=75-75/4,h=5.0,peg_d=3.0) {
  union() {
    translate([-w/2,h/2,0]) cube(size=[w,l-h/2,h], center=false);
    translate([-w/2,h/2,h/2]) sphere($fs=0.1,r=peg_d/2,center=true);
    translate([ w/2,h/2,h/2]) sphere($fs=0.1,r=peg_d/2,center=true);
    translate([-w/2,h/2,h/2]) rotate([0,90,0]) cylinder($fn=16,r=h/2,h=w,center=false);
  }
}

if(render_part==2) {
  hinge(w=hinge_w,l=stand_l-hinge_inset,h=stand_th,peg_d=stand_peg_d);
}

if(render_part==3) {
  stand(w=stand_w,l=stand_l,h=stand_th,,slot_inset=hinge_inset,peg_d=stand_peg_d);
  translate([0,hinge_inset+stand_th+stand_peg_d+stand_th/2,0]) hinge(w=hinge_w,l=stand_l-hinge_inset,h=stand_th,peg_d=stand_peg_d);
}

module card_hinge(w=3*50/4,l=75/4,h=5.0,peg_d=3.0, card_th=0.2, cut_angle=60) {
  difference() {
    hinge(w=w,l=l,h=h,peg_d=peg_d);
    translate([-w/4,l,h/2]) rotate([0,cut_angle,0]) cube(size=[card_th,3*h,2*h],center=true);
    translate([w/4,l,h/2]) rotate([0,-cut_angle,0]) cube(size=[card_th,3*h,2*h],center=true);
  }
}

if(render_part==4) {
  card_hinge(w=hinge_w,l=hinge_inset/2,h=stand_th,peg_d=stand_peg_d,card_th=card_th,cut_angle=card_cut_angle);
}

module hinge_with_profile(w=3*50/4,l=75/4,h=5.0,peg_d=3.0
	,image_x=-15,image_y=10,dxf_scale=10.0,profile_h=6.0,rounded=false
	,profile_colour=[1,0,0]
	){
  union() {
    if(!rounded) hinge(w=w,l=l,h=h,peg_d=peg_d);
    if(rounded) union() {
      hinge(w=w,l=l-w/2,h=h,peg_d=peg_d);
      translate([0,l-w/2,0]) difference() {
        cylinder(r=w/2,h=h,center=false);
        translate([0,-w/2,0]) cube(size=[w,w,3*h],center=true);
      }
    }
    color(profile_colour) translate([image_x,image_y,0]) linear_extrude(height=profile_h) scale(dxf_scale) child(0);
  }
}

// Slow Children
if(render_part==5) {
  hinge_with_profile(w=hinge_w,l=6.5,h=stand_th,peg_d=stand_peg_d,image_x=-20,image_y=5,dxf_scale=14,profile_h=5.0) {
    import(file="dxf/SlowChildren.dxf");
  }
}

// These LittleOldLady attemptsdon't work yet.
if(render_part==6) {
//  difference() {
//    import_dxf(file="dxf/LittleOldLady_Outer.dxf");
//    import_dxf(file="dxf/LittleOldLady_Inner.dxf");
//  }
    import_dxf(file="dxf/LittleOldLadyV2.dxf");
}

if(render_part==7) {
  hinge_with_profile(w=hinge_w,l=6.5,h=stand_th,peg_d=stand_peg_d,image_x=-20,image_y=5,dxf_scale=14,profile_h=5.0) {
    import_dxf(file="dxf/LittleOldLadyV2.dxf");
  }
}

// Froggie
if(render_part==8) {
  hinge_with_profile(w=hinge_w,l=32,h=stand_th,peg_d=stand_peg_d,image_x=-21.5,image_y=6,dxf_scale=14,profile_h=5.0,rounded=true) {
    import(file="dxf/Froggie_Cleaned.dxf");
  }
}
