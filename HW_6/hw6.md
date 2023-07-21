***1***
-
Определить все IP адреса, маски подсетей и соответствующие MAC адреса Linux VM.
Определите класс и адреса подсетей, в которых находится VM.

$ ip -4 -d a | grep brd
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00 promiscuity 0 minmtu 0 maxmtu 0 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
    link/ether fa:9e:07:90:c9:30 brd ff:ff:ff:ff:ff:ff promiscuity 0 minmtu 68 maxmtu 65535 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
    inet 10.0.0.221/24 brd 10.0.0.255 scope global ens18
-

Доступные ip адреса - 10.0.0.1 - 10.0.0.254
Текущая подсеть - 10.0.0.0/24
Классы подсетей - A
Адреса подсетей - 25-32


***2***
-
Определить публичный IP адрес хоста и Linux VM? Чем они отличаются?

$ curl ifconfig.me
86.57.226.187
-

публичные адреса у них идентичные


***3***
-
Вывести ARP таблицу на хосте и найти там запись, соответствующую MAC адресу с предыдущего задания.

У меня виртуалка поднята в гипервизоре и в свойствах сетевого адаптера Vm стоит bridge.
Таким образом гипервизор и VM находятся в одной локальной сети. Следующая команда выполнена с гипервизора.
Искомая запись находится в 3 строке

# ip -4 neigh show
10.0.0.20 dev vmbr0 lladdr 70:85:c2:73:dd:23 REACHABLE
10.0.0.1 dev vmbr0 lladdr 00:0c:29:bb:14:b8 STALE
10.0.0.221 dev vmbr0 lladdr fa:9e:07:90:c9:30 STALE
10.0.0.21 dev vmbr0 lladdr 5e:e3:f4:2e:45:71 STALE
172.31.221.137 dev vmbr0 lladdr 00:ae:dc:88:f5:75 STALE
-

***4***
-
Выполнить разбиение сети 172.20.0.0/16 на подсети с маской /24 и ответить на следующие вопросы:
- Сколько всего подсетей будет в сети - 255
- Сколько узлов будет в каждой подсети - 254
- Каким будет сетевой адрес первой и второй подсети - 172.20.0.0, 172.20.0.1
- Каким будут адреса первого и последнего хостов в первой и второй подсетях - 172.20.0.1, 172.20.0.254; 172.20.1.1, 172.20.1.254
- Каким будет широковещательный адрес в последней подсети - 172.20.254.255


***5***
-
Найти IP адрес соответствующий доменному имени ya.ru. 
Выполнить HTTP запрос на указазнный IP адрес, чтобы скачать страницу с помощью утилиты curl. 
В результате должна вывестись HTML страничка в консоль.

$ ping ya.ru
PING ya.ru (77.88.55.242) 56(84) bytes of data.
64 bytes from ya.ru (77.88.55.242): icmp_seq=1 ttl=51 time=25.8 ms
-

