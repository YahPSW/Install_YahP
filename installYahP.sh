#!/bin/sh
# Instalação de ferramentas em ambiente debian 
# Autor: Guilherme Dakuzaku
# --------------------------------
# Change Log:
# 0.0.1 - Amebiente Ubuntu 20.04
# - Git, php 7.4, visual code, mysql

echo "Atualizando Ubuntu"
apt-get update; apt-get -y upgrade 

echo "Instalando Pacotes"
apt-get -y install mysql-server git libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc

echo "Instalando php"
apt-get -y install php

echo "Instalando composer";
apt -y install curl php-cli php-mbstring unzip
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

echo "instalando Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

apt-get -y install apt-transport-https
apt-get update
snap install --classic code
snap install dbeaver-ce

echo "instalando extensoes vscode"
code --install-extension dracula-theme.theme-dracula
code --install-extension ms-python.python
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension onecentlin.laravel-blade
code --install-extension onecentlin.laravel5-snippets
code --install-extension ryannaddy.laravel-artisan
code --install-extension vscode-icons-team.vscode-icons

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt install gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
gdebi -y ~/discord.deb 
apt-get -y install sublime-text
