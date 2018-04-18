#!/bin/bash

aws s3 sync s3://kong-jenkins /var/jenkins_home
aws s3 sync s3://kong-jenkins-ssh /root/.ssh
chmod 500 /root/.ssh/id_rsa
git config --global user.name "Kong - Jenkins"
git config --global user.email office@konghq.com
ssh-keyscan -H github.com > /etc/ssh/ssh_known_hosts
/sbin/tini -- /usr/local/bin/jenkins.sh
