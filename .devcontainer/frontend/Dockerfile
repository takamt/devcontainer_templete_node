# Node LTS
FROM node:22.16.0-slim

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
    openssh-client \
    ca-certificates \
    unzip \
    git \
    vim \
    curl \
    wget \
    sudo \
    # cleanup apt
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create the vscode user
ARG USERNAME=vscode
ARG USER_UID=10001
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # Add sudo to the vscode user
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Copy existing application directory contents
COPY . .