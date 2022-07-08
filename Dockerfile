FROM ghcr.io/linuxserver/baseimage-alpine:3.16

# set version label
ARG BUILD_DATE
ARG KASM_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# Env
ENV DOCKER_TLS_CERTDIR=""

# Container setup
RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache --virtual=build-dependencies \
    alpine-sdk \
    npm && \
  echo "**** install packages ****" && \
  apk add --no-cache \
    bash \
    btrfs-progs \
    ca-certificates \
    coreutils \
    curl \
    docker \
    docker-cli-compose \
    e2fsprogs \
    e2fsprogs-extra \
    findutils \
    fuse-overlayfs \
    ip6tables \
    iptables \
    jq \
    nodejs \
    openssl \
    pigz \
    python3 \
    shadow-uidmap \
    sudo \
    xfsprogs \
    xz \
    zfs && \
  echo "**** dind setup ****" && \
  addgroup -S dockremap && \
  adduser -S -G dockremap dockremap && \
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
    KASM_VERSION=$(curl -sX GET 'https://api.github.com/repos/kasmtech/kasm-install-wizard/releases' \
    | jq -r 'map(select(.prerelease)) | sort_by(.published_at) | last | .tag_name'); \
  fi && \
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
  echo "**** copy assets ****" && \
  cp \
    /kasm_release/www/img/thumbnails/*.png \
    /wizard/public/img/thumbnails/ && \
  cp \
    /kasm_release/conf/database/seed_data/default_images_a* \
    /wizard/ && \
  echo "**** cleanup ****" && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /root/.npm \
    /root/.cache \
    /tmp/*

# add init files
COPY root/ /

# Ports and volumes
EXPOSE 3000 443
VOLUME /opt/
