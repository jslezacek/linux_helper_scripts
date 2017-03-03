#!/bin/bash

if [ ! $(id -un) == 'root' ]; then
echo "Must be root to run"
exit 1
fi

rpm -Uhv http://repo.rundeck.org/latest.rpm
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
wget -O /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

# cat >/etc/yum.repos.d/tor.repo<<EOF
# [tor]
# name=Tor repo
# enabled=1
# baseurl=https://deb.torproject.org/torproject.org/rpm/DISTRIBUTION/$basearch/
# gpgcheck=1
# gpgkey=https://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc
#        https://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.2012.asc
# repo_gpgcheck=1
# 
# [tor-source]
# name=Tor source repo
# enabled=1
# autorefresh=0
# baseurl=https://deb.torproject.org/torproject.org/rpm/DISTRIBUTION/SRPMS
# gpgcheck=1
# gpgkey=https://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc
#        https://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.2012.asc
# repo_gpgcheck=1
# EOF

packages="
vlc
guake
kile
texlive
eclipse
wireshark
okular
filezilla
cairo-dock
gnome-tweak-tool
yum-plugin-fastestmirror
git
git-core
subversion
tor
gnome-shell-extension-pidgin
purple-plugin_pack-pidgin
pidgin-privacy-please
gcc 
kernel-devel
autofs
nfs-utils
wine
dropbox
p7zip-plugins
unrar
akmod-nvidia-304xx
"

latex="
texlive-moderncv
bibtex
texlive-bibtex
texlive-datetime
texlive-epstopdf
texlive-moderncv.noarch
texlive-moderntimeline.noarch
"

web_packages="
https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm
http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm
http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
"


yum install -y $web_packages
yum install -y $packages
yum groupinstall "Development Tools" "Development Libraries"
yum install akmod-nvidia-304xx

yum update -y

echo "source $(rpm -ql git-core |grep git-prompt.sh)" >> /etc/bashrc
echo "export PS1='\[\e[36;1m\]\u\[\e[31;1m\]@\[\e[32;1m\]\h:\[\e[33;1m\]\w \e[38;5;28m$(__git_ps1 \" (%s)\") \[\e[0m\] \$ '" >> /etc/bashrc
