FROM rocker/r-base

# Update OS
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
 && apt-get install -y apt-utils \
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
    curl
    
# Setup R configs
RUN ["install2.r", "readr", "googleCloudStorageR", "bigrquery", "lubridate", "Rcpp", "digest", "crayon", "withr", "mime", "R6", "jsonlite", "xtable", "magrittr", "httr", "curl", "testthat", "devtools", "hms", "dplyr", "httpuv", "memoise", "htmltools", "openssl", "tibble", "remotes", "data.table", "xts"]

CMD ["R"]