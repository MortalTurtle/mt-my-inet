FROM debian

RUN apt update && apt install -y openssh-server bind9 dnsutils iputils-ping locales \
    && sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ru_RU.UTF-8 \
    && echo 'root:qwer' | chpasswd \
    && sed -i 's/#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && mkdir -p /run/sshd

COPY ./mturtle.ru /var/cache/bind/mturtle.ru

RUN useradd --create-home --base-dir /home --shell /bin/bash debian \
    && echo "debian:qwer" | chpasswd \
    && usermod -aG sudo debian

RUN chown -R bind:bind /var/cache/bind/ \
    && dnssec-keygen -a RSASHA512 -K /var/cache/bind/ -f KSK -n ZONE mturtle.ru \
    && cp /var/cache/bind/Kmturtle.ru.*.key /tmp/mturtle.keys \
    && sed -i -e ':a' -e 'N' -e '$!ba' -e 's/.*mturtle.ru\. IN DNSKEY 257 3 10 /trust-anchors { \n mturtle.ru. static-key 257 3 10 \"/g' /tmp/mturtle.keys \
    && sed -i -e ':a' -e 'N' -e '$!ba' -e 's/=/=\";\n};/g' /tmp/mturtle.keys \
    && dnssec-keygen -a RSASHA512 -K /var/cache/bind/ -n ZONE mturtle.ru \
    && cat /var/cache/bind/Kmturtle.ru.*key >> /var/cache/bind/mturtle.ru \
    && cd /var/cache/bind \
    && dnssec-signzone -K /var/cache/bind/ -S mturtle.ru

EXPOSE 22 53