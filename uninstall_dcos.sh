#!/bin/bash

rm -rf /etc/systemd/system/dcos*
rm -rf /opt/mesosphere /var/lib/mesos /var/lib/dcos /var/lib/zookeeper /var/log/mesos /etc/mesosphere /var/lib/mesosphere && \
rm -rf /etc/profile.d/dcos.sh /etc/systemd/journald.conf.d/dcos.conf /etc/systemd/system/dcos-cfn-signal.service /etc/systemd/system/dcos-download.service /etc/systemd/system/dcos-link-env.service /etc/systemd/system/dcos-setup.service /etc/systemd/system/multi-user.target.wants/dcos-setup.service /etc/systemd/system/multi-user.target.wants/dcos.target &&
rm -rf /run/dcos
