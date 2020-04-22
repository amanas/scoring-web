#! /bin/bash

IMG_NAME="r-runtime"
VM_NAME="run-scoring-web"
ZONE="europe-west1-b"

gcloud beta compute instances create $VM_NAME \
    --zone $ZONE \
    --source-machine-image $IMG_NAME \
    --scopes=default,bigquery \
    --metadata startup-script="#! /bin/bash

export REPO_NAME="scoring-web"
export PROJECT_NAME="TODO-set-project-name"
export SCRIPT_FILE="script.R"
export SCRIPT_PARAMS="project_id dataset_table"

gcloud source repos clone $REPO_NAME --project=$PROJECT_NAME
cd $REPO_NAME
Rscript --vanilla $SCRIPT_FILE $SCRIPT_PARAMS
"