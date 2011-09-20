OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"

all : skull.stl bullet.stl 

# From http://www.thingiverse.com/thing:2567
#  Licensed CC-By-NC
skull.stl :
	wget http://www.thingiverse.com/download:7112 -O skull.stl

# From http://www.thingiverse.com/thing:11732
#  Licensed CC-By-SA
bullet.stl :
	wget http://www.thingiverse.com/download:37486 -O bullet.stl

clean :
	$(RM) skull.scad skull.svg skull.stl
	$(RM) bullet.stl

