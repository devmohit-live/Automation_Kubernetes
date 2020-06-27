#!/bin/bash

kubectl create deployment myapp --image=httpd

kubectl scale deploy myapp --replicas=2

for podname in $(kubectl get pods -o json| jq -r '.items[].metadata.name'); do kubectl cp root/project/webfiles "${podname}":/usr/local/apache2/htdocs/; done

sleep 15
kubectl apply -f exposing.yml

