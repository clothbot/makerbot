OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

PARTS = Z_608_Bearing_Bracket

default : usage

usage :
	@echo "Usage: 'make all'"

all : $(PARTS)

Z_608_Bearing_Bracket :
	@echo "Processing Z_Bracket_Simple..."
	$(OPENSCAD) -D render_part=1 -s Z_Bracket_Simple.stl $@.scad

