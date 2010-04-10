PYTHON=python2.6
SKEINFORGE=/Applications/reprap_python_beanshell_16/skeinforge/skeinforge.py
RUNDIR=$(PWD)
# Profile types: cutting, extrusion, milling, winding
PROFILE_TYPE="extrusion"
PROFILE_NAME="makerbot_ABS"
PROFILE_XML=$(PROFILE_TYPE).$(PROFILE_NAME).xml

default: usage

usage:
	@echo "Usage: make unitTests"
	@echo "  RUNDIR=$(RUNDIR)"
	@echo "  PROFILE_TYPE=$(PROFILE_TYPE)"
	@echo "  PROFILE_NAME=$(PROFILE_NAME)"
	@echo "  PWD=$(PWD)"

unitTests: skein2xml.sed
	pushd ~/.skeinforge; tar cf $(RUNDIR)/profiles.orig.tar ./profiles; popd
	gzip -9 profiles.orig.tar
	tar xfz profiles.orig.tar.gz
	mkdir -p xml
	echo "<skeinforge>" > xml/$(PROFILE_XML)
	echo " <profile>" >> xml/$(PROFILE_XML)
	echo "  <type>$(PROFILE_TYPE)</type>" >> xml/$(PROFILE_XML)
	echo "  <name>$(PROFILE_NAME)</name>" >> xml/$(PROFILE_XML)
	echo "  <carve>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/carve.csv >> xml/$(PROFILE_XML)
	echo "  </carve>" >> xml/$(PROFILE_XML)
	echo "  <chamber>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/chamber.csv >> xml/$(PROFILE_XML)
	echo "  </chamber>" >> xml/$(PROFILE_XML)
	echo "  <clip>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/clip.csv >> xml/$(PROFILE_XML)
	echo "  </clip>" >> xml/$(PROFILE_XML)
	echo "  <comb>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/comb.csv >> xml/$(PROFILE_XML)
	echo "  </comb>" >> xml/$(PROFILE_XML)
	echo "  <cool>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/cool.csv >> xml/$(PROFILE_XML)
	echo "  </cool>" >> xml/$(PROFILE_XML)
	echo "  <dimension>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/dimension.csv >> xml/$(PROFILE_XML)
	echo "  </dimension>" >> xml/$(PROFILE_XML)
	echo "  <export>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/export.csv >> xml/$(PROFILE_XML)
	echo "  </export>" >> xml/$(PROFILE_XML)
	echo "  <fill>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/fill.csv >> xml/$(PROFILE_XML)
	echo "  </fill>" >> xml/$(PROFILE_XML)
	echo "  <fillet>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/fillet.csv >> xml/$(PROFILE_XML)
	echo "  </fillet>" >> xml/$(PROFILE_XML)
	echo "  <hop>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/hop.csv >> xml/$(PROFILE_XML)
	echo "  </hop>" >> xml/$(PROFILE_XML)
	echo "  <inset>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/inset.csv >> xml/$(PROFILE_XML)
	echo "  </inset>" >> xml/$(PROFILE_XML)
	echo "  <jitter>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/jitter.csv >> xml/$(PROFILE_XML)
	echo "  </jitter>" >> xml/$(PROFILE_XML)
	echo "  <limit>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/limit.csv >> xml/$(PROFILE_XML)
	echo "  </limit>" >> xml/$(PROFILE_XML)
	echo "  <multiply>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/multiply.csv >> xml/$(PROFILE_XML)
	echo "  </multiply>" >> xml/$(PROFILE_XML)
	echo "  <oozebane>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/oozebane.csv >> xml/$(PROFILE_XML)
	echo "  </oozebane>" >> xml/$(PROFILE_XML)
	echo "  <preface>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/preface.csv >> xml/$(PROFILE_XML)
	echo "  </preface>" >> xml/$(PROFILE_XML)
	echo "  <raft>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/raft.csv >> xml/$(PROFILE_XML)
	echo "  </raft>" >> xml/$(PROFILE_XML)
	echo "  <speed>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/speed.csv >> xml/$(PROFILE_XML)
	echo "  </speed>" >> xml/$(PROFILE_XML)
	echo "  <splodge>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/splodge.csv >> xml/$(PROFILE_XML)
	echo "  </splodge>" >> xml/$(PROFILE_XML)
	echo "  <stretch>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/stretch.csv >> xml/$(PROFILE_XML)
	echo "  </stretch>" >> xml/$(PROFILE_XML)
	echo "  <temperature>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/temperature.csv >> xml/$(PROFILE_XML)
	echo "  </temperature>" >> xml/$(PROFILE_XML)
	echo "  <tower>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/tower.csv >> xml/$(PROFILE_XML)
	echo "  </tower>" >> xml/$(PROFILE_XML)
	echo "  <vectorwrite>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/vectorwrite.csv >> xml/$(PROFILE_XML)
	echo "  </vectorwrite>" >> xml/$(PROFILE_XML)
	echo "  <widen>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/widen.csv >> xml/$(PROFILE_XML)
	echo "  </widen>" >> xml/$(PROFILE_XML)
	echo "  <wipe>" >> xml/$(PROFILE_XML)
	sed -f skein2xml.sed profiles/$(PROFILE_TYPE)/$(PROFILE_NAME)/wipe.csv >> xml/$(PROFILE_XML)
	echo "  </wipe>" >> xml/$(PROFILE_XML)
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
	$(RM) profiles.orig.tar.gz
	$(RM) -rf profiles
	$(RM) -rf xml

