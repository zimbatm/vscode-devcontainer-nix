# vscode-devcontainer-nix

**STATUS: Not working**

For colleagues who insist on working on macOS and Windows. Even though all the
binaries are built for, deployed and executed on Linux servers.

[Visual Studio Core Remote - Containers](https://code.visualstudio.com/docs/remote/containers)
is a feature that allows to create a docker-based development environment.
VSCode will start the container and run all the commands inside of it.

This project's goal is to provide such container to work on Nix-based
projects.

## Usage

Ideally, for any nix-based projects:

1. Install the VSCode plugin
2. Copy the .devcontainer folder in your project

Then VSCode would start the container and drop you into the nix-based
development environment.

Nothing of this works yet.

## How it works

The VSCode plugin:

* looks for the .devcontainer folder
* builds the .devcontainer/Dockerfile
* starts the container

Then it uses uses `docker exec` to copy and install
supporting binaries into the container. This includes some bash scripts, a
node program, .... The binaries are compiled to work on Ubuntu which means
that /lib64/ld-linux-x86-64.so.2 must present, and a few other supporting
libraries.

It needs:
* a /tmp folder
* /bin/bash
* /bin/sh
* /usr/bin/env
* passwordless sudo (optional)
* iproute

On Linux, the user must adjust the Dockerfile so that the UID and GID inside
of the container match the user UID and GID. It looks like this could be
automated. Right now there is this convention in the Dockerfile:
```
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
```

## TODO

* startup nix-daemon --daemon in the background

## Roadmap

1. Make it work
2. Pure nix-based docker container?
3. It would be nice if the vs extensions could be composed together.

