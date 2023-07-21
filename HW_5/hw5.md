***1***
-
Распределить основные сетевые протоколы (перечислены ниже) по уровням модели TCP/IP

Уровень приложений
FTP
RTP
DNS
HTTP
NTP
SSH

Транспортный уровень
UDP
TCP

Сетевой уровень
ICMP

Уровень доступа к сети
отсутствуют


***2***
-
Узнать pid процесса и длительность подключения ssh с помощью утилиты ss

$ sudo ss -lpn | grep ssh | grep 0.0.0.0  && ss -atop
tcp     LISTEN   0        128                                           0.0.0.0:22                                               0.0.0.0:*                       users:(("sshd",pid=724,fd=3))              
State                Recv-Q               Send-Q                               Local Address:Port                                 Peer Address:Port                Process
LISTEN               0                    4096                                 127.0.0.53%lo:domain                                    0.0.0.0:*
LISTEN               0                    128                                        0.0.0.0:ssh                                       0.0.0.0:*
ESTAB                0                    0                                       10.0.0.221:ssh                                     10.0.0.20:55371                timer:(keepalive,96min,0)
ESTAB                0                    0                                       10.0.0.221:ssh                                     10.0.0.20:55374                timer:(keepalive,96min,0)
LISTEN               0                    128                                           [::]:ssh                                          [::]:*
-

pid - 724
время соединения - 96 минут


***3***
-
Закрыть все порты для входящих подключений, кроме ssh

$ sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT && sudo iptables -P INPUT DROP
-

***4***
-
Установить telnetd на ВМ, зайти на нее с другой ВМ с помощью telnet
и отловить вводимый пароль и вводимые команды при входе c помощью tcpdump

$ sudo apt install telnetd
-

$ cat /var/log/syslog | grep telnet
Jul 14 10:46:50 ubuntu-study in.telnetd[347327]: connect from 10.0.0.20 (10.0.0.20)
-

$ sudo tcpdump port telnet -lA | egrep -i -B5 'password:|login:'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens18, link-type EN10MB (Ethernet), capture size 262144 bytes
...
..........Q JW.P. .56........
11:51:03.906959 IP ubuntu-study.telnet > 10.0.0.20.58142: Flags [P.], seq 72:92, ack 77, win 502, length 20
E..<y.@.@...
...
....... JW....QP.......ubuntu-study login:
--
...
..........X JW/P. .5.........
11:51:14.861914 IP ubuntu-study.telnet > 10.0.0.20.58142: Flags [P.], seq 99:109, ack 84, win 502, length 10
E..2y.@.@...
...
....... JW/...XP.......Password:
--
...
.........._ JWNP. .4.........
11:51:23.334224 IP ubuntu-study.telnet > 10.0.0.20.58142: Flags [P.], seq 130:150, ack 91, win 502, length 20
E..<y.@.@...
...
-

как привести в удобночитаемый формат - я не нашёл


***5***
-
Открыть порт 222/tcp и  обеспечить прослушивание порта с помощью netcat, проверить доступность порта 222 
с помощью telnet и nmap