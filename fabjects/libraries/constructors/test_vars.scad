use <fonts.scad>;

num_list=[9,8,7,6,5,4,3,2,1,0];

function sum(num_list,index) = index > 0 ? (num_list[index]+sum(num_list,index-1)) : num_list[index];

function make_array(num_list,i) = i>0 ? ([num_list[i],make_array(num_list,i-1)]) : num_list[i];
	// num_list[i];

function list_sum(num_list,i) = i>0 ? (
	( len(num_list[i])>0 ? num_list[i][0]+list_sum(num_list[i],len(num_list[i])-1) : num_list[i]) )
	: num_list[i];

function inc_sum(num_list,index) = index >0 ? 
	[inc_sum(num_list,index-1),list_sum(num_list,index)] : num_list[0];

function compare_char(ch1,ch2,match_val) = ch1==ch2 ? match_val : 0;

function find_font_char_list(ch,font,i) = i>0 ?
	[compare_char(font[2][i][1],ch,i),find_font_char_list(ch,font,i-1)]
    : 0 ;

function find_font_char(ch,font,i) = i>0 ?
	compare_char(font[2][i][1],ch,i)+find_font_char(ch,font,i-1)
    : font[2][0][0];


module test_vars() {
  current_val=0;
  for(i=[0:9]) assign(current_val=sum(num_list,i)) {
	echo(str("Current sum for ",i," with sum_list[i]=",num_list[i]," : ",current_val));
  }
  this_array=make_array(num_list,len(num_list)-1);
  echo(str("Make array:",this_array ) );
  echo(str("List sum:",list_sum(this_array,len(this_array)-1)));
  echo(str("Incremental sum:",inc_sum(num_list,len(num_list)-1)));
  this_font=8bit_polyfont();
  char_index_list=find_font_char_list("A",this_font,len(this_font[2])-1);
  char_index_A=list_sum(char_index_list,len(char_index_list)-1);
  echo(str("Find 'A' : ",char_index_A));
  echo(this_font[2][char_index_A]);
  char_index_B=find_font_char("B",this_font,len(this_font[2])-1);
  echo(str("Find 'B' : ",char_index_B));
  echo(this_font[2][char_index_B]);
}

cube();
test_vars();
