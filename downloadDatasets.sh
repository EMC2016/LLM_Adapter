#!/bin/bash

# List of dataset names
datasets=("rct-20k" "rct-sample" "citation_intent" "sciie" "ag" "hyperpartisan_news" "imdb" "amazon")

# Base URL for downloading datasets
base_url="https://allennlp.s3-us-west-2.amazonaws.com/dont_stop_pretraining/data"

# Loop over each dataset in the list
for dataset in "${datasets[@]}"; do
    echo "Downloading dataset: $dataset"

    # Create a directory for the dataset
    mkdir -p "$dataset"
    cd "$dataset"

    # Download the files for each dataset
    curl -fLo train.jsonl "$base_url/$dataset/train.jsonl"
    curl -fLo dev.jsonl "$base_url/$dataset/dev.jsonl"
    curl -fLo test.jsonl "$base_url/$dataset/test.jsonl"

    # Check if the downloads were successful
    if [ $? -eq 0 ]; then
        echo "$dataset files downloaded successfully."
    else
        echo "Error downloading files for $dataset."
    fi

    # Move back to the parent directory for the next dataset
    cd ..
done
