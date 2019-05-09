tkf-docker-postifx

This docker image is intended to handle the SMTP portions of mail for a small site. I use this personally, internally, for my home network so that each host can relay mail through it out to the internet. Much work still needs to be done.

The image is derived from the LinuxServer base image, which in turn is based off of Alpine linux.

# tkf-docker-postfix

This container is currently used to act as a small mail relay for an internal network out. It has support for TLS and relaying through an external mail server. Currently, the container allows mail to be relayed by all networks defined in 'mynetworks'. One day, with many PRs to come, I hope to add functionality to recieve and 'store' mail for a small network.

This image is based off of the [LinuxServer.io](https://github.com/linuxserver/) teams' [lsiobase-alpine image](https://hub.docker.com/r/lsiobase/alpine) and as such is a really small image. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

This image is still in testing. I have released v0.1.0, as a beta quality release. Please use at your own risk. I take no responsibility for anything that may go wrong or right for you. 

To get started, <a href="https://github.com/teknofile/tkf-docker-postfix/releases/tag/v0.1.0">download the code</a>, build the container and run it. Included is a ```build.sh``` sciprt that you can use as an example. A few envoirnment variables can be set to configure the container for mail handling.

### Prerequisites

Really all that should be needed is a recent version of Docker (I have been testing with Docker version 18.09.6).


### Installing

A step by step series of examples that tell you how to get a development env running

Download the code and all
```
git clone git@github.com:teknofile/tkf-docker-postfix.git
```

Build the docker container. Some things to note below: In my build script I currently just source those variables from another file. That let's me keep things I dont want to put into git stay out of there. The local config dir, most likely will need some base postfix configs to start with. There's more work to do there, I know.
```
  docker create \
    --name=my-contianer \
    -e PUID=11 \
    -e PGID=952 \
    -e TZ=US/Mountain \
    -e TKF_MAILDOMAIN="yourdomain.com" \
    -e TKF_RELAY_HOST="host.name.of.an.external.mail.relay.com:547" \
    -e TKF_MYNETWORKS="whitespace seperated list of IP networks to allow relaying" \
    -e TKF_MYHOSTNAME="mail.yourdomain.com" \
    -v /path/to/localconfigdir:/config \
    -p 25:25 \
    --restart unless-stopped \
    teknofile/tkf-docker-postfix:devel
```

Start the container
```
docker start my-container
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We (will) use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **teknofile** - *Initial work* - [teknofile](https://teknofile.org/)

See also the list of [contributors](https://github.com/teknofile/tkf-docker-postfix/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* TBD
