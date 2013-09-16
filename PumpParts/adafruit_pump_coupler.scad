// Peristaltic Pump Coupler
// Measured from https://www.adafruit.com/products/1150

render_part="pump_coupler";
render_part="pump_roller";
render_part="pump_roller_insert";
render_part="pump_roller_magnet_insert";
render_part="pump_shell_sensors";

function pump_coupler_id() = 4.38; // mm
function pump_coupler_od() = 22.37; // mm
function pump_base_th() = 1.93; // mm
function pump_base_hub_od() = 7.5; // mm
function pump_base_hub_th() = 2.45; // mm
function pump_peg_od() = 2.75; // mm
function pump_peg_h() = 10.22; // mm
function pump_peg_triangle_h() = 12.5; // mm

function pump_c2peg_r(peg_d=pump_peg_od(),triangle_h=pump_peg_triangle_h()) = 2*triangle_h/3-peg_d/2;

module pump_coupler(
    coupler_id=pump_coupler_id()
    , coupler_od=pump_coupler_od()
    , base_th=pump_base_th()
    , base_hub_od=pump_base_hub_od()
    , base_hub_th=pump_base_hub_th()
    , peg_od=pump_peg_od()
    , peg_h=pump_peg_h()
    , peg_triangle_h=pump_peg_triangle_h()
    ) {
    difference() {
        union() {
          translate([0,0,-base_hub_th]) cylinder(r=base_hub_od/2,h=base_hub_th,center=false,$fn=32);
          translate([0,0,-base_th]) cylinder(r=coupler_od/2,h=base_th,center=false,$fn=64);
          translate([pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h),0,0]) cylinder(r=peg_od/2,h=peg_h,center=false,$fn=16);
          rotate([0,0,120]) translate([pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h),0,0])
            cylinder(r=peg_od/2,h=peg_h,center=false,$fn=16);
          rotate([0,0,-120]) translate([pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h),0,0])
            cylinder(r=peg_od/2,h=peg_h,center=false,$fn=16);
        }
        translate([0,0,-base_hub_th/2]) cylinder(r=coupler_id/2,h=2*base_hub_th,center=true,$fn=32);
    }
}
if(render_part=="pump_coupler") {
    pump_coupler();
}

function pump_roller_h() = 13.6; //mm - to measure
function pump_roller_od() = 11.08; // mm
function pump_roller_id() = pump_roller_od()-2*1.2; // mm
function pump_roller_id_depth() = 4.0; // mm

function pump_roller_peg_hole_id() = 2.75; // mm
function pump_roller_peg_hole_od() = 6.00; // mm
function pump_roller_peg_hole_depth() = 10.00; // mm
function pump_roller_cap_od() = 5.33; // mm
function pump_roller_cap_hole_id() = 9.00; // mm
function pump_roller_cap_depth() = 0.25; // mm
function pump_roller_cap_side_depth() = 6.38; // mm
function pump_roller_cap_wall_th() = 0.9; // mm

function m3_washer_od() = 6.86; // mm
function m3_washer_id() = 3.1; // mm
function m3_washer_th() = 0.6; // mm

module pump_roller( roller_h=pump_roller_h(), roller_od=pump_roller_od(), roller_id=pump_roller_id(), roller_id_depth=pump_roller_id_depth()
    , peg_hole_id=pump_roller_peg_hole_id(), peg_hole_od=pump_roller_peg_hole_od(), peg_hole_depth=pump_roller_peg_hole_depth()
    , cap_od=pump_roller_cap_od(), cap_hole_id=pump_roller_cap_hole_id(), cap_depth=pump_roller_cap_depth()
    , cap_side_depth=pump_roller_cap_side_depth(), cap_wall_th=pump_roller_cap_wall_th()
    ) {
    difference() {
        cylinder(r=roller_od/2,h=roller_h,center=false,$fn=360);
        cylinder(r=peg_hole_id/2,h=2*peg_hole_depth,center=true,$fn=32);
        difference() {
            cylinder(r=roller_id/2,h=2*roller_id_depth,center=true,$fn=32);
            cylinder(r=peg_hole_od/2,h=2*peg_hole_depth,center=true,$fn=32);
        }
        translate([0,0,roller_h]) {
            cylinder(r=cap_hole_id/2,h=2*cap_depth,center=true,$fn=32);
            difference() {
                cylinder(r=cap_hole_id/2,h=2*cap_side_depth,center=true,$fn=32);
                cylinder(r=cap_od/2,h=2*(cap_side_depth+cap_depth),center=true,$fn=32);
            }
        }
    }
}

