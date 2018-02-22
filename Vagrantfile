# -*- mode: ruby -*-
# vi: set ft=ruby :

# Require YAML module
require 'yaml'
 
# Read YAML file with box details
servers = YAML.load_file('tests/vagrant-hosts.yml')

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"

  # Iterate through entries in YAML file
  N = servers.length - 1

  (0..N).each do |machine_id|
    config.vm.define servers[machine_id]["name"] do |srv|
      srv.vm.network "private_network", ip: servers[machine_id]["ip"], virtualbox__intnet: true
      #config.vm.network "public_network"
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers[machine_id]["name"]
        vb.memory = servers[machine_id]["memory"]
      end

      srv.vm.provision :shell do |shell|
        shell.path = "tests/bootstrap-vagrant.sh"
      end

      # Reboot to apply selinux config
      srv.vm.provision :reload

      # Only execute once the Ansible provisioner,
      # when all the machines are up and ready.
      if machine_id == N

        # Run Ansible from the Vagrant Host
        srv.vm.provision "ansible" do |ansible|
          # Disable default limit to connect to all the machines
          ansible.limit = "all"
          ansible.playbook = "playbook.yml"
          ansible.become = true
          ansible.become_user = "root"
          
          # temp
          ansible.skip_tags = "firewall"
          ansible.galaxy_role_file = "requirements.yml"
          ansible.groups = {
            "bootstrap"   => ["bootstrap"],
            "masters"     => ["master"],
            "pubagents"   => ["public_agent"],
            "agents"      => ["private_agent"]
          }
          #ansible.verbose = "vvv"
        end

      end
    end
  end
end
