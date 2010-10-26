// First stage barrel heater.

render_part=0;

module barrel(
	barrel_d=6.0
	, heater_h=16.0
	, wrench_flat_w=13.0
	, wrench_flat_h=7.0
	, bore_d=3.0
	, insert_h=6.0
	, spacer_h=1.0
	) {
  $fa=15.0;
  $fs=0.1;
  difference() {
    union() {
      cylinder(r=bore_d/2
