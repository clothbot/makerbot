// Functions

function gear_circular_pitch(gear_d,gear_num_teeth)=gear_d*180/gear_num_teeth;

function Bearing_623_OD(grow=0.0)=10.0+grow; // outer diameter
function Bearing_623_ID(grow=0.0)=3.0+grow; // inner diameter
function Bearing_623_TH(grow=0.0)=4.0+grow; // thickness

function Bearing_608_OD(grow=0.0)=22.0+grow; // outer diameter
function Bearing_608_ID(grow=0.0)=8.0+grow; // inner diameter
function Bearing_608_TH(grow=0.0)=7.0+grow; // thickness

function Tygon_B_44_3_OD(grow=0.0)=25.4*3/16+grow; // Outer Diameter
function Tygon_B_44_3_ID(grow=0.0)=25.4*1/16+grow; // Inner Diameter
function Tygon_B_44_3_WT(grow=0.0)=25.4*1/16+grow; // Wall Thickness
function Tygon_B_44_3_minBR(grow=0.0)=25.4*1/8+grow; // Minimum Bend Radius

function NEMA17_case_width(grow=0.0)=25.4*1.68+grow; // Case Width
function NEMA17_case_length(grow=0.0)=25.4*1.61+grow; // Case Length
function NEMA17_case_bolt_d(grow=0.0)=3.0+grow; // Case Bolt Diameter
function NEMA17_case_bolt_spacing(grow=0.0)=25.4*1.22+grow; // Case Bolt Spacing
function NEMA17_case_hub_d(grow=0.0)=Bearing_608_OD(grow=grow); // Case Hub Diameter
function NEMA17_case_hub_h(grow=0.0)=2.0+grow; // Case Hub Height
function NEMA17_shaft_d(grow=0.0)=5.0+grow; // Motor Shaft Diameter
function NEMA17_shaft_l(grow=0.0)=0.790*25.4+grow; // Motor Shaft Length

// Parts

module spider_coupler(
        thickness=5.0
        , outer_d=12.0
        , axle_d=3.0
        , bevel_dr=0.5
        , shrink=0.2
        ) {
  intersection() {
    union() {
      cylinder(r=outer_d/2,h=thickness-bevel_dr,center=false);
      translate([0,0,thickness-bevel_dr])
        cylinder(r1=outer_d/2,r2=outer_d/2-bevel_dr,h=bevel_dr,center=false);
    }
    difference() {
      union() {
          translate([shrink,shrink])
                cube(size=[outer_d/2-shrink,outer_d/2-shrink,thickness],center=false);
          rotate([0,0,180]) translate([shrink,shrink,0])
                cube(size=[outer_d/2-shrink,outer_d/2-shrink,thickness],center=false);
         }
         union() {
          translate([0,0,-bevel_dr]) cylinder(r=axle_d/2,h=thickness+2*bevel_dr,center=false);
          translate([0,0,thickness-bevel_dr])  cylinder(r2=axle_d/2+2*bevel_dr,r1=axle_d/2,h=2*bevel_dr,center=false);
          translate([0,0,thickness]) rotate([45,0,0]) cube(size=[outer_d,2*bevel_dr,2*bevel_dr],center=true);
          translate([0,0,thickness]) rotate([45,0,90]) cube(size=[outer_d,2*bevel_dr,2*bevel_dr],center=true);
         }
    }
  }
}

