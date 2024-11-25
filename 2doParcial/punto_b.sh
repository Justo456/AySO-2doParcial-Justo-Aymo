#Levanto una vm para el host con ip 192.168.56.9
#Levanto una vm para el Servidor con ip 192.168.56.8
#Generno llave privada-publica en AMN
ssh-keygen
#Copio la llave publica
cat .ssh/id_rsa.pub
#La pego en .ssh/authorized.keys
#En AMN modifico el inventory y el playbook
#Ejecuto en la carpeta
ansible-playbook -i inventory playbook.yml
sudo apt list --installed |grep apache
