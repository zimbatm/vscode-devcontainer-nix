FROM nixpkgs/devcontainer:nixos-19.09

# FIXUPs
#ENV NIX_PATH nixpkgs=channel:nixos-19.09
#RUN chmod 0755 /nix/var/nix/profiles/per-user
RUN chmod +s /nix/var/nix/profiles/default/bin/sudo

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN mkdir /home
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers \
  && chmod 0440 /etc/sudoers

USER $USERNAME
ENV USER $USERNAME
