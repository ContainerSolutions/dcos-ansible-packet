#!/usr/bin/env bash

set -x -o errexit

# set selinux to permissive
sed -i 's/SELINUX=\(disabled\|enforcing\)/SELINUX=permissive/g' /etc/selinux/config
sestatus

# workaround for 'bridge-nf-call-ip6tables is disabled' public_agent warning
modprobe br_netfilter

sysctl net.bridge.bridge-nf-call-iptables=1
sysctl net.bridge.bridge-nf-call-ip6tables=1

exit 0
