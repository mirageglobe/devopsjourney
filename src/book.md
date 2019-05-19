
---
title: 'DevOps Journey : DevHackThorsDay'
author:
- various authors
---

![title](src/images/cover-1.png)\

\clearpage

# DEVOPS Journey

DevOps is a set of software development practices that combines software development (Dev) and information technology operations (Ops) to shorten the systems development life cycle while delivering features, fixes, and updates frequently in close alignment with business objectives. Different disciplines collaborate, making quality everyone's job.

The goals of DevOps span the entire delivery pipeline including :

- improved deployment frequency
- faster time to market
- lower failure rate of new releases
- shortened lead time between fixes
- faster mean time to recovery (in the event of a new release crashing or otherwise disabling the current system)

# chapter 1 - docker

docker is a collection of interoperating software-as-a-service and platform-as-a-service offerings that employ operating-system-level virtualization to cultivate development and delivery of software inside standardized software packages called containers. the software that hosts the containers is called docker engine. it was first started in 2013 and is developed by docker, inc. the service has both free and premium tiers.

containers are isolated from each other and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. all containers are run by a single operating-system kernel and are thus more lightweight than virtual machines. containers are created from images that specify their precise contents. images are often created by combining and modifying standard images downloaded from public repositories

**challenge one**

fulfill the following requirements :

- on your local machine install docker
- create a dockerfile based off alpine linux
- install nginx as a web server in the container
- spin up and share the container on public docker hub ( https://hub.docker.com/ )
- have the final image under 30 mb

suggested solutions :

- JamesMannion ( https://github.com/mannion007/devopsjourney/tree/master/src/assignment1 )

**challenge two**

fulfill the following requirements :

- include php-fpm based off your public nginx container
- show basic php info
- the host on port 8081

