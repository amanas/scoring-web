IMG_NAME="r-runtime"
VM_NAME="r-model"
ZONE="europe-west1-b"

gcloud compute instances create $IMG_NAME \
    --zone $ZONE \
    --scopes=default,bigquery \
    --metadata-from-file startup-script=setup_r_runtime.sh

gcloud beta compute machine-images create $IMG_NAME \
    --source-instance $IMG_NAME \
    --source-instance-zone $ZONE
