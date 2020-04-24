#! /bin/bash

IMG_NAME="r-runtime"
VM_NAME="$IMG_NAME-$(date  +%Y%m%d%H%M%S)"
ZONE="europe-west1-b"

gcloud compute instances create $VM_NAME \
    --zone $ZONE \
    --scopes=default,bigquery \
    --metadata-from-file startup-script=setup_r_runtime.sh

echo "sleep 30 mins untill everything is installed"

sleep 1800

gcloud beta compute machine-images create $IMG_NAME \
    --source-instance $VM_NAME \
    --source-instance-zone $ZONE

gcloud compute instances delete $VM_NAME --zone $ZONE --quiet    
