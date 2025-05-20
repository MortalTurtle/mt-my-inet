FROM debian

RUN apt update && apt install -y openssh-server dnsutils iputils-ping\
    && echo 'root:qwer' | chpasswd \
    && sed -i 's/#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && mkdir -p /run/sshd

RUN useradd --create-home --base-dir /home debian \
    && echo "debian:qwer" | chpasswd \
    && usermod -aG sudo debian

EXPOSE 22