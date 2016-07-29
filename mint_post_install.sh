#!/bin/bash

if [ ! `id -un` == 'root' ]; then
    echo "Must be root to run"
    exit 1
fi

#apt-get update
#apt-get upgrade

packages_dev="
eclipse 
git
maven
haskell-platform
guake 
subversion
meld
"

packages="
chromium-browser 
kile
vlc 
pepperflashplugin-nonfree
ubuntu-restricted-extras
libdvdread4 
dropbox 
python-gpgme
skype 
sharutils 
rar 
arj 
lunzip 
lzip 
glipper 
wine 
filezilla 
texlive-latex-extra
wireshark
hardinfo
audacity
tor
texlive-base
texlive
texlive-bibtex-extra
texlive-fonts-extra
acpi
shutter
calibre
okular
latex-xcolor
"

apt-get install -y $packages
apt-get install -y $packages_dev

/usr/share/doc/libdvdread4/install-css.sh 
