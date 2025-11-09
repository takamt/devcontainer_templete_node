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
FROM base AS devcontainer

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
    openssh-client \
    ca-certificates \
    unzip \
    git \
    curl \
    wget \
    sudo \
    # cleanup apt
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Create user for DevContainer
ARG USERNAME
ARG UID
ARG GID

ENV USERNAME ${USERNAME}
ENV UID ${UID}
ENV GID ${GID}

RUN groupadd --gid $GID $USERNAME \
    && useradd --uid $UID --gid $GID -m $USERNAME \
    # Add sudo to the user
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    # Setup VS Code Server
    && mkdir -p /home/$USERNAME/.vscode-server \
    && chown -R $UID:$GID /home/$USERNAME/.vscode-server

USER $USERNAME