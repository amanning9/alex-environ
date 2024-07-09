#!/usr/bin/env bash
#set template path
environ_dir=~/.alex-environ
template_dir=${environ_dir}/setup/templates
environ_home=${environ_dir}/home

########## Move git repo to standard location
cd ~
mv alex-environ .alex-environ

########## Create .config if it doesn't exist
mkdir -p ~/.config

########## Copy templates into local files then edit them with vim.
cd ~/.alex-environ/setup/templates

# VIMrc (first as we are gonna use vim to edit everything else)
cat ${template_dir}/vimrc_template >> ~/.vimrc
vim ~/.vimrc

# Bash_profile
cat ${template_dir}/bash_profile_local_template >> ~/.bash_profile
vim ~/.bash_profile

# Bashrc
cat ${template_dir}/bashrc_local_template >> ~/.bashrc
vim ~/.bashrc

# Bash logout
cat ${template_dir}/bash_logout_template >> ~/.bash_logout
vim ~/.bash_logout

# Git config
cat ${template_dir}/gitconfig_template >> ~/.gitconfig
vim ~/.gitconfig

# TMUX config
cat ${template_dir}/tmux.conf_template >> ~/.tmux.conf
vim ~/.tmux.conf

# SSH config
cat ${template_dir}/sshconfig_template >> ~/.ssh/config
vim ~/.ssh/config
chmod 600 ~/.ssh/config

########## Setup the git hooks which run when this repo is pulled
cp ${template_dir}/post-merge ~/.alex-environ/.git/hooks

########## Create authorized_keys and run the auth keys script
touch ~/.ssh/authorized_keys
~/.alex-environ/setup/git_hooks/auth_keys.sh

########## Link files which do not support includes
##### In .config
#flake8
ln -s ${environ_home}/.config/flake8 ~/.config/flake8
#pylint
ln -s ${environ_home}/.config/pylintrc ~/.config/pylintrc
#matplotlib
ln -s ${environ_home}/.config/matplotlib ~/.config/matplotlib
#yamllint
ln -s ${environ_home}/.config/yamllint ~/.config/yamllint
#mypy
ln -s ${environ_home}/.config/mypy ~/.config/mypy

##### In home dir
ln -s ${environ_home}/.fonts ~/.fonts

# readline
ln -s ${environ_home}/.inputrc ~/.inputrc
