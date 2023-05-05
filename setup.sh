#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles/local_backup            # old dotfiles backup directory
files="bashrc vimrc vim profile bash_profile bash_login bashrc bash_logout inputrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"

for file in $files; do
    local_file=~/.$file
    backup_file=$olddir/.$file
    synced_file=$dir/$file

    if [ -e "$local_file" ] && [ ! -L "$local_file" ] 
    then
        echo "Backing up $local_file to $olddir"
        mv $local_file $olddir
    fi
    if [ -e "$synced_file" ] 
    then
        if [ -L "$local_file" ] 
        then
            echo "Removing existing symlink to $local_file"
            rm $local_file
        fi
        echo "Creating symlink to $file in home directory."
        ln -s $synced_file $local_file
    fi
done
