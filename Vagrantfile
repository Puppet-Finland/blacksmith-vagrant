# -*- mode: ruby -*-
# vi: set ft=ruby :

# Convenience variables
apply = "/opt/puppetlabs/bin/puppet apply --modulepath=/vagrant/modules"

Vagrant.configure("2") do |config|
  config.vm.define "blacksmith" do |box|
    box.vm.box = "ubuntu/bionic64"
    box.vm.box_version = "20180919.0.0"
    box.vm.hostname = "blacksmith.local"
    box.vm.network "private_network", ip: "192.168.81.40"
    box.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    box.vm.provision "shell" do |s|
      s.path = "vagrant/prepare.sh"
      s.args = ["-b", "/vagrant"]
    end
    box.vm.provision "shell", inline: "#{apply} /vagrant/vagrant/blacksmith.pp"
    box.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
    end
  end
end
