#!/bin/bash

if [ $# -eq 0 ]; then
    echo "$0: Missing ansible group"
    exit 1
elif [ $# -gt 1 ]; then
    echo "$0: Too many arguments"
    exit 1
fi

if [ "$1" == "personal" ]; then
    tags="personal"
elif [ "$1" == "work" ]; then
    tags="work"
else
    echo "Invalid option, valid arguments are [personal, work]"
    exit 1
fi

# Install ansible and necessary collections
sudo apt-get install ansible
ansible-galaxy collection install -r requirements.yml

# Run playbook
ansible-playbook -i inventory.yml -l "$1" setup_playbook.yml --tags "$tags"
