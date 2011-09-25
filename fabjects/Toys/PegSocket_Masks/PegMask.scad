// Peg Mask

render_part=1; // peg_mask()

module peg_mask(peg_d=3.0,rim_d=4.0,peg_min_l=3.0,body_h=5.0,body_w=5.0,body_l=10.0) {
  $fn=32;
  union() {
   rotate([-90,0,0]) intersection() {
    rotate([0,0,-135]) translate([0,0,-body_l]) cube(size=[rim_d,rim_d,body_l+peg_min_l+rim_d-peg_d],center=false);
    rotate([0,0,45]) union() {
      translate([-peg_d/2/sqrt(2),-peg_d/2/sqrt(2),-body_l]) cylinder(r=peg_d/2,h=body_l+peg_min_l+rim_d-peg_d,center=false);
      translate([-peg_d/2/sqrt(2),-peg_d/2/sqrt(2),peg_min_l]) cylinder(r1=peg_d/2,r2=rim_d/2,h=(rim_d/2-peg_d/2),center=false);
      translate([-peg_d/2/sqrt(2),-peg_d/2/sqrt(2),peg_min_l+(rim_d/2-peg_d/2)]) cylinder(r=rim_d/2,h=(rim_d/2-peg_d/2),center=false);
    }
   }
   translate([-body_w/2,-body_l,0,]) cube(size=[body_w,body_l,body_h],center=false);
  }
}

if(render_part==1) {
  echo("Rendering peg_mask()...");
  peg_mask();
}

