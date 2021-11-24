ARG RUBY_VERSION=2.7.4
FROM ruby:$RUBY_VERSION-alpine

RUN apk update && apk add --no-cache \
  git \
  make \
  bash \
  musl-locales \
  build-base

RUN locale en-US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

COPY Gemfile Gemfile

RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install

COPY entrypoint.sh /entrypoint.sh
 
ENTRYPOINT ["/entrypoint.sh"]

