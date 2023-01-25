#!/bin/bash

# **************** Global variables
source ./.env

# Information
RUNTIME_CONTAINER_NAME=watson-nlp-with-models
MODEL_CONTAINERS_NAME=watson-nlp-models
CUSTOM_CONTAINER_IMAGE_NAME=watson-nlp-custom-container
CUSTOM_CONTAINER_IMAGE_TAG=v1.0.0

# **********************************************************************************
# Functions definition
# **********************************************************************************

function connectToIBMContainerRegistry () {
    echo ""
    echo "# ******"
    echo "# Connect to IBM Cloud Container Image Registry: $IMAGE_REGISTRY"
    echo "# ******"
    echo ""
    echo "IBM_ENTITLEMENT_KEY: $IBM_ENTITLEMENT_KEY"
    echo ""
    docker login cp.icr.io --username cp --password $IBM_ENTITLEMENT_KEY
}

function buildContainerImageWithCustomModels () {
    echo ""
    echo "# ******"
    echo "# Build container image locally"
    echo "# Runtime container image: $WATSON_RUNTIME_BASE"
    echo "# ******"
    docker build . --build-arg WATSON_RUNTIME_BASE="$WATSON_RUNTIME_BASE" -t $CUSTOM_CONTAINER_IMAGE_NAME:$CUSTOM_CONTAINER_IMAGE_TAG
}

function runNLPwithCustomModels () {

    echo ""
    echo "# ******"
    echo "# Run NLP"
    echo "# ******"
    echo ""  
    echo "# Run the runtime with the models mounted"
    echo "" 
    docker run --rm -it \
      -e ACCEPT_LICENSE=true \
      -p 8085:8085 \
      -p 8080:8080 \
      --name $RUNTIME_CONTAINER_NAME \
      $CUSTOM_CONTAINER_IMAGE_NAME:$CUSTOM_CONTAINER_IMAGE_TAG
}

#**********************************************************************************
# Execution
# *********************************************************************************

connectToIBMContainerRegistry

buildContainerImageWithCustomModels

runNLPwithCustomModels

