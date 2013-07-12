#!/bin/bash

# ====== Ambari =======
cd /tmp
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/GA/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum -y install ambari-server ambari-agent

# ====== HDP =======
wget -nv http://public-repo-1.hortonworks.com/HDP-1.2.0/repos/centos6/hdp.repo -O /etc/yum.repos.d/hdp.repo
