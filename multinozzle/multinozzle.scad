// Multi-Nozzle Extruder Barrel
//
// Copyright 2010 by Andrew Plumb
// Licensed under the GPL

include <makerbot_abs_0p5mm.scad>
debug_flag=0;

  entryDiam=3.0;
//  wallThick=2.0;
  wallThick=2.0;
  exitDiam=0.25;
  innerFinCount=6;



module m6_nut(mfgGrid=mfgGrid_1mm
	, nutHeight=5.0
	) {
  scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) {
    dxf_linear_extrude(file="dxf/M6_Nut.dxf"
	, layer="0"
	, origin=[0,0,0]
	, convexity=5
	, height=nutHeight*mfgGrid
	, scale=mfgGrid
	);
  }
}

module m3_nut(mfgGrid=mfgGrid_1mm
	, nutHeight=2.4
	) {
  scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) {
    dxf_linear_extrude(file="dxf/M3_Nut.dxf"
	, layer="0"
	, origin=[0,0,0]
	, convexity=5
	, height=nutHeight*mfgGrid
	, scale=mfgGrid
	);
  }
}

module radial_mount(mfgGrid=mfgGrid_1mm
	, wallThick=2.0
	, ringThick=2.0
	, radialCount=4
	, radialHoleDiam=3.0
	, radialHolePos=16.0
	, radialAngleShift=0.0
	) {
  scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) union () {
	translate([0,0,mfgGrid*wallThick/2]) {
	  for ( i=[0:radialCount-1] ) {
	    assign(rotAngle=360*i/radialCount+radialAngleShift) {
		rotate ([0,0,rotAngle]) translate ([0,mfgGrid*radialHolePos,0]) difference () {
		  union () {
		    cylinder(r=mfgGrid*(radialHoleDiam/2+ringThick)
			, h=mfgGrid*wallThick
			, center=true);
		    translate([0,-mfgGrid*radialHolePos/2,0])
//			scale([(radialHoleDiam/2+wallThick),radialHolePos-(radialHoleDiam/2+wallThick),0.707*wallThick])
			scale([(radialHoleDiam/2+wallThick),radialHolePos,0.707*wallThick])
			cube(size=1.0*mfgGrid,center=true);
		    translate([0,-mfgGrid*radialHolePos/2,0])
//			scale([0.707*(radialHoleDiam/2+wallThick),radialHolePos-(radialHoleDiam/2+wallThick),wallThick])
			scale([0.707*(radialHoleDiam/2+wallThick),radialHolePos,wallThick])
			cube(size=1.0*mfgGrid,center=true);
		  }
		  cylinder(r=mfgGrid*(radialHoleDiam/2)
			, h=mfgGrid*wallThick+2.0*overlap
			, center=true);
		}
	    }
	  }
	}
  }
}


