dockerfile-ca-certificates
==========================

This is a simple alpine container that maintains the certificates updated every
week. Thus, the volume ca-certificates-etc-ssl can be shared with other
containers. The volume ca-certificates-var-cache-apk is needed in order to
avoid fetching the apk index every time.

## Example of docker run

```
docker build https://github.com:/manoj23/dockerfile-ca-certificates.git -t ca-certificates
docker volume create ca-certificates-etc-ssl
docker volume create ca-certificates-var-cache-apk
docker run --rm -ti
	-v ca-certificates-etc-ssl:/etc/ssl/
	-v ca-certificates-var-cache-apk:/var/cache/apk
	--name ca-certificates ca-certificates
```

## Example of docker-compose.yml

Put in a folder:
* docker-compose.yml as below

```
version: '3'
services:
  ca-certificates:
    build: https://github.com:/manoj23/dockerfile-ca-certificates.git
    volumes:
      - ca-certificates-etc-ssl:/etc/ssl/
      - ca-certificates-var-cache-apk:/var/cache/apk
```
