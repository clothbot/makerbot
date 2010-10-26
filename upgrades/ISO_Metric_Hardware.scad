// ISO Metric Hardware
// Screw Thread Reference: http://en.wikipedia.org/wiki/ISO_metric_screw_thread
use <Calibration.scad>

function M3_Diam() =3.0+M3_Diam_Err();
function M3_Pitch() = 0.5;
// SCS = Socket Cap Screws
function M3_SCS_Head_H() = 3.0;
function M3_SCS_Head_D() = 5.5+M3_SCS_Head_D_Err();
function M3_SCS_Head_Hex_W() = 2.5;

module M3_SCS_Head_Hole(extension=0.1) {
  linear_extrude(height=M3_SCS_Head_H()+extension, center=false,convexity=10)
    circle(r=(M3_SCS_Head_D()+extension)/2);
}

// Metric Hex Nuts - DIN 934
function M3_Nut_DIN934_Pitch()=0.5;
function M3_Nut_DIN934_W()=5.5+M3_Nut_DIN934_W_Err();
function M3_Nut_DIN934_H()=2.4;

// Metric Thin Hex Nuts - DIN 934B
function M3_Nut_DIN934B_Pitch()=0.5;
function M3_Nut_DIN934B_W()=5.5+M3_Nut_DIN934B_W_Err();
function M3_Nut_DIN934B_H()=1.8;

module M3_Nut_DIN934_2D() {
  $fa=15.0;
  $fs=0.1;
  difference() {
    intersection_for(i=[0:2]) {
      rotate([0,0,360*i/3]) square(size=[2*M3_Nut_DIN934_W(),M3_Nut_DIN934_W()], center=true);
    }
    circle(r=M3_Diam()/2,center=true);
  }
}

module M3_Nut_DIN934_Hole_2D() {
  $fa=15.0;
  $fs=0.1;
  intersection_for(i=[0:2]) {
    rotate([0,0,360*i/3]) square(size=[2*M3_Nut_DIN934_W(),M3_Nut_DIN934_W()], center=true);
  }
}

module M3_Nut_DIN934_Hole(extension=0.1) {
  $fa=15.0;
  $fs=0.1;
  linear_extrude(height=M3_Nut_DIN934_H()+extension, center=false, convexity=10) intersection_for(i=[0:2]) {
    rotate([0,0,360*i/3]) square(size=[2*(M3_Nut_DIN934_W()+extension),M3_Nut_DIN934_W()+extension], center=true);
  }
}

function M8_Diam() =8.0+M8_Diam_Err();
function M8_Pitch() = 1.25;
// SCS = Socket Cap Screws
function M8_SCS_Head_H() = 8.0;
function M8_SCS_Head_D() = 13.0+M8_SCS_Head_D_Err();
function M8_SCS_Head_Hex_W() = 6.0;

module M8_SCS_Head_Hole(extension=0.1) {
  linear_extrude(height=M8_SCS_Head_H()+extension, center=false,convexity=10)
    circle(r=(M8_SCS_Head_D()+extension)/2);
}

// Metric Hex Nuts - DIN 934
function M8_Nut_DIN934_Pitch()=1.25;
function M8_Nut_DIN934_W()=13.0+M8_Nut_DIN934_W_Err();
function M8_Nut_DIN934_H()=6.5;

// Metric Thin Hex Nuts - DIN 934B
function M8_Nut_DIN934B_Pitch()=1.25;
function M8_Nut_DIN934B_W()=13.0+M8_Nut_DIN934B_W_Err();
function M8_Nut_DIN934B_H()=4.0;

module M8_Nut_DIN934_2D() {
  $fa=15.0;
  $fs=0.1;
  difference() {
    intersection_for(i=[0:2]) {
      rotate([0,0,360*i/3]) square(size=[2*M8_Nut_DIN934_W(),M8_Nut_DIN934_W()], center=true);
    }
    circle(r=M8_Diam()/2,center=true);
  }
}

module M8_Nut_DIN934_Hole(extension=0.1) {
  $fa=15.0;
  $fs=0.1;
  linear_extrude(height=M8_Nut_DIN934_H()+extension, center=false, convexity=10) intersection_for(i=[0:2]) {
    rotate([0,0,360*i/3]) square(size=[2*(M8_Nut_DIN934_W()+extension),M8_Nut_DIN934_W()+extension], center=true);
  }
}

