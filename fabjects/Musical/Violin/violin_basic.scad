// Basic violin form.
include <StradPoints.scad>
include <FHolePoints.scad>
include <ContourPoints.scad>

echo("Note: Default scale is 1 unit = 1.0 cm = 10.0mm");

//render_part=1; // violin_body();
//render_part=2; // violin_strad_2d();
//render_part=3; // violin_strad_all_2d();
// render_part=4; // violin_fhole_2d();
// render_part=5; //violin_strad_w_fhole_2d();
//render_part=6; // violin_strad_quantized();
// render_part=7; // violin_strad_quantized(steps=8);
//render_part=8; // violin_strad_faceted(steps=8);
//render_part=9; // Test shell_2d()
// render_part=10; // violin_purfling_2d()
// render_part=11; // violin contours.
// render_part=12; // violin_interpolated_contours.
render_part=13; // violin_minkowski_contours

module shell_2d(width=0.1,steps=8,scale_x=1.0,scale_y=1.0) {
  union() {
    for(i=[0:steps-1]) assign(rotAngle=360*i/steps) difference() {
      child(0);
      translate([scale_x*width*cos(rotAngle),scale_y*width*sin(rotAngle)]) child(0);
    }
  }
}

// End-pin is at origin
module violin_body() {
  union() {
    translate([0,67.0,0]) scale([100,67,32]) 
	cylinder($fs=0.1,$fa=5,r=1.0,h=1.0,center=false);
    translate([0,172,0]) scale([85,172,31])
	cylinder($fs=0.1,$fa=5,r=1.0,h=1.0,center=false);
    translate([0,172.0+105.0,0]) scale([80.0,70.0,30.0])
	cylinder($fs=0.1,$fa=5,r=1.0,h=1.0,center=false);
  }
}

if(render_part==1) {
  echo("Rendering violin_body()...");
  violin_body();
}

module violin_strad_2d() {
  polygon( points=StradLower, paths=[ [
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39
	,40,41,42,43
	] ], convexity=10);
  polygon( points=StradC, paths=[ [
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	,20,21,22,23,24,25,26,27,28
	] ], convexity=10);
  polygon( points=StradUpper, paths=[ [
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39
	] ], convexity=10);
}

if(render_part==2) {
  echo("Rendering violin_strad_2d()...");
  violin_strad_2d();
}

module violin_strad_half_2d() {
  // 113 points
  polygon( points=StradAll, paths=[ [
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	,20,21,22,23,24,25,26,27,28,29
	,30,31,32,33,34,35,36,37,38,39
	,40,41,42,43,44,45,46,47,48,49
	,50,51,52,53,54,55,56,57,58,59
	,60,61,62,63,64,65,66,67,68,69
	,70,71,72,73,74,75,76,77,78,79
	,80,81,82,83,84,85,86,87,88,89
	,90,91,92,93,94,95,96,97,98,99
	,100,101,102,103,104,105,106,107,108,109
	,110,111,112
	] ], convexity=10);
}

module violin_strad_all_2d() {
  union() {
    violin_strad_half_2d();
    rotate([180,0,0]) violin_strad_half_2d();
  }
}

if(render_part==3) {
  echo("Rendering violin_strad_all_2d()...");
  violin_strad_all_2d();
}

module violin_fhole_2d() {
  // 113 points
  rotate([180,0,90]) translate([2.1,StradAll[StradAll_Num_Pts-1][0]-19.5]) 
    polygon( points=FHole, paths=[ [
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	,20,21,22,23,24,25,26,27,28,29
	,30,31,32,33,34,35,36,37,38,39
	,40,41,42,43,44,45,46,47,48,49
	,50,51,52,53,54,55,56,57,58,59
	,60,61,62,63,64,65,66,67,68
	] ], convexity=10);
}

if(render_part==4) {
  echo("Rendering violin_fhole_2d()...");
  violin_fhole_2d();
}

module violin_strad_w_fhole_2d() {
  union() {
    difference() {
      violin_strad_half_2d();
	violin_fhole_2d();
    }
    rotate([180,0,0]) difference() {
      violin_strad_half_2d();
	violin_fhole_2d();
    }
  }
}

if(render_part==5) {
  echo("Rendering violin_strad_w_fhole_2d()...");
  violin_strad_w_fhole_2d();
}


