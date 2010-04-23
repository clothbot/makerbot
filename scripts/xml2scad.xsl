<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="ISO-8859-1"/>

<xsl:variable name="space"><xsl:text> </xsl:text></xsl:variable>
<xsl:variable name="eol"><xsl:text>
</xsl:text></xsl:variable>
<xsl:template match="/">
<xsl:text>// XSL Transform OpenSCAD
$fa=9;
$fs=0.1;

scale_1in=25.4;
objectScale=</xsl:text><xsl:value-of select="/gcode/g70_units"/><xsl:text>;
// xNext=0.0;
// yNext=0.0;
xScale=1.0;
yScale=1.0;

xScale=pow(10,-</xsl:text><xsl:value-of select="/gcode/p_scale/x/div10e"/><xsl:text>);
echo("xScale: ",xScale);
yScale=pow(10,-</xsl:text><xsl:value-of select="/gcode/p_scale/y/div10e"/><xsl:text>);
echo("yScale: ",yScale);
</xsl:text><xsl:for-each select="/gcode/p_define"><xsl:text>
echo( "Defining aperture </xsl:text><xsl:value-of select="./aperture/@name"/><xsl:text>");
aperture</xsl:text><xsl:value-of select="./aperture/@name"/><xsl:text>=</xsl:text>
<xsl:value-of select="./aperture/width"/><xsl:text>;
</xsl:text></xsl:for-each><xsl:text>
module thisObject () {
assign(debug=0) {
</xsl:text><xsl:for-each select="/gcode/."><xsl:apply-templates/></xsl:for-each>
<xsl:text>echo("Finished.");
 } // close final aperture before module
} // close module

scale([scale_1in*xScale,scale_1in*yScale,1.0]) thisObject();
// cube(size=100.0);
</xsl:text></xsl:template>

<xsl:template match="gcode">
<xsl:for-each select="."><xsl:apply-templates/></xsl:for-each></xsl:template>

<xsl:template match="g70_units">
<xsl:text>// Imperial scale
// objectScale=scale_1in;
</xsl:text></xsl:template>

<xsl:template match="pcode"><xsl:text>// pcode: </xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>
</xsl:text></xsl:template>

<xsl:template match="p_scale">
<xsl:variable name="xScale">pow(10,-<xsl:value-of select="./x/div10e"/>)</xsl:variable>
<xsl:variable name="yScale">pow(10,-<xsl:value-of select="./y/div10e"/>)</xsl:variable>
<xsl:text>// xScale=</xsl:text><xsl:value-of select="$xScale"/><xsl:text>;
// echo("xScale: ",xScale);
// yScale=</xsl:text><xsl:value-of select="$xScale"/><xsl:text>;
// echo("yScale: ",yScale);
</xsl:text></xsl:template>

<xsl:template match="p_define">
<xsl:text>
// echo( "Defining aperture </xsl:text><xsl:value-of select="./aperture/@name"/><xsl:text>");
// aperture</xsl:text><xsl:value-of select="./aperture/@name"/><xsl:text>=</xsl:text>
<xsl:value-of select="./aperture/width"/><xsl:text>;
</xsl:text></xsl:template>

<xsl:template match="d_aperture">
<xsl:text>
echo( "Defining aperture </xsl:text><xsl:value-of select="./aperture/@name"/><xsl:text> next...");
}
assign(aperture=aperture</xsl:text><xsl:value-of select="@name"/><xsl:text>/xScale) {
</xsl:text></xsl:template>

<xsl:template match="d02_move"><xsl:text>// translate([</xsl:text>
<xsl:value-of select="./x"/><xsl:text>,</xsl:text>
<xsl:value-of select="./y"/><xsl:text>,0])
assign( xPos=</xsl:text><xsl:value-of select="./x"/><xsl:text>,
yPos=</xsl:text><xsl:value-of select="./y"/><xsl:text>)
</xsl:text></xsl:template>

<xsl:template match="d01_draw">
<xsl:text>assign(xNext=</xsl:text><xsl:value-of select="./x"/><xsl:text>,
yNext=</xsl:text><xsl:value-of select="./y"/><xsl:text>,
// atanRatio=(</xsl:text><xsl:value-of select="./y"/><xsl:text>-yPos)/(</xsl:text><xsl:value-of select="./x"/><xsl:text>-xPos),
// atanVal=atan(atanRatio),
atanVal=atan((</xsl:text><xsl:value-of select="./y"/><xsl:text>-yPos)/(</xsl:text><xsl:value-of select="./x"/><xsl:text>-xPos)),
cylHVal=sqrt( pow(</xsl:text><xsl:value-of select="./y"/><xsl:text>-yPos,2)+pow(</xsl:text><xsl:value-of select="./x"/><xsl:text>-xPos,2) )
) {
echo(" xNext: ",xNext);
echo(" yNext: ",yNext);
echo(" xPos: ",xPos);
echo(" yPos: ",yPos);
// echo(" atanRatio: ",atanRatio);
echo(" atanVal: ",atanVal);
translate([xPos,yPos,0]) scale([1.0,1.0,10*xScale]) rotate([0,0,atanVal]) rotate([0,90,0])
//   cylinder(r=aperture/2, h=cylHVal );
  cylinder(r=aperture/2, h=cylHVal, center=false );
}
assign(xPos=</xsl:text><xsl:value-of select="./x"/><xsl:text>,
yPos=</xsl:text><xsl:value-of select="./y"/><xsl:text>)
</xsl:text></xsl:template>

<xsl:template match="d03_flash">
<xsl:text>assign(
xNext=</xsl:text><xsl:value-of select="./x"/><xsl:text>,
yNext=</xsl:text><xsl:value-of select="./y"/><xsl:text>)
translate([xNext,yNext,-1.0]) 
  cylinder(r=aperture/2, h=1.0, center=false );
assign(
xNext=</xsl:text><xsl:value-of select="./x"/><xsl:text>,
yNext=</xsl:text><xsl:value-of select="./y"/><xsl:text>)
</xsl:text></xsl:template>

</xsl:stylesheet>
