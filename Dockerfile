## BUILDING
##   (from project root directory)
##   $ docker build -t juandavidcr-portafolio .
##
## RUNNING
##   $ docker run -p 9000:9000 juandavidcr-portafolio
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian:wheezy-r07

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="98ab2y6" \
    STACKSMITH_STACK_NAME="juandavidcr/Portafolio" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-5.6.22-0 --checksum 2439cf0adfc7cc21f15a6136059883e749958af83a082108e63a80ff3c5290c0

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# CodeIgniter template
COPY . /app
WORKDIR /app

EXPOSE 9000
CMD ["php", "-S", "0.0.0.0:9000"]
