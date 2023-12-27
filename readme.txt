Going thru the tutorials

https://developer.hashicorp.com/packer/tutorials/docker-get-started/docker-get-started-build-image

packer init .
packer fmt .
packer validate .
packer build docker-ubuntu.pkr.hcl

Note: Not sure why but I have to add "-v" to the end of the "docker run -it <image> -v". Bug in packer?
