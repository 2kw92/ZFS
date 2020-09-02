#!/bin/bash

#1 часть дз
#Установка zfs
yum install -y yum-utils
yum install -y http://download.zfsonlinux.org/epel/zfs-release.el7_8.noarch.rpm
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
yum-config-manager --enable zfs-kmod
yum-config-manager --disable zfs
yum install -y zfs
modprobe zfs

#Создание пула
zpool create storage mirror sdc sdd

#Создаем файловые системы и устанавливаем уровень сжатия
zfs create storage/data
zfs create storage/data/gzip
zfs set compression=gzip storage/data/gzip
zfs create storage/data/gzip-N
zfs set compression=gzip-9 storage/data/gzip-N
zfs create storage/data/zle
zfs set compression=zle storage/data/zle
zfs create storage/data/lzjb
zfs set compression=lzjb storage/data/lzjb
zfs create storage/data/lz4
zfs set compression=lz4 storage/data/lz4

#Выкачивам войну и мир
yum install -y wget
wget -O /storage/data/gzip War_and_Peace.txt http://www.gutenberg.org/files/2600/2600-0.txt
wget -O /storage/data/gzip/War_and_Peace.txt http://www.gutenberg.org/files/2600/2600-0.txt
wget -O /storage/data/gzip-N/War_and_Peace.txt http://www.gutenberg.org/files/2600/2600-0.txt
wget -O /storage/data/zle/War_and_Peace.txt http://www.gutenberg.org/files/2600/2600-0.txt
wget -O /storage/data/lzjb/War_and_Peace.txt http://www.gutenberg.org/files/2600/2600-0.txt
wget -O /storage/data/lz4/War_and_Peace.txt http://www.gutenberg.org/files/2600/2600-0.txt

#2 часть дз
wget -O zpoolexport.tar  "https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download"
tar -xvf zpoolexport.tar
zpool import -d zpoolexport otus

#3 часть дз
wget -O otus_task2.file  "https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download"
zfs receive storage/data/text1 < otus_task2.file
yum install -y mlocate
updatedb && locate -e bench-repo