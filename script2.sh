#!/bin/bash

kubectl create deployment myapp --image=vimal13/apache-webserver-php

kubectl scale deploy myapp --replicas=2


for podname in $(kubectl get pods -o json| jq -r '.items[].metadata.name'); do kubectl cp index.php "${podname}":/var/www/html; done

sleep 15
kubectl apply -f exposing.yml

