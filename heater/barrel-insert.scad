// Insert for barrel to heat incoming filament from the inside out.

render_part=0;

module barrel_insert(
	barrel_d=6.0
	, bore_d=3.0
	, thru_d=1.0
	, channel_d=1.0
	, insert_h=6.0
	, spacer_h=1.0
	, sidehole_n=4
	) {
  $fa=15.0;
  $fs=0.1;
  difference() {
    union() {
      cylinder(r=bore_d/2,h=insert_h+spacer_h,center=false);
      cylinder(r2=barrel_d/2,r1=barrel_d/2-spacer_h,h=spacer_h,center=false);
    }
    translate([0,0,-0.1])
      cylinder(r=thru_d/2,h=0.2+insert_h+spacer_h,center=false);
    translate([0,0,-thru_d])
      cylinder(r1=2*thru_d,r2=0,h=2*thru_d,center=false);
    translate([0,0,spacer_h+insert_h/4]) {
      difference() {
        cylinder(r=barrel_d/2,h=3*insert_h/4+spacer_h,center=false);
        cylinder(r1=bore_d/2,r2=thru_d/2,h=3*insert_h/4,center=false);
      }
    }
    translate([0,0,spacer_h+channel_d]) {
      for(i=[0:sidehole_n-1]) assign(rotA=360*i/sidehole_n) {
	   rotate([0,0,rotA]) translate([bore_d/2,0,0]) {
	     cylinder(r=thru_d/2,h=insert_h,center=false);
	     sphere(r=thru_d/2,center=true);
		rotate([0,-150,0])
		  cylinder(r=thru_d/2,h=2*spacer_h,center=false);
	   }
	 }
    }
  }
}

if( render_part==0 ) {
  barrel_insert();
}
