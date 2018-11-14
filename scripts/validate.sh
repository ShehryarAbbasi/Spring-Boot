#!/bin/bash

sleep 20

result=$(curl -s localhost:8080)

if [[ "$result" =~ "Greetings from Spring Boot!" ]]; then
    TIMESTAMP=$(date +"%m-%d-%y_%T")
    REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
    INSTANCE_ID=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .instanceId)
    aws ec2 create-tags --region $REGION --resources $INSTANCE_ID \
        --tags Key=AppName,Value=$APPLICATION_NAME \
            Key=DeploymentId,Value=$DEPLOYMENT_ID \
            Key=DeploymentGroup,Value=$DEPLOYMENT_GROUP_NAME \
            Key=Date,Value=$TIMESTAMP 
    exit 0
else
    exit 1
fi