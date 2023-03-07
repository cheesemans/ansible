# Ansible playbook to provision laptops

## To do
* Install Cloud CLIs
* Create Role for software
  * Install Spotify
* Consider improving readability of existing roles

## How to run

### Setup
    ./setup.sh -f

## Manual steps
Some steps are too tedious to automate, these have to be run manually 🥲, for now!

### Remap caps lock to esc
* Start GNOME Tweaks, navigate to "Keyboard & Mouse"
  * Press "Additional Layout Options"
    * Alter Caps Lock Behaviour to "Make Caps Lock an additional Esc"

### Update terminal configuration
In order for starship to render nicely, the font and color scheme needs to be updated in the
terminal preferences.  Don't forget this step!

![example workflow](https://github.com/cheesemans/ansible/actions/workflows/release.yml/badge.svg)
