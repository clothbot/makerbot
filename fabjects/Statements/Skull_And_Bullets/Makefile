OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"

all : skull.stl bullet.stl 

# From http://www.thingiverse.com/thing:9667
# From http://www.thingiverse.com/thing:2567
#  Licensed CC-By-NC
skull.stl :
	wget http://www.thingiverse.com/download:30554 -O skull.scad
	wget http://www.thingiverse.com/download:30555 -O skull.svg
	wget http://www.thingiverse.com/download:30553 -O skull.stl
	# $(OPENSCAD) -s skull.stl skull.scad

# From http://www.thingiverse.com/thing:11732
bullet.stl :
	wget http://www.thingiverse.com/download:37486 -O bullet.stl


clean :
	$(RM) skull.scad skull.svg skull.stl
	$(RM) bullet.stl

