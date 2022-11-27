# Ansible playbook to provision laptops

## To do
* Automate docker installation
* Automate vscode installation and configuration?

## How to run

### Set up personal computer
    ./setup.sh personal

### Set up work computer
    ./setup.sh work

## Manual steps
Some steps are too tedious to automate, these have to be run manually 🥲, for now!

### Remap caps lock to esc
* Install GNOME Tweaks via Ubuntu Software Store.
* Start GNOME Tweaks, navigate to "Keyboard & Mouse"
    * Press "Additional Layout Options"
        * Alter Caps Lock Behaviour to "Make Caps Lock an additional Esc"

### Update terminal configuration
In order for starship to render nicely, the font and color scheme needs to be updated in the
terminal preferences.  Don't forget this step!

### Install vim plugins
After launching vim, run:

    :PluginInstall

![example workflow](https://github.com/github/docs/actions/workflows/main.yml/badge.svg)