module nozzle_outer(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
	, exitDiam=0.25
	, boltMountCount=4
	, boltDiam=3.0
	, boltRadialPos=0.707*16.0
	, sensorMountCount=4
	, sensorDiam=3.0
	, sensorRadialPos=8.0
	, nutHeight=2.5
	, nutOuterDiamMin=10.0
	, nutOuterDiamMax=11.547
	) {
  union () {  
   radial_mount(mfgGrid=mfgGrid_1mm
		, wallThick=4.0
		, ringThick=2.0
		, radialCount=boltMountCount
		, radialHoleDiam=boltDiam
		, radialHolePos=boltRadialPos
		, radialAngleShift=180/boltMountCount
   );
   translate ([0,0,2*(entryDiam/2+2*wallThick)]) radial_mount(mfgGrid=mfgGrid_1mm
		, wallThick=3.0
		, ringThick=1.5
		, radialCount=sensorMountCount
		, radialHoleDiam=sensorDiam
		, radialHolePos=sensorRadialPos
		, radialAngleShift=0.0
   );
   scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) {
    union () {
	difference () {
	    sphere(
		r=mfgGrid*(nutOuterDiamMax/2+wallThick)
		, center=true
	    );
	    translate ([0,0,-mfgGrid*(nutOuterDiamMax/2+wallThick)-overlap])
	      cylinder(
		r=mfgGrid*(nutOuterDiamMax/2+wallThick)
		, h=mfgGrid*(nutOuterDiamMax/2+wallThick)+overlap
	      );
	}
	cylinder(
		r=mfgGrid*(entryDiam/2+2*wallThick)
		, h=2*mfgGrid*(entryDiam/2+2*wallThick)
		, center=false
	);
	translate ([0,0,2*mfgGrid*(entryDiam/2+2*wallThick)]) sphere(
		r=mfgGrid*(entryDiam/2+2*wallThick)
		, center=false
	);
	translate ([0,0,2*mfgGrid*(entryDiam/2+2*wallThick)]) 
	  cylinder(
		r=mfgGrid*wallThick
//		r1=mfgGrid*(exitDiam/2+wallThick)
//		, r2=mfgGrid*wallThick/2
		, h=2*mfgGrid*(exitDiam/2+wallThick)+mfgGrid*(wallThick+entryDiam/2)
		, center=false
	);
    }
  }
 }
}

module nozzle_inner_fins(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
	, exitDiam=0.25
	, innerFinCount=6
	, innerFinHeight=3.0
	) {
  finWidth=3.1415*entryDiam/(2*innerFinCount);
  scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) union () {
	  for ( i=[0:innerFinCount-1] ) {
	    assign(rotAngle=360*i/innerFinCount) {
		rotate ([0,0,rotAngle]) translate ([mfgGrid*entryDiam/2,0,0])
			scale([entryDiam/4,finWidth/2,innerFinHeight])
			sphere(r=1.0*mfgGrid,center=true);
	    }
	  }
  }
}

module nozzle_inner(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
	, exitDiam=0.25
	, nutHeight=2.5
	, nutInnerDiam=6.0
	) {
  union () {
   m6_nut(nutHeight=nutHeight+overlap/mfgGrid);
   scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) {
    union () {
	cylinder(
		r=mfgGrid*nutInnerDiam/2+overlap
		, h=nutHeight*mfgGrid
	);
	translate ([0,0,mfgGrid*nutHeight]) cylinder(
		r1=mfgGrid*nutInnerDiam/2
		, r2=mfgGrid*entryDiam/2
		, h=mfgGrid*(nutInnerDiam-entryDiam)/2
		, center=false
	);
	translate ([0,0,nutHeight-overlap]) cylinder(
		r=mfgGrid*(entryDiam/2)
		, h=2*mfgGrid*(entryDiam/2+2*wallThick)+nutHeight*mfgGrid+overlap
		, center=false
	);
	translate ([0,0,2*mfgGrid*(entryDiam/2+2*wallThick)+mfgGrid*nutHeight]) sphere(
		r=mfgGrid*(entryDiam/2)
		, center=false
	);
	translate ([0,0,2*mfgGrid*(entryDiam/2+2*wallThick)+mfgGrid*nutHeight]) {
	  cylinder(
		r2=mfgGrid*(exitDiam/2)
		, r1=mfgGrid*entryDiam/4
		, h=2*mfgGrid*(exitDiam/2+wallThick)+mfgGrid*wallThick/2
		, center=false
	  );
	  cylinder(
		r=mfgGrid*exitDiam/2
		, h=2*mfgGrid*(exitDiam/2+wallThick)+mfgGrid*(wallThick+entryDiam/2)+overlap
	  );
	}
    }
   }
  }
}


module nozzle(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
  ) {
  difference() {
    union() {
	nozzle_outer(entryDiam=entryDiam,wallThick=wallThick);
    }
    difference () { 
	nozzle_inner(entryDiam=entryDiam, wallThick=wallThick);
	translate ( [0,0, 2*(entryDiam/2+2*wallThick) ] ) {
	  nozzle_inner_fins( 
		innerFinHeight=(entryDiam/2+2*wallThick) 
		, innerFinCount=8
		, entryDiam=entryDiam
		, wallThick=wallThick
	  );
	}
    }
  }
}

