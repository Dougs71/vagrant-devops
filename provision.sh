# Common packages
yum install -y epel-release
yum install -y wget
yum install -y git
yum install -y unzip

# Create SSH keys
sudo -H -u vagrant bash -c 'yes y | ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa'

# Ansible
yum install -y ansible

# AWS CLI
yum install -y python-pip
pip install --upgrade --force-reinstall pip==9.0.3
pip install --upgrade pip boto botocore boto3 awscli

# Kubectl
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubectl

# Kops
wget -q https://github.com/kubernetes/kops/releases/download/1.17.0/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops
chmod +x /usr/local/bin/kops

# Docker

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
usermod -aG docker vagrant
systemctl enable docker.service
systemctl start docker.service

# Docker Compose
yum upgrade python*
pip install docker-compose

# Terraform
wget -q https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip
unzip -e terraform_0.12.28_linux_amd64.zip
rm -f terraform_0.12.28_linux_amd64.zip
mv terraform /usr/local/bin/

# Packer
wget -q https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip
unzip -e packer_1.6.0_linux_amd64.zip
rm -f packer_1.6.0_linux_amd64.zip
mv packer /usr/local/bin/

# Vault
wget -q https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip
unzip -e vault_1.4.2_linux_amd64.zip
rm -f vault_1.4.2_linux_amd64.zip
mv vault /usr/local/bin/
