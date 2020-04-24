#! /bin/bash

PARAM_REPO="scoring-web"
PARAM_SCRIPT="script.R"
PARAM_PROJECT_ID=$DEVSHELL_PROJECT_ID
PARAM_DATASET_TABLE="negocio.scoring_web"
IMG_NAME="r-runtime"
VM_NAME="runner4-$PARAM_REPO"-$(date  +%Y%m%d%H%M%S)
ZONE="europe-west1-b"

gcloud beta compute instances create $VM_NAME \
    --zone $ZONE \
    --source-machine-image $IMG_NAME \
    --scopes=default,bigquery,cloud-source-repos-ro \
    --metadata startup-script="#! /bin/bash

mkdir /working
cd /working

export PARAM_REPO=$PARAM_REPO
export PARAM_SCRIPT=$PARAM_SCRIPT
export PARAM_PROJECT_ID=$PARAM_PROJECT_ID
export PARAM_DATASET_TABLE=$PARAM_DATASET_TABLE

sudo Rscript -e \"install.packages(c('readr'), repos='http://cran.us.r-project.org')\" >>/image_log 2>&1

echo HOLA_1 >>/instance_log
sudo gcloud source repos clone $PARAM_REPO --project=$PARAM_PROJECT_ID >>/instance_log 2>&1
echo HOLA_2 >>/instance_log
cd $PARAM_REPO
sudo Rscript --vanilla $PARAM_SCRIPT $PARAM_PROJECT_ID $PARAM_DATASET_TABLE  >>/instance_log 2>&1
echo HOLA_3 >>/instance_log
"
