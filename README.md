# DocAI Expense Parser Demo

# Objective
Learn how to use Google Cloud Platform to construct a pipeline to process expenses (ie. receipts). 

# GCP Services used in the Demo
* [Google Cloud Procurement Document AI](https://cloud.google.com/solutions/procurement-doc-ai)
* [Google Cloud Storage](https://cloud.google.com/storage)
* [Google Cloud Functions](https://cloud.google.com/functions)
* [Knowledge Graph Search API](https://developers.google.com/knowledge-graph)
* [BigQuery](https://cloud.google.com/bigquery)

# Steps to re-create this demo in your own GCP environment
1. Create a Google Cloud Platform Project

2. Enable the APIs in the project you created in step #1 

* Cloud Document AI API
* Knowledge Graph Search API
* Cloud Build API

3. Request access for specialized parsers via link. 

4. Activate your Command Shell and clone this GitHub Repo in your Command shell 

5. Execute Bash shell scripts in your Cloud Shell terminal to create cloud resources (i.e Google Cloud Storage Buckets, Pub/Sub topics, Cloud Functions, BigQuery tables)

6. Edit Environment variables
