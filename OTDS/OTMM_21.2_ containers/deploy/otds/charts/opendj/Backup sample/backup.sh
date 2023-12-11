#!/bin/sh

while true
do
  echo "Authenticating to Google Cloud..."
  gcloud auth print-access-token >/dev/null 2>&1 || \
    gcloud auth activate-service-account --key-file /certs/key.json --project "$GCLOUD_PROJECT" -q

  echo "Syncing files..."
  gsutil -m rsync -rP ${BAK_SRC} gs://${GCLOUD_BUCKET}
  sleep ${SLEEPTIME}
done
