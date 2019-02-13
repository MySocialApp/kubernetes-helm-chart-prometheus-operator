#!/usr/bin/env bats

load ../k8s-euft/env
load common

@test "Deploying Prometheus operator helm chart" {
    helm install -f tests/configs/default.yaml kubernetes -n prometheus-operator
}

@test "Check Prometheus operator is deployed" {
    check_pod_is_running deployment '-l app=prometheus-operator' 'Prometheus Operator'
}