// ClothBot Sewable Connectors

render_part=1; // CB_Sewable_Socket_Holes()
render_part=2; // CB_Sewable_Peg_Holes()

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
    }
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
	rotate([0,0,rotAngle]) translate([peg_d/2-0.25*thread_d/2,0,0])
	  cylinder($fn=8,r=thread_d/2,h=extension+thread_h+thread_d/2,center=false);
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
