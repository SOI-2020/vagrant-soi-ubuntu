#!/bin/bash

DOC_ROOT=/var/www/lab04
if ! [ -d $DOC_ROOT ]; then
    mkdir $DOC_ROOT
    cp -r /vagrant/labs/lab04/* $DOC_ROOT/
    cp /vagrant/labs/lab04/.htaccess $DOC_ROOT/
fi

if ! grep soi-lab04 /etc/hosts &> /dev/null; then
    echo "127.0.0.1       soi-lab04 www.soi-lab04 lab04.soi" | sudo tee -a /etc/hosts
fi

if ! [ -f /etc/apache2/sites-available/lab04.conf ]; then
    sudo cp /vagrant/provision/lab04-apache.conf /etc/apache2/sites-available/lab04.conf
    sudo a2ensite lab04
    sudo systemctl reload apache2
fi
