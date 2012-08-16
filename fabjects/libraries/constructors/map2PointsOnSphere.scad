// Points on sphere module
// Derived from http://www.softimageblog.com/archives/115

test_object=0; // direct test
test_object=1; // module test
test_object=2; // spike ball
test_object=3; // ball test

function pi()=3.14159265358979323846;

function pointOnSphere(radius=1.0,k,N) =
  [ radius*cos(360*k*pi()*(3-sqrt(5))/(2*pi()))*sqrt(1-(k*(2/N)-1+((2/N)/2))*(k*(2/N)-1+((2/N)/2)))
   , radius*(k*(2/N)-1+((2/N)/2))
   , radius*sin(360*k*pi()*(3-sqrt(5))/(2*pi()))*sqrt(1-(k*(2/N)-1+((2/N)/2))*(k*(2/N)-1+((2/N)/2)))
  ];

// Cartesian to Spherical coordinate mapping.
function cart2sphere(x,y,z) = [ // returns [r, inclination, azimuth]
  sqrt( x*x+y*y+z*z )
  , acos(z/sqrt(x*x+y*y+z*z))
  , (x>0) ? atan(y/x) : (
	(x<0 && y>0) ? atan(y/x)+180 : (
	(x<0 && y<0) ? atan(y/x)-180 : (
	(x==0 && y>0) ? 90 : -90 ) ) )
  ];

// Spherical to Cartesian coordinate mapping.
function sphere2cart(r,inc,azi) = [ // returns [x, y, z]
  r*sin(inc)*cos(azi)
  , r*sin(inc)*sin(azi)
  , r*cos(inc)
  ];

module translate2PointOnSphere(radius=1.0,k,N,align=false) {
  // Cartesian Coordinate Translate
  for( i=[0:$children-1] ) assign(cc=pointOnSphere(radius=radius,k=k,N=N),cc0=pointOnSphere(radius=radius,k=0,N=N))
	 {
    if(align==false) {
      translate( cc ) child(i);
    } else assign(cs=cart2sphere(cc[0],cc[1],cc[2]),cs0=cart2sphere(cc0[0],cc0[1],cc0[2]) ) {
      translate( sphere2cart(cs[0],cs[1]-cs0[1]+90,cs[2]-cs0[2]) ) child(i);
    }
  }
}

module radial2PointOnSphere(radius=1.0,k,N,align=false) {
  // Spherical Coordinate Mapping
  for( i=[0:$children-1] ) assign(cc=pointOnSphere(radius=radius,k=k,N=N),cc0=pointOnSphere(radius=radius,k=0,N=N)) {
    rotate([0
	,cart2sphere(cc[0],cc[1],cc[2])[1]-((align==true) ? cart2sphere(cc0[0],cc0[1],cc0[2])[1]:90)
	,cart2sphere(cc[0],cc[1],cc[2])[2]-((align==true) ? cart2sphere(cc0[0],cc0[1],cc0[2])[2]:0)
	])
      translate([cart2sphere(cc[0],cc[1],cc[2])[0],0,0])
	rotate([0,90,0]) child(i);
  }
}

module map2PointsOnSphere(radius=1.0,N=3) assign(
  inc= pi()*(3-sqrt(5))
  , off=2/N) {
  for(k=[0:N-1]) assign(
    y = k*off-1+(off/2)
    , r = sqrt(1-(k*off-1+(off/2))*(k*off-1+(off/2)))
    , phi=k*inc ) {
	translate([radius*cos(360*phi/(2*pi()))*r,radius*y,radius*sin(360*phi/(2*pi()))*r]) child(0);
  }
}

spt_count=6;
horn_count=6;

