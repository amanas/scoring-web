IMG_NAME="r-runtime"
VM_NAME="r-model"
ZONE="europe-west1-b"

gcloud compute instances create r-runtime \
    --zone $ZONE \
    --scopes=default,bigquery \
    --metadata startup-script="#! /bin/bash
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
sudo Rscript -e \"install.packages(c('readr', 'googleCloudStorageR', 'bigrquery', 'lubridate'), repos='http://cran.us.r-project.org')\"
sudo Rscript -e \"install.packages(c('Rcpp', 'digest', 'crayon', 'withr', 'mime', 'R6', 'jsonlite', 'xtable','install2.r'), repos='http://cran.us.r-project.org')\"
sudo Rscript -e \"install.packages(c('magrittr', 'httr', 'curl', 'testthat', 'devtools', 'hms', 'dplyr','install2.r', 'httpuv'), repos='http://cran.us.r-project.org')\"
sudo Rscript -e \"install.packages(c('memoise', 'htmltools', 'openssl', 'tibble', 'remotes', 'data.table', 'xts'), repos='http://cran.us.r-project.org')\"
"

gcloud compute instances create $IMG_NAME \
    --zone $ZONE \
    --scopes=default,bigquery \
    --metadata-from-file startup-script=setup_r_runtime.sh

gcloud beta compute machine-images create $IMG_NAME \
    --source-instance $IMG_NAME \
    --source-instance-zone $ZONE

gcloud beta compute instances create $VM_NAME \
    --zone $ZONE \
    --source-machine-image $IMG_NAME \
    --scopes=default,bigquery \
    --metadata startup-script="#! /bin/bash
echo 'Hola' > hola.txt
export REPO_NAME="scoring-web"
export PROJECT_NAME="todo-set-project-name"
export SCRIPT_FILE="script.R"
export SCRIPT_PARAMS="bla bla bla"
gcloud source repos clone $REPO_NAME --project=$PROJECT_NAME
cd $REPO_NAME
Rscript --vanilla $SCRIPT_FILE $SCRIPT_PARAMS
"