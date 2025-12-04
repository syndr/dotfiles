## Create a Docker image to run legacy Openssh 7.0 client
#
# Build with: docker build --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) -t openssh7-client:7.0 .
#


FROM ubuntu:16.04

# Create a user matching the UID/GID of the host user
ARG USERNAME=user
ARG USER_UID
ARG USER_GID

# Install build dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    wget \
    zlib1g-dev \
    libssl-dev \
    libpam0g-dev \
    libselinux1-dev \
    libkrb5-dev \
    libedit-dev \
    && rm -rf /var/lib/apt/lists/*

# Download and build OpenSSH 7.0p1 from source
RUN cd /tmp && \
    wget https://openbsd.mirror.constant.com/pub/OpenBSD/OpenSSH/portable/openssh-7.0p1.tar.gz && \
    tar xzf openssh-7.0p1.tar.gz && \
    cd openssh-7.0p1 && \
    ./configure --without-openssl-header-check --prefix=/usr --sysconfdir=/etc/ssh && \
    make && make install && \
    cd / && rm -rf /tmp/openssh-7.0p1*

# Verify ssh client installed
RUN ssh -V

# Create group and user with specified UID/GID
RUN groupadd -g ${USER_GID} ${USERNAME} || true && \
    useradd -m -u ${USER_UID} -g ${USER_GID} -s /bin/bash ${USERNAME} || true

# Give user ownership of home directory (home created by -m)
RUN chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENTRYPOINT ["ssh"]
CMD ["-V"]

