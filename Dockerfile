FROM lsiobase/alpine:3.9

ENV MAILDOMAIN="copperdale.teknofile.net"


#RUN \
#  echo "**** Installing Build Packages ****" && \
#
#  apk add --no-cache --virtual=build-dependencies \
#    build-base \
#    libffi-dev 

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

#RUN  echo "**** Clean up ****" && \
#  apk del --purge \
#    build-dependencies && \
#  rm -rf \
#    /tmp/* 


# Copy local files over
COPY root/ /

# Ports to expose
EXPOSE 25 465
VOLUME /config /Maildir
