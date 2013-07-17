#!/bin/bash
# Builds virtual machine for OpenStack.
# You can pass configuration file as first argument. Default config is 'default'
# Configuration files are looked at 'templates/configname.conf'

set -e
set -x

if ! which qemu-img; then
	echo "No 'qemu-img' application"
	exit 1
fi

if ! which packer; then
	echo "No 'packer' application"
	exit 1
fi


# Function makes file from template
# - $1 - first parameter is template file. Base directory is 'templates/' folder
# - $2 - second parameter is target location
function process_template() {
	mkdir -p "`dirname $2`"
	cp "templates/$1" "$2"

	# Replace all %{VARIABLE} to enviromnent variable
	perl -p -i -e 's/\%\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' "$2"
}

# ==== MAKING CONFIGURATION FILES ====

# Template variables set file
[ -z "$1" ] && TEMPLATE="default" || TEMPLATE="$1"

(
	source "templates/$TEMPLATE.conf";
	process_template anaconda-ks.cfg http_directory/anaconda-ks.cfg
	process_template hdp-provision.sh provisioners/hdp-provision.sh
)

# ==== DO BUILDING ====

packer build packer-virtualbox-*hdp.json
rm -f output-*/hdp-centos-6.4-64.qcow2

# ==== CONVERT TO QCOW2 FORMAT ====
qemu-img convert -O qcow2 output-virtualbox/packer-disk1.vmdk output-virtualbox/hdp-centos-6.4-64.qcow2
