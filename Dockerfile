FROM alpine:3.8

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# We add the basics
RUN apk add --no-cache --update \
      bash \
      bash-completion \
      grep \
      tree \
      ssh  \
      # MySQL, PostgreSQL, etc
      mysql-client \
      postgresql-client \ 
      # Interacting with the networks
      curl \
      bind-tools \ # To use dig command 
      wget \
      jq \
      nmap \
      netcat-openbsd \
      # Monitoring / Shell tools
      htop \
      mc \
      # Development tools
      vim \
      tmux \
      git \
    && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["bash"] 
