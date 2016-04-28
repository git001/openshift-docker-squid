#!/bin/sh

envsubst < /etc/squid/squid.conf.template > /tmp/squid.conf

exec /usr/sbin/squid -f /tmp/squid.conf -N
