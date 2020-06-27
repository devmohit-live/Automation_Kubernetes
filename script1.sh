#!/bin/bash

kubectl create deployment myapp --image=httpd

kubectl scale deploy myapp --replicas=2

for podname in $(kubectl get pods -o json| jq -r ".items[].metadata.name | @sh" | tr -d "\' \r" ); do kubectl cp kk "${podname}"://; done
sleep 15
kubectl apply -f exposing.yml

