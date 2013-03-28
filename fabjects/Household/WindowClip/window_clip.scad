// Window clip.

render_part=0; // window_clip_outline
render_part=1; // window_clip

abs_correct=0.5;

scale_1in=25.4;
bottom_width=(2+1/8)*scale_1in-abs_correct;
bottom_height=scale_1in*7/8-abs_correct;
bottom_th=scale_1in/4;
clip_width=(1+1/4)*scale_1in-abs_correct;
bottom2clip_height=2.5*scale_1in;
bottom2fork_height=(1+5/16)*scale_1in;
fork_tine_width=scale_1in*7/16-abs_correct;
hole_radius2radius=scale_1in*0.5;
fork_tine_tip_width=scale_1in*0.475-abs_correct;
fork_tine_tip_height=scale_1in*0.275-abs_correct;
clip_peg_outer_diameter=0.2425*scale_1in-abs_correct/2;
clip_peg_height=0.220*scale_1in;
clip_peg_inner_diameter=0.082*scale_1in;
bracket_inner_height=18.0;
bracket_inset_deltax=3.5;
bracket_clip_width=0.25*scale_1in+abs_correct;
bracket_clip_deltaz=0.125*scale_1in;
bracket_clip_overhang=0.4;

module window_clip_outline(bottom_w=bottom_width
	, bottom_h=bottom_height
	, clip_w=clip_width
	, bottom2clip_h=bottom2clip_height
	, bottom2fork_h=bottom2fork_height
	, fork_tine_w=fork_tine_width
	, hole_r2r=hole_radius2radius
	, fork_tine_tip_w=fork_tine_tip_width
	, fork_tine_tip_h=fork_tine_tip_height
	, bevel_r=3.0
	) {
  hole_d=clip_w-2*fork_tine_w;
  fork_tip_hole_w=clip_w-2*fork_tine_tip_w;
  translate([-bottom_w/2,0]) square(size=[bottom_w,bottom_h],center=false);
  difference() {
    union() {
	translate([-clip_w/2,0]) square(size=[clip_w,bottom2clip_h-fork_tine_tip_h],center=false);
	translate([0,bottom2clip_h-fork_tine_tip_h]) {
	  hull() {
		translate([-clip_w/2,-bevel_r]) {
			square([fork_tine_tip_w,bevel_r],center=false);
			translate([bevel_r,fork_tine_tip_h]) circle($fn=16,r=bevel_r);
			translate([fork_tine_tip_w-bevel_r,fork_tine_tip_h]) circle($fn=16,r=bevel_r);
		}
	  }
	  mirror([1,0]) hull() {
		translate([-clip_w/2,0]) {
			square([fork_tine_tip_w,bevel_r],center=false);
			translate([bevel_r,fork_tine_tip_h-bevel_r]) circle($fn=16,r=bevel_r);
			translate([fork_tine_tip_w-bevel_r,fork_tine_tip_h-bevel_r]) circle($fn=16,r=bevel_r);
		}
	  }
	}
    }
    translate([0,bottom2fork_h]) {
      translate([0,hole_d/2]) {
	  circle(r=hole_d/2);
	  translate([-hole_d/2,0]) square(size=[hole_d,hole_r2r],center=false);
	  translate([0,hole_r2r]) circle(r=hole_d/2);
      }
    }
    translate([0,bottom2clip_h]) {
	translate([-fork_tip_hole_w/2,-fork_tine_tip_h]) square(size=[fork_tip_hole_w,2*fork_tine_tip_h],center=false);
	translate([0,-fork_tine_tip_h]) circle(r=fork_tip_hole_w/2);
    }
  }
}

if(render_part==0) {
  echo("Render window clip outline...");
  linear_extrude(height=bottom_th) window_clip_outline();
}

