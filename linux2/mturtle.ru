$TTL    86400
mturtle.ru.        IN      SOA     ns1.mturtle.ru. root.localhost. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL

mturtle.ru.        IN      NS      ns1.mturtle.ru.
ns1.mturtle.ru.            A       192.168.1.12
ns2.mturtle.ru.            A       192.168.1.13
mturtle.ru.                A       192.168.1.14