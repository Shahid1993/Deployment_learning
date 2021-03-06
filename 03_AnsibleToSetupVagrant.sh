# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"

   config.vm.network :forwarded_port, guest: 80, host: 8080
   config.vm.network :private_network, ip: "192.168.111.222"

   config.vm.provision "shell", inline: "apt-get update"
   config.vm.provision :ansible do |ansible|

    ansible.playbook = "ansible-playbooks/setup-vagrant.yml"
    ansible.inventory_file = "ansible_hosts"
  end

end
