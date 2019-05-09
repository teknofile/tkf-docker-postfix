== TODO ==

Things to make the Docker image do:

* Local Maildir/ should be mounted into the docker container via -v param
  * Only if we care about local mail storage tho?
* validate the /etc/mailname is the right thing to set for myorigin, i dont think it exists
* configure relaying (smarthost)
* Install a sasl provider backend and configure it so postfix can auth against it
* Setup a spamassassin filter (or other filter? bogo?)
* Setip clamav scanning of mail
* use postconf to setup smtps
* make rsyslog.conf come out of the /config dir
* auto regen the newaliases on container start
