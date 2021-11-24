ARG RUBY_VERSION=2.7.4
FROM ruby:$RUBY_VERSION-alpine

# one step to exclude .build_deps from docker cache
#RUN apk update && apk add --no-cache --virtual .build_deps \
RUN apk update && apk add --no-cache \
  git \
  make \
  bash \
  musl-locales \
  build-base #&& \
  #apk del .build_deps

RUN locale en-US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN ls .
COPY Gemfile Gemfile
RUN ls .

RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install

COPY entrypoint.sh /entrypoint.sh
 
ENTRYPOINT ["/entrypoint.sh"]

