PYTHON=python2.6
SKEINFORGE=/Applications/reprap_python_beanshell_16/skeinforge/skeinforge.py
RUNDIR=$(PWD)
# Profile types: cutting, extrusion, milling, winding
PROFILE_TYPE="extrusion"
PROFILE_NAME="makerbot_ABS"
PROFILE_XML=$(PROFILE_TYPE).$(PROFILE_NAME).xml
OPERATIONS = carve chamber clip comb cool dimension export fill fillet hop inset jitter limit multiply oozebane preface raft speed splodge stretch temperature tower vectorwrite widen wipe
OPERATIONS_XML = operations.xml

default: usage

usage:
	@echo "Usage: make unitTests"
	@echo "  RUNDIR=$(RUNDIR)"
	@echo "  PROFILE_TYPE=$(PROFILE_TYPE)"
	@echo "  PROFILE_NAME=$(PROFILE_NAME)"
	@echo "  PWD=$(PWD)"

unitTests: skein2xml.sed xml xml/$(PROFILE_XML)

profiles:
	pushd ~; tar cf $(RUNDIR)/skeinforge.orig.tar ./.skeinforge; popd
	gzip -9 skeinforge.orig.tar
	tar xfz skeinforge.orig.tar.gz

xml:
	mkdir -p xml

$(OPERATIONS_XML): $(OPERATIONS)

$(OPERATIONS) : profiles xml
	@echo "Processing $@"
	echo "  <$@>" >> $(OPERATIONS_XML)
	sed -f skein2xml.sed .skeinforge/profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/$@.csv >> $(OPERATIONS_XML)
	echo "  </$@>" >> $(OPERATIONS_XML)

xml/$(PROFILE_XML) : $(OPERATIONS_XML)
	echo "<skeinforge>" > xml/$(PROFILE_XML)
	echo " <profile>" >> xml/$(PROFILE_XML)
	echo "  <type>$(PROFILE_TYPE)</type>" >> xml/$(PROFILE_XML)
	echo "  <name>$(PROFILE_NAME)</name>" >> xml/$(PROFILE_XML)
	cat $(OPERATIONS_XML) >> xml/$(PROFILE_XML)
	echo " </profile>" >> xml/$(PROFILE_XML)
	echo "</skeinforge>" >> xml/$(PROFILE_XML)

skein2xml.sed:
	echo "# skeinforge to xml sed script" > skein2xml.sed
	echo "/	/ {" >> skein2xml.sed
	echo "  s/^/<name>/g" >> skein2xml.sed
	echo "  s/[ ]*	/<\/name><value>/g" >> skein2xml.sed
	echo "  s/$$/<\/value>/g" >> skein2xml.sed
	echo "}" >> skein2xml.sed
	echo "s/^/<param>/g" >> skein2xml.sed
	echo "s/$$/<\/param>/g" >> skein2xml.sed

clean:
	$(RM) skeinforge.orig.tar.gz
	$(RM) -rf .skeinforge
	$(RM) -rf xml
	$(RM) $(OPERATIONS_XML)
