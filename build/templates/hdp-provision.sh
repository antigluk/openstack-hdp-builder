#!/bin/bash

# ====== Ambari =======
cd /tmp
wget -nv %{AMBARI_REPO} -O /etc/yum.repos.d/ambari.repo
yum -y install ambari-server ambari-agent

# ====== HDP =======
wget -nv %{HDP_REPO} -O /etc/yum.repos.d/hdp.repo

# ====== EPEL =======
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm

# ====== cloud tools ======
yum install -y cloud-init

# ===== NETWORKING =====
rm -f /etc/udev/rules.d/70-persistent-net.rules
