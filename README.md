<!-- DO NOT EDIT THIS FILE MANUALLY -->
<!-- Please read https://github.com/linuxserver/docker-kasm/blob/master/.github/CONTRIBUTING.md -->
[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://linuxserver.io/discord "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=discourse)](https://discourse.linuxserver.io "post on our community forum.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub&logo=github)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Supporters&logo=open%20collective)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring:

* regular and timely application updates
* easy user mappings (PGID, PUID)
* custom base image with s6 overlay
* weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
* regular security updates

Find us at:

* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://linuxserver.io/discord) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/kasm](https://github.com/linuxserver/docker-kasm)

[![Scarf.io pulls](https://scarf.sh/installs-badge/linuxserver-ci/linuxserver%2Fkasm?color=94398d&label-color=555555&logo-color=ffffff&style=for-the-badge&package-type=docker)](https://scarf.sh)
[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-kasm.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-kasm)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-kasm.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-kasm/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub%20Package&logo=github)](https://github.com/linuxserver/docker-kasm/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab)](https://gitlab.com/linuxserver.io/docker-kasm/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/kasm)
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/kasm.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/linuxserver/kasm)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/kasm.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/linuxserver/kasm)
[![Jenkins Build](https://img.shields.io/jenkins/build?labelColor=555555&logoColor=ffffff&style=for-the-badge&jobUrl=https%3A%2F%2Fci.linuxserver.io%2Fjob%2FDocker-Pipeline-Builders%2Fjob%2Fdocker-kasm%2Fjob%2Fmaster%2F&logo=jenkins)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-kasm/job/master/)
[![LSIO CI](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=CI&query=CI&url=https%3A%2F%2Fci-tests.linuxserver.io%2Flinuxserver%2Fkasm%2Flatest%2Fci-status.yml)](https://ci-tests.linuxserver.io/linuxserver/kasm/latest/index.html)

[Kasm](https://www.kasmweb.com/?utm_campaign=LinuxServer&utm_source=listing) Workspaces is a docker container streaming platform for delivering browser-based access to desktops, applications, and web services. Kasm uses devops-enabled Containerized Desktop Infrastructure (CDI) to create on-demand, disposable, docker containers that are accessible via web browser. Example use-cases include Remote Browser Isolation (RBI), Data Loss Prevention (DLP), Desktop as a Service (DaaS), Secure Remote Access Services (RAS), and Open Source Intelligence (OSINT) collections.

The rendering of the graphical-based containers is powered by the open-source project [KasmVNC](https://www.kasmweb.com/kasmvnc.html?utm_campaign=LinuxServer&utm_source=kasmvnc).

[![kasm](https://kasm-ci.s3.amazonaws.com/kasm_wide.png)](https://www.kasmweb.com/?utm_campaign=LinuxServer&utm_source=listing)

## Supported Architectures

We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://distribution.github.io/distribution/spec/manifest-v2-2/#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `lscr.io/linuxserver/kasm:latest` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64v8-\<version tag\> |

## Application Setup

This container uses [Docker in Docker](https://www.docker.com/blog/docker-can-now-run-within-docker/) and requires being run in `privileged` mode. This container also requires an initial setup that runs on port 3000.

**Unlike other containers the web interface port (default 443) needs to be set for the env variable `KASM_PORT` and both the inside and outside port IE for 4443 `KASM_PORT=4443` `-p 4443:4443`**

**Unraid users due to the DinD storage layer `/opt/` should be mounted directly to a disk IE `/mnt/disk1/appdata/path` or optimally with a cache disk at `/mnt/cache/appdata/path`**

Access the installation wizard at https://`your ip`:3000 and follow the instructions there. Once setup is complete access https://`your ip`:443 and login with the credentials you entered during setup. The default users are:

* admin@kasm.local
* user@kasm.local

Currently Synology systems are not supported due to them blocking CPU scheduling in their Kernel.

### Updating KASM

In order to update kasm, first make sure you are using the latest docker image, and then perform the in app update in the admin panel. Docker image update and recreation of container alone won't update kasm.

### GPU Support

During installation an option will be presented to force all Workspace containers to mount in and use a specific GPU. If using an NVIDIA GPU you will need to pass `-e NVIDIA_VISIBLE_DEVICES=all` or `--gpus all` and have the [NVIDIA Container Runtime](https://github.com/NVIDIA/nvidia-container-runtime) installed on the host. Also if using NVIDIA, Kasm Workspaces has [native NVIDIA support](https://www.kasmweb.com/docs/latest/how_to/gpu.html) so you can optionally opt to simply use that instead of he manual override during installation.

### Gamepad support

In order to properly create virtual Gamepads you will need to mount from your host `/dev/input` and `/run/udev/data`. Please see [HERE](https://www.kasmweb.com/docs/develop/guide/gamepad_passthrough.html) for instructions on enabling gamepad support.

### Persistant profiles

In order to use persistant profiles in Workspaces you will need to mount in a folder to use from your host to `/profiles`. From there when configuring a workspace you can set the `Persistant Profile Path` to IE `/profiles/ubuntu-focal/{username}/`, more infomation can be found [HERE](https://www.kasmweb.com/docs/latest/how_to/persistent_profiles.html).

### Reverse proxy

A sample for [SWAG](https://github.com/linuxserver/docker-swag) can be found [here](https://raw.githubusercontent.com/linuxserver/reverse-proxy-confs/master/kasm.subdomain.conf.sample). Post installation you will need to modify the "Proxy Port" setting under the default zone to 0 as outlined [here](https://www.kasmweb.com/docs/latest/how_to/reverse_proxy.html#update-zones) to launch Workspaces sessions.

### Strict reverse proxies

This image uses a self-signed certificate by default. This naturally means the scheme is `https`.
If you are using a reverse proxy which validates certificates, you need to [disable this check for the container](https://docs.linuxserver.io/faq#strict-proxy).

## Usage

To help you get started creating a container from this image you can either use docker-compose or the docker cli.

>[!NOTE]
>Unless a parameter is flaged as 'optional', it is *mandatory* and a value must be provided.

### docker-compose (recommended, [click here for more info](https://docs.linuxserver.io/general/docker-compose))

```yaml
---
services:
  kasm:
    image: lscr.io/linuxserver/kasm:latest
    container_name: kasm
    privileged: true
    security_opt:
      - apparmor:rootlesskit #optional
    environment:
      - KASM_PORT=443
      - DOCKER_HUB_USERNAME=USER #optional
      - DOCKER_HUB_PASSWORD=PASS #optional
      - DOCKER_MTU=1500 #optional
    volumes:
      - /path/to/kasm/data:/opt
      - /path/to/kasm/profiles:/profiles #optional
      - /dev/input:/dev/input #optional
      - /run/udev/data:/run/udev/data #optional
    ports:
      - 3000:3000
      - 443:443
    restart: unless-stopped
```

### docker cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```bash
docker run -d \
  --name=kasm \
  --privileged \
  --security-opt apparmor=rootlesskit `#optional` \
  -e KASM_PORT=443 \
  -e DOCKER_HUB_USERNAME=USER `#optional` \
  -e DOCKER_HUB_PASSWORD=PASS `#optional` \
  -e DOCKER_MTU=1500 `#optional` \
  -p 3000:3000 \
  -p 443:443 \
  -v /path/to/kasm/data:/opt \
  -v /path/to/kasm/profiles:/profiles `#optional` \
  -v /dev/input:/dev/input `#optional` \
  -v /run/udev/data:/run/udev/data `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/kasm:latest
```

## Parameters

Containers are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 3000:3000` | Kasm Installation wizard. (https) |
| `-p 443:443` | Kasm Workspaces interface. (https) |
| `-e KASM_PORT=443` | Specify the port you bind to the outside for Kasm Workspaces. |
| `-e DOCKER_HUB_USERNAME=USER` | Optionally specify a DockerHub Username to pull private images. |
| `-e DOCKER_HUB_PASSWORD=PASS` | Optionally specify a DockerHub password to pull private images. |
| `-e DOCKER_MTU=1500` | Optionally specify the mtu options passed to dockerd. |
| `-v /opt` | Docker and installation storage. |
| `-v /profiles` | Optionally specify a path for persistent profile storage. |
| `-v /dev/input` | Optional for gamepad support. |
| `-v /run/udev/data` | Optional for gamepad support. |
| `--security-opt apparmor=rootlesskit` | Some hosts require this on top of privileged for namespacing to work properly inside the DinD layer. |

## Environment variables from files (Docker secrets)

You can set any environment variable from a file by using a special prepend `FILE__`.

As an example:

```bash
-e FILE__MYVAR=/run/secrets/mysecretvariable
```

Will set the environment variable `MYVAR` based on the contents of the `/run/secrets/mysecretvariable` file.

## Umask for running applications

For all of our images we provide the ability to override the default umask settings for services started within the containers using the optional `-e UMASK=022` setting.
Keep in mind umask is not chmod it subtracts from permissions based on it's value it does not add. Please read up [here](https://en.wikipedia.org/wiki/Umask) before asking for support.

## Docker Mods

[![Docker Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=kasm&query=%24.mods%5B%27kasm%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=kasm "view available mods for this container.") [![Docker Universal Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=universal&query=%24.mods%5B%27universal%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=universal "view available universal mods.")

We publish various [Docker Mods](https://github.com/linuxserver/docker-mods) to enable additional functionality within the containers. The list of Mods available for this image (if any) as well as universal mods that can be applied to any one of our images can be accessed via the dynamic badges above.

## Support Info

* Shell access whilst the container is running:

    ```bash
    docker exec -it kasm /bin/bash
    ```

* To monitor the logs of the container in realtime:

    ```bash
    docker logs -f kasm
    ```

* Container version number:

    ```bash
    docker inspect -f '{{ index .Config.Labels "build_version" }}' kasm
    ```

* Image version number:

    ```bash
    docker inspect -f '{{ index .Config.Labels "build_version" }}' lscr.io/linuxserver/kasm:latest
    ```

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (noted in the relevant readme.md), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Compose

* Update images:
    * All images:

        ```bash
        docker-compose pull
        ```

    * Single image:

        ```bash
        docker-compose pull kasm
        ```

* Update containers:
    * All containers:

        ```bash
        docker-compose up -d
        ```

    * Single container:

        ```bash
        docker-compose up -d kasm
        ```

* You can also remove the old dangling images:

    ```bash
    docker image prune
    ```

### Via Docker Run

* Update the image:

    ```bash
    docker pull lscr.io/linuxserver/kasm:latest
    ```

* Stop the running container:

    ```bash
    docker stop kasm
    ```

* Delete the container:

    ```bash
    docker rm kasm
    ```

* Recreate a new container with the same docker run parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* You can also remove the old dangling images:

    ```bash
    docker image prune
    ```

### Image Update Notifications - Diun (Docker Image Update Notifier)

>[!TIP]
>We recommend [Diun](https://crazymax.dev/diun/) for update notifications. Other tools that automatically update containers unattended are not recommended or supported.

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:

```bash
git clone https://github.com/linuxserver/docker-kasm.git
cd docker-kasm
docker build \
  --no-cache \
  --pull \
  -t lscr.io/linuxserver/kasm:latest .
```

The ARM variants can be built on x86_64 hardware and vice versa using `lscr.io/linuxserver/qemu-static`

```bash
docker run --rm --privileged lscr.io/linuxserver/qemu-static --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **08.06.25:** - Deprecate develop branch.
* **03.06.25:** - Rebase to Ubuntu Noble. Update for 1.17.0 release.
* **09.11.24:** - Update base image for 1.16.1 release.
* **24.09.24:** - Add base users in docker build logic to survive container upgrades.
* **17.09.24:** - Update base image for 1.16.0 release and fix Nvidia support.
* **16.02.24:** - Update base image for 1.15.0 release.
* **22.08.23:** - Update base image for 1.14.0 release.
* **07.04.23:** - Add mod layer for ingesting LSIO images for 1.13.0 release.
* **28.03.23:** - Pin compose to 2.5.0 to be in sync with upstream requirements.
* **05.11.22:** - Rebase to Jammy, add support for GPUs, add support for Gamepads.
* **23.09.22:** - Migrate to s6v3.
* **02.07.22:** - Initial Release.
