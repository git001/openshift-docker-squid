# Squid to run in openshift

```
 oc rsh default-http-proxy-15-yqieo
env|sort
DEFAULT_HTTP_PROXY_PORT=tcp://172.30.230.65:8080
DEFAULT_HTTP_PROXY_PORT_8080_TCP=tcp://172.30.230.65:8080
DEFAULT_HTTP_PROXY_PORT_8080_TCP_ADDR=172.30.230.65
DEFAULT_HTTP_PROXY_PORT_8080_TCP_PORT=8080
DEFAULT_HTTP_PROXY_PORT_8080_TCP_PROTO=tcp
DEFAULT_HTTP_PROXY_SERVICE_HOST=172.30.230.65
DEFAULT_HTTP_PROXY_SERVICE_PORT=8080
DEFAULT_HTTP_PROXY_SERVICE_PORT_8080_TCP=8080
HOME=/
HOSTNAME=default-http-proxy-15-yqieo
KUBERNETES_PORT=tcp://172.30.0.1:443
KUBERNETES_PORT_443_TCP=tcp://172.30.0.1:443
KUBERNETES_PORT_443_TCP_ADDR=172.30.0.1
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_53_TCP=tcp://172.30.0.1:53
KUBERNETES_PORT_53_TCP_ADDR=172.30.0.1
KUBERNETES_PORT_53_TCP_PORT=53
KUBERNETES_PORT_53_TCP_PROTO=tcp
KUBERNETES_PORT_53_UDP=udp://172.30.0.1:53
KUBERNETES_PORT_53_UDP_ADDR=172.30.0.1
KUBERNETES_PORT_53_UDP_PORT=53
KUBERNETES_PORT_53_UDP_PROTO=udp
KUBERNETES_SERVICE_HOST=172.30.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_DNS=53
KUBERNETES_SERVICE_PORT_DNS_TCP=53
KUBERNETES_SERVICE_PORT_HTTPS=443
OPENSHIFT_BUILD_COMMIT=258fe2390d1e2467e1e0c60bf96c4343b151d759
OPENSHIFT_BUILD_NAME=default-http-proxy-17
OPENSHIFT_BUILD_NAMESPACE=project-with-http-proxy
OPENSHIFT_BUILD_SOURCE=https://github.com/git001/openshift-docker-squid.git
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin
PKGM=yum
PWD=/
SHLVL=1
SQUID_CACHE_DIR=/var/spool/squid
SQUID_LOG_DIR=/var/log/squid
TCPLOGGER_PORT=tcp://172.30.185.104:8514
TCPLOGGER_PORT_8514_TCP=tcp://172.30.185.104:8514
TCPLOGGER_PORT_8514_TCP_ADDR=172.30.185.104
TCPLOGGER_PORT_8514_TCP_PORT=8514
TCPLOGGER_PORT_8514_TCP_PROTO=tcp
TCPLOGGER_SERVICE_HOST=172.30.185.104
TCPLOGGER_SERVICE_PORT=8514
TCPLOGGER_SERVICE_PORT_8514_TCP=8514
TZ=UTC
UPSTREAM=<UPSTREAM_SERVER_FROM_DC>
_=/usr/bin/env
container=docker
```

```
Squid Cache: Version 3.3.8
configure options:  '--build=x86_64-redhat-linux-gnu' '--host=x86_64-redhat-linux-gnu' '--program-prefix=' '--prefix=/usr' '--exec-prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--sysconfdir=/etc' '--datadir=/usr/share' '--includedir=/usr/include' '--libdir=/usr/lib64' '--libexecdir=/usr/libexec' '--sharedstatedir=/var/lib' '--mandir=/usr/share/man' '--infodir=/usr/share/info' '--disable-strict-error-checking' '--exec_prefix=/usr' '--libexecdir=/usr/lib64/squid' '--localstatedir=/var' '--datadir=/usr/share/squid' '--sysconfdir=/etc/squid' '--with-logdir=$(localstatedir)/log/squid' '--with-pidfile=$(localstatedir)/run/squid.pid' '--disable-dependency-tracking' '--enable-eui' '--enable-follow-x-forwarded-for' '--enable-auth' '--enable-auth-basic=DB,LDAP,MSNT,MSNT-multi-domain,NCSA,NIS,PAM,POP3,RADIUS,SASL,SMB,getpwnam' '--enable-auth-ntlm=smb_lm,fake' '--enable-auth-digest=file,LDAP,eDirectory' '--enable-auth-negotiate=kerberos' '--enable-external-acl-helpers=file_userip,LDAP_group,time_quota,session,unix_group,wbinfo_group' '--enable-cache-digests' '--enable-cachemgr-hostname=localhost' '--enable-delay-pools' '--enable-epoll' '--enable-icap-client' '--enable-ident-lookups' '--enable-linux-netfilter' '--enable-removal-policies=heap,lru' '--enable-snmp' '--enable-ssl' '--enable-ssl-crtd' '--enable-storeio=aufs,diskd,ufs' '--enable-wccpv2' '--enable-esi' '--enable-ecap' '--with-aio' '--with-default-user=squid' '--with-filedescriptors=16384' '--with-dl' '--with-openssl' '--with-pthreads' 'build_alias=x86_64-redhat-linux-gnu' 'host_alias=x86_64-redhat-linux-gnu' 'CFLAGS=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches   -m64 -mtune=generic -fpie' 'LDFLAGS=-Wl,-z,relro  -pie -Wl,-z,relro -Wl,-z,now' 'CXXFLAGS=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches   -m64 -mtune=generic -fpie' 'PKG_CONFIG_PATH=:/usr/lib64/pkgconfig:/usr/share/pkgconfig'
```
```
curl -v telnet://${OPENSHIFT_DOCKER_SQUID_SERVICE_HOST}:${OPENSHIFT_DOCKER_SQUID_SERVICE_PORT}
curl -v telnet://openshift-docker-squid:8080/

export http_proxy=http://${OPENSHIFT_DOCKER_SQUID_SERVICE_HOST}:${OPENSHIFT_DOCKER_SQUID_SERVICE_PORT}/
export http_proxy=http://default-http-proxy:8080/
export https_proxy=http://default-http-proxy:8080/

export https_proxy=http://default-http-proxy.pink.ap-southeast-1.aws.openpaas.axa-cloud.com:8888

curl -o /dev/null -v -L --max-time 10 http://google.com/
curl -o /dev/null -v -L --max-time 10 https://google.com/
curl -o /dev/null -v -L https://google.com/

curl -v --max-time 10 http://twitter.com/

/usr/sbin/squid -f /etc/squid/squid.conf -N

/usr/sbin/squid -f /tmp/squid.conf -N -X
```
