Vagrant.configure("2") do |config|
    #config.vbguest.auto_update = false
    #config.vm.box_check_update = false
    #config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 1
        v.name = "devops"
    end

    config.vm.box = "centos/7"
    config.vm.define "devops"
    config.vm.hostname = "devops"
    #config.vm.network "public_network", ip: "192.168.1.70", bridge: "em1"
    config.vm.provision "shell", path: "provision.sh"
end