if(render_part=="pump_roller") {
  echo("Rendering pump_roller()...");
  translate([0,-(pump_roller_od()+2.0),0]) pump_roller();
  pump_roller();
  translate([0,pump_roller_od()+2.0,0]) pump_roller();
}

module pump_roller_insert( roller_h=pump_roller_h(), roller_od=pump_roller_od()
    , peg_hole_id=pump_roller_peg_hole_id(), peg_hole_od=pump_roller_peg_hole_od(), peg_hole_depth=pump_roller_peg_hole_depth()
    , cap_od=pump_roller_cap_od(), cap_hole_id=pump_roller_cap_hole_id(), cap_depth=pump_roller_cap_depth()
    , cap_side_depth=pump_roller_cap_side_depth()/2, cap_wall_th=pump_roller_cap_wall_th()
    , center_hole_d=2.0, shrink_th=0.5, cut_w=0.4, cut_count=3
    , debug=false
    ) {
    if(debug) echo(str("  pump_roller_insert: od = ",cap_hole_id-shrink_th/2));
    if(debug) echo(str("  pump_roller_insert: id = ",cap_od+shrink_th/2));
    if(debug) echo(str("  pump_roller_insert: wall th = ",cap_hole_id-cap_od-shrink_th));
    difference() {
        hull() {
              cylinder(r2=cap_hole_id/2-shrink_th/4,r1=cap_hole_id/2-shrink_th/4-cap_depth,h=cap_depth,center=false,$fn=32);
            translate([0,0,cap_side_depth-2*cap_depth])
              cylinder(r1=cap_hole_id/2-shrink_th/4,r2=cap_hole_id/2-shrink_th/4-cap_depth,h=cap_depth,center=false,$fn=32);
        }
        translate([0,0,cap_side_depth-2*cap_depth])
          cylinder(r1=cap_od/2+shrink_th/4,r2=cap_od/2+shrink_th/4+2*cap_depth,h=2*cap_depth,center=false,$fn=32);
        if(center_hole_d>0) cylinder(r=center_hole_d/2,h=4*cap_depth,center=true,$fn=32);
        translate([0,0,cap_depth]) cylinder(r=cap_od/2+shrink_th/4,h=cap_side_depth,center=false,$fn=32);
        if(cut_count>0) for(i=[0:cut_count-1]) rotate([0,0,i*360/cut_count]) translate([0,-cut_w/2,2*cap_depth])
            cube([cap_hole_id/2,cut_w,cap_side_depth],center=false);
    }
}

if(render_part=="pump_roller_insert") {
    echo("Rendering pump_roller_insert()...");
    translate([0,-(pump_roller_cap_hole_id()+2.0),0]) pump_roller_insert(center_hole_d=0,cap_depth=2*pump_roller_cap_depth());
    pump_roller_insert(debug=true,center_hole_d=0,cap_depth=2*pump_roller_cap_depth());
    translate([0,pump_roller_cap_hole_id()+2.0,0]) pump_roller_insert(center_hole_d=0,cap_depth=2*pump_roller_cap_depth());
}

function magnet_od() = 1/4*25.4; // 1/4" diameter
function washer_od() = 6.8; // washer diameter
function magnet_h() = 1/10*25.4; // 1/10" height

