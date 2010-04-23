# Converting EAGLE .GTL and .GBL files into XML encoded version.
# References:
#  http://www.artwork.com/gerber/appl2.htm
#  http://web.vtc.edu/mt/2040Sum03/Project/Gillespie/turning%20G%20code.htm
# Usage: sed -f gerber2xml.sed board.GBL > board.GBL.xml 
s/^G75/<?xml version="1.0"?>\
<gcode>/
s/^G70/<units>imperial<\/units>/g
s/^G71/<units>metric<\/units>/g
/^%FSLA/,/\*%/ {
  s/^%FSLAX\([0-9]\)\([0-9]\)Y\([0-9]\)\([0-9]\)\*%$/<numbers>\
  <x><int>\1<\/int><frac>\2<\/frac><\/x>\
  <y><int>\3<\/int><frac>\4<\/frac><\/y>\
<\/numbers>/g
}
/^%AD/,/\*%$/ {
  s/^%ADD\([1-9][0-9]\)\(.*\),\([0-9][.0-9]*\)\*%$/<define><aperture name="\1"><type>\2<\/type><width>\3<\/width><\/aperture><\/define>/g
}
s/\*$//g
s/^D\([1-9][0-9]*\)$/<aperture name="\1"\/>/
s/X\([0-9][0-9]\)\([0-9]*\)Y\([0-9][0-9]\)\([0-9]*\)D01/<draw><x>\1.\2<\/x><y>\3.\4<\/y><\/draw>/g
s/X\([0-9][0-9]\)\([0-9]*\)Y\([0-9][0-9]\)\([0-9]*\)D02/<move><x>\1.\2<\/x><y>\3.\4<\/y><\/move>/g
s/X\([0-9][0-9]\)\([0-9]*\)Y\([0-9][0-9]\)\([0-9]*\)D03/<flash><x>\1.\2<\/x><y>\3.\4<\/y><\/flash>/g
s/X\([0-9]*\)/<x>\1<\/x>/g
s/Y\([0-9]*\)/<y>\1<\/y>/g
s/M02$/<\/gcode>/g
s/D\([0-9][0-9]*\)/<d>\1<\/d>/g
s/^G\([0-9]*\)\(.*\)$/<g\1\>\2<\/g\1>/g
s/^M\([0-9]*\)\(.*\)$/<m\1\>\2<\/m\1>/g
s/^%\(.*\)\*%$/<pcode>\1<\/pcode>/g
/^%/,/%$/ {
  s/^%$/<\/pcode>/
  s/^%/<pcode>/
}