module window_clip(bottom_w=bottom_width
	, bottom_h=bottom_height
	, clip_w=clip_width
	, bottom2clip_h=bottom2clip_height
	, bottom2fork_h=bottom2fork_height
	, fork_tine_w=fork_tine_width
	, hole_r2r=hole_radius2radius
	, fork_tine_tip_w=fork_tine_tip_width
	, fork_tine_tip_h=fork_tine_tip_height
	, bottom_th=bottom_th
	, peg_od=clip_peg_outer_diameter
	//, peg_id=clip_peg_inner_diameter
	, peg_id=3.2
	, peg_h=clip_peg_height
	, bracket_inner_h=bracket_inner_height
	, bracket_inset_dx=bracket_inset_deltax
	, bracket_clip_w=bracket_clip_width
	, bracket_clip_dz=bracket_clip_deltaz
	, bracket_clip_oh=bracket_clip_overhang
	, bevel_r=3.0
	, bolt_head_d=5.7
	, bolt_head_h=3.0
	) {
  bracket_clip_dy=(bottom_h-bracket_inner_h)/2;
  difference() {
    union() {
      linear_extrude(height=bottom_th) window_clip_outline(bottom_w=bottom_w
	,bottom_h=bottom_h
	,clip_w=clip_w
	,bottom2clip_h=bottom2clip_h
	,bottom2fork_h=bottom2fork_h
	,fork_tine_w=fork_tine_w
	,hole_r2r=hole_r2r
	,fork_tine_tip_w=fork_tine_tip_w
	,fork_tine_tip_h=fork_tine_tip_h
	, bevel_r=bevel_r
	);
      translate([-clip_w/2,bottom_h/2]) cylinder(r=peg_od/2,h=bottom_th+peg_h-(peg_od-peg_id)/4,center=false);
      translate([-clip_w/2,bottom_h/2,bottom_th+peg_h-(peg_od-peg_id)/4])
		cylinder(r1=peg_od/2,r2=peg_od/2-(peg_od-peg_id)/4,h=(peg_od-peg_id)/4,center=false);
      translate([clip_w/2,bottom_h/2]) cylinder(r=peg_od/2,h=bottom_th+peg_h-(peg_od-peg_id)/4,center=false);
      translate([clip_w/2,bottom_h/2,bottom_th+peg_h-(peg_od-peg_id)/4])
		cylinder(r1=peg_od/2,r2=peg_od/2-(peg_od-peg_id)/4,h=(peg_od-peg_id)/4,center=false);	translate([-bottom_w/2+bracket_inset_dx,0,0]) {
	  cube([bracket_clip_w,bracket_clip_dy,bottom_th+peg_h],center=false);
	  hull() {
	    translate([0,0,bottom_th+bracket_clip_dz]) cube([bracket_clip_w,bracket_clip_dy+bracket_clip_oh,bracket_clip_oh],center=false);
	    translate([0,0,bottom_th+peg_h-bracket_clip_oh]) cube([bracket_clip_w,bracket_clip_dy,bracket_clip_oh],center=false);
	  }
	}
	translate([bottom_w/2-bracket_inset_dx-bracket_clip_w,0,0]) {
	  cube([bracket_clip_w,bracket_clip_dy,bottom_th+peg_h],center=false);
	  hull() {
	    translate([0,0,bottom_th+bracket_clip_dz]) cube([bracket_clip_w,bracket_clip_dy+bracket_clip_oh,bracket_clip_oh],center=false);
	    translate([0,0,bottom_th+peg_h-bracket_clip_oh]) cube([bracket_clip_w,bracket_clip_dy,bracket_clip_oh],center=false);
	  }
	}
	translate([-bottom_w/2+bracket_inset_dx,bottom_h,0]) mirror([0,1,0]) {
	  cube([bracket_clip_w,bracket_clip_dy,bottom_th+peg_h],center=false);
	  hull() {
	    translate([0,0,bottom_th+bracket_clip_dz]) cube([bracket_clip_w,bracket_clip_dy+bracket_clip_oh,bracket_clip_oh],center=false);
	    translate([0,0,bottom_th+peg_h-bracket_clip_oh]) cube([bracket_clip_w,bracket_clip_dy,bracket_clip_oh],center=false);
	  }
	}
	translate([bottom_w/2-bracket_inset_dx-bracket_clip_w,bottom_h,0]) mirror([0,1,0]) {
	  cube([bracket_clip_w,bracket_clip_dy,bottom_th+peg_h],center=false);
	  hull() {
	    translate([0,0,bottom_th+bracket_clip_dz]) cube([bracket_clip_w,bracket_clip_dy+bracket_clip_oh,bracket_clip_oh],center=false);
	    translate([0,0,bottom_th+peg_h-bracket_clip_oh]) cube([bracket_clip_w,bracket_clip_dy,bracket_clip_oh],center=false);
	  }
	}
    }
    translate([-clip_w/2,bottom_h/2,0]) {
	cylinder($fn=8,r=peg_id/2,h=bottom_th+peg_h+0.2,center=false);
	cylinder($fn=16,r=bolt_head_d/2,h=2*bolt_head_h, center=true);
	translate([0,0,bolt_head_h-0.1]) cylinder(r1=bolt_head_d/2+0.1,r2=0,h=bolt_head_d/2+0.1,center=false);
	cube([1.2*bolt_head_d,peg_id/8,2*(bottom_th+bracket_clip_dz)],center=true);
    }
    translate([clip_w/2,bottom_h/2,0]) {
	cylinder($fn=8,r=peg_id/2,h=bottom_th+peg_h+0.2,center=false);
	cylinder($fn=16,r=bolt_head_d/2,h=2*bolt_head_h, center=true);
	translate([0,0,bolt_head_h-0.1]) cylinder(r1=bolt_head_d/2+0.1,r2=0,h=bolt_head_d/2+0.1,center=false);
	cube([1.2*bolt_head_d,peg_id/8,2*(bottom_th+bracket_clip_dz)],center=true);
    }	
    translate([-clip_w/2-bevel_r,bottom2clip_h,bottom_th-bevel_r]) rotate([60,0,0]) cube([clip_w+2*bevel_r,bevel_r,4*bevel_r],center=false);
  }	
}

if(render_part==1) {
  echo("Render window clip...");
  window_clip();
}
