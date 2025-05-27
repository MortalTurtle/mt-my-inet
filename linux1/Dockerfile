FROM debian

RUN apt update && apt install -y openssh-server bind9 dnsutils iputils-ping locales ntp \
    && sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ru_RU.UTF-8 \
    && echo 'root:qwer' | chpasswd \
    && sed -i 's/#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && mkdir -p /run/sshd

COPY ./root.db /etc/bind/root.db

RUN useradd --create-home --base-dir /home --shell /bin/bash debian \
    && echo "debian:qwer" | chpasswd \
    && usermod -aG sudo debian

RUN dnssec-keygen -a RSASHA512 -K /var/cache/bind/ -f KSK -n ZONE . \
    && cp /var/cache/bind/K.*.key /etc/bind/my.keys \
    && sed -i '1,4d' /etc/bind/my.keys \
    && sed -i -e 's/.*IN DNSKEY 257 3 10 /trust-anchors { \n    . static-key 257 3 10 \"/g' /etc/bind/my.keys \
    && sed -i -e 's/=/=\";\n};/g' /etc/bind/my.keys \
    && dnssec-keygen -a RSASHA512 -K /var/cache/bind/ -n ZONE . \
    && chown -R bind:bind /var/cache/bind/

EXPOSE 22 53