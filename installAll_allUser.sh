#! /bin/bash

# This is a Shell Scrip to install all related programs base on the Linux Opensuse Leap 15.4 distribution and to be
# used in the Wed App Developer Cifo course.
# It is a must that the script initInsta.sh has been executed. This script will executed by the initInstall.sh mentioned. 

# make the repos openSUSE-Leap-15.4-1 and repo-update-non-oss active.
sudo zypper mr -e 1 && zypper mr -e 12

#Install all external and necessary repositories.
#Snappy for IntellJ idea.
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_15.4 snappyy
sudo zypper --gpg-auto-import-keys refresh
sudo zypper dup --from snappy
sudo zypper --non-interactive install snapd
sudo systemctl enable --now snapd
#systemctl start snapd
sudo systemctl enable --now snapd.apparmor
#systemctl start snapd.apparmor

#Microsoft Repo.
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

#Google Repo.
sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

# Refresh and update all repositories.
sudo zypper --non-interactive update && zypper --non-interactive refresh

#Install teminator as the main terminal. This app helps to create diferent windows terminals in the same screen.
sudo zypper install -y terminator
terminatorVersion=$(terminator --version 2> /dev/null)
dateterminator=$(date)
echo -e "On '$dateterminator'\tThe terminator version installed is: '$terminatorVersion'." >> /home/$USER/install.log

#Install tilix as other good terminal emulator.
sudo zypper install -y tilix
tilixVersion=$(tilix --version 2> /dev/null)
datetilix=$(date)
echo -e "On '$datetilix'\tThe tilix version installed is: '$tilixVersion'." >> /home/$USER/install.log

#Install JDK ver.11 in case has not been alreay installed. Java 11 is being installed in OpenSUSE by default.
fileJ=$(readlink -f $(which java))
if [[ -f "$fileJ" ]]
then
    dateJava11=$(date)
    echo -e "On '$dateJava11'\tThe file '$fileJ' is executable and Java ver.11 is part of the system." >> /home/$USER/install.log
else
    sudo zypper install -y java-11-openjdk
    dateJava11=$(date)
    javaVersion=$(javac --version)
    echo -e "On '$dateJava11'\tThe Java version JDK installed is '$javaVersion'." >> /home/$USER/install.log
fi

#Install JDK ver.17 and chose which version run as defoult in my system.
sudo zypper --non-interactive install java-17-openjdk-devel
sudo update-alternatives --config java
javaVersion=$(javac --version)
dateJava=$(date)
echo -e "On '$dateJava'\tThe Java version of your system is: '$javaVersion'." >> /home/$USER/install.log

#Install JDK latest version. TO-DO.

#Istall Apache-maven.
sudo zypper --non-interactive install maven
mavenVersion=$(maven --version 2> /dev/null)
dateMaven=$(date)
echo -e "On '$dateMaven'\tThe maven version installed is: '$mavenVersion'." >> /home/$USER/install.log

#Install FlameShot.
sudo zypper --non-interactive install flameshot
flameShotVersion=$(flameshot --version 2> /dev/null)
dateFlameShot=$(date)
echo -e "On '$dateFlameShot'\tThe Flameshot version installed is: '$flameShotVersion'." >> /home/$USER/install.log

#Install Quarto.
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.280/quarto-1.2.280-linux-amd64.tar.gz
tar -xvzf quarto-1.2.280-linux-amd64.tar.gz -C /opt
ln -s /opt/quarto-1.2.280/bin/quarto /usr/local/bin/quarto
rm -rf quarto-1.2.280-linux-amd64.tar.gz
quartoVersion=$(quarto --version 2> /dev/null)
dateQuarto=$(date)
echo -e "On '$dateQuarto'\tThe Quarto version installed is: '$quartoVersion'." >> /home/$USER/install.log

#Install Docker && Docker Desktop.
sudo zypper --non-interactive install docker
dockerVersion=$(docker --version 2> /dev/null)
dateDocker=$(date)
echo -e "On '$dateQuarto'\tThe Docker version installed is: '$dockerVersion'."  >> /home/$USER/install.log

#Install IntellJ Idea through the snap app.
sudo snap install intellij-idea-ultimate --classic

#Alternative source to install IntelliJ idea
#https://tutorialforlinux.com/2019/05/08/how-to-install-intellij-idea-on-opensuse-15-leap-gnu-linux/
#download the tar.gz file lates is: ideaIU-2022.3.tar.gz
#wget -r --no-parent -A 'ideaIU-2022.3.tar.gz' https://download.jetbrains.com/idea/

#sudo tar -xvzf ~/Downloads/ideaIC-2022.3.tar.gz /opt
#sudo chown -R $USER:$USER /opt/idea
#sudo mv /opt/idea/idea-IC-222.4459.24 /opt/idea/idea
#sudo ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea.sh
#idea.sh

#Install Visual Code.
sudo zypper --non-interactive install code
codeVersion=$(code --version 2> /dev/null)
dateCode=$(date)
echo -e "On '$dateCode'\tThe Docker version installed is: '$codeVersion'."  >> /home/$USER/install.log

#Install google chrome.
sudo zypper --non-interactive install google-chrome-stable
googleVersion=$(google-chrome-stable --version 2> /dev/null)
dateGoogle=$(date)
echo -e "On '$dateGoogle'\tThe Docker version installed is: '$googleVersion'."  >> /home/$USER/install.log

#Create a .vimrc with a personal configuration.
makevimrc.sh
#Edit the .bashrc configuration
addConf_bashrc.sh
#Edit the terminaor configuration
termConfigUP.sh


#Link creation to duplicate some important files in a folder to backup and sent to a cloud Repo.
ln /home/$USER/.bashrc /home/$USER/shell_Utils_Scripts_Suse/SySBackups/bashrc.bak

#Git add commit and push the new backup file .bashrc
#cd shell_Utils_Scripts_Suse
#git add .
#git commit -m "[ADD] bashrc.bak"
#git push
