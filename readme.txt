packer init .
packer fmt .
packer validate .
packer build docker-ubuntu.pkr.hcl
