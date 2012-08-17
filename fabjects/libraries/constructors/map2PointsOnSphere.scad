// Points on sphere module
// Derived from http://www.softimageblog.com/archives/115

test_object=0; // direct test
test_object=1; // module test
test_object=2; // spike ball
test_object=3; // ball test
test_object=4; // dimpled ball
test_object=5; // ribbon ball
test_object=6; // ball gear
test_object=7; // ball socket
test_object=8; // sphere stand

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

function sphere_surface_area(r)=4*pi()*pow(r,2);
function sphere_volume(r)=4*pi()*pow(r,3)/3;

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

module radial2PointOnSphere(radius=1.0,k,N,align=false,hemisphere=false) {
  // Spherical Coordinate Mapping
  for( i=[0:$children-1] ) assign(cc=pointOnSphere(radius=radius,k=k,N=N),cc0=pointOnSphere(radius=radius,k=0,N=N)) 
    assign(rx=0
	,ry=cart2sphere(cc[0],cc[1],cc[2])[1]-((align==true) ? cart2sphere(cc0[0],cc0[1],cc0[2])[1]:90)
	,rz=cart2sphere(cc[0],cc[1],cc[2])[2]-((align==true) ? cart2sphere(cc0[0],cc0[1],cc0[2])[2]:0)
	) {
    rotate([rx,ry,rz]) if(hemisphere==false || ry>0.0) 
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

ball_sides= pow(7,3);
ball_radius=30.0;
ball_surface_area=sphere_surface_area(ball_radius);
ball_volume=sphere_volume(ball_radius);

module ball(r,align=false) {
  ball_sides=$fn;
  intersection_for(i=[0:ball_sides-1]) radial2PointOnSphere(radius=r,k=i,N=ball_sides,align=true) render()
    translate([-2*r,-2*r,-2*r]) cube(size=[4*r,4*r,6*r],center=false);
}

if(test_object==3) {
  echo("Ball:");
  echo( str("  Sides: ",ball_sides) );
  echo( str("  Radius: ",ball_radius) );
  echo( str("  Surface Area: ",ball_surface_area ) );
  echo( str("  Volume: ",ball_volume ) );
  echo( str("  Surface Area/Side: ",ball_surface_area/ball_sides) );
  echo( str("  sqrt(Surface Area/Side): ",sqrt(ball_surface_area/ball_sides) ) );
  % translate([-ball_radius,0,0]) cube(ball_radius);
  ball($fn=ball_sides,r=ball_radius,align=true);
}

dimple_radius_scale=ball_sides;
dimple_radius=dimple_radius_scale*ball_radius/ball_sides;

if(test_object==4) {
  echo("Dimpled ball:");
  echo( str("  Sides: ",ball_sides) );
  echo( str("  Radius: ",ball_radius) );
  echo( str("  Surface Area: ",ball_surface_area ) );
  echo( str("  Volume: ",ball_volume ) );
  echo( str("  Surface Area/Side: ",ball_surface_area/ball_sides) );
  echo( str("  sqrt(Surface Area/Side): ",sqrt(ball_surface_area/ball_sides) ) );

  % translate([-ball_radius,0,0]) cube(ball_radius);
    intersection_for(i=[0:ball_sides-1]) radial2PointOnSphere(radius=ball_radius,k=i,N=ball_sides,align=true) render() difference() {
      translate([-4*ball_radius,-4*ball_radius,-2*ball_radius]) cube(size=[8*ball_radius,8*ball_radius,6*ball_radius],center=false);
      translate([0,0,-2*ball_radius-sqrt(dimple_radius_scale-3)*dimple_radius/sqrt(dimple_radius_scale)]) sphere($fn=32,r=dimple_radius);
  }
}

ribbon_vertex_count=pow(5,3);
ribbon_ball_radius=25.0;
ribbon_th=3.0;
ribbon_ball_surface_area=sphere_surface_area(ribbon_ball_radius);
ribbon_ball_volume=sphere_volume(ribbon_ball_radius);
ribbon_width=0.707*sqrt(ribbon_ball_surface_area/ribbon_vertex_count);

if(test_object==5) {
  echo("Ribbon ball...");
  % sphere($fn=ribbon_vertex_count,r=ribbon_ball_radius);
  union() for(i=[0:ribbon_vertex_count-2]) difference() {
    hull() {
        radial2PointOnSphere(radius=ribbon_ball_radius,k=i,N=ribbon_vertex_count,align=true) cylinder($fn=8,r=ribbon_width/2,h=ribbon_th);
        radial2PointOnSphere(radius=ribbon_ball_radius,k=i+1,N=ribbon_vertex_count,align=true) cylinder($fn=8,r=ribbon_width/2,h=ribbon_th);
    }
    cube(size=[2*ribbon_ball_radius,2*ribbon_ball_radius,2*ribbon_ball_radius],center=false);
  }
}

ball_gear_tooth_h=1.0;
ball_gear1_teeth=pow(5,3);
ball_gear1_radius=25.0;
ball_gear1_surface_area=sphere_surface_area(ball_gear1_radius);
ball_gear1_tooth_surface_area=ball_gear1_surface_area/ball_gear1_teeth;
// circle_area=pi()*pow(r,2); circle_r=sqrt(circle_area/pi());
ball_gear1_tooth_r=sqrt(ball_gear1_tooth_surface_area/pi());

ball_gear2_sockets=pow(5,3);
ball_gear2_socket_r=ball_gear1_tooth_r;
ball_gear2_tooth_surface_area=pi()*pow(ball_gear2_socket_r,2);
ball_gear2_surface_area=ball_gear2_sockets*ball_gear2_tooth_surface_area;
// sphere_area=4*pi()*pow(r,2); sphere_r=sqrt(sphere_area/(4*pi()));
ball_gear2_radius=sqrt(ball_gear2_surface_area/(4*pi()));

ball_gear2gear_space=1.0;

if(test_object==6) {
  echo("Simple ball gear example");
  union() {
    sphere(r=ball_gear1_radius);
    for(i=[0:ball_gear1_teeth-1]) radial2PointOnSphere(radius=ball_gear1_radius,k=i,N=ball_gear1_teeth,align=true)
	cylinder($fn=8,r1=ball_gear1_tooth_r/sqrt(2),r2=ball_gear1_tooth_r/2,h=2*ball_gear_tooth_h,center=true);
  }
}
if(test_object==7) {
  echo("Simple ball gear socket example");
  // translate([-ball_gear1_radius-ball_gear2_radius-ball_gear_tooth_h-ball_gear2gear_space,0,0]) 
  mirror([1,0,0]) difference() {
    sphere(r=ball_gear2_radius);
    for(i=[0:ball_gear2_sockets-1]) radial2PointOnSphere(radius=ball_gear2_radius,k=i,N=ball_gear2_sockets,align=true)
	translate([0,0,-1.5*ball_gear_tooth_h]) cylinder($fn=12,r2=ball_gear2_socket_r,r1=ball_gear2_socket_r/2,h=3*ball_gear_tooth_h);
  }
}

hemisphere_stand_points=20;
hemisphere_stand_radius=25.0;
hemisphere_surface_area=sphere_surface_area(hemisphere_stand_radius);
hemisphere_surface_disc_area=hemisphere_surface_area/(2*hemisphere_stand_points);
hemisphere_surface_disc_r=sqrt(hemisphere_surface_disc_area/pi());
hemisphere_surface_disc_th=3.0;
hemisphere_stand_base_th=5.0;
hemisphere_stand_base_radius=hemisphere_stand_radius+2*hemisphere_surface_disc_th+hemisphere_stand_base_th;

if(test_object==8) {
  % translate([0,0,hemisphere_stand_radius+3*hemisphere_surface_disc_th])
	sphere(r=hemisphere_stand_radius+hemisphere_surface_disc_th);
  cylinder(r=hemisphere_stand_base_radius,h=hemisphere_stand_base_th,center=true);
  for(i=[0:2*hemisphere_stand_points-1]) assign(
	cch=pointOnSphere(radius=hemisphere_stand_radius+hemisphere_surface_disc_th,k=i,N=2*hemisphere_stand_points) 
	, cch0=pointOnSphere(radius=hemisphere_stand_radius+hemisphere_surface_disc_th,k=0,N=2*hemisphere_stand_points)
	)
    assign( csh=cart2sphere(cch[0],cch[1],cch[2]), csh0=cart2sphere(cch0[0],cch0[1],cch0[2]) ) {
	echo("csh:",csh," csh0:",csh0);
	if( (csh[1]-csh0[1])>30 ) hull() {
      translate([0,0,hemisphere_stand_radius+3*hemisphere_surface_disc_th]) radial2PointOnSphere(radius=hemisphere_stand_radius+hemisphere_surface_disc_th,k=i,N=2*hemisphere_stand_points,align=true,hemisphere=false) difference() {
	  cylinder($fn=16,r=hemisphere_surface_disc_r,h=hemisphere_surface_disc_th);
	  cylinder($fn=16,r=hemisphere_surface_disc_r/2,h=2*hemisphere_surface_disc_th);
	 }
      render() linear_extrude(height=hemisphere_surface_disc_th) projection(cut=false)
	  radial2PointOnSphere(radius=hemisphere_stand_radius+hemisphere_surface_disc_th,k=i,N=2*hemisphere_stand_points,align=true,hemisphere=false) difference() {
	    cylinder($fn=16,r=hemisphere_surface_disc_r,h=hemisphere_surface_disc_th);
	    cylinder($fn=16,r=hemisphere_surface_disc_r/2,h=2*hemisphere_surface_disc_th);
	  }
	}
  }
}



