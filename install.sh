#!/bin/bash

MINIKUBE_PROFILE=sonarqube
SONARQUBE_HOST=sonarqube.minikube.local

echo "Starting Minikube with Docker driver..."
if minikube start --driver=docker --profile=$MINIKUBE_PROFILE; then
    echo "Minikube started successfully."
else
    echo "Failed to start Minikube."
    exit 1
fi

echo "Enabling Minikube Ingress addon..."
if minikube addons enable ingress --profile=$MINIKUBE_PROFILE; then
    echo "Ingress addon enabled successfully."
else
    echo "Failed to enable Ingress addon."
    exit 1
fi

# echo "Enabling Minikube Ingress-DNS addon..."
# if minikube addons enable ingress-dns --profile=$MINIKUBE_PROFILE; then
#     echo "Ingress-DNS addon enabled successfully."
# else
#     echo "Failed to enable Ingress-DNS addon."
#     exit 1
# fi

echo "Initializing Terraform..."
if terraform init; then
    echo "Terraform initialized successfully."
else
    echo "Failed to initialize Terraform."
    exit 1
fi

echo "Applying Terraform configuration..."
if terraform apply -input=false -auto-approve -var sonarqube_host=$SONARQUBE_HOST; then
    echo "Terraform applied successfully."
    echo "All commands executed successfully!"
    INGRESS=$(minikube ip --profile=$MINIKUBE_PROFILE)
    echo "To access Sonarqube URL at http://$SONARQUBE_HOST:80/ add following line"
    echo "$INGRESS      $SONARQUBE_HOST"
    echo "in /etc/hosts file (root privileges required)"
else
    echo "Failed to apply Terraform configuration."
    exit 1
fi
