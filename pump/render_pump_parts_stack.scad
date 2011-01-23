//
// use <parts.scad>
roller_d=27;
roller_num_teeth=27;
drive_d=33;
drive_num_teeth=33;
roller_n=6;
sheet_th=3.0;
tube_od=25.4*3/16;
tube_id=25.4*1/16;
tube_th=25.4*1/16;
tube_layer_th=tube_od+tube_id;

stack_space=0.1;
render_stack=1;
//layer=0; //rim layer
layer=1; // gear layer
//layer=2; //rim layer
//layer=3; // tube layer
//layer=4; // rim layer
//layer=5; // gear layer
//layer=6; // rim layer
//layer=7; // stepper spacer layer
//layer=8; // stepper base layer

module drive_gear_rim() {
  import_dxf(file="build/drive_gear_rim.dxf");
}

module drive_gear_w_hub_holes() {
  import_dxf(file="build/drive_gear_w_hub_holes.dxf");
}

module drive_gear_stack(h=sheet_th) {
  linear_extrude(height=h,convexity=10,center=false) drive_gear_rim();
  translate([0,0,h+stack_space]) linear_extrude(height=h,convexity=10,center=false) drive_gear_w_hub_holes();
  translate([0,0,2*(h+stack_space)]) linear_extrude(height=h,convexity=10,center=false) drive_gear_rim();
  translate([0,0,3*(h+stack_space)]) linear_extrude(height=h+tube_layer_th,convexity=10,center=false) drive_gear_rim();
  translate([0,0,4*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) drive_gear_rim();
  translate([0,0,5*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) drive_gear_w_hub_holes();
  translate([0,0,6*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) drive_gear_rim();

}

if(render_stack==0 && layer==0) drive_gear_rim();
if(render_stack==0 && layer==1) drive_gear_w_hub_holes();
if(render_stack==0 && layer==2) drive_gear_rim();
if(render_stack==0 && layer==3) drive_gear_rim();
if(render_stack==0 && layer==4) drive_gear_rim();
if(render_stack==0 && layer==5) drive_gear_w_hub_holes();
if(render_stack==0 && layer==6) drive_gear_rim();

if(render_stack==1) drive_gear_stack();

module outer_gear_rim() {
  import_dxf(file="build/outer_gear_rim.dxf");
}

module outer_gear_w_mount_holes() {
  import_dxf(file="build/outer_gear_w_mount_holes.dxf");
}

module outer_tube_retainer() {
  import_dxf(file="build/outer_tube_retainer.dxf");
}

module outer_tube_retainer_w_exit() {
  import_dxf(file="build/outer_tube_retainer_w_exit.dxf");
}

module outer_stepper_spacer() {
  import_dxf(file="build/outer_stepper_spacer.dxf");
}

module outer_stepper_base() {
  import_dxf(file="build/outer_stepper_base.dxf");
}


module outer_gear_stack(h=sheet_th) {
  linear_extrude(height=h,convexity=10,center=false) outer_gear_rim();
  translate([0,0,h+stack_space]) linear_extrude(height=h,convexity=10,center=false) outer_gear_w_mount_holes();
  translate([0,0,2*(h+stack_space)]) linear_extrude(height=h,convexity=10,center=false) outer_gear_rim();
  translate([0,0,3*(h+stack_space)]) linear_extrude(height=h+tube_layer_th,convexity=10,center=false) outer_tube_retainer_w_exit();
  translate([0,0,4*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) outer_gear_rim();
  translate([0,0,5*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) outer_gear_w_mount_holes();
  translate([0,0,6*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) outer_gear_rim();
  translate([0,0,7*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) outer_stepper_spacer();
  translate([0,0,8*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) outer_stepper_base();
}

if(render_stack==0 && layer==0) outer_gear_rim();
if(render_stack==0 && layer==1) outer_gear_w_mount_holes();
if(render_stack==0 && layer==2) outer_gear_rim();
if(render_stack==0 && layer==3) outer_tube_retainer_w_exit();
if(render_stack==0 && layer==4) outer_gear_rim();
if(render_stack==0 && layer==5) outer_gear_w_mount_holes();
if(render_stack==0 && layer==6) outer_gear_rim();
if(render_stack==0 && layer==7) outer_stepper_spacer();
if(render_stack==0 && layer==8) outer_stepper_base();

if(render_stack==1) outer_gear_stack();

module roller_gear_rim() {
  import_dxf(file="build/roller_gear_rim.dxf");
}

module roller_gear_w_hub_holes() {
  import_dxf(file="build/roller_gear_w_hub_holes.dxf");
}

module roller_gear_tube_retainer() {
  import_dxf(file="build/roller_gear_tube_retainer.dxf");
}

module roller_gear_tube_compressor() {
  import_dxf(file="build/roller_gear_tube_compressor.dxf");
}

module roller_gear_stack(index=0,h=sheet_th) {
	linear_extrude(height=h,convexity=10,center=false) roller_gear_rim();
	translate([0,0,h+stack_space]) linear_extrude(height=h,convexity=10,center=false) roller_gear_w_hub_holes();
	translate([0,0,2*(h+stack_space)]) linear_extrude(height=h,convexity=10,center=false) roller_gear_rim();
	if(index%3 != 0) translate([0,0,3*(h+stack_space)]) linear_extrude(height=h+tube_layer_th,convexity=10,center=false) 
		roller_gear_tube_retainer();
	if(index%3 == 0) translate([0,0,3*(h+stack_space)]) linear_extrude(height=h+tube_layer_th,convexity=10,center=false) 
		roller_gear_tube_compressor();
	translate([0,0,4*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) roller_gear_rim();
	translate([0,0,5*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) roller_gear_w_hub_holes();
	translate([0,0,6*(h+stack_space)+tube_layer_th]) linear_extrude(height=h,convexity=10,center=false) roller_gear_rim();

}

for(i=[0:roller_n-1]) rotate([0,0,360*i/roller_n]) {
  translate([drive_d/2+roller_d/2,0,0]) rotate([0,0,(drive_num_teeth/roller_num_teeth)*(i%2)*180/drive_num_teeth]) {
	if(render_stack==1) roller_gear_stack(index=i);
	if(render_stack==0 && layer==0) roller_gear_rim();
	if(render_stack==0 && layer==1) roller_gear_w_hub_holes();
	if(render_stack==0 && layer==2) roller_gear_rim();
	if(render_stack==0 && layer==3) {
		if(i%3 != 0) roller_gear_tube_retainer();
		if(i%3 == 0) roller_gear_tube_compressor();
	}
	if(render_stack==0 && layer==4) roller_gear_rim();
	if(render_stack==0 && layer==5) roller_gear_w_hub_holes();
	if(render_stack==0 && layer==6) roller_gear_rim();
  }
}
