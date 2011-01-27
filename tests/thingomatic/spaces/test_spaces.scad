// Testing spaces
line_w=2.0;
line_l=12.0;
line_h=2.0;
space_scale=0.1;

union() {
  translate([-line_w,0,0]) cube(size=[2*line_w,10*line_w+space_scale*9*10/2,line_h],center=false);
  for(i=[0:9]) {
    translate([-line_l,(line_w+space_scale)*i+space_scale*(i-1)*i/2,0]) cube(size=[2*line_l,line_w,line_h],center=false);
  }
  translate([-line_l-line_w,0,0]) cube(size=[2*line_w,10*line_w+space_scale*9*10/2,line_h],center=false);
}
