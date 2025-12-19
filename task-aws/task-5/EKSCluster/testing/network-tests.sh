#!/bin/bash

echo "NETWORK TEST"
POD=$(kubectl get pod -n team-a -l app=app -o jsonpath='{.items[0].metadata.name}')

kubectl exec -n team-a $POD -- curl -m 5 http://app.team-b.svc.cluster.local || echo "Blocked as expected"