// polytext module
// Encoding from http://en.wikipedia.org/wiki/ASCII

render_part=0; // polytext()
//render_part=1; // test variable widths.

use <fonts.scad>

function sum(num_list,index) = index > 0 ? (num_list[index]+sum(num_list,index-1)) : num_list[index];

function font_char_index(ch,font,i) = i<len(font[2])-1 ?
  font_char_index(ch,font,i+1)+(font[2][i][1]==ch ? i : 0)
    : font[2][0][0];

function min_x(points,i) = i <len(points)-1 ?
  ( points[i][0]<min_x(points,i+1) ? points[i][0] : min_x(points,i+1) ) : points[i][0];

function max_x(points,i) = i <len(points)-1 ?
  (points[i][0]>max_x(points,i+1) ? points[i][0] : max_x(points,i+1)) : points[i][0];

function min_y(points,i) = i <len(points)-1 ?
  ( points[i][1]<min_y(points,i+1) ? points[i][1] : min_y(points,i+1) ) : points[i][1];

function max_y(points,i) = i <len(points)-1 ?
  (points[i][1]>max_y(points,i+1) ? points[i][1] : max_y(points,i+1)) : points[i][1];

function sum_font_string_x(font,char_string,index) = index > 0 ? 
	(font[2][font_char_index(char_string[index],font,0)][5][1][0]-font[2][font_char_index(char_string[index],font,0)][5][0][0])+sum_font_string_x(font,char_string,index-1) 
	: font[2][font_char_index(char_string[0],font,0)][5][1][0];

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
	,fixed_width=true
	) {
  line_length=len(charstring)*font[0][0];
  line_shift=-line_length/2+justify*line_length/2;
  char_width=font[0][0];
  char_height=font[0][1];
  char_thickness=font[0][2];
  for(i=[0:len(charstring)-1]) assign(
	 x_pos=fixed_width ? i*char_width*size/char_width+line_shift
		: (i>0 ? sum_font_string_x(font,charstring,i-1)+line_shift : line_shift)
	) {
    // echo(charstring[i]);
    translate([x_pos,line*char_height*size/char_height]) {
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

render_string=["!\"#$%&'"
	,"()*+,-./"
	,"01234"
	,"56789"
	,":;<=>?@"
	,"ABCDEFG"
	,"HIJKLMN"
	,"OPQRST"
	,"UVWXYZ"
	,"[\\]^_`"
	,"abcdefg"
	,"hijklmn"
	,"opqrst"
	,"uvwxyz"
	,"{|}~"
	];
render_modifiers="AB C";
thisFont=8bit_polyfont();

total_x=0;
if(render_part==0) {
  echo("Testing polytext()...");
  for(i=[0:len(render_string)-1])
    translate([0,-i*8bit_polyfont()[0][1]])
      polytext(render_string[i],8,thisFont,justify=i%3-1);


  translate([0,8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,thisFont);
  translate([0,2*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,thisFont,justify=-1,bold=true,bold_width=0.25,bold_resolution=4);
  translate([0,3*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,thisFont,justify=0,outline=true,outline_width=0.25,outline_resolution=8);
  translate([0,4*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,thisFont,justify=1,underline=true,underline_start=[-0.25,-0.25],underline_width=0.75);
  translate([0,5*8bit_polyfont()[0][1]])
    polytext(render_modifiers,8,thisFont,justify=0,strike=true,strike_start=[-0.25,0],strike_width=0.5);

}

//thisCharIndex=0;
//thisChar=render_modifiers[0];
if(render_part==1) {
  for( i=[0:(len(render_modifiers)-1)] ) assign(thisChar=render_modifiers[i]
		,thisCharIndex=font_char_index(render_modifiers[i],thisFont,0)) {
//    thisChar=render_modifiers[i];
 //   thisCharIndex=font_char_index(thisChar,thisFont,0);
    echo(str("ch: ",thisChar," = ",thisCharIndex));
  }
  echo(str("Min X of A: ",min_x(thisFont[2][ font_char_index("A",thisFont,0) ][6][0],0)));
  echo(str("Sum of X: ",sum_font_string_x(thisFont,render_modifiers,3)));
  echo("Testing variable widths");
  polytext(render_modifiers,8,thisFont);
  translate([0,-thisFont[0][1]])
    polytext(render_modifiers,8,thisFont,fixed_width=false);

}
