// Bearing, 608
use <Calibration.scad>

function Bearing_608_ID() = 8.0+Bearing_608_ID_Err();
function Bearing_608_OD() = 22.0+Bearing_608_OD_Err();
function Bearing_608_H()  = 7.0;

module Bearing_608() {
  translate([0,0,Bearing_608_H()/2]) difference() {
    cylinder(r=Bearing_608_OD()/2, h=Bearing_608_H(), center=true);
    cylinder(r=Bearing_608_ID()/2, h=Bearing_608_H()+0.1, center=true);
  }
}

