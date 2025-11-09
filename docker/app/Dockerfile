# Node LTS
FROM node:22.16.0-slim AS base


# stage: Production
FROM base AS production
# TODO: Add production specific steps here


# stage: Development
FROM base AS development
# TODO: Add development specific steps here

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
    locales \
    # cleanup apt
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # locale settings
    && sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ja_JP.UTF-8

# stage: DevContainer
FROM development AS devcontainer

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
    openssh-client \
    ca-certificates \
    unzip \
    curl \
    wget \
    # cleanup apt
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*