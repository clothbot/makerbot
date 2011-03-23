// Sight Mount Side Profile
// scale 1 unit = 1 inch
render_part=1; // MaverickRev6_SideProfile()
function NerfTacticalRail_Length() = 3.5;

MaverickRev6_SightMount_SideProfile_Num_Pts=17;
module MaverickRev6_SightMount_SideProfile() {
  polygon( points=[
	[0,0], [0,0.25]
	, [0.74,0.25], [0.8,0.19], [1.0,0.19], [1.06,0.25]
	, [1.34,0.25], [1.4,0.19], [1.6,0.19], [1.66,0.25]
	, [2.54,0.25], [2.6,0.19], [2.8,0.19], [2.86,0.25]
	, [3.5, 0.25], [3.5,0], [0,0]
	]
	, paths=[ [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16] ]
	, convexity=10);
}

if(render_part==1) {
  echo("Rendering MaverickRev6_SightMount_SideProfile()...");
  MaverickRev6_SightMount_SideProfile();
}

