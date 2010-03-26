// MakerBot Process File
// Material: ABS
// Nozzle Diameter: 0.5mm
// 
// Copyright 2010 by Andrew Plumb
// Licensed under the GPL

// For more information about OpenSCAD, see http://www.openscad.org/

// Note 1: The dimensions are 100x larger, i.e. 100=1mm
// This is to work around some rendering issues when fractional values are used at 1=1mm.
// and 1000x (1000=1mm) has trouble rendering the whole volume.

mfgGrid_1mm=100;

// Makerbot Cupcake CNC Parameters
minXStep=0.085*mfgGrid_1mm; // 8.5 grid units
minYStep=0.085*mfgGrid_1mm; // 8.5 grid units

minZStep=0.003125*mfgGrid_1mm; // 0.3125 grid units

nozzleDiam=0.5*mfgGrid_1mm; // 50 grid units

avgZHeight=0.3725*mfgGrid_1mm; // 37.25 grid units

maxBuildX=100.0*mfgGrid_1mm; // 10000 grid units
maxBuildY=100.0*mfgGrid_1mm; // 10000 grid units
maxBuildZ=130.0*mfgGrid_1mm; // 13000 grid units

// The "overlap" variable is for a common amount of volume overlap to "fuse" objects.
// Set overlap=0 to see side-effects of not having overlap.
overlap=minXStep+minYStep;

// The "heatShrinkPercent" is the amount contraction of a length of material due to thermal effects.
heatShrinkPercent=1.0;

module build_volume()
{
translate([0,0,-0.5]) 
	difference() {
		scale([maxBuildX/mfgGrid_1mm+1,maxBuildY/mfgGrid_1mm+1,1]) 
			cube(size = 1, center = true);
		scale([maxBuildX/mfgGrid_1mm,maxBuildY/mfgGrid_1mm,2]) 
			cube(size = 1, center = true);
	}
translate([-0.5*maxBuildX/mfgGrid_1mm,-0.5*maxBuildY/mfgGrid_1mm,0])
	scale([1,1,maxBuildZ/mfgGrid_1mm])
		cube(size = 1, center = false);
translate([0.5*maxBuildX/mfgGrid_1mm,-0.5*maxBuildY/mfgGrid_1mm,0])
	scale([1,1,maxBuildZ/mfgGrid_1mm])
		cube(size = 1, center = false);
translate([-0.5*maxBuildX/mfgGrid_1mm,0.5*maxBuildY/mfgGrid_1mm,0])
	scale([1,1,maxBuildZ/mfgGrid_1mm])
		cube(size = 1, center = false);
translate([0.5*maxBuildX/mfgGrid_1mm,0.5*maxBuildY/mfgGrid_1mm,0])
	scale([1,1,maxBuildZ/mfgGrid_1mm])
		cube(size = 1, center = false);
translate([0,0,maxBuildZ/mfgGrid_1mm+0.5]) 
	difference() {
		scale([maxBuildX/mfgGrid_1mm+1,maxBuildY/mfgGrid_1mm+1,1]) 
			cube(size = 1, center = true);
		scale([maxBuildX/mfgGrid_1mm,maxBuildY/mfgGrid_1mm,2]) 
			cube(size = 1, center = true);
	}
}

// Build Volume
//  Uncomment the next line to see the object in build volume context.
// build_volume();

// Note 2: If you don't see the object after first compilation, try zooming out.

// To scale resulting 100=1mm STL to 1=1mm without using scale() function:
// 1. Open resulting STL file in Meshlab
// 2. Select Filters - Normals, Curvatures and Orientation - Apply Transform
// 3. Select "Scale"
// 4. Set X=0.01
// 5. Check "Uniform"
// 6. Click Apply
// 7. Click Close and Freeze
// 8. File - Save As
// 9. Select Format: STL File Format (*.stl)
// 10. Click Save
// 11. Ok the Dialog defaults
// 12. Open newly created STL file in Meshlab.
// 13. Use Tape Measure to confirm dimensions are now 1=1mm.

