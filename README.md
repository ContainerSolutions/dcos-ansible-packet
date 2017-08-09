# DC/OS Ansible

Ansible playbook for setting up a single master DC/OS cluster. The cluster will consists of nodes with bootstrap, master and agent roles.

## Contact

Frank Scholten [@Frank_Scholten](https://twitter.com/Frank_Scholten)

## Prerequisites

* Create an `inventory` file with a single master and at least 3 agents. The master node can be both a
bootstrap and master node which saves costs. See the example below.

* Add hostnames and IPs to `/etc/hosts`

* SSH into the nodes so your pub key is authorized and Ansible SSH works

* Test connectivity with `ansible -i inventory m ping all`

## Example inventory file

Use the following inventory file and change the IPs

```
[bootstrap]

master1 ansible_host=1.1.1.1 ansible_user=root

[agents]

agent1 ansible_host=11.11.11.11 ansible_user=root
agent2 ansible_host=22.22.22.22 ansible_user=root
agent3 ansible_host=33.33.33.33 ansible_user=root

[masters]

master1 ansible_host=1.1.1.1 ansible_user=root

```

## How to deploy

```$ ansible-playbook -i inventory playbook.yml```

## How to update the firewall

Add an IP to `local_ips` list in `vars.yaml.example` and run

```$ ansible-playbook -i inventory playbook.yml -t firewall```

This will update the ipset rules. To learn more about the firewall read this [blog post](http://container-solutions.com/how-to-secure-dcos-packet-cluster-ip-whitelisting-ipset/)
