// ClothBot Sewable Connectors

scale_1in=25.4;

//render_part=1; // CB_Sewable_Socket_Holes()
// render_part=2; // CB_Sewable_Peg_Holes()
// render_part=3; // CB_Sewable_Socket_2x2()
// render_part=4; //   CB_Sewable_Plug_2x2();
// render_part=5; //   minkowski sum CB_Sewable_Plug_2x2();
// render_part=6; // CB_Sewable_Socket_2x2_0p1_SIP()
// render_part=7; // CB_Sewable_Channel()
render_part=8; //   CB_Sewable_Socket_2x2_0p1_Channels();

module CB_Sewable_Socket_Holes(extension=0.1
	, hole_d=4.9
	, thread_d=1.0
	, hole_h=1.8
	, thread_h=3.2
	) {
  union() {
    translate([0,0,thread_h-hole_h])
      cylinder($fs=0.1,$fa=15,r=hole_d/2,h=hole_h+extension,center=false);
    for(i=[0:3]) assign(rotAngle=360*i/4+45) {
      rotate([0,0,rotAngle]) translate([hole_d/2-0.75*thread_d/2,0,-extension])
	cylinder($fn=6,r=thread_d/2,h=2*extension+thread_h,center=false);
	rotate([0,0,rotAngle]) translate([0.75*sqrt(2)*4.0,0,-extension])
	  cylinder($fn=6,r=thread_d/2,h=2*extension+thread_h,center=false);
    }
    rotate([0,0,45]) translate([0,0,thread_h]) rotate([90,0,0])
	cylinder($fn=8,r=thread_d/2,h=2*0.75*sqrt(2)*4+thread_d,center=true);
    rotate([0,0,45+90]) translate([0,0,thread_h]) rotate([90,0,0])
	cylinder($fn=8,r=thread_d/2,h=2*0.75*sqrt(2)*4+thread_d,center=true);
  }
}

if(render_part==1) {
  echo("Rendering CB_Sewable_Socket_Holes()...");
  CB_Sewable_Socket_Holes();
}

module CB_Sewable_Peg_Holes(extension=0.1
	, peg_d=4.9
	, thread_d=1.0
	, peg_h=1.8
	, thread_h=3.2+1.8
	) {
  union() {
    translate([0,0,-extension]) {
      cylinder($fn=8, r1=peg_d/2+extension,r2=0,h=peg_d/2+extension,center=false);
	cylinder($fn=8,r=thread_d/2,h=extension+thread_h+thread_d/4,center=false);
      for(i=[0:3]) assign(rotAngle=360*i/4+45) {
	  rotate([0,0,rotAngle]) {
	   translate([peg_d/2-0.25*thread_d/2,0,0])
	    cylinder($fn=8,r=thread_d/2,h=extension+thread_h+thread_d/2,center=false);
	   translate([0.75*sqrt(2)*4.0,0,0]) {
	    cylinder($fn=8,r=thread_d/2,h=extension+thread_h-peg_h+thread_d/2,center=false);
	    translate([0,0,extension+thread_h-peg_h]) rotate([0,-90,0])
	      cylinder($fn=8,r=thread_d/2,h=0.75*sqrt(2)*4-peg_d/2,center=false);
	   }
	  }
	}
    }
    translate([0,0,thread_h]) {
	rotate([45,90,0])
	  cylinder($fn=8,r=thread_d/2,h=peg_d+0.75*thread_d,center=true);
	rotate([-45,90,0])
	  cylinder($fn=8,r=thread_d/2,h=peg_d+0.75*thread_d,center=true);
    }
    
  }
}

if(render_part==2) {
  echo("Rendering CB_Sewable_Peg_Holes()...");
  CB_Sewable_Peg_Holes();
}

