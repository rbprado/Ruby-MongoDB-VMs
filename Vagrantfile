# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 

    config.vm.box = 'ubuntu/trusty32'
    config.vm.box_url = 'https://vagrantcloud.com/ubuntu/trusty32'
    config.vm.boot_timeout = 1000

    config.vm.define :mongodb do |mongodb|
        mongodb.vm.network :private_network, ip: '192.168.2.3'
        mongodb.vm.network :forwarded_port, host: 27017, guest: 27017
        mongodb.vm.hostname = 'mongodb'
        mongodb.vm.provider 'virtualbox' do |v|
            v.customize ['modifyvm', :id, '--name', 'mongodb']
            v.customize ['modifyvm', :id, '--cpus', '1']
            v.customize ['modifyvm', :id, '--memory', 1024]
            v.customize ['modifyvm', :id, '--ioapic', 'off']
            v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
            v.customize ['modifyvm', :id, '--nictype1', 'virtio']
            v.customize ['modifyvm', :id, '--nictype2', 'virtio']
        end
        mongodb.vm.provision :shell, :inline => 'if [[ ! -f /apt-get-run ]]; then apt-get update && sudo touch /apt-get-run; fi'
        mongodb.vm.provision :shell, :inline => 'apt-get -y install mongodb-server'
        mongodb.vm.provision :shell, :inline => 'sed -i s/"bind_ip = .*"/"bind_ip = 0.0.0.0"/ /etc/mongodb.conf'
        mongodb.vm.provision :shell, :inline => 'service mongodb restart'

    end

    config.vm.define :develop do |develop| 
        develop.vm.network :private_network, ip: '192.168.2.2'
        develop.vm.hostname = 'develop'
        develop.vm.provider 'virtualbox' do |v|
         v.customize ['modifyvm', :id, '--name', 'develop']
         v.customize ['modifyvm', :id, '--cpus', '1']
         v.customize ['modifyvm', :id, '--memory', 1024]
        end
        develop.vm.provision :shell, :inline => 'if [[ ! -f /apt-get-run  ]]; then apt-get update && sudo touch /apt-get-run; fi'
        develop.vm.provision :shell, :inline => 'echo "/vagrant/greetings.rb" >> /home/vagrant/.profile' # Ruby script called at the user login
        develop.vm.provision :shell, path: 'install-rvm.sh', args: 'stable', privileged: false # https://rvm.io/integration/vagrant
        develop.vm.provision :shell, path: 'install-ruby.sh', args: '1.9.3', privileged: false
        develop.vm.provision :shell, path: 'install-ruby.sh', args: '2.2.3', privileged: false # Latest ruby stable
        develop.vm.provision :shell, :inline => 'gem install mongo', privileged: false
    end

end
