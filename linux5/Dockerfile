FROM debian

RUN apt update && apt install -y openssh-server bind9 dnsutils iputils-ping locales \
    && sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ru_RU.UTF-8 \
    && echo 'root:qwer' | chpasswd \
    && sed -i 's/#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && mkdir -p /run/sshd

RUN useradd --create-home --base-dir /home --shell /bin/bash debian \
    && echo "debian:qwer" | chpasswd \
    && usermod -aG sudo debian

RUN chown -R bind:bind /var/cache/bind/ \
    && echo "include \"/tmp/keys/my.keys\";" >> /etc/bind/bind.keys

EXPOSE 22 53