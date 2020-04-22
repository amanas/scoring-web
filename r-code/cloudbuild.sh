# gcloud init
# gcloud source repos clone scoring-web --project=$DEVSHELL_PROJECT_ID
# git config --global user.email "andresmanasmanas@gmail.com"
# git config --global user.name "Andrés Mañas"
# scoring-web
# git add .
# git commit -m "go"
# git push -u origin master


export REPO=scoring-web 

git config --global user.email "andresmanasmanas@gmail.com"
git config --global user.name "Andrés Mañas"

gcloud source repos delete $REPO --quiet
rm -rf .git

gcloud source repos create $REPO --quiet
gcloud source repos clone $REPO --project=$DEVSHELL_PROJECT_ID
mv $REPO/.git ./
rm -rf $REPO

git add .
git commit -m "go"
git push -u origin master


bq mk -d negocio
bq mk -t negocio.scoring_web fecha:TIMESTAMP,url:STRING
cat scoring_web.sql | bq query 
