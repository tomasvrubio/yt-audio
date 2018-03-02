# yt-audio
Integration between Youtube music and Play Music 

*Pendiente de maquetarlo y rellenarlo adecuadamente.*

### Explicación


Indicar como funciona todo el tinglado descargando las canciones, maquetándolas y volviéndolas a subir a Internet a través de Play Music.


### Instalación

Descargar repositorio. 
Modificar permisos ejecución "yt-audio.sh".

youtube-dl -> Remitir a web del proyecto

gmusicapi-scripts -> Remitir a web del proyecto

Para poderlo utilizar en la raspberry tenemos que instalar las siguientes librerías de python:
 * libxm12-dev
 * libx
 * python-dev
  
Para todas ellas utilizar python3: pip3 install nombre_paquete


### Funcionamiento

1. Prueba con el usuario que vas a utilizar. De esta manera creamos ya el fichero de autenticación que luego reutilizaremos en las ejecuciones del script desasistidas. Le tendremos que asignar una MAC al usuario que luego será la que usemos en el fichero de configuración de yt-audio. Esto lo tendremos que hacer cada vez que vayamos a sincronizar a un usuario nuevo. 
	* Comando a utilizar para realizar esa prueba inicial. 
1. Introducir datos de playlist a bajar en el fichero de configuración.
1. Lanzar script a mano.
1. Una vez comprobado que funciona programarlo en el crontab usando flock para evitar ejecuciones simultáneas. En el crontab hay que indicar dónde están los ejecutables de python.


### Contenido


Indicar el formato de los directorios y lo que va a contener cada uno.


### Tareas pendientes

* Mostrar más información de que ficheros se han bajado y cuales sincronizado. Desechar lo que no sirva para analizar problemas.
* Borrado: Al borrar una canción de playlist de Youtube se elimine del directorio local y de Play Music.

Apaños que tengo que ir haciendo.
Por la aparición del "ERROR: ffprobe or avprobe not found. Please install one." installo: 
	sudo apt-get install -y libav-tools