module CB_Sewable_Body_Builder(extension=0.1
	, x_n=2
	, x_space=8.0
	, y_n=2
	, y_space=8.0
	) {
  union() {
    for(i=[0:x_n-1]) {
	for(j=[0:y_n-1]) {
	  translate([x_space*i,y_space*j,0]) {
	    child(0);
	  }
	}
    }
    for(i=[0:x_n-2]) {
	for(j=[0:y_n-2]) {
	  translate([x_space*i+x_space/2,y_space*j+y_space/2,0]) {
	    child(1);
	  }
	}
    }
  }
}

module CB_Sewable_Socket_2x2(extension=0.1
	, x_n=2, x_space=8.0
	, y_n=2, y_space=8.0
	, body_h=4.0
	, hole_h=2.0
	, hole_d=4.9
	, thread_d=1.0
	) {
  $fs=0.1;
  $fa=15;
  difference() {
    CB_Sewable_Body_Builder( extension=extension
	, x_n=x_n, x_space=x_space
	, y_n=y_n, y_space=y_space
	) {
      cylinder(r=hole_d/2+1.0,h=body_h,center=false);
      cylinder(r=x_space/sqrt(2),h=body_h-hole_h/2,center=false);
    }
    CB_Sewable_Body_Builder( extension=extension
	, x_n=x_n, x_space=x_space
	, y_n=y_n, y_space=y_space
	) {
      CB_Sewable_Socket_Holes(extension=0.1
	  , hole_d=hole_d
	  , thread_d=1.0
	  , hole_h=hole_h
	  , thread_h=body_h
	  );
	translate([0,0,-extension])
	  cylinder(r=hole_d/2,h=body_h+2*extension,center=false);
    }
  }
}

if(render_part==3) {
  echo("Rendering CB_Sewable_Socket_2x2()...");
  CB_Sewable_Socket_2x2();
}

module CB_Sewable_Plug_2x2(extension=0.1
	, x_n=2, x_space=8.0
	, y_n=2, y_space=8.0
	, body_h=4.0
	, peg_h=2.0
	, peg_d=4.9
	, thread_d=1.0
	) {
  $fs=0.1;
  $fa=15;
  difference() {
    CB_Sewable_Body_Builder( extension=extension
	, x_n=x_n, x_space=x_space
	, y_n=y_n, y_space=y_space
	) {
      union() {
	cylinder(r=peg_d/2+2.0,h=body_h,center=false);
	cylinder(r=peg_d/2,h=body_h+peg_h,center=false);
      }
      cylinder(r=x_space/sqrt(2),h=body_h-peg_h/2,center=false);
    }
    CB_Sewable_Body_Builder( extension=extension
	, x_n=x_n, x_space=x_space
	, y_n=y_n, y_space=y_space
	) {
      CB_Sewable_Peg_Holes(extension=0.1
	, peg_d=peg_d
	, thread_d=thread_d
	, peg_h=peg_h
	, thread_h=body_h+peg_h
	);
	translate([0,0,-extension])
	  cylinder(r=peg_d/2,h=body_h+2*extension,center=false);
    }
  }
}

if(render_part==4) {
  echo("Rendering CB_Sewable_Plug_2x2()...");
  CB_Sewable_Plug_2x2();
}


if(render_part==5) {
  echo("Rendering minkowski of CB_Sewable_Plug_2x2() with cylinder...");
  minkowski() {
    CB_Sewable_Plug_2x2(thread_d=2.0);
    sphere(r=0.5);
  }
}

