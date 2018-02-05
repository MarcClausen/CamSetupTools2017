#!/bin/bash
# Generate QRcodes next to a colorchart
mkdir output
mkdir tmp
for i in $(seq 1 1 3)
do
echo $i
   qrencode -8 -m 1 -l H -s 34 -o tmp/$i.png $i
convert tmp/$i.png colorchart.png -append output/$i.jpg
done
