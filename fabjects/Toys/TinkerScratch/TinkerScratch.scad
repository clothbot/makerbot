// Tinker Toy compatible Back Scratcher

function scale_in()=25.4;
function TinkerToy_rod_d(tol=0.0) = scale_in()*(3/8+tol);
function TinkerToy_hole_d(tol=0.01) = scale_in()*(3/8+tol);
function TinkerToy_wall_th(tol=0.0) = 4.0;

number_of_claws=5;

module TinkerScratch(paw_r=25.0,claw_count=number_of_claws) {
  difference() {
     union() {
      cylinder(r=paw_r,h=TinkerToy_rod_d()+2*TinkerToy_wall_th());
      for(i=[0:(claw_count-1)%8]) assign(rotAngle=360*i/8) rotate([0,0,rotAngle]) {
	  translate([paw_r-TinkerToy_wall_th(),-2*TinkerToy_wall_th(),0]) 
	    cube(size=[4*TinkerToy_wall_th(),4*TinkerToy_wall_th(),TinkerToy_rod_d()+2*TinkerToy_wall_th()],center=false);
	  translate([paw_r,0,TinkerToy_rod_d()+2*TinkerToy_wall_th()]) rotate([90,0,0]) difference() {
	    cylinder(r=paw_r/2,h=2*TinkerToy_wall_th(),center=true);
	    translate([-paw_r/3,paw_r/2,0]) cylinder(r=paw_r/2,h=3*TinkerToy_wall_th(),center=true);
	  }
	 }
     }
    translate([0,0,TinkerToy_wall_th()+TinkerToy_rod_d()/2])
	cylinder(r=TinkerToy_hole_d()/2,h=TinkerToy_rod_d()+3*TinkerToy_wall_th(),center=true);
    for(i=[0:7]) assign(rotAngle=360*i/8) rotate([0,0,rotAngle]) {
      translate([paw_r,0,TinkerToy_wall_th()+TinkerToy_rod_d()/2]) rotate([0,90,0]) cylinder(r=TinkerToy_hole_d()/2,h=3*paw_r/2,center=true);
    }
  }
}

TinkerScratch();

