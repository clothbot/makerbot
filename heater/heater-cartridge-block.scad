// Heater Cartridge Block for MK5 Extruder upgrade

// render_part=1; // Heater_Cartridge_Block()
// render_part=2; // X plane intersected slices
//render_part=3; // Y plane intersected slices
// render_part=4; // Z plane intersected slices
// render_part=5; // All 2D intersected slices
 render_part=6; // 3D Model with 2D intersected slices

function Heater_Block_X() = 28.0869;
function Heater_Block_Y() = 19.2374;
function Heater_Block_Z() = 20.3;
function Heater_Block_Resistor_Mount_DX() = 14.3;
function Heater_Block_Resistor_Mount_DZ() = 15.9;
function Heater_Block_Resistor_Bolt_D() = 2.0;
function Heater_Cartridge_D() = 25.4*1/8;

module Heater_Cartridge_Block_Body(extension=0.1
	, HCBB_X=Heater_Block_X()
	, HCBB_Y=Heater_Block_Y()/2
	, HCBB_Z=Heater_Block_Z()
	) {
  cube(size=[HCBB_X,HCBB_Y,HCBB_Z],center=false);
}

module Heater_Cartridge_Block_Holes(extension=0.1
	, HCBH_X=Heater_Block_X()
	, HCBH_Y=Heater_Block_Y()/2
	, HCBH_Z=Heater_Block_Z()
	, HCBH_Resistor_Mount_DX=Heater_Block_Resistor_Mount_DX()
	, HCBH_Resistor_Mount_DZ=Heater_Block_Resistor_Mount_DZ()
	, HCBH_Resistor_Mount_Hole_D=Heater_Block_Resistor_Bolt_D()
	, HCBH_Cartridge_Hole_D=Heater_Cartridge_D()
	) {
  translate([-extension,HCBH_Y/2,HCBH_Z/2])
	rotate([0,90,0]) cylinder($fs=0.1,r=HCBH_Cartridge_Hole_D/2,h=HCBH_X+2*extension,center=false);
  translate([HCBH_X/2-HCBH_Resistor_Mount_DX/2,-extension,HCBH_Z/2-HCBH_Resistor_Mount_DZ/2])
	rotate([-90,0,0]) cylinder($fs=0.1,r=HCBH_Resistor_Mount_Hole_D/2,h=HCBH_Y+2*extension,center=false);
  translate([HCBH_X/2+HCBH_Resistor_Mount_DX/2,-extension,HCBH_Z/2-HCBH_Resistor_Mount_DZ/2])
	rotate([-90,0,0]) cylinder($fs=0.1,r=HCBH_Resistor_Mount_Hole_D/2,h=HCBH_Y+2*extension,center=false);
  translate([HCBH_X/2+HCBH_Resistor_Mount_DX/2,-extension,HCBH_Z/2+HCBH_Resistor_Mount_DZ/2])
	rotate([-90,0,0]) cylinder($fs=0.1,r=HCBH_Resistor_Mount_Hole_D/2,h=HCBH_Y+2*extension,center=false);
  translate([HCBH_X/2-HCBH_Resistor_Mount_DX/2,-extension,HCBH_Z/2+HCBH_Resistor_Mount_DZ/2])
	rotate([-90,0,0]) cylinder($fs=0.1,r=HCBH_Resistor_Mount_Hole_D/2,h=HCBH_Y+2*extension,center=false);
}

module Heater_Cartridge_Block(extension=0.1
	) {
  difference() {
    Heater_Cartridge_Block_Body(extension=extension);
    Heater_Cartridge_Block_Holes(extension=extension);
  }
}

if(render_part==1) {
  echo("Rendering Heater_Cartridge_Block()...");
  Heater_Cartridge_Block();
}

if(render_part==2) {
  echo("Rendering X plane instersected slices");
  intersection() {
    projection(cut=true) translate([0,-Heater_Block_Y()/4,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
    projection(cut=true) translate([0,-Heater_Block_Y()/4,-Heater_Block_Z()/2+Heater_Block_Resistor_Mount_DZ()/2])
	Heater_Cartridge_Block();
  }
}

if(render_part==3) {
  echo("Rendering Y plane instersected slices");
  intersection() {
    projection(cut=true) rotate([0,90,0]) translate([-Heater_Block_X()/2,0,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
    projection(cut=true) rotate([0,90,0]) translate([-Heater_Block_X()/2+Heater_Block_Resistor_Mount_DX()/2,0,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
  }
}

if(render_part==4) {
  echo("Rendering Z plane instersected slices");
    projection(cut=true) rotate([90,0,0]) translate([-Heater_Block_X()/2,-Heater_Block_Y()/4,0])
	Heater_Cartridge_Block();
}

if(render_part==5) {
  echo("Rendering all 2D intersected slices");
  // Heater_Cartridge_Block();

  translate([5.0,Heater_Block_Y()/4+5.0,0])   intersection() {
    projection(cut=true) translate([0,-Heater_Block_Y()/4,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
    projection(cut=true) translate([0,-Heater_Block_Y()/4,-Heater_Block_Z()/2+Heater_Block_Resistor_Mount_DZ()/2])
	Heater_Cartridge_Block();
  }

  translate([-5.0,-Heater_Block_Z()/2-5.0,0]) rotate(90) intersection() {
    projection(cut=true) rotate([0,90,0]) translate([-Heater_Block_X()/2,0,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
    projection(cut=true) rotate([0,90,0]) translate([-Heater_Block_X()/2+Heater_Block_Resistor_Mount_DX()/2,0,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
  }

  translate([5.0+Heater_Block_X()/2,-5.0,0])  
    projection(cut=true) rotate([90,0,0]) translate([-Heater_Block_X()/2,-Heater_Block_Y()/4,0])
	Heater_Cartridge_Block();

}


if(render_part==6) {
  echo("Rendering 3D Model with Intersected Slices");
  Heater_Cartridge_Block();

  translate([0,Heater_Block_Y()/4,-5.0])   linear_extrude(height=0.1) intersection() {
    projection(cut=true) translate([0,-Heater_Block_Y()/4,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
    projection(cut=true) translate([0,-Heater_Block_Y()/4,-Heater_Block_Z()/2+Heater_Block_Resistor_Mount_DZ()/2])
	Heater_Cartridge_Block();
  }

  translate([-5.0,0,Heater_Block_Z()/2]) rotate([0,-90,0]) linear_extrude(height=0.1) intersection() {
    projection(cut=true) rotate([0,90,0]) translate([-Heater_Block_X()/2,0,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
    projection(cut=true) rotate([0,90,0]) translate([-Heater_Block_X()/2+Heater_Block_Resistor_Mount_DX()/2,0,-Heater_Block_Z()/2])
	Heater_Cartridge_Block();
  }

  translate([Heater_Block_X()/2,-5.0,0]) rotate([-90,0,0]) linear_extrude(height=0.1) 
    projection(cut=true) rotate([90,0,0]) translate([-Heater_Block_X()/2,-Heater_Block_Y()/4,0])
	Heater_Cartridge_Block();

}
