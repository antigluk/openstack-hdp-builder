#!/bin/bash

# ====== Ambari =======
cd /tmp
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/GA/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum -y install ambari-server ambari-agent

# ====== HDP =======
wget -nv http://public-repo-1.hortonworks.com/HDP-1.2.0/repos/centos6/hdp.repo -O /etc/yum.repos.d/hdp.repo

# ====== EPEL =======
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm

# ====== cloud tools ======
yum install -y cloud-init
