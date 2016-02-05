FROM alpine
MAINTAINER Jeffrey Vandenborne <vandenbornejeffrey@gmail.com>

WORKDIR /root

ENV AUTHORIZED_KEY_FILE=/root/.ssh/authorized_keys

ARG PUBLIC_KEY=id_rsa.pub

# Install SSH Server
RUN apk --no-cache add openssh
RUN mkdir /root/.ssh && chmod 700 /root/.ssh
RUN /usr/bin/ssh-keygen -A

# Copy sshd configuration
COPY sshd_config /etc/ssh/sshd_config

# copy public key to the machine
COPY ${PUBLIC_KEY} ${AUTHORIZED_KEY_FILE}
RUN chmod 600 ${AUTHORIZED_KEY_FILE}

COPY docker-entrypoint.sh /entrypoint
ENTRYPOINT /entrypoint
