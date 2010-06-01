OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

PRIMITIVES = unit_hexagon unit_teardrop_trunc

default : usage

usage :
	@echo "Usage: 'make all'"

all : $(PRIMITIVES)

$(PRIMITIVES) :
	@echo "Processing $@"
	$(OPENSCAD) -s $@.stl $@.scad