module pump_roller_magnet_insert( roller_h=pump_roller_h(), roller_od=pump_roller_od()
    , peg_hole_id=pump_roller_peg_hole_id(), peg_hole_od=pump_roller_peg_hole_od(), peg_hole_depth=pump_roller_peg_hole_depth()
    , cap_od=pump_roller_cap_od(), cap_hole_id=pump_roller_cap_hole_id(), cap_depth=pump_roller_cap_depth()
    , cap_side_depth=pump_roller_cap_side_depth()/2, cap_wall_th=pump_roller_cap_wall_th()
    , center_hole_d=2.0, shrink_th=0.5, cut_w=0.4, cut_count=3
    , debug=false
    , magnet_od=washer_od(), magnet_h=magnet_h()
    ) {
    if(debug) echo(str("  pump_roller_insert: od = ",cap_hole_id-shrink_th/2));
    if(debug) echo(str("  pump_roller_insert: id = ",cap_od+shrink_th/2));
    if(debug) echo(str("  pump_roller_insert: wall th = ",cap_hole_id-cap_od-shrink_th));
    hole_d=(magnet_od>cap_od?magnet_od:cap_od)+shrink_th;
    hole_h=(magnet_h>cap_side_depth?magnet_h:cap_side_depth);
    if(debug) {
	if(magnet_h>cap_side_depth) {
		echo(str("    Using magnet_h: ",magnet_h));
		echo(str("    cap_side_depth:  ",cap_side_depth));
	} else {
		echo(str("    Using cap_side_depth:  ",cap_side_depth));
		echo(str("                magnet_h: ",magnet_h));
	}
    }
    difference() {
        hull() {
              cylinder(r2=cap_hole_id/2-shrink_th/4,r1=cap_hole_id/2-shrink_th/4-cap_depth,h=cap_depth,center=false,$fn=32);
            translate([0,0,(magnet_h>cap_side_depth?magnet_h:cap_side_depth)-cap_depth])
              cylinder(r1=cap_hole_id/2-shrink_th/4,r2=cap_hole_id/2-shrink_th/4-cap_depth,h=cap_depth,center=false,$fn=32);
        }
        translate([0,0,hole_h-0.5*cap_depth])
          cylinder(r1=hole_d/2,r2=hole_d/2+2*cap_depth,h=2*cap_depth,center=false,$fn=32);
        if(center_hole_d>0) cylinder(r=center_hole_d/2+shrink_th/2,h=4*cap_depth,center=true,$fn=32);
        translate([0,0,cap_depth]) cylinder(r=hole_d/2,h=hole_h,center=false,$fn=32);
        if(cut_count>0) for(i=[0:cut_count-1]) rotate([0,0,i*360/cut_count]) translate([0,-cut_w/2,2*cap_depth])
            cube([cap_hole_id/2,cut_w,hole_h],center=false);
    }
}

if(render_part=="pump_roller_magnet_insert") {
    echo("Rendering pump_roller_magnet_insert()...");
    translate([0,-(pump_roller_cap_hole_id()+2.0),0]) pump_roller_magnet_insert(center_hole_d=1/8*25.4,cap_depth=1.5*pump_roller_cap_depth());
    pump_roller_magnet_insert(debug=true,center_hole_d=1/8*25.4,cap_depth=1.5*pump_roller_cap_depth());
    translate([0,pump_roller_cap_hole_id()+2.0,0]) pump_roller_magnet_insert(center_hole_d=1/8*25.4,cap_depth=1.5*pump_roller_cap_depth());
}

function pump_shell_od() = 28.0; // 28.0mm
function pump_shell_h() = 2.8; // 2.8mm
function pump_shell_notch_w() = 7.0; // 7.0mm
function pump_shell_notch_h() = 4.5; // 4.5mm
function pump_shell_mount_inner() = 45.32;
function pump_shell_mount_outer() = 52.85;
function pump_shell_mount_bolt_d() = 3.0;
function shell_sensor_w() = 4.3;
// function shell_sensor_w_min() = 2.64;
function shell_sensor_w_min() = 2.8;
function shell_sensor_h() = 3.2;
function shell_sensor_th() = 1.6;
function shell_sensor_th_min() = 0.84;

