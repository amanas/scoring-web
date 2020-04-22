REPO="scoring-web" 
PROJECT_ID=$DEVSHELL_PROJECT_ID
SRC_IMG="gcr.io/${PROJECT_ID}/r-runtime"
TGT_IMG="gcr.io/${PROJECT_ID}/r-model-${REPO}"

sed -i 's@SRC_IMG@'"$SRC_IMG"'@g' Dockerfile
sed -i 's@REPO@'"$REPO"'@g' Dockerfile

gcloud builds submit --timeout="15m" \
    --config cloudbuild.yaml \
    --substitutions=_REPO="${REPO}",_TGT_IMG="${TGT_IMG}" .

# docker image rm $TGT_IMG -f
# docker run $TGT_IMG script.R $PROJECT_ID negocio.scoring_web
