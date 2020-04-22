gcloud builds submit --timeout="30m" --config cloudbuild.yaml --substitutions=_IMAGE_NAME="r-runtime" .

# docker run gcr.io/$DEVSHELL_PROJECT_ID/r-runtime