module CB_Sewable_Socket_2x2_0p1_SIP(extension=0.1
	, x_n=2, x_space=8.0
	, y_n=2, y_space=8.0
	, body_h=4.0
	, hole_h=2.0
	, hole_d=4.9
	, thread_d=1.0
	) {
  $fs=0.1;
  $fa=15;
  difference() {
    translate([-3*x_space/2,-3*y_space/2,0])
      cube(size=[(x_n+1)*x_space,(y_n+1.5)*y_space,body_h],center=false);
    translate([-x_space/2,0,0]) {
      CB_Sewable_Body_Builder( extension=extension
	  , x_n=x_n, x_space=x_space
	  , y_n=y_n, y_space=y_space
	  ) {
        CB_Sewable_Socket_Holes(extension=0.1
	    , hole_d=hole_d
	    , thread_d=1.0
	    , hole_h=hole_h
	    , thread_h=body_h
	  );
	}
	translate([-3*x_space/4,y_space/2,body_h/2]) rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
	translate([(x_n-1)*x_space+3*x_space/4,y_space/2,body_h/2]) rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
	translate([-3*x_space/4,3*y_space/2,body_h/2]) rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
	translate([(x_n-1)*x_space+3*x_space/4,3*y_space/2,body_h/2]) rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
    }
    translate([-3*0.1*scale_1in/2,-y_space,-extension]) {
      for(i=[0:3]) translate([i*0.1*scale_1in,-thread_d/2,0]) {
	translate([0,0,body_h/2]) rotate([0,0,45]) cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
	translate([0,(y_space/4+thread_d)/2,body_h]) rotate([0,45,0])
	  cube(size=[thread_d,y_space/4+thread_d,thread_d],center=true);
	translate([0,(y_space/4+thread_d),body_h/2]) rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
      }
    }
    translate([0,-y_space+(y_space/4+thread_d),body_h]) {
      rotate([45,0,0])
	cube(size=[(x_n+0.5)*x_space,thread_d,thread_d],center=true);
      translate([-(x_n+0.5)*x_space/2,0,-body_h/2]) {
	rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
      translate([0,y_space/2+y_space-(y_space/4+thread_d),body_h/2]) rotate([0,45,0])
	  cube(size=[thread_d,y_n*y_space+2*thread_d,thread_d],center=true);
      }
      translate([(x_n+0.5)*x_space/2,0,-body_h/2]) {
	rotate([0,0,45])
	  cube(size=[thread_d,thread_d,body_h+4*extension],center=true);
      translate([0,y_space/2+y_space-(y_space/4+thread_d),body_h/2]) rotate([0,45,0])
	  cube(size=[thread_d,y_n*y_space+2*thread_d,thread_d],center=true);
      }
    }
  }
}

if(render_part==6) {
  echo("Rendering CB_Sewable_Socket_2x2_0p1_SIP()...");
  CB_Sewable_Socket_2x2_0p1_SIP();
}

