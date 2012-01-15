// polytext module
// Encoding from http://en.wikipedia.org/wiki/ASCII

function 8bit_polyfont() = [
  [8,8],[
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
  ,[ 33,"!","!",  "", "",[]]
  ,[ 34,"\"","\"","", "",[]]
  ,[ 35,"#","#",  "", "",[]]
  ,[ 36,"$","$",  "", "",[]]
  ,[ 37,"%","%",  "", "",[]]
  ,[ 38,"&","&",  "", "",[]]
  ,[ 39,"'","'",  "", "",[]]
  ,[ 40,"(","(",  "", "",[]]
  ,[ 41,")",")",  "", "",[]]
  ,[ 42,"*","*",  "", "",[]]
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

module polytext(charstring,size,font) {
  
}

