# DC/OS Ansible Packet

Ansible playbook for setting up a single master DC/OS cluster on Packet Cloud. The cluster will consists of nodes with bootstrap, master and agent roles.

## Contact

Frank Scholten [@Frank_Scholten](https://twitter.com/Frank_Scholten)

## Prerequisites

* Create 5 machines or cloud instances, 1 bootstrap, 1 master and 3 or more agents.

* Add their hostnames and IPs to `/etc/hosts`

* Edit the example `inventory` file. See the example below.

* SSH into the nodes so your pub key is authorized and Ansible SSH works

* Test connectivity with `ansible -i inventory -m ping all`

## Example inventory file

Use the example inventory file and set the IP addresses.

```
[bootstrap]

bootstrap ansible_ssh_host=1.1.1.1 ansible_user=root

[masters]

master ansible_ssh_host=2.2.2.2 ansible_user=root

[agents]

agent1 ansible_ssh_host=3.3.3.3 ansible_user=root
agent2 ansible_ssh_host=4.4.4.4 ansible_user=root
agent3 ansible_ssh_host=5.5.5.5 ansible_user=root
```

## How to deploy

```$ ansible-playbook -i inventory playbook.yml```

## How to update the firewall

Add an IP to `local_ips` list in `vars.yaml.example` and run

```$ ansible-playbook -i inventory playbook.yml -t firewall```

This will update the ipset rules. To learn more about the firewall read this [blog post](http://container-solutions.com/how-to-secure-dcos-packet-cluster-ip-whitelisting-ipset/)
