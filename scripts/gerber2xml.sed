# Converting EAGLE .GTL and .GBL files into XML encoded version.
# References:
#  http://www.artwork.com/gerber/appl2.htm
#  http://web.vtc.edu/mt/2040Sum03/Project/Gillespie/turning%20G%20code.htm
# Usage: sed -f gerber2xml.sed board.GBL > board.GBL.xml 
s/^G75/<?xml version="1.0"?>\
<gcode>/
s/^G70/<g70_units>imperial<\/g70_units>/g
s/^G71/<g71_units>metric<\/g71_units>/g
/^%FSLA/,/\*%/ {
  s/^%FSLAX\([0-9]\)\([0-9]\)Y\([0-9]\)\([0-9]\)\*%$/<p_scale>\
  <x><max10e>\1<\/max10e><div10e>\2<\/div10e><\/x>\
  <y><max10e>\3<\/max10e><div10e>\4<\/div10e><\/y>\
<\/p_scale>/g
}
/^%AD/,/\*%$/ {
  s/^%ADD\([1-9][0-9]\)\(.*\),\([0-9][.0-9]*\)\*%$/<p_define><aperture name="\1"><type>\2<\/type><width>\3<\/width><\/aperture><\/p_define>/g
}
s/\*$//g
s/^D\([1-9][0-9]*\)$/<d_aperture name="\1"\/>/
s/X[0]*\([1-9][0-9]*\)Y[0]*\([1-9][0-9]*\)D01/<d01_draw><x>\1<\/x><y>\2<\/y><\/d01_draw>/g
s/X[0]*\([1-9][0-9]*\)Y[0]*\([1-9][0-9]*\)D02/<d02_move><x>\1<\/x><y>\2<\/y><\/d02_move>/g
s/X[0]*\([0-9][0-9]*\)Y[0]*\([0-9][0-9]*\)D03/<d03_flash><x>\1<\/x><y>\2<\/y><\/d03_flash>/g
s/X\([0-9]*\)/<x>\1<\/x>/g
s/Y\([0-9]*\)/<y>\1<\/y>/g
s/M02$/<\/gcode>/g
s/D\([0-9][0-9]*\)/<dcode>\1<\/dcode>/g
s/^G\([0-9]*\)\(.*\)$/<g\1\>\2<\/g\1>/g
s/^M\([0-9]*\)\(.*\)$/<m\1\>\2<\/m\1>/g
s/^%\(.*\)\*%$/<pcode>\1<\/pcode>/g
/^%/,/%$/ {
  s/^%$/<\/pcode>/
  s/^%/<pcode>/
}
