#! /bin/bash

sudo apt-get -y update 

sudo apt-get install -y \
    apt-utils \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libgmp-dev \
    libpng-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pandoc \
    pandoc-citeproc \
    zlib1g-dev \
    curl,
    r-base

sudo Rscript -e "install.packages(c('readr', 'googleCloudStorageR', 'bigrquery', 'lubridate'), repos='http://cran.us.r-project.org')"
sudo Rscript -e "install.packages(c('Rcpp', 'digest', 'crayon', 'withr', 'mime', 'R6', 'jsonlite', 'xtable','install2.r'), repos='http://cran.us.r-project.org')"
sudo Rscript -e "install.packages(c('magrittr', 'httr', 'curl', 'testthat', 'devtools', 'hms', 'dplyr','install2.r', 'httpuv'), repos='http://cran.us.r-project.org')"
sudo Rscript -e "install.packages(c('memoise', 'htmltools', 'openssl', 'tibble', 'remotes', 'data.table', 'xts'), repos='http://cran.us.r-project.org')"
