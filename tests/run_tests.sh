#!/usr/bin/env bash

set -e

source tests/k8s-euft/env.bash

ptitle "Prepare cluster"
bats tests/play/prepare.bats

ptitle "Regular deploy"
bats tests/play/deploy.bats
bats tests/play/remove_chart.bats

echo "All tests passed :)"