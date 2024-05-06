#!/bin/bash

cd ../Configuration/

kubectl apply -f efs.yml
kubectl apply -f wordpress.yml
kubectl apply -f ssl/ssl-issuer.yml
kubectl apply -f nginx.yml