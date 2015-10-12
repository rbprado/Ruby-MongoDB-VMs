# Vagrantfile for MongoDB VM and Ruby 2.2.3 VM

This project uses Vagrant to mount and deploy a environment
according the request of Paulo Schreiner from Instituto de
Pesquisas Eldorado:

The goal is to create a Vagrantfile that spins up two machines:

 - Development machine, with the latest version of Ruby installed.
 - A second machine with a database of your choice.

And a sample Ruby program that, when run, asks the user for his
name and after the name is provided it will say:

"Hello #{user}" if it's the first time this user runs the program, or
"Welcome back, #{user}" if the user has been here before.

The information about which users have used the program should be
stored in the database.

## Steps to run:

### Initial Requirements:

  * Vagrant v1.6.5 + (http://vagrantup.com)
  * Virtualbox v4.3.10 + (https://www.virtualbox.org/)
  * The port 27017 must be avaliable to mongodb VM.
  * The IP 192.168.2.3 must be avaliable to mongodb VM.
  * The IP 192.168.2.2 must be avaliable to develop VM.

### Tutorial:
    
NOTE: The command "vagrant up" can take 1 hour to run.

Basicaly you have to run the following commands:
    
    ~$ git clone https://github.com/rbprado/Ruby-MongoDB-VMs.git
    ~$ cd Ruby-MongoDB-VMs
    ~/Ruby-MongoDB-VMs$ vagrant up

    Bringing machine 'mongodb' up with 'virtualbox' provider...
    Bringing machine 'develop' up with 'virtualbox' provider...
    ==> mongodb: Importing base box 'ubuntu/trusty32'...

    [...]

    ~/Ruby-MongoDB-VMs$ vagrant ssh develop
    ~/Ruby-MongoDB-VMs$ /vagrant/lib/greetings.rb

### Access to the VMs

The following commands grants access to the VMs:

To access the VM mongodb:

    vagrant ssh mongodb

Or:

    ssh vagrant@192.168.2.3

To access the VM develop:

    vagrant ssh develop

Or:

    ssh vagrant@192.168.2.2

---

## Notes

The script greetings.rb executes a query and an insert to
mongodb in another VM.

The greetings.rb script must be called from the develop VM
according the Tutorial.

The Vagrantfile creates 2 VMs:

 - A database VM, MongoDB, nosql all in json.
 - A develop VM, with Ruby and RVM.

From the develop VM is possible to run the ruby app which 
interacts with the database.

The scripts folder stores the scripts to installation of 
Ruby and RVM according with: https://rvm.io/integration/vagrant

The lib folder stores the Ruby file developed here.

---
