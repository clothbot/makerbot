// Target Stand
stand_w=50;
stand_l=75;
stand_th=3.0;
stand_peg_d=2.0;
hinge_w=3*50/4;
hinge_inset=75/4;
slot_l=75;
card_th=0.6;
card_cut_angle=45;

render_part=1; // stand();
//render_part=2; // hinge();
//render_part=3; // stand and hinge();
render_part=4; // card_hinge();

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
  stand(w=stand_w,l=stand_l,h=stand_th,,slot_inset=hinge_inset,peg_d=stand_peg_d);
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
  translate([0,hinge_inset+stand_th+stand_peg_d+stand_th,0]) hinge(w=hinge_w,l=stand_l-hinge_inset,h=stand_th,peg_d=stand_peg_d);
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

