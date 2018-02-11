FROM alpine:3.7
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
RUN apk update && apk add ca-certificates && update-ca-certificates
COPY update-ca-certificates.sh /etc/periodic/weekly
VOLUME [ "/etc/ssl/" "/var/cache/apk/" ]
CMD crond -f -l 5
