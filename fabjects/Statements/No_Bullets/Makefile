OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"

all : bullet.stl 

# From http://www.thingiverse.com/thing:11732
#  Licensed CC-By-SA
bullet.stl :
	wget http://www.thingiverse.com/download:37486 -O bullet.stl

no_bullets.stl :
	$(OPENSCAD) -s no_bullets.stl no_bullets.scad

clean :
	$(RM) bullet.stl

