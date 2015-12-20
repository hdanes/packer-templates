#!/usr/bin/env bash

# Install Puppet 3.x
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -t -y -e 0 install puppet
