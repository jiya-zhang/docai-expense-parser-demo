#! /bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/.env.local"

# create archive bucket
gsutil mb -p ${PROJECT_ID} -c standard -l ${BUCKET_LOCATION} -b on gs://${PROJECT_ID}-archived-receipts

# create input bucket
gsutil mb -p ${PROJECT_ID} -c standard -l ${BUCKET_LOCATION} -b on gs://${PROJECT_ID}-input-receipts

# create output bucket
gsutil mb -p ${PROJECT_ID} -c standard -l ${BUCKET_LOCATION} -b on gs://${PROJECT_ID}-output-receipts


# create bq table
bq --location=US mk  -d \
--description "Expense Parser Results" \
${PROJECT_ID}:expense_parser_results

bq mk --table expense_parser_results.doc_ai_extracted_entities table-schema/doc_ai_extracted_entities.json

# deploy Cloud Function
gcloud functions deploy process-receipts \
--ingress-settings=${INGRESS_SETTINGS} \
--region=${CLOUD_FUNCTION_LOCATION} \
--entry-point=process_receipt \
--runtime=python37 \
--service-account=${CLOUD_FUNCTION_SERVICE_ACCOUNT}@${PROJECT_ID}.iam.gserviceaccount.com \
--source=cloud-functions \
--timeout=400 \
--env-vars-file=cloud-functions/.env.yaml \
--trigger-resource=gs://${PROJECT_ID}-input-receipts \
--trigger-event=google.storage.object.finalize
