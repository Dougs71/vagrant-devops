Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.name = "devops"
    end

    config.vm.box = "Dougs71/CentOS-7.6.1810-Minimal"
    config.vm.define "devops"
    config.vm.hostname = "devops"
    config.vm.provision "shell", path: "provision.sh"
end
