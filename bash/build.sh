wget -O packer.zip https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_linux_amd64.zip
unzip packer.zip
./packer validate deployments/template.json
./packer build deployments/template.json