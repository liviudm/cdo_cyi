#!/bin/bash

set -eou pipefail

name="kibana"

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PACKER_DIR="$(cd ${CWD} && cd ../ && pwd)"

vpc_id="vpc-b51fa3d2"
subnet_id="subnet-13fca539"

if [[ ! -d "${PACKER_DIR}/${name}" ]]; then
    mkdir -p ${PACKER_DIR}/${name}
fi

if [[ ! -d "${PACKER_DIR}/logs" ]]; then
    mkdir -p ${PACKER_DIR}/logs
fi

cd ${PACKER_DIR}
packer validate -machine-readable ${name}.json
packer build -machine-readable -var "vpc_id=${vpc_id}" -var "subnet_id=${subnet_id}" ${name}.json | tee ${PACKER_DIR}/logs/${name}-build.log

ami_id=$(egrep -m1 -oe 'ami-.{8}' ${PACKER_DIR}/logs/${name}-build.log)
echo "AMI ID: ${ami_id}"
echo ${ami_id} > ${PACKER_DIR}/${name}/latest_ami
echo $(date +'%s') ${ami_id} >> ${PACKER_DIR}/${name}/all_amis
