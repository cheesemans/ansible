#!/bin/bash

# Install ansible and necessary collections
sudo apt-get install ansible
ansible-galaxy collection install -r requirements.yml

# Run playbook
ansible-playbook -i inventory.yml setup.yml --ask-become-pass
