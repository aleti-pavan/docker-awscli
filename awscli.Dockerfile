# This Dockerfile is going to be base for AWS CLI Dockerfiles
#Entrypoint makes container executable - look into README for more information
FROM alpine:3.9
LABEL maintainer="Pavan Kumar Aleti"

ARG VERSION
ENV AWS_CLI_VERSION=$VERSION
#ENV AWS_DEFAULT_REGION='eu-west-2'

RUN apk --update --no-cache add \
    python \
    py-pip \
    jq \
    bash \
    git \
    groff \
    less \
    mailcap \
    bash \
    && pip install --no-cache-dir awscli==$AWS_CLI_VERSION \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws
ENTRYPOINT ["aws"] 
CMD ["--version"]