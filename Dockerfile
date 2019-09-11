From continuumio/miniconda3
#ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install -y  git  wget gcc default-jdk && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default



Run conda install samtools 
RUN conda install kallisto==0.43.0

#get git
Run git clone https://github.com/saima-tithi/FastViromeExplorer.git

RUN cd FastViromeExplorer && \
    javac -d bin src/*.java && \
    chmod a+x *

ENV PATH /FastViromeExplorer:$PATH