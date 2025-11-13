# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-ubuntu:noble

# set version label
ARG BUILD_DATE
ARG KASM_VERSION
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thespad"

# Env
ENV DOCKER_TLS_CERTDIR=""
ENV TINI_SUBREAPER=true

#Add needed nvidia environment variables for https://github.com/NVIDIA/nvidia-docker
ENV NVIDIA_DRIVER_CAPABILITIES="compute,graphics,video,utility"

# Container setup
RUN \
  echo "**** install packages ****" && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
  echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu noble stable" > \
    /etc/apt/sources.list.d/docker.list && \
  curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
    && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
      sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
      tee /etc/apt/sources.list.d/nvidia-container-toolkit.list && \
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
  echo "Package: docker-ce docker-ce-cli docker-ce-rootless-extras \
  Pin: version 5:28.* \
  Pin-Priority: 1001" > /etc/apt/preferences.d/docker && \
  apt-get install -y --no-install-recommends \
    btrfs-progs \
    build-essential \
    containerd.io \
    docker-ce \
    docker-ce-cli \
    docker-compose-plugin \
    e2fsprogs \
    fuse-overlayfs \
    iproute2 \
    iptables \
    lsof \
    nodejs \
    nvidia-container-toolkit \
    openssl \
    pigz \
    python3 \
    sudo \
    uidmap \
    xfsprogs && \
  echo "**** dind setup ****" && \
  useradd -U dockremap && \
  usermod -G dockremap dockremap && \
  echo 'dockremap:165536:65536' >> /etc/subuid && \
  echo 'dockremap:165536:65536' >> /etc/subgid && \
  curl -o \
  /usr/local/bin/dind -L \
    https://raw.githubusercontent.com/moby/moby/master/hack/dind && \
  chmod +x /usr/local/bin/dind && \
  echo 'hosts: files dns' > /etc/nsswitch.conf && \
  echo "**** setup wizard ****" && \
  mkdir -p /wizard && \
  if [ -z ${KASM_VERSION+x} ]; then \
      KASM_VERSION=$(curl -sX GET 'https://api.github.com/repos/kasmtech/kasm-install-wizard/releases/latest' \
      | jq -r '.name'); \
  fi && \
  echo "${KASM_VERSION}" > /version.txt && \
  curl -o \
    /tmp/wizard.tar.gz -L \
    "https://github.com/kasmtech/kasm-install-wizard/archive/refs/tags/${KASM_VERSION}.tar.gz" && \
  tar xf \
    /tmp/wizard.tar.gz -C \
    /wizard --strip-components=1 && \
  cd /wizard && \
  npm install && \
  echo "**** add installer ****" && \
  curl -o \
    /tmp/kasm.tar.gz -L \
    "https://github.com/kasmtech/kasm-install-wizard/releases/download/${KASM_VERSION}/kasm_release.tar.gz" && \
  tar xf \
    /tmp/kasm.tar.gz -C \
    / && \
  ALVERSION=$(cat /kasm_release/conf/database/seed_data/default_properties.yaml |awk '/alembic_version/ {print $2}') && \
  curl -o \
    /tmp/images.tar.gz -L \
    "https://kasm-ci.s3.amazonaws.com/${KASM_VERSION}-images-combined.tar.gz" && \
  tar xf \
    /tmp/images.tar.gz -C \
    / && \
  sed -i \
    '/alembic_version/s/.*/alembic_version: '${ALVERSION}'/' \
    /kasm_release/conf/database/seed_data/default_images_a* && \
  sed -i 's/-N -e -H/-N -B -e -H/g' /kasm_release/upgrade.sh && \
  echo "exit 0" > /kasm_release/install_dependencies.sh && \
  /kasm_release/bin/utils/yq_$(uname -m) -i \
    '.services.proxy.volumes += "/kasm_release/www/img/thumbnails:/srv/www/img/thumbnails"' \
    /kasm_release/docker/docker-compose-all.yaml && \
  echo "**** copy assets ****" && \
  cp \
    /kasm_release/www/img/thumbnails/*.png /kasm_release/www/img/thumbnails/*.svg \
    /wizard/public/img/thumbnails/ && \
  cp \
    /kasm_release/conf/database/seed_data/default_images_a* \
    /wizard/ && \
  useradd -u 70 kasm_db && \
  useradd kasm && \
  printf "Linuxserver.io version: ${VERSION}\nBuild-date: ${BUILD_DATE}" > /build_version && \
  echo "**** cleanup ****" && \
  apt-get remove -y g++ gcc make && \
  apt-get -y autoremove && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# add init files
COPY root/ /

# Ports and volumes
EXPOSE 3000 443
VOLUME /opt/
