
FROM debian:latest
ENV APP_HOME=/build
ENV BUILDS_ROOT=/build/.tmp
RUN mkdir -p $APP_HOME \
    && useradd -u 1000 -r dev --create-home \
    # cli setup
    # all project specific folders need to be accessible by newly created user but also for unknown users (when UID is set manually). Such users are in group root.
    && chown -R dev:root /home/dev \
    && chmod -R 770 /home/dev \
    && apt-get update && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
    git sudo ansible live-build \
    && echo 'dev ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/dev \
    && git config --system init.defaultBranch main \
    && mkdir -p /home/dev/$BUILDS_ROOT
WORKDIR /build