module bracket_outer(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
	, boltMountCount=4
	, boltDiam=3.0
	, boltRadialPos=0.707*16.0
	, nutHeight=2.5
	, nutOuterDiamMin=10.0
	, nutOuterDiamMax=11.547
	) {
  union () {  
   radial_mount(mfgGrid=mfgGrid_1mm
		, wallThick=4.0
		, ringThick=2.0
		, radialCount=boltMountCount
		, radialHoleDiam=boltDiam
		, radialHolePos=boltRadialPos
		, radialAngleShift=180/boltMountCount
   );
   scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) {
    union () {
	difference () {
	    sphere(
		r=mfgGrid*(nutOuterDiamMax/2+wallThick)
		, center=true
	    );
	    translate ([0,0,-mfgGrid*(nutOuterDiamMax/2+wallThick)-overlap])
	      cylinder(
		r=mfgGrid*(nutOuterDiamMax/2+wallThick)
		, h=mfgGrid*(nutOuterDiamMax/2+wallThick)+overlap
	      );
	}
    }
   }
  }
}

module bracket_inner(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
	, nutHeight=2.5
	, nutInnerDiam=6.0
	, nutOuterDiamMin=10.0
	, nutOuterDiamMax=11.547
	) {
  union () {
   m6_nut(nutHeight=nutHeight+overlap/mfgGrid);
   scale ([1/mfgGrid,1/mfgGrid,1/mfgGrid]) {
    union () {
	cylinder(
		r=mfgGrid*nutInnerDiam/2+overlap
		, h=nutHeight*mfgGrid
	);
	translate ([0,0,mfgGrid*nutHeight]) cylinder(
		r1=mfgGrid*(nutOuterDiamMin+nutInnerDiam)/4
		, r2=mfgGrid*nutInnerDiam/2
		, h=mfgGrid*(nutOuterDiamMin-nutInnerDiam)/4
		, center=false
	);
	translate ([0,0,nutHeight-overlap]) cylinder(
		r=mfgGrid*(nutInnerDiam/2)
		, h=mfgGrid*(nutOuterDiamMax/2+wallThick)+2*overlap
		, center=false
	);
    }
   }
  }
}

module bracket(mfgGrid=mfgGrid_1mm
	, entryDiam=3.0
	, wallThick=2.0
	, nutHeight=2.5
	, nutInnerDiam=6.0
	, nutOuterDiamMin=10.0
	, nutOuterDiamMax=11.547
  ) {
  difference() {
    bracket_outer(entryDiam=entryDiam
		, wallThick=wallThick
    );
    bracket_inner(entryDiam=entryDiam
	, wallThick=wallThick
    );
  }
}


render_part=0;

if( render_part==1 ) {
  nozzle_outer();
}

if( render_part==2 ) {
  nozzle_inner_fins();
}

if( render_part==3 ) {
  difference () {
	nozzle_inner();
	translate ( [0,0, 2*(entryDiam/2+2*wallThick) ] ) {
	  nozzle_inner_fins( 
		innerFinHeight=(entryDiam/2+2*wallThick) 
		, innerFinCount=8
	  );
	}
  }
}

if( render_part==4 ) {
  radial_mount();
}

if( render_part==5 ) {
  m6_nut();
}

if( render_part==6 ) {
  m3_nut();
}


if( render_part==7 ) {
  nozzle();
}

if( render_part==8 ) {
  bracket_outer();
}

if( render_part==9 ) {
  bracket_inner();
}

if( render_part==10) {
  bracket();
}

if( render_part==0 ) {
  nozzle(wallThick=wallThick);
  rotate([180,0,0]) translate([0,0,overlap/mfgGrid_1mm]) bracket(wallThick=wallThick);
}
