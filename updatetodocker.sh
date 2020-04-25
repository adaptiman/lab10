#!/bin/bash
sudo apt -yq update
sudo apt -yq upgrade
sudo apt -yq install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt -yq update
sudo apt -yq install docker-ce docker-ce-cli containerd.io
apt-cache madison docker-ce
sudo apt -yq install docker-ce=5:19.03.8~3-0~ubuntu-bionic docker-ce-cli=5:19.03.8~3-0~ubuntu-bionic containerd.io
sudo usermod -aG docker ${USER}