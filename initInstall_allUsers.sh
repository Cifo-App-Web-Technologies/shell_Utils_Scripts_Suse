#!/usr/bin/bash

#There are all initial steps in order to Install all programs and settings immediately after install a new OpenSuse Linux.
#--IMPORTANT-- follow next steps before excute this scrip:
# copy this file (initInstall.sh) in /Home/$USER

# Building a temp file to save all env $USER variable. A file named instemporal.tmp would be created in home/user.
# ----IMPORTANT----This file creation is necessary to keep all user information and in case of execute the script under a root user.
# To do so, the double quotes around the command env, ensures that $USER is expanded before sudo is invoked as root abd save
# all env $USER under root privileges.

# Two optional lines to get the same output.
# su root -c "export -p | sed 's/declare -x //' > /home/$USER/instemp.tmp"
su  root -c  "env > /home/$USER/instemp.tmp"

#Checking the system arquitecture and initiated a install.log saved in home/user
systemArchi=$(uname -m)
datelog=$(date)
echo "INSTALL.LOG created on '$datelog'."> /home/$USER/install.log
echo "The system architecture is, '$systemArchi'." >> /home/$USER/install.log
echo "-------------------------------------------" >> /home/$USER/install.log

#ADD the paths to the folder shell_Utils_Scripts_Suse.
#PATH
export PATH="$PATH:/home/$USER/shell_Utils_Scripts_Suse"

#FPATH Fusntions Path
export FPATH="$FPATH:/home/$USER/shell_Utils_Scripts_Suse/FuntionShell"

#Install git using sudo. Intro sudo password.
sudo zypper install -y git

#Check the version of the installed Git.
gitVersion=$(git --version 2> /dev/null)
dategit=$(date)
echo -e "On '$dategit'\tThe Git version installed is: '$gitVersion'." >> /home/$USER/install.log

#Config global info git "EDIT AND USE YOU OWN INFORMATION HERE"
git config --global user.name "alexpicjava"
git config --global user.mail "alex.pic.java@gmail.com"

#Create a local Repo and clone all necessary information to continue with the installation.
# git clone https://oauth-key-goes-here@github.com/username/repo.git
# key --> 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 --> Ended 01/12/22
# git clone https://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@github.com/alexpicjava/Cifo-App-Web-Technologies/shell_Utils_Scripts_Suse.git /home/$USER/shell_Utils_Scripts_Suse

git clone https://github.com/Cifo-App-Web-Technologies/shell_Utils_Scripts_Suse.git /home/$USER/shell_Utils_Scripts_Suse

# Once the repo is installed in your local home route folder, then it is possible to call the next scrip that would 
# set all the system with all the necessary software to follow the course.

#Starting Installation
installAll_allUsers.sh
