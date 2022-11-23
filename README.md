# Ansible playbook to provision laptops

## To do
* Roles instead of tasks to be more ansible-esque?
* Integrate old tasks into new setup playbook

## How to run

### Set up personal computer
    ./setup.sh personal

### Set up work computer
    ./setup.sh work

## Remap caps lock to esc
* Install GNOME Tweaks via Ubuntu Software Store.
* Start GNOME Tweaks, navigate to "Keyboard & Mouse"
    * Press "Additional Layout Options"
        * Alter Caps Lock Behaviour to "Make Caps Lock an additional Esc"
