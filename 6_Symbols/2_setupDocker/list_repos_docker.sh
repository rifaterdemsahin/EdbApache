#!/bin/bash

# Replace with your Docker registry URL
REGISTRY_URL="https://docker.enterprisedb.com"

# List all repositories
REPOS=$(curl -s $REGISTRY_URL/v2/_catalog | jq -r '.repositories[]')

# List tags for each repository
for REPO in $REPOS; do
    echo "Repository: $REPO"
    TAGS=$(curl -s $REGISTRY_URL/v2/$REPO/tags/list | jq -r '.tags[]')
    for TAG in $TAGS; do
        echo "  Tag: $TAG"
    done
done


# # Replace with your Docker registry credentials
# USERNAME="<username>"
# PASSWORD="<password>"
# REGISTRY_URL="https://docker.enterprisedb.com"

# # List all repositories
# REPOS=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/v2/_catalog | jq -r '.repositories[]')

# # List tags for each repository
# for REPO in $REPOS; do
#     echo "Repository: $REPO"
#     TAGS=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/v2/$REPO/tags/list | jq -r '.tags[]')
#     for TAG in $TAGS; do
#         echo "  Tag: $TAG"
#     done
# done