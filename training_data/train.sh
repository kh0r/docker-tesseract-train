#!/bin/bash
while read name
do
  outputname="/opt/training_data/generated/eng.$name.exp0"
  /opt/tesseract-ocr/training/text2image --text=/opt/tesseract-ocr/training_data/text.txt --outputbase=$outputname --font='$name' --fonts_dir=/opt/tesseract-ocr/training_data/fonts
done < fonts.txt

#
# for file in $( ls /opt/tesseract-ocr/training_data/generated/ ); do
#   tesseract [lang].[fontname].exp[num].tif $file box.train
# done
