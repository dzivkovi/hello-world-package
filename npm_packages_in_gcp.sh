
# https://medium.com/@michaelsmithchandler/migrating-npm-dependencies-to-google-artifact-registry-62ee8e0064f9

export PROJECT=ccx-web-nonprod
export REPO=npm-packages
export LOCATION=northamerica-northeast1

gcloud artifacts repositories create $REPO --repository-format=npm --location=$LOCATION --project=$PROJECT

gcloud beta services identity create \
    --service=artifactregistry.googleapis.com \
    --project=$PROJECT
# Service identity created: foobar@gcp-sa-artifactregistry.iam.gserviceaccount.com
SVC_ACCOUNT=foobar@gcp-sa-artifactregistry.iam.gserviceaccount.com
gcloud iam service-accounts keys create gcs-npm-svc-nonprod.json --iam-account $SVC_ACCOUNT

...

gcloud artifacts print-settings npm --project=$PROJECT --repository=$REPO --location=$LOCATION > .npmrc
npx google-artifactregistry-auth
