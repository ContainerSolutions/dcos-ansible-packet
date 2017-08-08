# DC/OS Ansible

## Prerequisites

Create an `inventory` file with the following:

* 1 bootstrap node
* 1 master node
* 3 agent nodes

## How to Run

```$ ansible-playbook -i inventory playbook.yml```

## How to update the firewall

Add an IP to `local_ips` list in `vars.yaml.example` and run

```$ ansible-playbook -i inventory playbook.yml -t firewall```
