# Converting EAGLE .GTL and .GBL files into XML to start with
# Usage: sed -f gerber2scad.sed board.GBL > board.GBL.xml 
s/\*$//g
/^D[0-9]*/,/^X*$/ {
s/^D\([0-9]*\)$/<polygon name=\1>/
  s/X\([0-9]*\)/<x>\1<\/x>/g
  s/Y\([0-9]*\)/<y>\1<\/y>/g
  s/D\([0-9]*\)/<d>\1<\/d>/g
} 
/<\d>/,/^<polygon/ {
  s/^<polygon/<\/polygon>\
&/
}
s/^M02/<\/polygon>\
&/
