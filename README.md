# DC/OS Ansible Packet

Ansible playbook for setting up a single master DC/OS cluster on Packet Cloud. The cluster will consists of nodes with bootstrap, master, public agent and agent roles.

## Contact

Frank Scholten [@Frank_Scholten](https://twitter.com/Frank_Scholten)

## Prerequisites

* Run `ansible-galaxy install -r requirements.yml` to install the Ansible dependencies.

* Create 5 machines or cloud instances, 1 bootstrap, 1 master, 1 public agent and one more agents.

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

[pubagents]

agent3 ansible_ssh_host=5.5.5.5 ansible_user=root
```

## How to deploy

```$ ansible-playbook -i inventory playbook.yml```

After the cluster is installed the bootstrap node can be removed to save costs.

## How to update the firewall

Add an IP to `local_ips` list in `vars.yaml.example` and run

```$ ansible-playbook -i inventory playbook.yml -t firewall```

This will update the ipset rules. To learn more about the firewall read this [blog post](http://container-solutions.com/how-to-secure-dcos-packet-cluster-ip-whitelisting-ipset/)

## Testing

A Vagrant environment is available for local testing of setups.

Requirements:

- Vagrant + Virtualbox
- 'vagrant-reload' plugin (https://github.com/aidanns/vagrant-reload)

To provision the testing environment:

- create a `vars.yaml` and set `net_interface`/`net_interface_label` vars to "eth1" and `cloud` to "vagrant" (for the specific "detect-ip" script)
- execute `$ vagrant up`

VM hosts (and respective static IP addresses) are defined in the `tests/vagrant-hosts.yml` YAML file
