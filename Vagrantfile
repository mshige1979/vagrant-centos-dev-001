# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # box name
  config.vm.box = "centos64_01"

  # box url
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/36773763/vagrant/CentOS-6.4-x86_64-v20130427.box"
  
  # network
  config.vm.network "private_network", ip: "192.168.33.10"

  # share
  config.vm.synced_folder "./", "/vagrant", \
        create: true, owner: 'vagrant', group: 'vagrant', \
        mount_options: ['dmode=777,fmode=666']

  # provision
  config.vm.provision :shell, :path => "script.sh"
  
end
