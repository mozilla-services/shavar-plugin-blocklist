#!/usr/bin/env bash

swfmill=`which swfmill`
xsltproc=`which xsltproc`
# be sure that all needed commands exist
test -z $swfmill && echo "Error: swfmill not found." && exit
test -z $xsltproc && echo "Error: xsltproc not found." && exit
# print usage message unless all required arguments were passed
test $# -lt 1 && echo "Usage: $0 infile" && exit

infile=$1
# test for valid input file
file $infile | grep -q "Macromedia Flash data" || (echo "Error: $infile is not a SWF file." && exit)

tmpdir=`mktemp -d /tmp/detect-XXXXXXXX`
swf=$tmpdir/${infile##*/}
xml=${swf/%.*/.xml}

# convert the SWF file to XML
cp $infile $swf
$swfmill swf2xml $swf $xml
# apply all XSLT stylesheet
$xsltproc ./detect.xslt $xml

# clean up temporary files
rm $swf $xml
