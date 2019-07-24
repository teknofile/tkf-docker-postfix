FROM lsiobase/alpine:3.9
LABEL MAINTAINER teknofile <teknofile@teknofile.org>

#ENV TZ
#ENV TKF_MAILDOMAIN
#ENV TKF_RELAY_HOST
#ENV TKF_MYNETWORKS
#ENV TKF_RELAY_PASSWORD
#ENV TKF_MYHOSTNAME

RUN  echo "**** Installing Runtime Packages ****" && \
  apk add --no-cache \
    postfix \
    postfix-sqlite \
    postfix-ldap \
    postfix-pcre \
    procmail \
    rsyslog \
    runit \
    mailx \
    bash \
    ca-certificates \
    libsasl \
    cyrus-sasl \
    cyrus-sasl-digestmd5 \
    cyrus-sasl-plain


# Copy local files over
COPY root/ /

# Ports to expose
EXPOSE 25
VOLUME /config 