module pump_shell_sensors( wall_th=1.6
	, shell_od=pump_shell_od(), shell_h=pump_shell_h()
	, shell_notch_w=pump_shell_notch_w(), shell_notch_h=pump_shell_notch_h()
	, shell_mount_inner=pump_shell_mount_inner(), shell_mount_outer=pump_shell_mount_outer()
	, mount_bolt_hole_d=pump_shell_mount_bolt_d(), mount_bolt_head_h=3.0, mount_bolt_head_d=5.6,mount_bolt_hole_h=4.0
	, peg_od=pump_peg_od()
	, peg_h=pump_peg_h()
	, peg_triangle_h=pump_peg_triangle_h()
	, sensor_w=shell_sensor_w(), sensor_w_min=shell_sensor_w_min(), sensor_h=shell_sensor_h()
	, sensor_th=shell_sensor_th(), sensor_th_min=shell_sensor_th_min()
    , center_hole_d=2.0, shrink_th=0.5, sensor_count=6
	, wire_lead_spacing=0.05*25.4
	, anchor_nub_th=0.5
	) {
	sensor_offset=pump_c2peg_r(peg_d=peg_od,triangle_h=peg_triangle_h);
	difference() {
		union() {
		  hull() {
			cylinder(r1=shell_od/2+shrink_th+wall_th/2,r2=shell_od/2+wall_th+shrink_th,h=wall_th/2,center=false);
			translate([0,0,shell_h+sensor_th-wall_th/2]) cylinder(r1=shell_od/2+wall_th+shrink_th,r2=shell_od/2+shrink_th+wall_th/2,h=wall_th/2,center=false);
			translate([0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_head_d/2+shrink_th+wall_th,h=mount_bolt_head_h,center=false,$fn=16);
			translate([0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th+wall_th,h=mount_bolt_hole_h,center=false,$fn=16);
			translate([0,-(shell_mount_outer/2-mount_bolt_hole_d/2),0]) cylinder(r=mount_bolt_head_d/2+shrink_th+wall_th,h=mount_bolt_head_h,center=false,$fn=16);
			translate([0,-(shell_mount_outer/2-mount_bolt_hole_d/2),0]) cylinder(r=mount_bolt_hole_d/2+shrink_th+wall_th,h=mount_bolt_hole_h,center=false,$fn=16);
		  }
		  translate([shell_od/2+shrink_th,-shell_notch_w/2,0]) cube([wall_th,shell_notch_w,shell_notch_h+sensor_th],center=false);
		  hull() {
		    translate([0,shell_mount_inner/2+mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th+wall_th,h=mount_bolt_hole_h+wall_th,center=false,$fn=16);
		    translate([0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th+wall_th,h=mount_bolt_hole_h+wall_th,center=false,$fn=16);
		  }
		  hull() {
		    translate([0,-(shell_mount_inner/2+mount_bolt_hole_d/2),0]) cylinder(r=mount_bolt_hole_d/2+shrink_th+wall_th,h=mount_bolt_hole_h+wall_th,center=false,$fn=16);
		    translate([0,-(shell_mount_outer/2-mount_bolt_hole_d/2),0]) cylinder(r=mount_bolt_hole_d/2+shrink_th+wall_th,h=mount_bolt_hole_h+wall_th,center=false,$fn=16);
		  }
		}
		hull() {
		  translate([0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) {
			cylinder(r=mount_bolt_head_d/2+shrink_th,h=mount_bolt_head_h,center=true,$fn=16);
			translate([0,0,mount_bolt_head_h]) cylinder(r1=mount_bolt_head_d/2+shrink_th,r2=0,h=mount_bolt_head_d/2+shrink_th,center=false,$fn=16);
		  }
		  translate([0,shell_mount_inner/2+mount_bolt_hole_d/2,0]) {
			cylinder(r=mount_bolt_head_d/2+shrink_th,h=mount_bolt_head_h,center=true,$fn=16);
			translate([0,0,mount_bolt_head_h]) cylinder(r1=mount_bolt_head_d/2+shrink_th,r2=0,h=mount_bolt_head_d/2+shrink_th,center=false,$fn=16);
		  }
		}
		hull() {
		  translate([0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th,h=2*(mount_bolt_hole_h+2*wall_th),center=true,$fn=16);
		  translate([0,shell_mount_inner/2+mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th,h=2*(mount_bolt_hole_h+2*wall_th),center=true,$fn=16);
		}
		hull() {
		  translate(-[0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) {
			cylinder(r=mount_bolt_head_d/2+shrink_th,h=mount_bolt_head_h,center=true,$fn=16);
			translate([0,0,mount_bolt_head_h]) cylinder(r1=mount_bolt_head_d/2+shrink_th,r2=0,h=mount_bolt_head_d/2+shrink_th,center=false,$fn=16);
		  }
		  translate(-[0,shell_mount_inner/2+mount_bolt_hole_d/2,0]) {
			cylinder(r=mount_bolt_head_d/2+shrink_th,h=mount_bolt_head_h,center=true,$fn=16);
			translate([0,0,mount_bolt_head_h]) cylinder(r1=mount_bolt_head_d/2+shrink_th,r2=0,h=mount_bolt_head_d/2+shrink_th,center=false,$fn=16);
		  }
		}
		hull() {
		  translate(-[0,shell_mount_outer/2-mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th,h=2*(mount_bolt_hole_h+2*wall_th),center=true,$fn=16);
		  translate(-[0,shell_mount_inner/2+mount_bolt_hole_d/2,0]) cylinder(r=mount_bolt_hole_d/2+shrink_th,h=2*(mount_bolt_hole_h+2*wall_th),center=true,$fn=16);
		}
		translate([0,0,sensor_th]) cylinder(r=shell_od/2+shrink_th,h=shell_h+sensor_th+sensor_h,center=false,$fn=128);
		for(i=[0:sensor_count-1]) rotate([0,0,360*(i+0.5*(sensor_count/2%2+1))/sensor_count]) translate([sensor_offset,0,0]) rotate([0,0,90]) {
			translate([0,shrink_th/2,sensor_th]) cube([sensor_w_min,sensor_h+shrink_th,sensor_th],center=true);
			hull() {
				translate([-sensor_w_min/2,-sensor_h/2,sensor_th_min]) cube([sensor_w_min,sensor_h+shrink_th,sensor_th_min],center=false);
				translate([-sensor_w/2,-sensor_h/2,0]) cube([sensor_w,sensor_h+shrink_th,sensor_th-sensor_th_min],center=false);
			}
			translate([0,shrink_th/2,0]) cube([sensor_w,sensor_h+shrink_th,sensor_th],center=true);
			rotate([0,0,180]) hull() {
				translate([-sensor_w/2,sensor_h/2-shrink_th/16,(sensor_th-sensor_th_min)/2]) cube([sensor_w,shell_od,(sensor_th-sensor_th_min)/2],center=false);
				translate([-sensor_w_min/2+shrink_th,sensor_h/2-shrink_th/16,sensor_th-sensor_th_min]) cube([sensor_w_min-2*shrink_th,shell_od,sensor_th_min+shrink_th],center=false);
			}
			rotate([0,0,180]) {
				// vdd terminal
				translate([wire_lead_spacing,shell_od/2,0]) cube([1.1*wire_lead_spacing,shell_od/2,1.5*sensor_th_min],center=true);
				// gnd terminal
				translate([0,shell_od/2,0]) cube([1.1*wire_lead_spacing,shell_od/2,1.5*sensor_th_min],center=true);
				// sig out terminal
				translate([-wire_lead_spacing,shell_od/2,0]) cube([1.1*wire_lead_spacing,shell_od/2,1.5*sensor_th_min],center=true);

			}
		}	
	}
	for(i=[0:sensor_count-1]) rotate([0,0,360*(i+0.5*sensor_count/2%2)/sensor_count]) translate([shell_od/2+shrink_th,0,shell_h+sensor_th-anchor_nub_th/2]) {
		rotate([90,30,0]) cylinder(r=anchor_nub_th/2,h=10*anchor_nub_th,center=true,$fn=6);
	}
}

if(render_part=="pump_shell_sensors") {
  echo("Rendering pump_shell_sensors()...");
  pump_shell_sensors(sensor_count=4);
}
