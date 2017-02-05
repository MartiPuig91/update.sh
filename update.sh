#!/bin/bash

user=$(whoami)
cd /home/$user
DIA=`date +"%d/%m/%Y"`

update=$(grep $DIA update.txt)

if ping -c1 google.com &>/dev/null; 
	then
	echo "Tenemos conexión y podemos actualizar"
	if [ $update = $DIA ]
		then
		echo "El equipo ya está actualizado"

	else
		echo "El equipo hay que actualizarse"
	
	    echo " "
	    echo "Iniciamos las actualizaciones del sistema"
	    echo " "
	    echo " "
	    echo "Limpiamos el sistema"
	    echo sudo apt-get clean all
	    echo " "
	    echo " "
        echo "Descargamos los nuevos paquetes del software instalado"
	    sudo apt-get update -y
	    echo " "
	    echo " "
        echo "Actualizamos el software instalado"
        sudo apt-get upgrade -y
        echo " "
        echo " "
        echo "Actualizamos la distribución instalado"
        sudo apt-get dist-upgrade -y
        echo " "
        echo " "
        echo "Buscamos si hay actualizaciones del sistema operativo"
        sudo update-manager -d
        echo " "
        echo " "
        echo "Recuperamos espacio inutilizado"
        sudo apt-get autoclean -y
        echo " "
        echo " "
        echo "ELiminamos del cache los paquets .deb"
        sudo apt-get clean -y
        echo " "
        echo " "
        echo "Borra los paquetes huerfanos"
        sudo apt-get autoremove -y
        echo " "
        echo " "
        echo "Actualizmos la base de datos de Rkhunter"         #Hay que tener instalado el programa
        sudo rkhunter --update
    	sudo rkhunter --propupd
        echo " "
        echo " "
        echo "Instalamos las actualizaciones corrompidas"
        sudo apt-get install -f
        echo " "
        echo " "
        echo "Actualizamos el programa youtube-dl"               #Hay que tener instalado el programa
        sudo pip install --upgrade youtube-dl
        echo ""
        echo ""
        echo "Actualitzamos el descarregador de Udemy"            #Hay que tener instalado el programa
    	sudo pip install --upgrade udemy-dl
        echo " "
        echo " "
        echo "Actualitzaciones efectuadas correctamente"
        echo "$DIA" >> update.txt
    fi    
else
	echo "No tenim connexió per tant no ens és possible actualitzar"
fi
	
	
