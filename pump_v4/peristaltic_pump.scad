// Peristaltic Planetary Gear Pump

include <MCAD/involute_gears.scad>
include <functions_and_parts.scad>
include <configuration.scad>

render_part="roller_pulley";

module roller_pulley(bearing_od=roller_bearing_od
	, bearing_id=roller_bearing_id
	, bearing_th=roller_bearing_th
	, tube_od=tube_od
	, tube_id=tube_id
	, wall_th=wall_min_th
	, layer_th=layer_th
	, axle_d=roller_bearing_id+bevel_dr
	, bevel_dr=bevel_dr
	, verbose=false
	) {
  pulley_min_h=tube_od+tube_id+tube_od/2;
  pulley_h=((pulley_min_h-pulley_min_h%layer_th)/layer_th+2)*layer_th;
  pulley_od=bearing_od+2*wall_th+tube_od/2;
  if(verbose==true) {
    echo("roller_pulley:");
    echo(str("  bearing_od=",bearing_od));
    echo(str("  bearing_id=",bearing_id));
    echo(str("  bearing_th=",bearing_th));
    echo(str("  tube_od=",tube_od));
    echo(str("  tube_id=",tube_id));
    echo(str("  wall_th=",wall_th));
    echo(str("  axle_d=",axle_d));
    echo(str("  bevel_dr=",bevel_dr));
    echo(str("  pulley_min_h=",pulley_min_h));
    echo(str("  pulley_od=",pulley_od));
    echo(str("  pulley_h=",pulley_h));
  }
  difference() {
    union() {
      cylinder($fn=128,r=bearing_od/2+wall_th,h=pulley_h,center=false);
      cylinder($fn=32,r=pulley_od/2,h=tube_od/4,center=false);
      translate([0,0,tube_od/4])
	cylinder(r1=pulley_od/2,r2=(pulley_od-tube_od/2)/2,h=tube_od/4,center=false);
      translate([0,0,pulley_h-tube_od/2])
	cylinder(r2=pulley_od/2,r1=(pulley_od-tube_od/2)/2,h=tube_od/4,center=false);
      translate([0,0,pulley_h-tube_od/4])
	cylinder($fn=32,r=pulley_od/2,h=tube_od/4,center=false);
    }
    translate([0,0,pulley_h-bearing_th])
      cylinder($fn=64,r=bearing_od/2,h=bearing_th+0.1,center=false);
    cylinder($fn=16,r1=axle_d/2+2*bevel_dr,r2=axle_d/2,h=2*bevel_dr,center=true);
    cylinder($fn=16,r=axle_d/2,h=pulley_h+bevel_dr,center=false);
    translate([0,0,pulley_h])
      cylinder($fn=16,r1=bearing_od/2,r2=bearing_od/2+2*bevel_dr,h=2*bevel_dr,center=true);
  }
}

if(render_part=="roller_pulley") {
  echo("Rendering roller_pulley()...");
  roller_pulley(verbose=true);
}

