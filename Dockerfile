FROM debian:stable-slim AS base

# Initialize package management
RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get update -y -q \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade --no-install-recommends -y

# Create a build user and group
RUN set -x \
    && addgroup --gid 1011 jekyll \
    ; adduser --uid 1011 --gid 1011 --no-create-home --disabled-password --gecos "" --shell /bin/false jekyll

# Install packages
RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -q -y rbenv git build-essential libssl-dev zlib1g-dev wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -q -y autoremove \
    && apt-get -q -y autoclean \
    && apt-get -q -y clean

FROM base AS rbenv

# Switch to being the deploy user now.
ENV RBENV_ROOT=/var/tmp/rbenv
USER jekyll

# Install rbenv
RUN set -ex \
    && eval "$(rbenv init -)" \
    && mkdir -p "$(rbenv root)"/plugins \
    && git clone --depth 1 --branch v20211019 https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build \
    && rbenv install 2.7.3

FROM rbenv AS bundler

# Copy the jekyll build script to /workspace
COPY --chown=1011:1011 . /workspace
WORKDIR /workspace

# Install jekyll build script dependencies
RUN set -ex \
    && eval "$(rbenv init -)" \
    && rbenv global 2.7.3 \
    && rbenv exec bundle install --local --path .bundle --no-cache --without development test

# Run jekyll build script
FROM bundler AS builder
ENTRYPOINT /bin/bash -l -c 'LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8 rbenv exec bundle exec ./jekyll-build.rb'
