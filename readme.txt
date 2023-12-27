Going thru the tutorials

https://developer.hashicorp.com/packer/tutorials/docker-get-started/docker-get-started-build-image

packer init .
packer fmt .
packer validate .
packer build docker-ubuntu.pkr.hcl

Note: Not sure why but I have to add "-v" to the end of the "docker run -it <image> -v". Bug in packer?

packer build --var-file=example.pkrvars.hcl docker-ubuntu.pkr.hcl

packer build .
packer build --var docker_image=ubuntu:focal .

docker system prune

docker run -it learn-packer:packer-rocks -v

docker run -it learn-packer:packer-rocks -v -c "/usr/bin/snet --help"
