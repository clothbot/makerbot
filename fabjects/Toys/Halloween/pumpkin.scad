// Parametric Pumpkin

render_part="pumpkin_body";
//render_part="pumpkin_hollow";
render_part="hollow_pumpkin";
//render_part="pumpkin_face_parts";
//render_part="pumpkin_face";
//render_part="hollow_pumpkin_w_face";
render_part="large_pumpkin_w_10mm_LED";


module lobe(a=30,truncate=true) {
  difference() {
    union() {
	sphere($fn=32,r=0.5);
	translate([0,0,-0.5*cos(a)]) rotate([180,0,0]) cylinder($fn=32,r1=0.5*sin(a),r2=0,h=0.5*sin(a)/tan(90-a),center=false);
    }
    if(truncate) translate([0,0,-0.5]) rotate([180,0,0]) cylinder(r=0.5,h=1.0);
  }
}

module pumpkin_body(diam=20.0,lobes=9) {
  cylinder(r=diam/4,h=diam/20,center=false);
  translate([0,0,diam/2]) union() {
    sphere($fn=32,r=0.5*diam);
    for(i=[0:lobes-1]) rotate([0,0,360*i/lobes]) translate([0,2*diam/lobes,0])
      scale([diam*(1-2/lobes),diam*(1-2/lobes),diam]) lobe(a=30,truncate=true); 
  }
}

if(render_part=="pumpkin_body") {
  echo("Rendering pumpkin_body()...");
  pumpkin_body();
}

module pumpkin_hollow(diam=20.0,lobes=9,wall_th=0.8, bottom_hole_d=5.5) {
  translate([0,0,diam/2]) {
    sphere($fn=32,r=0.5*(diam-wall_th));
    for(i=[0:lobes-1]) rotate([0,0,360*i/lobes]) translate([0,2*diam/lobes,0])
	scale([(diam-2*wall_th)*(1-2/lobes),(diam-2*wall_th)*(1-2/lobes),diam-2*wall_th]) rotate([180,0,0]) lobe(a=30,truncate=false);
    translate([0,0,diam/2-diam/lobes]) cylinder($fn=lobes,r1=diam/lobes,r2=3*diam/lobes,h=3*diam/lobes,center=true);
  }
  cylinder($fn=16,r=bottom_hole_d/2,h=4*wall_th,center=true);
}

if(render_part=="pumpkin_hollow") {
  echo("Rendering pumpkin_hollow()...");
  % pumpkin_body();
  pumpkin_hollow();
}

module hollow_pumpkin(diam=20.0,lobes=9,wall_th=0.8,bottom_hole_d=5.5) {
  render() difference() {
    pumpkin_body(diam=diam,lobes=lobes);
    pumpkin_hollow(diam=diam,lobes=lobes,wall_th=wall_th,bottom_hole_d=bottom_hole_d);
  }
}

if(render_part=="hollow_pumpkin") {
  echo("Rendering hollow_pumpkin()...");
  hollow_pumpkin(diam=30.0,bottom_hole_d=10.5);
}

module pumpkin_mask(diam=20.0,lobes=9,wall_th=0.8) {
  for(i=[0:$children-1]) intersection() {
    hollow_pumpkin(diam=diam,lobes=lobes,wall_th=wall_th);
    child(i);
  }
}

module pumpkin_face_parts(diam=20.0,lobes=9,wall_th=0.8) {
    // eyes
    translate([0,0,3*diam/4]) {
	rotate([90,0,30]) rotate([0,0,-30]) cylinder($fn=3,r=diam/10,h=diam,center=false);
	rotate([90,0,-30]) rotate([0,0,-30]) cylinder($fn=3,r=diam/10,h=diam,center=false);
    }
    // nose
    translate([0,0,diam/2+diam/16]) {
	rotate([90,0,0]) rotate([0,0,-30]) cylinder($fn=3,r=diam/8,h=diam,center=false);
    }
    // mouth
    translate([0,0,diam/4+diam/8]) {
	rotate([90,0,0]) render() difference() {
	  scale([1.5,0.5,1]) cylinder(r=diam/4,h=diam,center=false);
	  scale([1.5,0.5,1]) translate([0,diam/8,0]) cylinder(r=diam/4,h=diam,center=false);
	  translate([-diam/10,-diam/17,0]) rotate([0,0,-90-45]) cube([diam/8,diam/8,diam],center=false);
	  translate([-diam/6,diam/12,0]) rotate([0,0,-90-45-12.5]) cube([diam/8,diam/8,diam],center=false);
	  translate([diam/10,-diam/17,0]) rotate([0,0,-90-45]) cube([diam/8,diam/8,diam],center=false);
	  translate([diam/6,diam/12,0]) rotate([0,0,-90-45+12.5]) cube([diam/8,diam/8,diam],center=false);
	}
    }
}

if(render_part=="pumpkin_face_parts") {
  echo("Rendering pumpkin_face_parts()...");
  pumpkin_face_parts();
}

module pumpkin_face(diam=20.0,lobes=9,wall_th=0.8) {
  % pumpkin_body(diam=diam,lobes=lobes);
  difference() {
    render() hollow_pumpkin(diam=diam,lobes=lobes,wall_th=2*wall_th);
    render() hollow_pumpkin(diam=diam,lobes=lobes,wall_th=wall_th);
  }
  pumpkin_mask(diam=diam,lobes=lobes,wall_th=wall_th) {
    pumpkin_face_parts(diam=diam,lobes=lobes,wall_th=wall_th);
  }
}

if(render_part=="pumpkin_face") {
  echo("Rendering pumpkin_face()...");
  pumpkin_face(wall_th=2*0.8);
}

if(render_part=="hollow_pumpkin_w_face") {
  echo("Rendering hollow_pumpkin_w_face...");
  difference() {
    hollow_pumpkin(wall_th=2*0.8);
    intersection() {
      hollow_pumpkin(wall_th=0.8);
      pumpkin_face_parts(wall_th=2*0.8);
    }
  }
}

if(render_part=="large_pumpkin_w_10mm_LED") {
  echo("Rendering large_pumpkin_w_10mm_LED...");
  difference() {
    hollow_pumpkin(wall_th=2*0.8,diam=30.0,bottom_hole_d=10.5);
    intersection() {
      hollow_pumpkin(wall_th=0.8,diam=30.0,bottom_hole_d=10.5);
      pumpkin_face_parts(wall_th=2*0.8,diam=30.0,bottom_hole_d=10.5);
    }
  }
}