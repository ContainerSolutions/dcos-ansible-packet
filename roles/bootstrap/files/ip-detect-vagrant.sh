#!/bin/bash

set -o nounset -o errexit
export PATH=/usr/sbin:/usr/bin:$PATH
echo $(ip address show eth1 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
