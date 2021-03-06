#!/bin/bash -ex
#
# Sample script to deploy K8s cluster with Kargo.
# Please adjust to your needs.


# Configuration:
export ENV_NAME="k8s-kargo-test-env"
export IMAGE_PATH="/home/ubuntu/packer-ubuntu-1604-server.qcow2" # path to VM image file (e.g. build with packer)
export DONT_DESTROY_ON_SUCCESS=1
#export VLAN_BRIDGE="vlan456" # full name e.g. "vlan450"
export DEPLOY_METHOD="kargo"
export SLAVES_COUNT=3
export SLAVE_NODE_MEMORY=6144
export SLAVE_NODE_CPU=2
export WORKSPACE="/home/ubuntu/workspace"
CCP_INSTALLER_DIR="."  # path to root fuel-ccp-installer/ directory
export CUSTOM_YAML='hyperkube_image_repo: "quay.io/coreos/hyperkube"
hyperkube_image_tag: "v1.4.0_coreos.1"
kube_version: "v1.4.0"'


mkdir -p ${WORKSPACE}
echo "Running on ${NODE_NAME}: ${ENV_NAME}"
bash -x "${CCP_INSTALLER_DIR}/utils/jenkins/run_k8s_deploy_test.sh"
