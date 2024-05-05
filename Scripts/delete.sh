#!/bin/bash

cd ../Configuration/

kubectl delete -f efs.yml
kubectl delete -f wordpress.yml
kubectl delete -f nginx.yml
