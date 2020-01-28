FROM ubuntu:18.04

MAINTAINER matthew.mattox@rancher.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    openssl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
CMD /bin/run.sh
