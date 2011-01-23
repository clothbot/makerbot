OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

BUILD_DIR = ./build

DXF_FILES = drive_gear_w_hub_holes.dxf \
	roller_gear_w_hub_holes.dxf \
	outer_gear.dxf \
	outer_gear_w_mount_holes.dxf \
	outer_tube_retainer.dxf \
	outer_tube_retainer_w_exit.dxf \
	roller_gear_tube_retainer.dxf \
	roller_gear_tube_compressor.dxf \
	roller_gear_rim.dxf \
	drive_gear_rim.dxf \
	outer_gear_rim.dxf

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"
	@echo "DXF Files:"
	@echo "	$(DXF_FILES)"

all :  $(BUILD_DIR) $(DXF_FILES)

$(BUILD_DIR) :
	mkdir -p $(BUILD_DIR)

drive_gear_w_hub_holes.dxf : 
	$(OPENSCAD) -D render_part=1 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_w_hub_holes.dxf :
	$(OPENSCAD) -D render_part=2 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear.dxf :
	$(OPENSCAD) -D render_part=3 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear_w_mount_holes.dxf :
	$(OPENSCAD) -D render_part=4 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_tube_retainer.dxf :
	$(OPENSCAD) -D render_part=5 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_tube_retainer.dxf :
	$(OPENSCAD) -D render_part=6 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_tube_compressor.dxf :
	$(OPENSCAD) -D render_part=7 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_rim.dxf :
	$(OPENSCAD) -D render_part=8 -x $(BUILD_DIR)/$@ render_pump_parts.scad

drive_gear_rim.dxf :
	$(OPENSCAD) -D render_part=9 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear_rim.dxf :
	$(OPENSCAD) -D render_part=10 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_tube_retainer_w_exit.dxf :
	$(OPENSCAD) -D render_part=11 -x $(BUILD_DIR)/$@ render_pump_parts.scad

clean :
	$(RM) -r $(BUILD_DIR)
