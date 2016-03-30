#!/bin/sh

# Test the XSLT by running it on al of the ISO docs

TEST="tests/iso"
TARGET=build
ISOBASE="iso-"
EMLBASE="eml-"

mkdir -p $TARGET

for num in 01 02 03 04 05 06 07 08 09 10
do
    xml tr src/iso2eml.xsl $TEST/$ISOBASE${num}.xml > $TARGET/${EMLBASE}${num}.xml
done
