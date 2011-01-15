OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

# PARTS = Z_608_Bearing_Bracket
PARTS = Z_Bracket_Simple Z_Bracket_Simple_Nuts Z_Sleave_M8_Locking

default : usage

usage :
	@echo "Usage: 'make all'"
	@echo "  make Z_Bracket_Simple"
	@echo "  make Z_Bracket_Simple_Nuts"
	@echo "  make Z_Sleave_M8_Locking"

all : $(PARTS)

Z_Bracket_Simple :
	@echo "Processing $@..."
	$(OPENSCAD) -D render_part=1 -s $@.stl Z_608_Bearing_Bracket.scad

Z_Bracket_Simple_Nuts :
	@echo "Processing $@..."
	$(OPENSCAD) -D render_part=2 -s $@.stl Z_608_Bearing_Bracket.scad

Z_Sleave_M8_Locking :
	@echo "Processing $@..."
	$(OPENSCAD) -D render_part=3 -s $@.stl Z_608_Bearing_Bracket.scad

clean :
	$(RM) *.stl
