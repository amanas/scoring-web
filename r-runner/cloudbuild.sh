MODEL="scoring-web" 
PROJECT_ID=$DEVSHELL_PROJECT_ID
IMAGE="gcr.io/${PROJECT_ID}/r-model-${MODEL}"
VM_NAME="prueba"
ZONE="europe-west1-b"

# gcloud compute instances delete prueba --zone $ZONE --quiet

gcloud compute instances create-with-container $VM_NAME \
    --zone $ZONE \
    --container-image $IMAGE \
    --container-arg="greetings.R" \
    --container-arg="$PROJECT_ID" \
    --container-arg="negocio.scoring_web" \
    --scopes=default,bigquery


        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring.write",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/trace.append"

--service-account=model-runner@qwiklabs-gcp-00-ff78fb12d597.iam.gserviceaccount.com \
--scopes=https://www.googleapis.com/auth/bigquery,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/trace.append,https://www.googleapis.com/auth/devstorage.read_only \    


gcloud beta auth configure-docker europe-west1-docker.pkg.dev

