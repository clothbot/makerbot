// Testing spaces
line_w=2.0;
line_l=12.0;
line_h=2.0;
space_scale=0.1;

module test_spaces() {
 translate([line_l+line_w,0,0]) union() {
  translate([-line_w,0,0]) cube(size=[2*line_w,10*line_w+space_scale*9*10/2,line_h],center=false);
  for(i=[0:9]) {
    translate([-line_l,(line_w+space_scale)*i+space_scale*(i-1)*i/2,0]) cube(size=[2*line_l,line_w,line_h],center=false);
  }
  translate([-line_l-line_w,0,0]) cube(size=[2*line_w,10*line_w+space_scale*9*10/2,line_h],center=false);
 }
}

translate([line_w,line_w,0]) test_spaces();
rotate(-90) translate([line_w,line_w,0]) test_spaces();
rotate(180) translate([line_w,line_w,0])
	cube(size=[2*line_l,2*line_l,line_h],center=false);
translate([-line_l-line_w,line_l+line_w,0])
	difference() {
	  cylinder(r=22.0/2,h=7.0,center=false);
	  translate([0,0,-0.1]) 
	    cylinder($fs=0.1,$fa=5.0,r=8.0/2,h=7.0+0.2,center=false);
	}
