// Measurement Modules
include <MCAD/bitmap/bitmap.scad>
render_part=1; // arrow_2d()
// render_part=2; // measure_distance()

module arrow_2d(arrow_head_diameter,arrow_head_height,arrow_tail_width,arrow_tail_length,arrow_type="default") {
  if(arrow_type=="default") {
    polygon(points=[[0,0]
	,[-arrow_head_diameter/2,arrow_head_height],[-arrow_tail_width/2,arrow_head_height]
	,[-arrow_tail_width/2,arrow_head_height+arrow_tail_length],[arrow_tail_width/2,arrow_head_height+arrow_tail_length]
	,[arrow_tail_width/2,arrow_head_height],[arrow_head_diameter/2,arrow_head_height]]
	,paths=[[0,1,2,3,4,5,6]]);
  }
  if(arrow_type=="left") {
    polygon(points=[[0,0]
	,[-arrow_head_diameter/2,arrow_head_height],[-arrow_tail_width,arrow_head_height]
	,[-arrow_tail_width,arrow_head_height+arrow_tail_length],[0,arrow_head_height+arrow_tail_length]]
	,paths=[[0,1,2,3,4]]);
  }
  if(arrow_type=="right") {
    polygon(points=[[0,0]
	,[arrow_head_diameter/2,arrow_head_height],[arrow_tail_width,arrow_head_height]
	,[arrow_tail_width,arrow_head_height+arrow_tail_length],[0,arrow_head_height+arrow_tail_length]]
	,paths=[[0,1,2,3,4]]);
  }
}

if(render_part==1) {
  echo("Rendering arrow_2d()...");
  translate([-5,0])
    arrow_2d(arrow_head_diameter=2,arrow_head_height=3,arrow_tail_width=0.5,arrow_tail_length=20,arrow_type="left");
  arrow_2d(arrow_head_diameter=2,arrow_head_height=3,arrow_tail_width=0.5,arrow_tail_length=20,arrow_type="default");
  translate([5,0])
    arrow_2d(arrow_head_diameter=2,arrow_head_height=3,arrow_tail_width=0.5,arrow_tail_length=20,arrow_type="right");
}

module measure_distance(pt1, pt2, point_offset, text_offset, units
	, arrow_head_diameter, arrow_head_height, arrow_angle
	) {
  translate(pt1) {
    rotate([arrow_angle,0,0]) translate([0,0,point_offset]) {
      % cylinder($fn=16,r1=0,r2=arrow_head_diameter/2,h=arrow_head_height,center=false);
      translate([0,0,arrow_head_height]) 
        % cylinder($fn=16,r=arrow_head_diameter/4,h=text_offset,center=false);
    }
  }
  translate(pt2) {
    rotate([arrow_angle,0,0]) translate([0,0,point_offset]) {
      % cylinder($fn=16,r1=0,r2=arrow_head_diameter/2,h=arrow_head_height,center=false);
      translate([0,0,arrow_head_height])
        % cylinder($fn=16,r=arrow_head_diameter/4,h=text_offset,center=false);
    }
  }
  midpt=[pt1[0]+(pt2[0]-pt1[0])/2,pt1[1]+(pt2[1]-pt1[1])/2,pt1[2]+(pt2[2]-pt1[2])/2+point_offset+text_offset];
  translate(midpt) rotate([0,90,-90]) % 8bit_str(chars=units,char_count=len(units),block_size=2,height=4);
}

if(render_part==2) {
  cube(size=[100,10,10],center=false);
  echo("Rendering measure_distance()...");
  measure_distance(pt1=[0,0,0],pt2=[100,0,0],point_offset=10.1,text_offset=20,units=["m","m"]
	, arrow_head_diameter=2, arrow_head_height=3, arrow_angle=0);
}

