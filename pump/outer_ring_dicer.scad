// Code for dicing up the outer ring parts for smaller build platforms.

module outer_ring_wedge_mask(
	// 2*roller_d+drive_d+hole_d_odd+2*outer_wall_th+extension
	wedge_r=(2*27+33)+(3.0+0.2)+2*10.0+0.1
	, start_angle=360/24
	, end_angle=360/4+360/24
	) {
  if((end_angle-start_angle)<=90) {
    intersection() {
      rotate(start_angle) square(size=wedge_r,center=false);
      rotate(end_angle-90) square(size=wedge_r,center=false);
      circle(r=wedge_r);
    }
  }
}

module outer_ring_quarters(
	num_wedges=4
	, wedge_angle_start=360/24
	, wedge_spacing=25.0
	, wedge_h=4.5
	) {
  for(i=[0:num_wedges-1]) {
    translate([i*wedge_spacing,0,0]) rotate(-wedge_angle_start-360*i/num_wedges-180/num_wedges) intersection() {
      translate([0,0,-0.1]) linear_extrude(height=wedge_h+0.2) 
        outer_ring_wedge_mask(start_angle=360*i/num_wedges+wedge_angle_start
		, end_angle=360*(i+1)/num_wedges+wedge_angle_start);
        child(0);
    }
  }
}

translate([-75,0,0]) outer_ring_quarters() import_stl(file="build/outer_gear_w_mount_holes.stl");

