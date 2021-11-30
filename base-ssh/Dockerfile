FROM oliverdd/apollo:base

RUN pacman -Sy \
  && pacman -S --needed --noconfirm openssh \
  && pacman -Scc --noconfirm

EXPOSE 22

CMD [ ! -f /etc/ssh/ssh_host_rsa_key ] && ssh-keygen -A && su - charmer sh -c 'ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa'; /bin/sshd -D
