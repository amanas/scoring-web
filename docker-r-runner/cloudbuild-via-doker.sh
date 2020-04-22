#! /bin/bash

MODEL="scoring-web" 
PROJECT_ID=$DEVSHELL_PROJECT_ID
IMAGE="gcr.io/${PROJECT_ID}/r-model-${MODEL}"
VM_NAME="prueba"
ZONE="europe-west1-b"

# gcloud compute instances delete prueba --zone $ZONE --quiet

gcloud compute instances create-with-container $VM_NAME \
    --zone $ZONE \
    --container-image $IMAGE \
    --container-arg="Rscript" \
    --container-arg="--vanilla" \
    --container-arg="script.R" \
    --container-arg="$PROJECT_ID" \
    --container-arg="negocio.scoring_web" \
    --scopes=default,bigquery
