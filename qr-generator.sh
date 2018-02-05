#!/bin/bash
mkdir output
mkdir tmp
for i in $(seq 1 1 230)
do
echo $i
qrencode -8 -m 1 -l H -s 34 -o tmp/$i.png $i
convert tmp/$i.png colorchart.png -append output/$i.jpg
convert output/$i.jpg -fill green -stroke black -pointsize 30 -gravity center -annotate 0 $i $1 output/$i.jpg
done
convert output/*.jpg -quality 80 QR.pdf
