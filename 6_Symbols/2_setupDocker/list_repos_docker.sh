#!/bin/bash

# Replace with your Docker registry credentials
USERNAME="<username>"
PASSWORD="<password>"
REGISTRY_URL="https://docker.enterprisedb.com"

# List all repositories
REPOS_RESPONSE=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/v2/_catalog)
REPOS=$(echo $REPOS_RESPONSE | jq -r '.repositories[]')

if [ -z "$REPOS" ]; then
    echo "No repositories found or failed to fetch repositories."
    echo "Response from registry: $REPOS_RESPONSE"
    exit 1
fi

# List tags for each repository
for REPO in $REPOS; do
    echo "Repository: $REPO"
    TAGS_RESPONSE=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/v2/$REPO/tags/list)
    TAGS=$(echo $TAGS_RESPONSE | jq -r '.tags[]')
    if [ -z "$TAGS" ]; then
        echo "  No tags found or failed to fetch tags for repository $REPO."
        echo "  Response from registry: $TAGS_RESPONSE"
        continue
    fi
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