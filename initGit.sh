#--------------NOT USE---------------

#! bin/bash

#Install git
zypper install -y git

#Config global info git
git config --global user.name "alexpicjava"
git config --global user.mail "alex.pic.java@gmail.com"

#Create a local Repo and clone all necessary information to continue with the installation.
# git clone https://oauth-key-goes-here@github.com/username/repo.git
# key --> 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 --> Ended 01/12/22
# git clone https://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@github.com/alexpicjava/Cifo-App-Web-Technologies/shell_Utils_Scripts_Suse.git /home/$USER/shell_Utils_Scripts_Suse
git clone https://github.com/Cifo-App-Web-Technologies/shell_Utils_Scripts_Suse.git /home/$puser/shell_Utils_Scripts_Suse


#Update the Paths to the system be able to work whit the new folder.
#PATH
#export PATH="$PATH:/home/$puser/shell_Utils_Scripts_Suse"

#FPATH Fusntions Path
#export FPATH="$FPATH:/home/$puser/shell_Utils_Scripts_Suse/FuntionShell"

#Starting Installation
installAll.sh