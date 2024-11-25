#Hacemos esto 3 veces:
sudo fdisk /dev/sdc
n new
p partition
enter
enter
+1G

#Hacemos esto 1 vez:
creación 1 partición extendida
n new
e extended
enter
enter
+3G

creación 2 particiones lógicas dentro de la extendida, hacer esto x2
n new
enter
+1,5G

#Asignar particion 1 como swap:
sudo fdisk /dev/sdc
t cambiar el sistema de archivos
1 elegimos partición 1
L listado de fs
82 elige fs swap
w guardar
sudo mkswap /dev/sdc1
sudo swapon /dev/sdc1

#Crear Pv, Vg y Lv con LVM:
sudo wipefs -a /dev/sdc2
sudo wipefs -a /dev/sdc3
sudo wipefs -a /dev/sdc4
sudo wipefs -a /dev/sdc5
sudo wipefs -a /dev/sdc6
sudo fdisk /dev/sdc
sudo fdisk -l
sudo fdisk /dev/sdc
sudo fdisk -l
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
sudo pvs
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo pvs
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L 1G vgDevelopers -n lvDevops
sudo lvcreate -L .9G vgDevelopers -n lvDevops
sudo lvcreate -L 2G vgAdmin -n lvAdmin
sudo lvcreate -L 1.9G vgAdmin -n lvAdmin
sudo lvs
sudo fdisk -l
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops
sudo mkdir /mnt/lvAdmin
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin
df -h

