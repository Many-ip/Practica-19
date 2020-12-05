# Practica-19
En este proyecto de GitHub es un fichero de configuración para leer un fichero de logs y te indica los intetnos de intrusión, IP y pais

## Comenzando 🚀
Para poder hacer uso de este script se requiere de un equipo linux y dar permisos de ejecucuón del mismo

## Pre-requisitos 📋
Se requiere:
* Conocimientos de linux (terminal)
* Tener dispositivo linux
* Instalar geoip-bin

## Instalación 🔧

Hay que clonar el repositorio:

```
git clone https://github.com/Many-ip/Practica-19
```
Una vez colonado use:
```
cd Practica-19
chmod +x show-attackers.sh 
```
Aprovechamos para instalar si no lo tenemos instalado
```
sudo apt install geoip-bin
```
## Funcionalidad 👨🏽‍💻
Para hacer uso de este programa solo requiere de un parametro, el cual es indicar el fichero.
Puede usar el fichero de prueba de esta manera:
``
./show-attackers.sh syslog-sample
``