module violin_strad_quantized(steps=64,height=3.0) {
  // 113 points
  firstPt_x=StradAll[0][0];
  lastPt_x=StradAll[StradAll_Num_Pts-1][0];
  step_size=(lastPt_x-firstPt_x)/steps;
  union() {
    translate([-step_size/2,-step_size/4,-height/2])
      cube(size=[lastPt_x+step_size,step_size/2,height/2], center=false);
    for(i=[0:steps-1]) assign(x_pos=step_size/2+step_size*i) translate([x_pos,0,0])
      cube(size=[step_size,2*get_strad_y(x_pos),height],center=true);
  }
}

if(render_part==6) {
  echo("Rendering violin_strad_quantized()...");
  violin_strad_quantized();
}

if(render_part==7) {
  echo("Rendering violin_strad_quantized(steps=8)...");
  violin_strad_quantized(steps=8);
}

module violin_strad_faceted(steps=64,height=3.0) {
  // 113 points
  firstPt_x=StradAll[0][0];
  lastPt_x=StradAll[StradAll_Num_Pts-1][0];
  step_size=(lastPt_x-firstPt_x)/steps;
  union() {
    translate([-step_size/2,-step_size/4,-height/2])
      cube(size=[lastPt_x+step_size,step_size/2,height/2], center=false);
    for(i=[0:steps-1]) assign(x_pos=step_size/2+step_size*i) translate([x_pos,0,0])
      cube(size=[step_size,2*get_strad_y(x_pos),height],center=true);
  }
}

if(render_part==8) {
  echo("Rendering violin_strad_faceted()...");
  violin_strad_faceted();
}

if(render_part==9) {
  echo("Testing shell_2d()...");
  shell_2d(width=1) square(size=[10,10]);
  translate([0,0,-1.0]) import_dxf("violin_strad_all_2d.dxf");
}


module violin_purfling_2d() {
  difference() {
    shell_2d(width=0.4+0.15) import_dxf("violin_strad_all_2d.dxf");
    shell_2d(width=0.4) import_dxf("violin_strad_all_2d.dxf");
  }
}

if(render_part==10) {
  echo("Rendering violin_purfling_2d()...");
  difference() {
    translate([0,0,-0.5]) linear_extrude(height=1.0) import_dxf("violin_strad_all_2d.dxf");
    linear_extrude(height=1.0) violin_purfling_2d();
  }
}

if(render_part==11) {
  echo("Rendering violin contours...");
  union() {
   linear_extrude(height=get_contour_z_height(0.0)) import_dxf("violin_strad_all_2d.dxf");
   for(i=[1:ViolinContour_Num_Pts-1]) assign(x_coord=ViolinContourPoints_Scale_X[i][0]) {
     echo("x_coord: ",get_contour_scale_x(x_coord),get_contour_scale_y(x_coord),x_coord,get_contour_z_height(x_coord),get_contour_steps(x_coord));
     linear_extrude(height=get_contour_z_height(x_coord)) difference() {
      import_dxf("violin_strad_all_2d.dxf");
      shell_2d(width=x_coord,scale_x=get_contour_scale_x(x_coord),scale_y=get_contour_scale_y(x_coord),steps=get_contour_steps(x_coord)) 
	import_dxf("violin_strad_all_2d.dxf");
     }
   }
  }
}

module violin_interpolated_contours(num_interp_points=8) {
  union() {
   linear_extrude(height=get_contour_z_height(0.0)) import_dxf("violin_strad_all_2d.dxf");
   for(k=[1:num_interp_points]) assign(x_coord=(k*ViolinContourPoints_Scale_X[ViolinContour_Num_Pts-1][0])/num_interp_points) {
     echo("x_coord: ",x_coord,get_contour_scale_x(x_coord),get_contour_scale_y(x_coord),x_coord,get_contour_z_height(x_coord),get_contour_steps(x_coord));
     linear_extrude(height=get_contour_z_height(x_coord)) difference() {
      import_dxf("violin_strad_all_2d.dxf");
      shell_2d(width=x_coord,scale_x=get_contour_scale_x(x_coord),scale_y=get_contour_scale_y(x_coord),steps=get_contour_steps(x_coord)) 
	import_dxf("violin_strad_all_2d.dxf");
     }
   }
  }
}

if(render_part==12) {
  echo("Rendering violin_interpolated_contours(num_interp_points=8)...");
  violin_interpolated_contours(num_interp_points=8);
}

module violin_minkowski_contour() {
  minkowski() {
   linear_extrude(height=3.0) import_dxf("violin_strad_all_2d.dxf");
    sphere(r=3.0/4);
  }
}

if(render_part==13) {
  echo("Rendering violin_minkowski_contour()...");
  violin_minkowski_contour();
}
