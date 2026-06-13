#!/bin/sh
set -eux

mkdir -p /root/.ssh
echo "$AUTHORIZED_KEYS" > /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

. /etc/default/ssh || true

/usr/sbin/sshd -t

exec /usr/sbin/sshd
