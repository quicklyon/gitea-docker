FROM debian:11.6-slim

LABEL maintainer "zhouyueqiu <zhouyueqiu@easycorp.ltd>"

ENV OS_ARCH="amd64" \
    OS_NAME="debian-11" \
    HOME_PAGE="gitea.io"

COPY debian/prebuildfs /

ENV TZ=Asia/Shanghai

ARG IS_CHINA="true"
ENV MIRROR=${IS_CHINA}

RUN install_packages curl wget zip unzip s6 pwgen git upx xz-utils cron procps libedit2 ca-certificates net-tools \
    && groupadd -g 1024 git \
    && useradd -u 1024 -g 1024 -s /usr/sbin/nologin -d /data/git -M git

# Install app
ARG VERSION
ENV EASYSOFT_APP_NAME="Gitea $VERSION"

# Install render-template
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "render-template" "1.0.1-10" --checksum 5e410e55497aa79a6a0c5408b69ad4247d31098bdb0853449f96197180ed65a4

# Install su-exec
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "su-exec" "0.2" --checksum 687d29fd97482f493efec73a9103da232ef093b2936a341d85969bc9b9498910

# Install wait-for-port
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "wait-for-port" "1.01" -c 2ad97310f0ecfbfac13480cabf3691238fdb3759289380262eb95f8660ebb8d1

# Install mysql-client
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "mysql-client" "10.5.15-20220817" -c c4f82cb5b66724dd608f0bafaac400fc0d15528599e8b42be5afe8cedfd16488

ARG SHA256
RUN download_gitea "$VERSION" "$SHA256"

# Copy app config files
COPY debian/rootfs /

WORKDIR /apps/gitea

# add gitea bin to path env
ENV PATH=$PATH:/apps/gitea/bin

EXPOSE 3000

# Persistence directory
VOLUME [ "/data"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
