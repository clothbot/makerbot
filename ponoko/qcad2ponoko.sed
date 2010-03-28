## Usage: sed -f qcad2ponoko.sed qcad.src.svg > ponoko.dst.svg
/stroke:rgb(0,0,255);/ {
	s/stroke:rgb(0,0,255);stroke-width:0.1;/stroke:rgb(0,0,255);stroke-width:0.003;/
}
/stroke:rgb(230,230,230);/ {
	s/stroke:rgb(230,230,230);stroke-width:0.1;/stroke:rgb(230,230,230);stroke-width:0.03;/
}
/stroke:rgb(128,128,128);/ {
	s/stroke:rgb(128,128,128);stroke-width:0.1;/stroke:rgb(128,128,128);stroke-width:0.03;/
}
/stroke:rgb(0,0,0);/ {
	s/stroke:rgb(0,0,0);stroke-width:0.1;/stroke:rgb(0,0,0);stroke-width:0.03;/
}
/stroke:rgb(255,0,255);/ {
	s/stroke:rgb(255,0,255);stroke-width:0.1;/stroke:rgb(255,0,255);stroke-width:0.003;/
}
/stroke:rgb(0,255,0);/ {
	s/stroke:rgb(0,255,0);stroke-width:0.1;/stroke:rgb(0,255,0);stroke-width:0.003;/
}
/stroke:rgb(255,0,0);/ {
	s/stroke:rgb(255,0,0);stroke-width:0.1;/stroke:rgb(255,0,0);stroke-width:0.003;/
}
/stroke:rgb(246,146,30);/ {
	s/stroke:rgb(246,146,30);stroke-width:0.1;/stroke:rgb(246,146,30);stroke-width:1.0;/
#	s/stroke:rgb(246,146,30);stroke-width:0.1;/fill-rule:nonzero;clip-rule:nonzero;fill:#F6921E;stroke:#000000;stroke-miterlimit:4;/
}

