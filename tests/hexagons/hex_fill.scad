// Variations on a Hexagonal Theme.

// render_part="hex_cell_2d";
// render_part="hex_line_2d";
// render_part="hex_area_2d";
// render_part="hex_triangle_2d";
render_part="hex_of_hex_2d";
// render_part="hex_fill";


module hex_cell_2d(width=5.5) {
  intersection() {
    square(size=[width,2*width],center=true);
    rotate([0,0,60]) square(size=[width,2*width],center=true);
    rotate([0,0,120]) square(size=[width,2*width],center=true);
  }
}

module hex_line_2d(width=5.5
  ,space=1.0
  ,count=20
  ) {
  for(i=[0:count-1]) translate([i*(width+space),0,0]) {
    hex_cell_2d(width=width);
  }
}

module hex_area_2d(cell_width=6.0
	, cell_space=1.0
	, row_count=20
	, col_count=10
	, col_angle=60
	) {
  for(i=[0:col_count-1])
    translate([i*(cell_width+cell_space),0,0])
      rotate([0,0,col_angle])
	  hex_line_2d(width=cell_width,space=cell_space,count=row_count);
}

module hex_triangle_2d(cell_width=6.0
	, cell_space=1.0
	, row_count=20
	) {
  for(i=[0:row_count-1])
    translate([i*(cell_width+cell_space),0,0])
      rotate([0,0,60])
	  hex_line_2d(width=cell_width,space=cell_space,count=row_count-i);
}

module hex_of_hex_2d(cell_width=6.0
	, cell_space=1.0
	, row_count=5
	) {
  union() for(i=[0:5]) {
    rotate([0,0,i*60])
      hex_triangle_2d(cell_width=cell_width
	    , cell_space=cell_space
	    , row_count=row_count
	  );
  }
}

module hex_fill(cell_width=5.0
	, cell_space=2.5
	, cell_height=2.5
	, row_count=8
	, col_count=8
	, col_angle=60
	) {
  linear_extrude(height=cell_height)
    hex_area_2d( cell_with=cell_width
	, cell_space=cell_space
	, cell_height=cell_height
	, row_count=row_count
	, col_count=col_count
	, col_angle=col_angle
	);
}

if(render_part=="hex_cell_2d") {
  echo("Rendering hex_cell_2d...");
  hex_cell_2d();
}

if(render_part=="hex_line_2d") {
  echo("Rendering hex_line_2d...");
  hex_line_2d();
}

if(render_part=="hex_area_2d") {
  echo("Rendering hex_area_2d...");
  hex_area_2d();
}

if(render_part=="hex_triangle_2d") {
  echo("Rendering hex_triangle_2d...");
  hex_triangle_2d();
}

if(render_part=="hex_of_hex_2d") {
  echo("Rendering hex_of_hex_2d...");
  hex_of_hex_2d();
}

if(render_part=="hex_fill") {
  echo("Rendering hex_fill...");
  hex_fill();
}

