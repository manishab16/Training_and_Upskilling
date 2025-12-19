#!/bin/bash

echo "GRAFANA TEST"

echo "Team-A Grafana:"
kubectl port-forward -n team-a deploy/grafana 3000:3000