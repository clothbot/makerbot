OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"
	@echo "  make drive_gear.dxf"
	@echo "  make roller_gear.dxf"
	@echo "  make outer_gear.dxf"
#	@echo "  make drive_gear.stl"
#	@echo "  make roller_gear.stl"
#	@echo "  make outer_gear.stl"

# all : drive_gear.dxf roller_gear.dxf outer_gear.dxf
all : drive_gear.stl roller_gear.stl outer_gear.stl

drive_gear.scad :
	echo "use <planetary_gears.scad>" > drive_gear.scad
	echo "if(render_part==1) drive_gear_dxf(" >> drive_gear.scad
	echo "	clearance=0.1" >> drive_gear.scad
	echo "	, outer_wall_th=5.0" >> drive_gear.scad
	echo "	, drive_gear_pitch_d=33" >> drive_gear.scad
	echo "	, drive_gear_pitch_num_teeth=33" >> drive_gear.scad
	echo "	, drive_gear_axle_d=3.0" >> drive_gear.scad
	echo "	, pressure_angle=26" >> drive_gear.scad
	echo "	, shrink=1" >> drive_gear.scad
	echo ");" >> drive_gear.scad
	echo "if(render_part==2) linear_extrude(file="'"'"drive_gear.dxf"'"'",height=4.0);" >> drive_gear.scad

drive_gear.dxf : drive_gear.scad
	$(OPENSCAD) -D render_part=1 -x drive_gear.dxf drive_gear.scad

drive_gear.stl : drive_gear.dxf
	$(OPENSCAD) -D render_part=2 -s drive_gear.stl drive_gear.scad

roller_gear.scad :
	echo "use <planetary_gears.scad>" > roller_gear.scad
	echo "if(render_part==1) roller_gear_dxf(" >> roller_gear.scad
	echo "	clearance=0.1" >> roller_gear.scad
	echo "	,outer_wall_th=5.0" >> roller_gear.scad
	echo "	,roller_gear_pitch_d=27" >> roller_gear.scad
	echo "	,roller_gear_pitch_num_teeth=27" >> roller_gear.scad
	echo "	,roller_gear_axle_d=3.0" >> roller_gear.scad
	echo "	,pressure_angle=26" >> roller_gear.scad
	echo "	,shrink=1" >> roller_gear.scad
	echo ");" >> roller_gear.scad
	echo "if(render_part==2) linear_extrude(file="'"'"roller_gear.dxf"'"'",height=4.0);" >> roller_gear.scad

roller_gear.dxf : roller_gear.scad
	$(OPENSCAD) -D render_part=1 -x roller_gear.dxf roller_gear.scad

roller_gear.stl : roller_gear.dxf
	$(OPENSCAD) -D render_part=2 -s roller_gear.stl roller_gear.scad

outer_gear.scad :
	echo "use <planetary_gears.scad>" > outer_gear.scad
	echo "if(render_part==1) outer_gear_dxf(" >> outer_gear.scad
	echo "	clearance=0.1" >> outer_gear.scad
	echo "	, outer_wall_th=5.0" >> outer_gear.scad
	echo "	, outer_gear_pitch_d=27" >> outer_gear.scad
	echo "	, outer_gear_pitch_num_teeth=27" >> outer_gear.scad
	echo "	, outer_gear_axle_d=3.0" >> outer_gear.scad
	echo "	, pressure_angle=26" >> outer_gear.scad
	echo "	, shrink=1" >> outer_gear.scad
	echo ");" >> outer_gear.scad
	echo "if(render_part==2) linear_extrude(file="'"'"outer_gear.dxf"'"'",height=4.0);" >> outer_gear.scad

outer_gear.dxf : outer_gear.scad
	$(OPENSCAD) -D render_part=1 -x outer_gear.dxf outer_gear.scad

outer_gear.stl : outer_gear.dxf
	$(OPENSCAD) -D render_part=2 -s outer_gear.stl outer_gear.scad

clean :
	$(RM) roller_gear.scad drive_gear.scad outer_gear.scad
	$(RM) roller_gear.dxf drive_gear.dxf outer_gear.dxf
	$(RM) roller_gear.stl drive_gear.stl outer_gear.stl
