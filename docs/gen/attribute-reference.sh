#!/bin/bash

HTMLFILE="../attribute-reference.html"
PAGETITLE="Attribute Reference"

sed -e "s/PAGETITLE/$PAGETITLE/g" header.txt > "$HTMLFILE"
markdown "attribute-reference.md" >> "$HTMLFILE"
cd ../../
./extract_xml.sh | xsltproc wiki.xslt - | sed -e '1,3d' -e 's:\([a-z]*\)_\1:\1\\_:g' | markdown >> "docs/gen/$HTMLFILE"
cd "docs/gen"
cat footer.txt >> "$HTMLFILE"

