ARG BASE_VERSION
FROM certbot/dns-route53:${BASE_VERSION}
ENTRYPOINT /bin/bash
WORKDIR /root
RUN apk add --no-cache bash \
 && pip install awscli --upgrade --user \
 && ln -s /root/.local/bin/aws /usr/local/bin/aws