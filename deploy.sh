#!/bin/sh

DIR=`dirname $0`

kubectl apply -k $DIR/deployment/tekton
kubectl apply -k $DIR/deployment/build-operator
kubectl apply -k $DIR/deployment/apheleia-operator

#restart the operators
kubectl rollout restart deployment -n jvm-build-service hacbs-jvm-operator apheleia-operator
