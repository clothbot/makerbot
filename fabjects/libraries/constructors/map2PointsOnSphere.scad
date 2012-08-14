// Points on sphere module
// Derived from http://www.softimageblog.com/archives/115

M_PI=3.14159265358979323846;

module map2PointsOnSphere(radius=1.0,N=3) assign(
  inc= M_PI*(3-sqrt(5))
  , off=2/N) {
  for(k=[0:N-1]) assign(
    y = k*off-1+(off/2)
    , r = sqrt(1-(k*off-1+(off/2))*(k*off-1+(off/2)))
    , phi=k*inc ) {
	translate([radius*cos(360*phi/(2*M_PI))*r,radius*y,radius*sin(360*phi/(2*M_PI))*r]) child(0);
  }
}

# sphere(r=10.0);
map2PointsOnSphere(radius=10.0,N=300) cube(1.0,center=true);

    