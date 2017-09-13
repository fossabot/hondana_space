FROM ruby:2.4.1

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends mysql-client \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* \
     /var/lib/apt/lists/*

WORKDIR /hondana_space
ENV BUNDLE_PATH /bundle
