//
use <parts.scad>
roller_d=27;
roller_num_teeth=27;
drive_d=33;
drive_num_teeth=33;
roller_n=6;
sheet_th=3.0;

module drive_gear_rim(h=sheet_th) {
  linear_extrude(file="build/drive_gear_rim.dxf", height=h,convexity=10,center=false);
}

module drive_gear_w_hub_holes(h=sheet_th) {
  linear_extrude(file="build/drive_gear_w_hub_holes.dxf", height=h,convexity=10,center=false);
}

module drive_gear_stack(h=sheet_th) {
  drive_gear_rim();
  translate([0,0,h]) drive_gear_w_hub_holes();
  translate([0,0,2*h]) drive_gear_rim();
  translate([0,0,3*h]) drive_gear_rim();
  translate([0,0,4*h]) drive_gear_rim();
  translate([0,0,5*h]) drive_gear_w_hub_holes();
  translate([0,0,6*h]) drive_gear_rim();

}

drive_gear_stack();

module outer_gear_rim(h=sheet_th) {
  linear_extrude(file="build/outer_gear_rim.dxf", height=h,convexity=10,center=false);
}

module outer_gear_w_mount_holes(h=sheet_th) {
  linear_extrude(file="build/outer_gear_w_mount_holes.dxf", height=h,convexity=10,center=false);
}

module outer_tube_retainer(h=sheet_th) {
  linear_extrude(file="build/outer_tube_retainer.dxf", height=h,convexity=10,center=false);
}

module outer_tube_retainer_w_exit(h=sheet_th) {
  linear_extrude(file="build/outer_tube_retainer_w_exit.dxf", height=h,convexity=10,center=false);
}


module outer_gear_stack(h=sheet_th) {
  outer_gear_rim();
  translate([0,0,h]) outer_gear_w_mount_holes();
  translate([0,0,2*h]) outer_gear_rim();
  translate([0,0,3*h]) outer_tube_retainer_w_exit();
  translate([0,0,4*h]) outer_gear_rim();
  translate([0,0,5*h]) outer_gear_w_mount_holes();
  translate([0,0,6*h]) outer_gear_rim();
}

outer_gear_stack();

module roller_gear_rim(h=sheet_th) {
  linear_extrude(file="build/roller_gear_rim.dxf", height=h,convexity=10,center=false);
}

module roller_gear_w_hub_holes(h=sheet_th) {
  linear_extrude(file="build/roller_gear_w_hub_holes.dxf", height=h,convexity=10,center=false);
}

module roller_gear_tube_retainer(h=sheet_th) {
  linear_extrude(file="build/roller_gear_tube_retainer.dxf", height=h,convexity=10,center=false);
}

module roller_gear_tube_compressor(h=sheet_th) {
  linear_extrude(file="build/roller_gear_tube_compressor.dxf", height=h,convexity=10,center=false);
}

module roller_gear_stack(index=0,h=sheet_th) {
	roller_gear_rim();
	translate([0,0,h]) roller_gear_w_hub_holes();
	translate([0,0,2*h]) roller_gear_rim();
	if(index%3 != 0) translate([0,0,3*h]) roller_gear_tube_retainer();
	if(index%3 == 0) translate([0,0,3*h]) roller_gear_tube_compressor();
	translate([0,0,4*h]) roller_gear_rim();
	translate([0,0,5*h]) roller_gear_w_hub_holes();
	translate([0,0,6*h]) roller_gear_rim();

}

for(i=[0:roller_n-1]) rotate([0,0,360*i/roller_n]) {
  translate([drive_d/2+roller_d/2,0,0]) rotate([0,0,(i%2)*180/drive_num_teeth]) {
	roller_gear_stack(index=i);
  }
}