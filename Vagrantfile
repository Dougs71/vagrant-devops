Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.name = "devops"
    end

    config.vm.box = "centos/7"
    config.vm.define "devops"
    config.vm.hostname = "devops"
    config.vm.provision "shell", path: "provision.sh"
end
