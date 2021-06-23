#!/bin/bash

### MODE SECURE
set -u # en cas de variable non définit, arreter le script
set -e # en cas d'erreur (code de retour non-zero) arreter le script

# Create a resource group.
az group create --location westeurope --name resource-tp1-kevin

# Create a new virtual machine, this creates SSH keys if not present.
az vm create --resource-group resource-tp1-kevin --name vm-tp1-kevin --image UbuntuLTS --ssh-key-value ~/.ssh/id_rsa.pub --custom-data cloud-init.txt

# Open port 80 to allow web traffic to host.
az vm open-port --port 80 --resource-group resource-tp1-kevin --name vm-tp1-kevin
