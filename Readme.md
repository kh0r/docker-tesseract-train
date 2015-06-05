# Docker Container for training tesseract

## Building
```
docker build -t kh0r/tesseract_training .
docker tag kh0r/tesseract_training:latest kh0r/tesseract_training:3.04-rc1
```

## Preparation
- Copy your fonts (TTF/OTF) in the training_data/fonts folder.
- Edit the samples.txt file in the training_data folder
- Edit the used font list in fonts.txt



## Usage
```
docker run -i -t kh0r/tesseract_training /bin/bash
```
