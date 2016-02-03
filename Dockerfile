FROM alpine
MAINTAINER Jeffrey Vandenborne <vandenbornejeffrey@gmail.com>

WORKDIR /root

# Install SSH Server
RUN apk --no-cache add openssh
RUN mkdir /root/.ssh && chmod 700 /root/.ssh
RUN /usr/bin/ssh-keygen -A

COPY docker-entrypoint.sh /entrypoint
ENTRYPOINT /entrypoint
