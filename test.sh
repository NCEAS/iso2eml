#!/bin/sh

# Test the XSLT by running it on al of the ISO docs

TEST="tests/iso"
TARGET=build
ISOBASE="iso-0"
EMLBASE="eml-0"

mkdir -p $TARGET

for num in 1 2 3 4 5 6 7 8
do
    xml tr src/iso2eml.xsl $TEST/$ISOBASE${num}.xml > $TARGET/${EMLBASE}${num}.xml
done
