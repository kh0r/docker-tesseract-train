FROM ubuntu:14.04

RUN apt-get update

RUN apt-get -q -y install git wget
RUN apt-get -q -y install autoconf automake libtool
RUN apt-get -q -y install libpng12-dev
RUN apt-get -q -y install libjpeg62-dev
RUN apt-get -q -y install libtiff4-dev
RUN apt-get -q -y install zlib1g-dev
RUN apt-get -q -y install libicu-dev
RUN apt-get -q -y install libpango1.0-dev
RUN apt-get -q -y install libcairo2-dev

# install leptonica
RUN cd /opt && wget http://www.leptonica.com/source/leptonica-1.72.tar.gz && tar xvzf leptonica-1.72.tar.gz && rm leptonica-1.72.tar.gz
WORKDIR /opt/leptonica-1.72
RUN cd /opt/leptonica-1.72 && ./configure && make && sudo make install

# install tesseract
RUN git clone https://github.com/tesseract-ocr/tesseract.git /opt/tesseract-ocr
WORKDIR /opt/tesseract-ocr
RUN git checkout tags/3.04-rc1
RUN ./autogen.sh && ./configure && make && sudo make install && sudo ldconfig
RUN make training && sudo make training-install

ADD ./training_data/ /opt/training_data
# RUN /opt/training_data/train.sh
