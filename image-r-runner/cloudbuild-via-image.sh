#! /bin/bash

IMG_NAME="r-runtime"
VM_NAME="run-scoring-web"
ZONE="europe-west1-b"

PARAM_REPO="scoring-web"
PARAM_SCRIPT="script.R"
PARAM_PROJECT_ID=$DEVSHELL_PROJECT_ID
PARAM_DATASET_TABLE="negocio.scoring_web"

gcloud beta compute instances create $VM_NAME \
    --zone $ZONE \
    --source-machine-image $IMG_NAME \
    --scopes=default,bigquery \
    --metadata startup-script="#! /bin/bash

export PARAM_REPO=$PARAM_REPO
export PARAM_SCRIPT=$PARAM_SCRIPT
export PARAM_PROJECT_ID=$PARAM_PROJECT_ID
export PARAM_DATASET_TABLE=$PARAM_DATASET_TABLE

gcloud source repos clone $PARAM_REPO --project=$PARAM_PROJECT_ID
cd $PARAM_REPO
Rscript --vanilla $PARAM_SCRIPT $PARAM_PROJECT_ID $PARAM_DATASET_TABLE
"