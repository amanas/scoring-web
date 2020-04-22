#! /bin/bash

sudo apt-get -y update >>/image_log 2>&1

sudo apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    curl \
    git \
    r-base >>/image_log 2>&1
    

sudo Rscript -e "install.packages(c('bigrquery'), repos='http://cran.us.r-project.org')" >>/image_log 2>&1
