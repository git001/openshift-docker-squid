#!/bin/sh

echo "UPSTREAM          :"${UPSTREAM}
echo "TZ                :"${TZ}
echo "WHITELIST_FILE    :"${WHITELIST_FILE}
echo "WHITELIST_DOMAINS :"${WHITELIST_DOMAINS}
echo "FORCE             :"${FORCE}
echo "TCPLOGGER_PORT    :"${TCPLOGGER_PORT}

if [ x"${UPSTREAM}" = x ];
  echo "Error the UPSTREAM MUST be defined"
  exit 1
fi

if [ x"${TCPLOGGER_PORT}" = x ];
  echo "Error the TCPLOGGER_PORT MUST be defined"
  exit 1
fi

if [ x"${WHITELIST_FILE}" = x ];
  echo "Error a white list file MUST be defined"
  exit 1
fi

if [ x"${WHITELIST_DOMAINS}" != x ]; then
  for i in $( echo ${WHITELIST_DOMAINS}| sed -e 's/,/ /g') ; do
    echo $i > ${WHITELIST_FILE}
  done
fi

if [ ! -s ${WHITELIST_FILE} ]; then
  echo "Error the white list file can't be 0"
  ls -la ${WHITELIST_FILE}
  exit 2

fi

envsubst < /etc/squid/squid.conf.template > /tmp/squid.conf

exec /usr/sbin/squid -f /tmp/squid.conf -N
