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
kind: CatalogSource
metadata:
  name: test-fusion-access-operator
  namespace: openshift-marketplace
spec:
  displayName: Test Storage Scale Operator
  sourceType: grpc
  image: "quay.io/openshift-storage-scale/openshift-fusion-access-catalog:stable"
---
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: openshift-fusion-access-operator
  namespace: ibm-fusion-access
spec:
  channel: alpha
  installPlanApproval: Automatic
  name: openshift-fusion-access-operator
  source: test-fusion-access-operator
  sourceNamespace: openshift-marketplace
EOF
