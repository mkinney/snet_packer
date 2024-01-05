Build docker image that contains snet

https://github.com/mkinney/snet

Used https://developer.hashicorp.com/packer/tutorials/docker-get-started/docker-get-started-build-image as a starting guide.

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
