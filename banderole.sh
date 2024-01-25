#!/bin/bash

H_px=256
H_mm=68.5

imprimer() 
{
OUT=$(date +%s).png
convert -background white -fill black \
		-size x$H_px \
		-font Junicode-CondLight.ttf label:"$1" \
        -rotate -180 \
      	$OUT
# produit en croix
L_px=$(identify -format "%[fx:w]" $OUT)
L_mm=$(bc -l <<< "$L_px * $H_mm / $H_px")

lp $OUT -s \
    -o PageSize=Custom."$H_mm"x"$L_mm"mm \
    -o TmtSpeed=1 
}

#while true; do 
    #read -n1 MESSAGE
    #read MESSAGE
    MESSAGE="Un outil pour écrire des banderoles sur ticket de caisse → https://git.vvvvvvaria.org/clemtre/banderole.sh · fonctionne sur mac, linux* & *bsd · license CC4r"
    #MESSAGE=" (fonctionne sur mac, linux* & *bsd)"
    imprimer "$MESSAGE"
#done

