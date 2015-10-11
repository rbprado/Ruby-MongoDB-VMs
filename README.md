#VM mongodb - Ubuntu Trusty32 + MongoDB
#VM develop - Ubuntu Trusty32 + Ruby and RVM installations

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

## Initial Requirements

### You will need:

  * Vagrant v1.6.5 + (http://vagrantup.com)
  * Virtualbox v4.3.10 + (https://www.virtualbox.org/)

### Clone this repositoriy with submodules (they are puppet submodules)
    Bringing machine 'mongodb' up with 'virtualbox' provider...
    Bringing machine 'develop' up with 'virtualbox' provider...
    ==> mongodb: Importing base box 'ubuntu/trusty32'...
    [...]

### Access to the VMs

    The following commands grants access to the VMs:

    Ruby-MongoDB-VMs$ vagrant ssh mongodb
    Ruby-MongoDB-VMs$ vagrant ssh develop

    To access a VM from another, use ssh with "vagrant" user to the
    configured IPs at the Vagrantfile.

    To access the VM mongodb:
    ssh vagrant@192.168.2.3

    To access the VM develop:
    ssh vagrant@192.168.2.2


---

## Notes

---

## Known issues

---

## ToDo

goal.t2t
