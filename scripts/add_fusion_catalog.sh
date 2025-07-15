#!/bin/bash

oc apply -f=- <<EOF
---
apiVersion: v1
kind: Namespace
metadata:
  name: ibm-fusion-access
spec:
---
apiVersion: operators.coreos.com/v1
kind: OperatorGroup
metadata:
  name: storage-scale-operator-group
  namespace: ibm-fusion-access
spec:
  upgradeStrategy: Default
---
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: openshift-fusion-access-operator
  namespace: ibm-fusion-access
spec:
  channel: stable-v1
  installPlanApproval: Automatic
  name: openshift-fusion-access-operator
  sourceNamespace: openshift-marketplace
  source: certified-operators
EOF
