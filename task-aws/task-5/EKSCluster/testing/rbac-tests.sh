#!/bin/bash


echo "RBAC TEST"


kubectl auth can-i get pods -n team-b \
--as=system:serviceaccount:team-a:team-a-sa