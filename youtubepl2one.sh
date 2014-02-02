#!/bin/bash

youtube-dl -t $1

x=0
for i in *.mp4; do
    ffmpeg -i "$i" -c copy -bsf:v h264_mp4toannexb -f mpegts $x.ts
    x=$((x+1))
done

lips=$(for i in *.ts; do echo "$i|" | tr "\n" " "; done)
clips=$(echo $lips | sed -e 's/|$//g' | sed -e 's/\ //g')

ffmpeg -i "concat:$(echo $clips)" -c copy -bsf:a aac_adtstoasc $2.mp4

rm *.ts
mv $2.mp4 SAVE
rm *.mp4
mv SAVE $2.mp4

echo "Finished downloading your playlist and saved it as $2.mp4"
