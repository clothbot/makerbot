// polytext module
// Encoding from http://en.wikipedia.org/wiki/ASCII

render_part=0; // polytext()

use <fonts.scad>

function sum(num_list,index) = index > 0 ? (num_list[index]+sum(num_list,index-1)) : num_list[index];

function font_char_index(font,ch,i) = i<len(font[2]) ?
  font_char_index(ch,font,i+1)+(font[2][i][1]==ch ? i : 0)
    : font[2][0][0];

module outline_2d(outline,points,paths,width=0.1,resolution=8) {
  if(outline && resolution > 4) {
    for(j=[0:len(paths)-1]) union() {
      for(i=[1:len(paths[j])-1]) hull() {
	    translate(points[paths[j][i-1]]) circle($fn=resolution,r=width/2);
	    translate(points[paths[j][i]]) circle($fn=resolution,r=width/2);
      }
      hull() {
	    translate(points[paths[j][len(paths[j])-1]]) circle($fn=resolution,r=width/2);
	    translate(points[paths[j][0]]) circle($fn=resolution,r=width/2);
      }
    }
  } else {
      polygon(points=points,paths=paths);
  }
}

module bold_2d(bold,width=0.2,resolution=8) {
  for(j=[0:$children-1]) {
    if(bold) {
      render() union() {
	    child(j);
        for(i=[0:resolution-1]) assign(dx=width*cos(360*i/resolution),dy=width*sin(360*i/resolution))
	      translate([dx,dy]) child(j);
      }
    } else {
      child(j);
    }
  }
}

module polytext(charstring,size,font,line=0,justify=1
	,bold=false,bold_width=0.2,bold_resolution=8
	,italic=false
	,underline=false,underline_start=[0,0],underline_width=1.0
	,outline=false,outline_width=0.2,outline_resolution=8
	,strike=false,strike_start=[-0.5,0],strike_width=1.0
	) {
  line_length=len(charstring)*font[0][0];
  line_shift=-line_length/2+justify*line_length/2;
  char_width=font[0][0];
  char_height=font[0][1];
  char_thickness=font[0][2];
  for(i=[0:len(charstring)-1]) {
    // echo(charstring[i]);
    translate([i*char_width*size/char_width+line_shift,line*char_height*size/char_height]) {
      for(j=[0:len(font[2])-1]) {
		// echo("Checking %s against %s...",charstring[i],font[2][j][2]);
        if(charstring[i]==font[2][j][2]) {
	  if(char_thickness==0)
	    bold_2d(bold,width=bold_width,resolution=bold_resolution)
		  render() outline_2d(outline,points=font[2][j][6][0],paths=font[2][j][6][1]
			,width=outline_width,resolution=outline_resolution); 
	    if(underline && charstring[i] != " ") {
	      translate(underline_start) square(size=[char_width-2*underline_start[0],underline_width],center=false);
		}
	    if(strike && charstring[i] != " ") {
	      translate([strike_start[0],char_height/2+strike_start[1]])
			square(size=[char_width-2*strike_start[0],strike_width],center=false);
	    }
	  if(char_thickness>0)
	    polyhedron(points=font[2][j][6][0],triangles=font[2][j][6][1]);
	}
      }
    }
  }
}

render_string=["\"!#$%&'()*"
	,"ABCDEFG"
	,"HIJKLMN"
	,"OPQRST"
	,"UVWXYZ"
	,"abcdef"
	];
render_modifiers="AB C";

if(render_part==0) {
  echo("Testing polytext()...");
  for(i=[0:len(render_string)-1])
    translate([0,-i*8bit_polyfont()[0][1]])
      polytext(render_string[i],8,8bit_polyfont(),justify=i%3-1);


  translate([0,8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,8bit_polyfont());
  translate([0,2*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,8bit_polyfont(),justify=-1,bold=true,bold_width=0.25,bold_resolution=4);
  translate([0,3*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,8bit_polyfont(),justify=0,outline=true,outline_width=0.25,outline_resolution=8);
  translate([0,4*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,8bit_polyfont(),justify=1,underline=true,underline_start=[-0.25,-0.25],underline_width=0.75);
  translate([0,5*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,8bit_polyfont(),justify=0,strike=true,strike_start=[-0.25,0],strike_width=0.5);
}