module CB_Sewable_Channel( extension=0.1
	, body_h=4.0
	, x_channel_h=1.5
	, x_channel_w=1.0
	, x_channel_l=2*0.1*scale_1in
	, y_channel_h=3.0
	, y_channel_w=1.0
	, y_channel_l=2*0.1*scale_1in
	, diag_channel_h=3.5
	, diag_channel_w=1.0
	, thread_d=1.0
	) {
  diag_channel_l=sqrt(x_channel_l*x_channel_l+y_channel_l*y_channel_l)/2;
  union() {
    translate([0,0,body_h/2]) {
      cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([-x_channel_l/2,0,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([x_channel_l/2,0,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([0,y_channel_l/2,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([0,-y_channel_l/2,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([x_channel_l/2,y_channel_l/2,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([-x_channel_l/2,y_channel_l/2,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([-x_channel_l/2,-y_channel_l/2,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
      translate([x_channel_l/2,-y_channel_l/2,0]) cube(size=[thread_d,thread_d,2*extension+body_h],center=true);
    }
    translate([0,0,x_channel_h]) {
      translate([0,0,(body_h-x_channel_h+extension)/2])
	cube(size=[x_channel_l+2*extension,x_channel_w,body_h-x_channel_h+extension],center=true);
      rotate([45,0,0])
	cube(size=[x_channel_l+2*extension,x_channel_w,x_channel_w],center=true);
    }
    translate([0,0,y_channel_h]) {
      translate([0,0,(body_h-y_channel_h+extension)/2])
	cube(size=[y_channel_w,y_channel_l+2*extension,body_h-y_channel_h+extension],center=true);
      rotate([0,45,0])
	cube(size=[y_channel_w,x_channel_l+2*extension,y_channel_w],center=true);
    }
    translate([0,0,diag_channel_h]) {
      translate([0,0,(body_h-diag_channel_h+extension)/2]) {
	rotate([0,0,45]) cube(size=[diag_channel_l+2*extension,diag_channel_l+2*extension,body_h-diag_channel_h+extension], center=true);
	translate([x_channel_l/4,y_channel_l/4,0]) rotate([0,0,45])
	  cube(size=[diag_channel_l+2*extension,diag_channel_w,body_h-diag_channel_h+extension], center=true);
	translate([-x_channel_l/4,-y_channel_l/4,0]) rotate([0,0,45])
	  cube(size=[diag_channel_l+2*extension,diag_channel_w,body_h-diag_channel_h+extension], center=true);
	translate([-x_channel_l/4,y_channel_l/4,0]) rotate([0,0,-45])
	  cube(size=[diag_channel_l+2*extension,diag_channel_w,body_h-diag_channel_h+extension], center=true);
	translate([x_channel_l/4,-y_channel_l/4,0]) rotate([0,0,-45])
	  cube(size=[diag_channel_l+2*extension,diag_channel_w,body_h-diag_channel_h+extension], center=true);
      }
    }
  }
}

if(render_part==7) {
  echo("Rendering CB_Sewable_Channel()...");
  CB_Sewable_Channel();
}

module CB_Sewable_Socket_2x2_0p1_Channels(extension=0.1
	, x_n=2, x_space=8.0
	, y_n=2, y_space=8.0
	, body_h=4.0
	, hole_h=2.0
	, hole_d=4.9
	, thread_d=1.0
	, x_channel_h=1.5
	, x_channel_w=1.0
	, x_channel_l=2*0.1*scale_1in
	, y_channel_h=3.0
	, y_channel_w=1.0
	, y_channel_l=2*0.1*scale_1in
	, diag_channel_h=3.5
	, diag_channel_w=1.0
	) {
  $fs=0.1;
  $fa=15;
  difference() {
    translate([-2*x_space,-2*y_space,0])
      cube(size=[(x_n+2)*x_space,(y_n+2)*y_space,body_h],center=false);
    translate([-x_space/2,-y_space/2,0]) {
      CB_Sewable_Body_Builder( extension=extension
	  , x_n=x_n, x_space=x_space
	  , y_n=y_n, y_space=y_space
	  ) {
        CB_Sewable_Socket_Holes(extension=0.1
	    , hole_d=hole_d
	    , thread_d=1.0
	    , hole_h=hole_h
	    , thread_h=body_h
	  );
	}
    }
    for(i=[-2,2]) for(j=[-2:2]) translate([i*x_channel_l,j*y_channel_l,0])
      CB_Sewable_Channel( extension=extension
	  , body_h=body_h , thread_d=thread_d
	  , x_channel_h=x_channel_h , x_channel_w=x_channel_w , x_channel_l=x_channel_l
	  , y_channel_h=y_channel_h , y_channel_w=y_channel_w , y_channel_l=y_channel_l
	  , diag_channel_h=diag_channel_h , diag_channel_w=diag_channel_w
      );
    for(i=[-1:1]) for(j=[-2,2]) translate([i*x_channel_l,j*y_channel_l,0])
      CB_Sewable_Channel( extension=extension
	  , body_h=body_h , thread_d=thread_d
	  , x_channel_h=x_channel_h , x_channel_w=x_channel_w , x_channel_l=x_channel_l
	  , y_channel_h=y_channel_h , y_channel_w=y_channel_w , y_channel_l=y_channel_l
	  , diag_channel_h=diag_channel_h , diag_channel_w=diag_channel_w
      );
  }
}

if(render_part==8) {
  echo("Rendering CB_Sewable_Socket_2x2_0p1_Channels()...");
  CB_Sewable_Socket_2x2_0p1_Channels();
}
