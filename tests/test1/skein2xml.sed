# skeinforge to xml sed script
/	/ {
  s/^/<name>/g
  s/[ ]*	/<\/name><value>/g
  s/$/<\/value>/g
}
s/^/<param>/g
s/$/<\/param>/g
