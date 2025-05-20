$TTL    86400
urfu.ru.        IN      SOA     ns1.urfu.ru. root.localhost. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL

urfu.ru.        IN      NS      ns1.urfu.ru.
ns1.urfu.ru.            A       192.168.1.12

urfu.ru.                A       192.168.1.14