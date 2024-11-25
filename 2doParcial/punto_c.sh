#Creo Carpeta docker2Parcial en el $home

#Creo la carpeta appHomeBanking

vim index.html:
<h1> Persona_Datos </h1>
vim contacto.html:
<h1> Numero de DNI: 44764019 </h1>
<h1> Nombre: Justo</h1>
<h1> Apellido: Aymo </h1>

vim dockerfile:
FROM nginx
COPY appHomeBanking /usr/share/nginx/html

#Me logueo
docker login -u justo456
docker build -t justo456/homebanking:v1.0 .
docker push justo456/homebanking:v1.0
docker run -d -p 8080:80 justo456/2parcial-ayso:v1.0
docker image ls
docker container ls
docker stop 9dba5a2243b0

http://192.168.56.2:8080/index.html
http://192.168.56.2:8080/contacto.htm

