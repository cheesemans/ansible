#!/bin/bash

if [ $# -eq 0 ];
then
    echo "$0: Missing ansible group"
    exit 1
elif [ $# -gt 1 ];
then
    echo "$0: Too many arguments"
    exit 1
fi

ansible-playbook -i inventory.yml -l "$1" setup.yml
