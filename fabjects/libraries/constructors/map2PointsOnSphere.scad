// Points on sphere module
// Derived from http://www.softimageblog.com/archives/115

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

% color(0.1,0.1,0.1) sphere(r=8.0);
map2PointsOnSphere(radius=8.0,N=128) cube(1.0,center=true);

spt_count=6;
for(i=[0:spt_count-1]) assign(cc=pointOnSphere(radius=10.0,k=i,N=spt_count)) translate(cc) {
  cube(1.0,center=false);
  cylinder($fn=7,r1=1,r2=0,h=5);
}


translate([10,0,0]) rotate([0,90,0]) union() {
  cylinder($fn=32,r1=1.0,r2=0,h=10.0);
  cube(size=[2,2,4],center=false);
}
horn_count=6;
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
