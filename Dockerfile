FROM lsiobase/alpine:3.9

# Available packages within Alpine for postfix:
# postfix
# postfix-sqlite
# postfix-stone
#       -stone is simulation & testing tools
# postfix-doc
# postfix-ldap
# postfix-lmbdb
# postfix-mysql
# postfix-openrc
# postfix-pcre
# postfix-pgsql
# postfix-policyd-spf-perl
# postfixadmin

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
    procmail

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
