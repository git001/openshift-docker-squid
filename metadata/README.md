# Build

## TCP logger

```
oc process -f 01_buildconfig_tcplogger.json -v HTTP_PROXY=${HTTP_PROXY} \
           -v HTTPS_PROXY=${HTTPS_PROXY} \
           -v GIT_URI=https://github.com/git001/openshift-docker-squid.git
```

if the output looks good you can pipe it to oc create.

```
oc process -f 01_buildconfig_tcplogger.json -v HTTP_PROXY=${HTTP_PROXY} \
           -v HTTPS_PROXY=${HTTPS_PROXY} \
           -v GIT_URI=https://github.com/git001/openshift-docker-squid.git \
           | oc create -f -
```

## HTTP / Squid

```
oc process -f 01_buildconfig_default-http-proxy.json -v HTTP_PROXY=${HTTP_PROXY} \
           -v HTTPS_PROXY=${HTTPS_PROXY} \
           -v GIT_URI=https://github.com/git001/openshift-docker-squid.git
```

if the output looks good you can pipe it to oc create.

```
oc process -f 01_buildconfig_default-http-proxy.json -v HTTP_PROXY=${HTTP_PROXY} \
           -v HTTPS_PROXY=${HTTPS_PROXY} \
           -v GIT_URI=https://github.com/git001/openshift-docker-squid.git \
           | oc create -f -
```

# Deploy

```
oc process -f 02_deploymentconfig.json -v WHITELIST_FILE=/data/whitelist -v UPSTREAM=myUps
```

if the output looks good you can pipe it to oc create.

```
oc process -f 02_deploymentconfig.json -v WHITELIST_FILE=/data/whitelist -v UPSTREAM=myUps | oc create -f -
```
