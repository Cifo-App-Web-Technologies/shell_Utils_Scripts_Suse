#! bin/bash
#This is the initial steps in order to Install all programs and settings immediately after install a new OpenSuse Linux.

export puser=$USER
export inifol=$PWD

#Update the Paths to the system be able to work whit the new folder.
#PATH
export PATH="$PATH:/home/$puser/shell_Utils_Scripts_Suse"

#FPATH Fusntions Path
export FPATH="$FPATH:/home/$puser/shell_Utils_Scripts_Suse/FuntionShell"

#Switch to root
sudo -E su root && ./initGit.sh

#Starting Installation
#initGit.sh

