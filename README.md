# DocAI Expense Parser Demo

# Objective
Learn how to use Google Cloud Platform to construct a pipeline to process expenses (ie. receipts). 

# Visualizing workflow

# GCP Services used in the Demo
* [Google Cloud Procurement Document AI](https://cloud.google.com/solutions/procurement-doc-ai)
* [Google Cloud Storage](https://cloud.google.com/storage)
* [Google Cloud Functions](https://cloud.google.com/functions)
* [Knowledge Graph Search API](https://developers.google.com/knowledge-graph)
* [BigQuery](https://cloud.google.com/bigquery)

# Steps to re-create this demo in your own GCP environment
1. Create a Google Cloud Platform Project

2. Enable the **Cloud Document AI API** in the project you created in step #1 

3. If you do not have access to the parser, request access via [this link](https://docs.google.com/forms/d/e/1FAIpQLSc_6s8jsHLZWWE0aSX0bdmk24XDoPiE_oq5enDApLcp1VKJ-Q/viewform?gxids=7826). Here is a [link](https://cloud.google.com/document-ai/docs/processors-list#processor_expense-parser) to the official Expense Parser documentation.

4. Activate your Command Shell and clone this GitHub Repo in your Command shell using the command:
```
git clone https://github.com/jiya-zhang/docai-expense-parser-demo
```

5. Execute Bash shell scripts in your Cloud Shell terminal to create cloud resources (i.e Google Cloud Storage Buckets, Pub/Sub topics, Cloud Functions, BigQuery dataset and table)

    1. Change directory to the scripts folder

        ```
        cd docai-expense-parser-demo
        ```
    3. Update the value of PROJECT_ID in .env.local to match your current projectID

        ```
        vim .env.local
        ```
    5. Make your .sh files executable

        ```
        chmod +x set-up-pipeline.sh
        ```
    6. Execute your .sh files to create cloud resources
        ```
        ./set-up-pipeline.sh
        ```

    8. Create your Doc AI processor

6. Testing/Validating the demo

    1. Upload a sample invoice in the input bucket
    2. At the end of the processing, you should expect your BigQuery tables to be populated with extracted entities (eg. total_amount, supplier_name, etc.) 
    3. With the structured data in BigQuery, we can now design downstream analytical tools to gain actionable insights as well as detect errors/frauds.