if(test_object==0) {
  % color(0.1,0.1,0.1) sphere(r=8.0);
  map2PointsOnSphere(radius=8.0,N=128) cube(1.0,center=true);

  for(i=[0:spt_count-1]) assign(cc=pointOnSphere(radius=10.0,k=i,N=spt_count)) translate(cc) {
    cube(1.0,center=false);
    cylinder($fn=7,r1=1,r2=0,h=5);
  }

  translate([10,0,0]) rotate([0,90,0]) union() {
    cylinder($fn=32,r1=1.0,r2=0,h=10.0);
    cube(size=[2,2,4],center=false);
  }
  for(i=[0:horn_count-1]) assign(cc=pointOnSphere(radius=10.0,k=i,N=horn_count)) {
    echo("  points: ",cc);
    echo("  cart2sphere: ",cart2sphere(cc[0],cc[1],cc[2]));
    rotate([0,cart2sphere(cc[0],cc[1],cc[2])[1]-90,cart2sphere(cc[0],cc[1],cc[2])[2] ])
        translate([cart2sphere(cc[0],cc[1],cc[2])[0],0,0])
	  rotate([0,90,0]) union() {
	    cylinder($fn=32,r1=2.0,r2=0,h=2.0);
	    cube(size=[3,3,1],center=false);
	  }
  }
}

if(test_object==1) {
  % color(0.1,0.1,0.1) sphere(r=8.0);
  map2PointsOnSphere(radius=8.0,N=128) cube(1.0,center=true);

  translate([15,0,0]) rotate([0,90,0]) union() {
    color([1,1,1]) cylinder($fn=32,r1=1.0,r2=0,h=10.0);
    cube(size=[2,2,4],center=false);
  }

  for(i=[0:spt_count-1]) translate2PointOnSphere(radius=12.0,k=i,N=spt_count) {
    cube(1.0,center=false);
    color([1,0,0]) cylinder($fn=7,r1=1,r2=0,h=5);
  }
  for(i=[0:spt_count-1]) translate2PointOnSphere(radius=13.0,k=i,N=spt_count,align=true) {
    cube(1.0,center=false);
    color([1,1,0]) cylinder($fn=7,r1=1,r2=0,h=5);
  }

  for(i=[0:horn_count-1]) radial2PointOnSphere(radius=8.0,k=i,N=horn_count) {
	    color([0,1,0]) cylinder($fn=32,r1=2.0,r2=0,h=2.0);
	    cube(size=[3,3,1],center=false);
  }
  for(i=[0:horn_count-1]) radial2PointOnSphere(radius=9.0,k=i,N=horn_count,align=true) {
	    color([0,0,1]) cylinder($fn=32,r1=2.0,r2=0,h=2.0);
	    cube(size=[3,3,1],center=false);
  }
}

hull_cone_count=17;
if(test_object==2) {
  for(i=[0:hull_cone_count-1]) union() {
    hull() {
      sphere($fn=9,r=3.0);
      radial2PointOnSphere(radius=20.0,k=i,N=hull_cone_count,align=false) rotate([-90,0,0]) cylinder($fn=7,r1=1,r2=3,h=6.0);
    }
    hull() {
      radial2PointOnSphere(radius=20.0,k=i,N=hull_cone_count,align=false) rotate([-90,0,0]) cylinder($fn=7,r1=1,r2=3,h=6.0);
      radial2PointOnSphere(radius=30.0,k=i,N=hull_cone_count,align=true) cylinder($fn=7,r1=3.0,r2=0,h=12.0);
    }
  }
}

ball_sides=61;
ball_radius=30.0;
dimple_radius_scale=ball_sides;
dimple_radius=dimple_radius_scale*ball_radius/ball_sides;
if(test_object==3) {
  % translate([-ball_radius,0,0]) cube(ball_radius);
    intersection_for(i=[0:ball_sides-1]) radial2PointOnSphere(radius=ball_radius,k=i,N=ball_sides,align=true) render() difference() {
      translate([-2*ball_radius,-2*ball_radius,-2*ball_radius]) cube(size=[4*ball_radius,4*ball_radius,6*ball_radius],center=false);
      translate([0,0,-2*ball_radius-sqrt(dimple_radius_scale-3)*dimple_radius/sqrt(dimple_radius_scale)]) sphere($fn=32,r=dimple_radius);
  }
}
