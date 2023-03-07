#!/bin/bash
first_time_setup=false

print_usage() {
  printf """
Usage: ./setup.sh [options]

Options:
- f     Indicates first time setup
-h      Print help
"""
}

while getopts 'fh' flag; do
  case "${flag}" in
    f) first_time_setup=true ;;
    h) print_usage
       exit 0;;
    *) print_usage
       exit 1 ;;
  esac
done

# Install ansible and necessary collections
if $first_time_setup ; then
    sudo apt-get install ansible
    ansible-galaxy collection install -r requirements.yml
fi

# Run playbook
ansible-playbook -i inventory.yml setup.yml --ask-become-pass

# Install Plugins in vim
if $first_time_setup ; then
    vim -c PluginInstall -c 'qa!'
fi

# Add SSH key to Github
if $first_time_setup ; then
    while true; do
        read -p "Log into 1Password and configure it for use with 1Password CLI (https://developer.1password.com/docs/cli/get-started/#sign-in), type 'Y/y' when done!\n" choice
        case $choice in
            [Yy]* ) echo "Continuing..."; break;;
            * ) echo "Follow the instructions!";;
        esac
    done

    op signin
    op plugin init gh
    echo "source $HOME/.config/op/plugins.sh" >> ~/.bashrc && source ~/.bashrc
    echo "Run: gh ssh-key add "$HOME/.ssh/id_ssh_ed25519.pub" -t personal-laptop"
fi