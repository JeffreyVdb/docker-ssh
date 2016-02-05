#!/bin/sh

# run sshd but do not daemonize
/usr/sbin/sshd -D -o PidFile=/var/run/sshd.pid -f /etc/ssh/sshd_config
