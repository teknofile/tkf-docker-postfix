# List 'o TODO items

Things to make the Docker image do:

- Local Maildir/ should be mounted into the docker container via -v param
  - Only if we care about local mail storage tho?
  - validate the /etc/mailname is the right thing to set for myorigin, i dont think it exists
  - configure relaying (smarthost)
  - Setup a spamassassin filter (or other filter? bogo?)
  - Setip clamav scanning of mail
  - use postconf to setup smtps
  - make rsyslog.conf come out of the /config dir
  - auto regen the newaliases on container start
  - Testing!!!
    - Let's make sure that not everyone with a valid cert to the world can relay
    - Let's make sure that only authenticated users can relay (right now - everyone on the lcoal network can)
    - Let's make sure we support tls. no sense in not using encryption
    - Think about mail spool dir's - expose to the container host? Pros/cons?
    - omg the configuration needs to be massively cleaned up
    - I'm pretty sure it'll break on a new install unless a default set of posfix configs are already in /config/postfix
    - Test to make sure HELO response matches the domain name
