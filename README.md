# Sistema de Trámites

## Instalar manejador de paquetes de python
sudo apt-get install python3-pip
## Instalar postgres

sudo apt-get install postgresql

sudo apt-get install postgresql-server-dev-x.y

sudo -su postgres createdb tramites
## Instalar entorno virtual de python

pip install virtualenv

## Crear un entorno virtual de python utilizando virtualenv

virtualenv -p python3 nombre_entorno_virtual

## Activar entorno virtual
source nombre_entorno_virtual/bin/activate

## Instalar los paquetes de python para el proyecto con el entorno virtual activado

pip install -r ruta/al/proyecto/requirements.txt

## Correr el proyecto(en la carpeta raíz, donde se encuentra manage.py y el entorno virtual activado)

python manage.py migrate

python manage.py runserver



