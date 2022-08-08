#!/bin/bash

userdel -r -f teste_dev
userdel -r -f teste_adm

groupdel GRP_DEV
groupdel GRP_ADM

rm -r /server

groupadd GRP_DEV
groupadd GRP_ADM

useradd teste_adm -c "Administrador" -p $(openssl passwd -crypt "123") -G GRP_ADM -s /bin/bash
useradd teste_dev -c "Desenvolvedor" -p $(openssl passwd -crypt "123") -G GRP_DEV -s /bin/bash

passwd teste_adm -e
passwd teste_dev -e

mkdir -p /server/config
mkdir -p /server/code

chmod 770 /server/config
chmod 774 /server/code

chown teste_adm:GRP_ADM /server/config
chown teste_dev:GRP_DEV /server/code
