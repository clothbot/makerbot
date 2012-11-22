// Peristaltic Planetary Gear Pump

include <functions_and_parts.scad>

nozzle_d=0.4;
layer_th=0.2;
wall_min_th=4*nozzle_d;

tube_od=Tygon_B_44_3_OD();
tube_id=Tygon_B_44_3_ID();
tube_min_bend_r=Tygon_B_44_3_minBR();
tube_compress=0.25;

roller_bearing_od=Bearing_608_OD(grow=0.0);
roller_bearing_id=Bearing_608_ID(grow=0.0);
roller_bearing_th=Bearing_608_TH(grow=0.0);
roller_count=3;

bevel_dr=2*nozzle_d;
gear_clearance=0.1;


