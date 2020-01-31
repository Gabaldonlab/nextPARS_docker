FROM lepinkainen/ubuntu-python-base

# metadata
LABEL base.image="ubuntu"
LABEL version="1"
LABEL software="nextPARSParer"
LABEL software.version="0.10"
LABEL description=""
LABEL website="https://github.com/Gabaldonlab/nextPARSParer"
LABEL license="GNU General Public License"

MAINTAINER Uciel Chorostecki "uciel.chorostecki@bsc.es"

ARG SOURCE_DIR=/root/src/nextparsPARSER/dependencies
ARG HOME_DIR=/home/nextPARS

RUN mkdir -p SOURCE_DIR HOME/DIR

# ---------------------------------------

RUN echo "Installing python and relevant tools..."
RUN apt-get update  -y && apt-get install -y \ 
    build-essential \
    git \
    libxml2-dev \
    libxslt-dev \
    libssl-dev \
    libyaml-dev \
    libffi-dev \
	python3 \
    python-dev \
    python3-pip \
	zlib1g-dev 

# General dev tools
RUN echo "Installing general dev tools..."

RUN apt-get install -y git

RUN echo "Latest versions of python tools via pip3..."
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade virtualenv \
                          requests \
                          numpy \
                          biopython \
                          cutadapt \
                          datetime \
                          termcolor \
                          pandas \
                          keras \
                          tensorflow \
                          dask \
                          HTSeq \
                          h5py

# ---------------------------------------

WORKDIR $SOURCE_DIR

RUN echo "Installing STAR"
RUN git clone https://github.com/alexdobin/STAR.git

RUN echo "Compiling STAR" 
WORKDIR $SOURCE_DIR/STAR/source
RUN make STAR

RUN PATH=$PATH:/root/src/nextparsPARSER/dependencies/STAR/source
RUN export PATH

WORKDIR $HOME_DIR
