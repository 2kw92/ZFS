# ZFS
ДЗ по Теме ZFS

Для проверки ДЗ необходимо запустить Vagrantfile,который развернет виртуальную машину, а так же
подтянет и выполнит скрипт zfs.sh (необходимо чтобы zfs.sh лежад в одной директории с Vagrantfile),
который проделает операции по установке zfs и скачиванию 
необходимых утилит для выполнения дз. Все необходимые команды прописаны в zfs.sh.
Для проверки 1-ой части дз, после установки виртуальной машины необходимо будет
выполнить следующие команды:
du -sh /storage/data/*
zfs get compressratio storage/data/gzip storage/data/gzip-N storage/data/zle storage/data/lzjb storage/data/lz4
Которые и покажут нам что механизм сжатия gzip и gzip-9 наиболее агрессивный и при таком
виде сжатия файл занимает меньше места на диске.

Для проверки 2-ой части дз, необходимо выполнить следующие команды 
zpool list otus otus/hometask2 --покажет размер хранилища
zpool status otus otus/hometask2 -- покажет тип pool
zfs get recordsize,compression,checksum otus otus/hometask2 --покажет значение recordsize,какое сжатие используется,какая контрольная сумма используется
zfs get all otus otus/hometask2 --покажет все возможные настройки

Для проверки 3-ей части дз необходимо вызвать команду:
locate secret_message --которая покажет нахождение файла
cat /storage/data/text1/task1/file_mess/secret_message --смотрим содержимое
Сожержимое файла:
https://github.com/sindresorhus/awesome
