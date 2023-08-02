## 1

Вывести в консоль список всех пользователей системы

```
$ cat /etc/passwd | grep -o '^[^:]*'
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
systemd-network
systemd-resolve
systemd-timesync
messagebus
syslog
_apt
tss
uuidd
tcpdump
landscape
pollinate
fwupd-refresh
usbmux
sshd
systemd-coredump
notme
lxd
_chrony
node_exporter
telnetd
```


## 2

Найти и вывести в консоль домашние каталоги для текущего пользователя и root

```
$ whoami
notme

$ echo ~root
/root

$ echo ~notme
/home/notme
```


## 3

Создать Bash скрипт get-date.sh, выводящий текущую дату

```
$ cat get-date.sh
#!/bin/bash

date

$ bash get-date.sh
Wed 02 Aug 2023 09:33:07 AM +03
```


## 4

Запустить скрипт через ./get-date.sh и bash get-date.sh. Какой вариант не работает? Сделать так, чтобы оба варианта работали

```
$ bash get-date.sh
Wed 02 Aug 2023 09:33:07 AM +03

$ ./get-date.sh
-bash: ./get-date.sh: Permission denied

$ chmod +x get-date.sh

$ ./get-date.sh
Wed 02 Aug 2023 09:34:32 AM +03
```


## 5

Создать пользователей alice и bob с домашними директориями и установить /bin/bash в качестве командной оболочки по умолчанию

```
$ sudo adduser alice --home /home/alice --shell /bin/bash
Adding user `alice' ...
Adding new group `alice' (1005) ...
Adding new user `alice' (1003) with group `alice' ...
Creating home directory `/home/alice' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for alice
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y

$ sudo adduser bob --home /home/bob --shell /bin/bash
Adding user `bob' ...
Adding new group `bob' (1004) ...
Adding new user `bob' (1002) with group `bob' ...
Creating home directory `/home/bob' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for bob
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y
```


## 6

Запустить интерактивную сессию от пользователя alice. Создать файл secret.txt с каким-нибудь секретом в домашней директории при помощи текстового редактора nano

```
$ su alice
Password:

$ nano ~/secret.txt

$ cat ~/secret.txt
Top Secret
```


## 7

Вывести права доступа к файлу secret.txt

```
$ ls -la secret.txt
-rw-rw-r-- 1 alice alice 11 Aug  2 09:46 secret.txt
```


## 8

Выйти из сессии от alice и открыть сессию от bob. Вывести содержимое файла /home/alice/secret.txt созданного ранее не прибегая к команде sudo.
В случае, если это не работает, объяснить

```
alice@ubuntu-study:~$ exit
exit

notme@ubuntu-study:~/hw8$ su bob
Password:

bob@ubuntu-study:/home/notme/hw8$ cd ~

bob@ubuntu-study:~$ cat /home/alice/secret.txt
Top Secret
```


## 9

Создать файл secret.txt с каким-нибудь секретом в каталоге /tmp при помощи текстового редактора nano

```
$ nano /tmp/secret.txt

$ cat /tmp/secret.txt
top secret credentials
```


## 10

Вывести права доступа к файлу secret.txt. Поменять права таким образом, чтобы этот файл могли читать только владелец и члены группы, привязанной к файлу

```
$ ls -la /tmp/secret.txt
-rw-rw-r-- 1 bob bob 23 Aug  2 09:54 /tmp/secret.txt

$ sudo chmod 440 /tmp/secret.txt

$ ls -la /tmp/secret.txt
-r--r----- 1 bob bob 23 Aug  2 09:54 /tmp/secret.txt
```


## 11

Выйти из сессии от bob и открыть сессию от alice. Вывести содержимое файла /tmp/secret.txt созданного ранее не прибегая к команде sudo

```
$ su alice
Password:

alice@ubuntu-study:/tmp$ cat secret.txt
cat: secret.txt: Permission denied
```


## 12

Добавить пользователя alice в группу, привязанную к файлу /tmp/secret.txt

```
$ sudo usermod -a -G bob alice
```


## 13

Вывести содержимое файла /tmp/secret.txt

```
$ su alice
Password:

alice@ubuntu-study:/home/notme/hw8$ cd /tmp/

alice@ubuntu-study:/tmp$ cat secret.txt
top secret credentials
```


## 14

Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice с помощью rsync

```
$ rsync -r /home/alice/ /tmp/alice
```


## 15

Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice на другую VM по SSH с помощью rsync. Как альтернатива, можно скопировать любую папку с хоста на VM по SSH

```
$ sudo rsync -r /home/alice/ notme@127.0.0.1:/tmp/rsync-ssh-alice
notme@127.0.0.1's password:

$ ls -la /tmp/rsync-ssh-alice/
total 32
drwxr-xr-x  3 notme notme 4096 Aug  2 10:27 .
drwxrwxrwt 21 root  root  4096 Aug  2 10:27 ..
-rw-------  1 notme notme  460 Aug  2 10:27 .bash_history
-rw-r--r--  1 notme notme  220 Aug  2 10:27 .bash_logout
-rw-r--r--  1 notme notme 3771 Aug  2 10:27 .bashrc
drwxrwxr-x  3 notme notme 4096 Aug  2 10:27 .local
-rw-r--r--  1 notme notme  807 Aug  2 10:27 .profile
-rw-rw-r--  1 notme notme   11 Aug  2 10:27 secret.txt
```


## 16

Удалить пользователей alice и bob вместе с домашними директориями

```
sudo userdel -r alice
userdel: alice mail spool (/var/mail/alice) not found

sudo userdel -r bob
userdel: bob mail spool (/var/mail/bob) not found

$ ls -la /home/
total 16
drwxr-xr-x  4 root  root          4096 Aug  2 10:30 .
drwxr-xr-x 19 root  root          4096 Jun 25 21:03 ..
drwxr-xr-x  2  1002 node_exporter 4096 Jul 13 11:45 new_user
drwxr-xr-x 11 notme notme         4096 Aug  2 09:28 notme
```


## 17

С помощью утилиты htop определить какой процесс потребляет больше всего ресурсов в системе

```
$ echo q | htop -s PERCENT_MEM | aha --black --line-fix > htop_sort_by_mem.html
```


## 18

Вывести логи сервиса Firewall с помощью journalctl не прибегая к фильтрации с помощью grep

```
$ journalctl -u firewalld
-- Logs begin at Sun 2023-06-25 21:06:11 +03, end at Wed 2023-08-02 11:07:07 +03. --
Aug 02 11:07:04 ubuntu-study systemd[1]: Starting firewalld - dynamic firewall daemon...
Aug 02 11:07:04 ubuntu-study systemd[1]: Started firewalld - dynamic firewall daemon.
```