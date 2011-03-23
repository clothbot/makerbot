// Points for the sight mount cross-section
// scale 1 unit = 1 inch
render_part=1; // MaverickRev6_SightMount_XSection
function NerfTacticalRail_OuterHeight() = 0.25;
function NerfTacticalRail_InnerHeight() = 0.15;
function NerfTacticalRail_OuterWidth() = 0.7;
function NerfTacticalRail_InnerWidth() = 0.5;

MaverickRev6_SightMount_XSection_Num_Pts = 15;
module MaverickRev6_SightMount_XSection() {
  polygon( points=[
	[0,0], [0.25,0], [0.25,0.15], [0.35,0.15], [0.35,0.25]
	, [0.25,0.25], [0.16,0.19]
	, [0,0.19]
	, [-0.16,0.19], [-0.25,0.25]
	, [-0.35,0.25], [-0.35,0.15], [-0.25,0.15], [-0.25,0], [0,0]
	]
	, paths=[ [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14] ]
	, convexity=10);
}

if(render_part==1) {
  echo("Rendering MaverickRev6_SightMount_XSection()...");
  MaverickRev6_SightMount_XSection();
}

