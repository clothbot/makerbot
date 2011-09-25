// Socket Mask

render_part=1; // socket_mask()

module socket_mask(peg_d=3.0,rim_d=4.0,peg_min_l=3.0,body_h=5,body_w=10.0,body_l=5.0) {
  $fn=32;
  union() {
    rotate([-90,0,0]) union() {
     rotate([0,0,45]) union() {
      translate([-peg_d/2/sqrt(2),-peg_d/2/sqrt(2),-body_l]) union() {
        cylinder(r=peg_d/2,h=body_l+peg_min_l+rim_d-peg_d,center=false);
        cube(size=[peg_d/2,peg_d/2,body_l+peg_min_l+rim_d-peg_d],center=false);
      }
      translate([-peg_d/2/sqrt(2),-peg_d/2/sqrt(2),peg_min_l]) union() {
        cylinder(r=rim_d/2,h=rim_d-peg_d,center=false);
        cube(size=[rim_d/2,rim_d/2,rim_d-peg_d],center=false);
      }
     }
    }
    translate([-body_w/2,-body_l,0]) cube(size=[body_w,body_l,body_h],center=false);
  }
}

if(render_part==1) {
  echo("Rendering socket_mask()...");
  socket_mask();
}

