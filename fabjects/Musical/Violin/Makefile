OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

BUILD_DIR = ./build

DXF_FILES = violin_strad_all_2d.dxf \
	violin_fhole_2d.dxf \
	violin_strad_w_fhole_2d.dxf \
	violin_purfling_2d.dxf
	

STL_FILES = violin_strad_quantized_64pt.stl \
	violin_strad_quantized_8pt.stl \
	violin_strad_contours_all.stl \
	violin_strad_contours_interp_8pt.stl \
	violin_strad_minkowsky.stl

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"
	@echo "  make dxf_files"
	@echo "  make stl_files"
	@echo "DXF Files:"
	@echo " $(DXF_FILES)"
	@echo "STL FILES:"
	@echo " $(STL_FILES)"

all : $(BUILD_DIR) $(DXF_FILES) $(STL_FILES)

dxf_files: $(BUILD_DIR) $(DXF_FILES)

stl_files : $(STL_FILES)

$(BUILD_DIR) :
	mkdir -p $(BUILD_DIR)

violin_strad_all_2d.dxf :
	$(OPENSCAD) -D render_part=3 -x $(BUILD_DIR)/$@ violin_basic.scad

violin_fhole_2d.dxf :
	$(OPENSCAD) -D render_part=4 -x $(BUILD_DIR)/$@ violin_basic.scad

violin_strad_w_fhole_2d.dxf :
	$(OPENSCAD) -D render_part=5 -x $(BUILD_DIR)/$@ violin_basic.scad

violin_strad_quantized_64pt.stl :
	$(OPENSCAD) -D render_part=6 -s $(BUILD_DIR)/$@ violin_basic.scad

violin_strad_quantized_8pt.stl :
	$(OPENSCAD) -D render_part=7 -s $(BUILD_DIR)/$@ violin_basic.scad

violin_purfling_2d.dxf :
	$(OPENSCAD) -D render_part=10 -x $(BUILD_DIR)/$@ violin_basic.scad

violin_strad_contours_all.stl :
	$(OPENSCAD) -D render_part=11 -s $(BUILD_DIR)/$@ violin_basic.scad

violin_strad_contours_interp_8pt.stl :
	$(OPENSCAD) -D render_part=12 -s $(BUILD_DIR)/$@ violin_basic.scad

violin_strad_minkowsky.stl :
	$(OPENSCAD) -D render_part=13 -s $(BUILD_DIR)/$@ violin_basic.scad

