# Ansible playbook to provision laptops

## To do
* Install Cloud CLIs
* Create Role for software
    * Install 1Password
    * Install Firefox?
    * Install Spotify
* Consider improving readability of existing roles

## How to run

### Setup
    ./setup.sh

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

![example workflow](https://github.com/cheesemans/ansible/actions/workflows/release.yml/badge.svg)
