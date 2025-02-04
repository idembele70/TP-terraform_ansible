#!/bin/bash

apt-get update && apt-get install -y \
    software-properties-common \
    ansible \
    python3 \
    python3-pip \
    ssh \
    curl \
    wget \
    git \
    iputils-ping \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get install -y terraform

cd terraform
terraform init
terraform apply -auto-approve

cd ../
ansible-playbook -i ./ansible ./playbook.yml