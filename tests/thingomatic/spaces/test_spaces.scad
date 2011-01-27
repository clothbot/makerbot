// Testing spaces
line_w=2.0;
line_l=20.0;
line_h=2.0;
space_scale=0.1;

union() {
  cube(size=[line_w,10*line_w+space_scale*9*10/2,line_h],center=false);
  for(i=[0:9]) {
    translate([0,(line_w+space_scale)*i+space_scale*(i-1)*i/2,0]) cube(size=[line_l,line_w,line_h],center=false);
  }
}
