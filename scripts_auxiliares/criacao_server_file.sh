
#!/bin/bash

echo "\nIniciando configuração de servidor de arquivo...\n"
apt install samba -y
mkdir -p /server/publica
chmod 777 /server/publica

echo "\nConfigurando file /etc/samba/smb.conf..."



if grep -q  "#script_config" /etc/samba/smb.conf
	then
		echo "\n!! Configuração de pasta encontrada !!"
	else
		echo "#script_config" >> /etc/samba/smb.conf
		echo "[publica]\n\npath = /server/publica\nwritable = yes\nguest ok = yes\nguest only = yes" >> /etc/samba/smb.conf
fi


systemctl enable smbd
systemctl restart smbd

echo "\nServidor de arquivo configurado\n"
