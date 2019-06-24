FROM alpine:3.8

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Terraform and Vault
ENV TERRAFORM_VERSION=0.11.13
ENV TERRAFORM_SHA256SUM=43543a0e56e31b0952ea3623521917e060f2718ab06fe2b2d506cfaa14d54527
ENV VAULT_VERSION 1.1.1


# We add the basics
RUN apk add --no-cache --update \
      bash \
      util-linux \
      bash-completion \
      grep \
      tree \
      openssh-client  \
      # MySQL, PostgreSQL, etc
      mysql-client \
      postgresql-client \ 
      # Interacting with the networks
      curl \
      bind-tools \
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


#############
# TERRAFORM #
#############

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS ./

RUN sed -i '/.*linux_amd64.zip/!d' terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

#########
# VAULT #
#########

ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip ./
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /bin
RUN rm -f vault_${VAULT_VERSION}_linux_amd64.zip

################### ENTRY POINT ###############

ENTRYPOINT ["/bin/bash"] 
