#!/bin/bash

set -e
set -x

packer build packer-virtualbox-*hdp.json
rm -f output-*/hdp-centos-6.4-64.qcow2
qemu-img convert -O qcow2 output-virtualbox/packer-disk1.vmdk output-virtualbox/hdp-centos-6.4-64.qcow2
