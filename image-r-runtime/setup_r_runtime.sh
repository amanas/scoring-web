#! /bin/bash

sudo apt-get -y update 

sudo apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    curl \
    r-base
    

sudo Rscript -e "install.packages(c('bigrquery'), repos='http://cran.us.r-project.org')"
