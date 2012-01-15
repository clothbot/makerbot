// polytext module
// Encoding from http://en.wikipedia.org/wiki/ASCII

render_part=0; // polytext()

function 8bit_polyfont() = [
  [8,8,0],["Decimal Byte","Caret Notation","Character Escape Code","Abbreviation","Name","[points,paths]"]
  ,[
   [  0,"^@","\0","NUL","Null character",[]]
  ,[  1,"^A","",  "SOH","Start of Header",[]]
  ,[  2,"^B","",  "STX","Start of Text",[]]
  ,[  3,"^C","",  "ETX","End of Text",[]]
  ,[  4,"^D","",  "EOT","End of Transmission",[]]
  ,[  5,"^E","",  "ENQ","Enquiry",[]]
  ,[  6,"^F","",  "ACK","Acknowledgment",[]]
  ,[  7,"^G","\a","BEL","Bell",[]]
  ,[  8,"^H","\b","BS", "Backspace",[]]
  ,[  9,"^I","\t","HT", "Horizontal Tab",[]]
  ,[ 10,"^J","\n","LF", "Line Feed",[]]
  ,[ 11,"^K","\v","VT", "Vertical Tab",[]]
  ,[ 12,"^L","\f","FF", "Form feed",[]]
  ,[ 13,"^M","\r","CR", "Carriage return",[]]
  ,[ 14,"^N","",  "SO", "Shift Out",[]]
  ,[ 15,"^O","",  "SI", "Shift In",[]]
  ,[ 16,"^P","",  "DLE","Data Link Escape",[]]
  ,[ 17,"^Q","",  "DC1","Device Control 1",[]]
  ,[ 18,"^R","",  "DC2","Device Control 2",[]]
  ,[ 19,"^S","",  "DC3","Device Control 3",[]]
  ,[ 20,"^T","",  "DC4","Device Control 4",[]]
  ,[ 21,"^U","",  "NAK","Negative Acknowledgement",[]]
  ,[ 22,"^V","",  "SYN","Synchronous Idle",[]]
  ,[ 23,"^W","",  "ETB","End of Transmission Block",[]]
  ,[ 24,"^X","",  "CAN","Cancel",[]]
  ,[ 25,"^Y","",  "EM", "End of Medium",[]]
  ,[ 26,"^Z","",  "SUB","Substitute",[]]
  ,[ 27,"^[","\e","ESC","Escape",[]]
  ,[ 28,"^\\","", "FS", "File Separator",[]]
  ,[ 29,"^]","",  "GS", "Group Separator",[]]
  ,[ 30,"^^","",  "RS", "Record Separator",[]]
  ,[ 31,"^_","",  "US", "Unit Separator",[]]
  ,[ 32," "," ",  "", "Space",[]]
  ,[ 33,"!","!",  "", "",[
	[[3,1],[3,2],[5,2],[5,1]
	,[3,3],[3,7],[5,7],[5,3]]
	,[[0,1,2,3],[4,5,6,7]]
	]]
  ,[ 34,"\"","\"","", "",[
	[[1,4],[1,7],[3,7],[3,4]
	,[5,4],[5,7],[7,7],[7,4]]
	,[[0,1,2,3],[4,5,6,7]]
	]]
  ,[ 35,"#","#",  "", "",[
	[[1,1],[1,2],[0,2],[0,3],[1,3],[1,5],[0,5],[0,6],[1,6],[1,7],[3,7],[3,6],[5,6],[5,7],[7,7]
		,[7,6],[8,6],[8,5],[7,5],[7,3],[8,3],[8,2],[7,2],[7,1],[5,1],[5,2],[3,2],[3,1]
	,[3,3],[3,5],[5,5],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],[28,29,30,31]]
	]]
  ,[ 36,"$","$",  "", "",[
	[[3,1],[3,2],[1,2],[1,3],[5,3],[5,4],[2,4],[2,5],[1,5],[1,6],[2,6],[2,7],[3,7],[3,8],[5,8],[5,7],[7,7],[7,6]
		,[3,6],[3,5],[6,5],[6,4],[7,4],[7,3],[6,3],[6,2],[5,2],[5,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]
	]]
  ,[ 37,"%","%",  "", "",[
	[[1,1],[1,3],[2,3],[2,5],[1,5],[1,7],[3,7],[3,5],[4,5],[4,6],[5,6],[5,7],[7,7]
		,[7,6],[6,6],[6,5],[5,5],[5,4],[4,4],[4,3],[3,3],[3,2],[2,2],[2,1]
	,[5,1],[5,3],[7,3],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23],[24,25,26,27]]
	]]
  ,[ 38,"&","&",  "", "",[
	[[2,1],[2,2],[1,2],[1,4],[2,4],[2,5],[3,5],[3,6],[2,6],[2,7],[3,7],[3,8],[6,8],[6,7],[7,7],[7,6],[6,6],[6,5],[5,5],[5,4]
		,[8,4],[8,3],[7,3],[7,2],[8,2],[8,1],[6,1],[6,2],[5,2],[5,1]
	,[3,2],[3,4],[4,4],[4,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29],[30,31,32,33]]
	]]
  ,[ 39,"'","'",  "", "",[
	[[3,4],[3,7],[5,7],[5,4]]
	,[[0,1,2,3]]
	]]
  ,[ 40,"(","(",  "", "",[
	[[3,1],[3,2],[2,2],[2,6],[3,6],[3,7],[6,7],[6,6],[5,6],[5,5],[4,5],[4,3],[5,3],[5,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[ 41,")",")",  "", "",[
	[[2,1],[2,2],[3,2],[3,3],[4,3],[4,5],[3,5],[3,6],[2,6],[2,7],[5,7],[5,6],[6,6],[6,2],[5,2],[5,1],[4,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
	]]
  ,[ 42,"*","*",  "", "",[
	[[1,2],[1,3],[2,3],[2,4],[0,4],[0,5],[2,5],[2,6],[1,6],[1,7],[3,7],[3,6],[5,6],[5,7],[7,7],[7,6],[6,6]
		,[6,5],[8,5],[8,4],[6,4],[6,3],[7,3],[7,2],[5,2],[5,3],[3,3],[3,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]
	]]
  ,[ 43,"+","+",  "", "",[]]
  ,[ 44,",",",",  "", "",[]]
  ,[ 45,"-","-",  "", "",[]]
  ,[ 46,".",".",  "", "",[]]
  ,[ 47,"/","/",  "", "",[]]
  ,[ 48,"0","0",  "", "",[]]
  ,[ 49,"1","1",  "", "",[]]
  ,[ 50,"2","2",  "", "",[]]
  ,[ 51,"3","3",  "", "",[]]
  ,[ 52,"4","4",  "", "",[]]
  ,[ 53,"5","5",  "", "",[]]
  ,[ 54,"6","6",  "", "",[]]
  ,[ 55,"7","7",  "", "",[]]
  ,[ 56,"8","8",  "", "",[]]
  ,[ 57,"9","9",  "", "",[]]
  ,[ 58,":",":",  "", "",[]]
  ,[ 59,";",";",  "", "",[]]
  ,[ 60,"<","<",  "", "",[]]
  ,[ 61,"=","=",  "", "",[]]
  ,[ 62,">",">",  "", "",[]]
  ,[ 63,"?","?",  "", "",[]]
  ,[ 64,"@","@",  "", "",[]]
  ,[ 65,"A","A",  "", "",[]]
  ,[ 66,"B","B",  "", "",[]]
  ,[ 67,"C","C",  "", "",[]]
  ,[ 68,"D","D",  "", "",[]]
  ,[ 69,"E","E",  "", "",[]]
  ,[ 70,"F","F",  "", "",[]]
  ,[ 71,"G","G",  "", "",[]]
  ,[ 72,"H","H",  "", "",[]]
  ,[ 73,"I","I",  "", "",[]]
  ,[ 74,"J","J",  "", "",[]]
  ,[ 75,"K","K",  "", "",[]]
  ,[ 76,"L","L",  "", "",[]]
  ,[ 77,"M","M",  "", "",[]]
  ,[ 78,"N","N",  "", "",[]]
  ,[ 79,"O","O",  "", "",[]]
  ,[ 80,"P","P",  "", "",[]]
  ,[ 81,"Q","Q",  "", "",[]]
  ,[ 82,"R","R",  "", "",[]]
  ,[ 83,"S","S",  "", "",[]]
  ,[ 84,"T","T",  "", "",[]]
  ,[ 85,"U","U",  "", "",[]]
  ,[ 86,"V","V",  "", "",[]]
  ,[ 87,"W","W",  "", "",[]]
  ,[ 88,"X","X",  "", "",[]]
  ,[ 89,"Y","Y",  "", "",[]]
  ,[ 90,"Z","Z",  "", "",[]]
  ,[ 91,"[","[",  "", "",[]]
  ,[ 92,"\\","\\","", "",[]]
  ,[ 93,"]","]",  "", "",[]]
  ,[ 94,"^","^",  "", "",[]]
  ,[ 95,"_","_",  "", "",[]]
  ,[ 96,"`","`",  "", "",[]]
  ,[ 97,"a","a",  "", "",[]]
  ,[ 98,"b","b",  "", "",[]]
  ,[ 99,"c","c",  "", "",[]]
  ,[100,"d","d",  "", "",[]]
  ,[101,"e","e",  "", "",[]]
  ,[102,"f","f",  "", "",[]]
  ,[103,"g","g",  "", "",[]]
  ,[104,"h","h",  "", "",[]]
  ,[105,"i","i",  "", "",[]]
  ,[106,"j","j",  "", "",[]]
  ,[107,"k","k",  "", "",[]]
  ,[108,"l","l",  "", "",[]]
  ,[109,"m","m",  "", "",[]]
  ,[110,"n","n",  "", "",[]]
  ,[111,"o","o",  "", "",[]]
  ,[112,"p","p",  "", "",[]]
  ,[113,"q","q",  "", "",[]]
  ,[114,"r","r",  "", "",[]]
  ,[115,"s","s",  "", "",[]]
  ,[116,"t","t",  "", "",[]]
  ,[117,"u","u",  "", "",[]]
  ,[118,"v","v",  "", "",[]]
  ,[119,"w","w",  "", "",[]]
  ,[120,"x","x",  "", "",[]]
  ,[121,"y","y",  "", "",[]]
  ,[122,"z","z",  "", "",[]]
  ,[123,"{","{",  "", "",[]]
  ,[124,"|","|",  "", "",[]]
  ,[125,"}","}",  "", "",[]]
  ,[126,"~","~",  "", "",[]]
  ,[127,"^?","",  "DEL","Delete",[]]
  ] ];

module polytext(charstring,size,font,line=0) {
  char_width=font[0][0];
  char_height=font[0][1];
  char_thickness=font[0][2];
  for(i=[0:len(charstring)-1]) {
    // echo(charstring[i]);
    translate([i*char_width*size/char_width,line*char_height*size/char_height]) {
      for(j=[0:len(font[2])-1]) {
		// echo("Checking %s against %s...",charstring[i],font[2][j][2]);
        if(charstring[i]==font[2][j][2]) {
	      if(char_thickness==0) polygon(points=font[2][j][5][0],paths=font[2][j][5][1]);
	      if(char_thickness>0) polyhedron(points=font[2][j][5][0],triangles=font[2][j][5][1]);
	    }
      }
    }
  }
}

if(render_part==0) {
  echo("Testing polytext()...");
  polytext("!!!",8,8bit_polyfont());
  translate([0,-8bit_polyfont()[0][1]])
    polytext("\"!#$%&'()*",8,8bit_polyfont());
}

