# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  
  config.vm.hostname = 'albus'


  #
  # DEVELOPMENT MACHINE
  #
  config.vm.define :dev do |dev|

#    dev.vm.box = "albus_dev_base"

    dev.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      
      # Customize the amount of memory on the VM:
      vb.memory = "2048"


      # Logfile der Console geht auf COM1 serial port. Wir müssen aufpassen, dass wir hier
      # keinen absoluten Pfad drin haben, wegen Export als OVA Appliance
      # Docs von VBoxManage modifyvm:
      # [--uartmode<1-N> disconnected|
      #                                          server <pipe>|
      #                                          client <pipe>|
      #                                          tcpserver <port>|
      #                                          tcpclient <hostname:port>|
      #                                          file <file>|
      #                                         <devicename>]
      vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
    end


    # Run Ansible from the Vagrant VM
    dev.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook_install_pharo.yml"
    end
    
  end

  #
  # GEMSTONE DEVELOPMENT MACHINE
  #
  config.vm.define :gsdev do |dev|

    dev.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      
      # Customize the amount of memory on the VM:
      vb.memory = "2048"

    end


    # Run Ansible from the Vagrant VM
    dev.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook_install_gemstone.yml"
    end
    
  end

  

  #
  # DEMO MACHINE auf Exoscale
  #
  # config.vm.define :demo do |demo|

  #   demo.vm.provider "cloudstack" do |cs, override|

  #     # Wegen NFS Bug, siehe  https://github.com/hashicorp/vagrant/issues/5401
  #     override.nfs.functional = false


  #     override.vm.box = "exoscale-ubuntu-xenial64-10GB"

  #     cs.api_key    = Secret.exoscale_api_key
  #     cs.secret_key = Secret.exoscale_secret_key
  #     cs.service_offering_name = "Tiny"
  #     cs.security_group_names = ['default']

  #     # das exoscale cloudstack plugin musste gepatcht werden. Siehe auch:
  #     # https://github.com/MissionCriticalCloud/vagrant-cloudstack/pull/168
      
  #     cs.keypair = "dassi"
  #     cs.ssh_key = "~/.ssh/id_rsa"
  #     cs.ssh_user = "root"

  #     #    cs.network_type = "Basic"
      
  #   end


  #   # Run Ansible from the Vagrant VM
  #   demo.vm.provision "ansible_local" do |ansible|
  #     ansible.playbook = "playbook_install.yml"
  #   end
    
  # end
  

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  config.ssh.forward_x11 = true
  
  # Bootstrapping stuff in the guest
  config.vm.provision "shell", :inline => <<-SHELL
    timedatectl set-timezone Europe/Zurich
SHELL

  

end
