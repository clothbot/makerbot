// Thread maker

module nut_profile(count,angle,thread_r,nut_r,cut_extension=0) {
  intersection() {
    circle($fn=64,r=nut_r+cut_extension);
    render() projection(cut=true) for(i=[0:count-1]) rotate([0,0,i*360/count]) {
      translate([nut_r,0,0]) rotate([angle,0,0])
        cylinder($fn=32,r=thread_r,h=2*nut_r,center=true);
    }
  }
}

module nut_thread(count,angle,height,thread_r,nut_r,cut_extension=0) {
  twist_angle=tan(angle)*height/2*nut_r;
  echo("twist_angle: ",twist_angle);
  linear_extrude(height=height,twist=twist_angle)
    nut_profile(count,angle,thread_r,nut_r,cut_extension);
}

//linear_extrude(twist=360/3,height=10.0)
//  nut_profile(count=3,angle=90-30,thread_r=1.0,nut_r=10,cut_extension=0.1);
nut_thread(count=3,angle=75,height=20.0,thread_r=1.0,nut_r=10,cut_extension=1.1);