$ curl 77.88.55.242 -v -L -H 'Host: ya.ru' >> ya.ru
*   Trying 77.88.55.242:80...
* TCP_NODELAY set
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to 77.88.55.242 (77.88.55.242) port 80 (#0)
> GET / HTTP/1.1
> Host: ya.ru
> User-Agent: curl/7.68.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 301 Moved permanently
< Accept-CH: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< Cache-Control: max-age=1209600,private
< Date: Fri, 21 Jul 2023 12:36:18 GMT
< Location: https://ya.ru/
< NEL: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< P3P: policyref="/w3c/p3p.xml", CP="NON DSP ADM DEV PSD IVDo OUR IND STP PHY PRE NAV UNI"
< Portal: Home
< Report-To: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
< Transfer-Encoding: chunked
< X-Content-Type-Options: nosniff
< X-Yandex-Req-Id: 1689942978030604-15648640458643138044-balancer-l7leveler-kubr-yp-sas-138-BAL-5597
< set-cookie: is_gdpr=0; Path=/; Domain=.ya.ru; Expires=Sun, 20 Jul 2025 12:36:18 GMT
< set-cookie: is_gdpr_b=CO3+UxCHxAEoAg==; Path=/; Domain=.ya.ru; Expires=Sun, 20 Jul 2025 12:36:18 GMT
< set-cookie: _yasc=6sLfmGPhgZEZSi+hq2+fangvTaEZDBpgOzFVqafiwqbNTNlWvbBlmkb2L+1dsQ==; domain=.ya.ru; path=/; expires=Mon, 18 Jul 2033 12:36:18 GMT; secure
<
* Ignoring the response-body
{ [5 bytes data]
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
* Connection #0 to host 77.88.55.242 left intact
* Clear auth, redirects to port from 80 to 443Issue another request to this URL: 'https://ya.ru/'
*   Trying 5.255.255.242:443...
* TCP_NODELAY set
* Connected to ya.ru (5.255.255.242) port 443 (#1)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/certs/ca-certificates.crt
  CApath: /etc/ssl/certs
} [5 bytes data]
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
} [512 bytes data]
* TLSv1.3 (IN), TLS handshake, Server hello (2):
{ [122 bytes data]
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
{ [15 bytes data]
* TLSv1.3 (IN), TLS handshake, Certificate (11):
{ [3672 bytes data]
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
{ [79 bytes data]
* TLSv1.3 (IN), TLS handshake, Finished (20):
{ [52 bytes data]
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
} [1 bytes data]
* TLSv1.3 (OUT), TLS handshake, Finished (20):
} [52 bytes data]
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: C=RU; ST=Moscow; L=Moscow; O=Yandex LLC; CN=*.xn--d1acpjx3f.xn--p1ai
*  start date: Jun 21 13:42:48 2023 GMT
*  expire date: Dec 19 20:59:59 2023 GMT
*  subjectAltName: host "ya.ru" matched cert's "ya.ru"
*  issuer: C=BE; O=GlobalSign nv-sa; CN=GlobalSign ECC OV SSL CA 2018
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
} [5 bytes data]
* Using Stream ID: 1 (easy handle 0x5577f066cd90)
} [5 bytes data]
> GET / HTTP/2
> Host: ya.ru
> user-agent: curl/7.68.0
> accept: */*
>
{ [5 bytes data]
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
{ [233 bytes data]
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
{ [233 bytes data]
* old SSL session ID is stale, removing
{ [5 bytes data]
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
} [5 bytes data]
< HTTP/2 302
< x-yandex-eu-request: 0
< location: https://ya.ru/showcaptcha?cc=1&mt=697CFC125B893236CCB54D4DBCC8E6CC866DB43FB93F6B903582DCB39A63305AB761A32B10430BC9EE56819F910607B4A46C207F2015F9FBC3602166A0307E0D8F57E07CECF3279B3B7685E8B4561FD9ADA9A1076B1D735E90808E3BC74E&retpath=aHR0cHM6Ly95YS5ydS8__9d906f87b45b8d94b3dbf0c32d764b40&t=2/1689942978/29648463ef1da81f884217cfc0797fa1&u=d6349a17-c0f82874-81106b27-4652eefe&s=045de9ccdc402ce78616587d0c9b986d
< nel: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< x-content-type-options: nosniff
< x-yandex-captcha: captcha
< set-cookie: spravka=dD0xNjU4NDA2OTc4O2k9ODYuNTcuMjI2LjE4NztEPTE4NjhDNDg3RTZFNEZGNThFOEZFQUVFOEFEMzNGOUY3RUZEOUM1NjFGQUQ3QzlGQkQ3MjNFRDMyRkIxRTdBNjc3MjYxOTYyNTkxQkI7dT0xNjU4NDA2OTc4MTQ2NTUwNDM1O2g9YTRhY2E3MDZhNWQ2OTc1Y2UzMGNlNDExYjA2MTBhZmE=; domain=.ya.ru; path=/; expires=Sun, 20 Aug 2023 12:36:18 GMT
< set-cookie: i=0TpPeJwD4O7oz82/oYjtGtjC9jaGyULOJh8NdyClSZT62/KY2GFex07VJNEHcY5uA5V9iRBCBf0nVDFlz3p+Ns7KB7E=; Expires=Sun, 20-Jul-2025 12:36:18 GMT; Domain=.ya.ru; Path=/; Secure; HttpOnly
< set-cookie: yandexuid=4126281581689942978; Expires=Sun, 20-Jul-2025 12:36:18 GMT; Domain=.ya.ru; Path=/; Secure
< x-yandex-req-id: 1689942978144991-10378645648512628158-balancer-l7leveler-kubr-yp-vla-24-BAL
< accept-ch: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< report-to: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
<
{ [0 bytes data]
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
* Connection #1 to host ya.ru left intact
* Issue another request to this URL: 'https://ya.ru/showcaptcha?cc=1&mt=697CFC125B893236CCB54D4DBCC8E6CC866DB43FB93F6B903582DCB39A63305AB761A32B10430BC9EE56819F910607B4A46C207F2015F9FBC3602166A0307E0D8F57E07CECF3279B3B7685E8B4561FD9ADA9A1076B1D735E90808E3BC74E&retpath=aHR0cHM6Ly95YS5ydS8__9d906f87b45b8d94b3dbf0c32d764b40&t=2/1689942978/29648463ef1da81f884217cfc0797fa1&u=d6349a17-c0f82874-81106b27-4652eefe&s=045de9ccdc402ce78616587d0c9b986d'
* Found bundle for host ya.ru: 0x5577f06648c0 [can multiplex]
* Re-using existing connection! (#1) with host ya.ru
* Connected to ya.ru (5.255.255.242) port 443 (#1)
* Using Stream ID: 3 (easy handle 0x5577f066cd90)
} [5 bytes data]
> GET /showcaptcha?cc=1&mt=697CFC125B893236CCB54D4DBCC8E6CC866DB43FB93F6B903582DCB39A63305AB761A32B10430BC9EE56819F910607B4A46C207F2015F9FBC3602166A0307E0D8F57E07CECF3279B3B7685E8B4561FD9ADA9A1076B1D735E90808E3BC74E&retpath=aHR0cHM6Ly95YS5ydS8__9d906f87b45b8d94b3dbf0c32d764b40&t=2/1689942978/29648463ef1da81f884217cfc0797fa1&u=d6349a17-c0f82874-81106b27-4652eefe&s=045de9ccdc402ce78616587d0c9b986d HTTP/2
> Host: ya.ru
> user-agent: curl/7.68.0
> accept: */*
>
{ [5 bytes data]
< HTTP/2 200
< content-length: 12819
< x-yandex-eu-request: 0
< nel: {"report_to": "network-errors", "max_age": 100, "success_fraction": 0.001, "failure_fraction": 0.1}
< x-content-type-options: nosniff
< x-yandex-captcha: captcha
< set-cookie: i=NESGpFLI5ntJTf9Rf1tV8Ht8NZ1s2YsQJdEXojmQwXKTMunH4g8Fn+5gADneEfSZHDRcxxtFAHxv8mHY05visJmxwyE=; Expires=Sun, 20-Jul-2025 12:36:18 GMT; Domain=.ya.ru; Path=/; Secure; HttpOnly
< set-cookie: yandexuid=1986426361689942978; Expires=Sun, 20-Jul-2025 12:36:18 GMT; Domain=.ya.ru; Path=/; Secure
< x-yandex-req-id: 1689942978169132-3674188603898642636-balancer-l7leveler-kubr-yp-vla-24-BAL
< accept-ch: Sec-CH-UA-Platform-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA, Sec-CH-UA-Full-Version-List, Sec-CH-UA-WoW64, Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Platform, Sec-CH-UA-Full-Version, Viewport-Width, DPR, Device-Memory, RTT, Downlink, ECT
< report-to: { "group": "network-errors", "max_age": 100, "endpoints": [{"url": "https://dr.yandex.net/nel", "priority": 1}, {"url": "https://dr2.yandex.net/nel", "priority": 2}]}
< content-type: text/html
<
{ [12819 bytes data]
100 12819  100 12819    0     0  64417      0 --:--:-- --:--:-- --:--:-- 64417
* Connection #1 to host ya.ru left intact
-