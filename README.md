# Summary
Utility image based on `certbot/dns-route53` with AWS CLI version 1.
You can pull the image from [ECS repository ](https://gallery.ecr.aws/stonedot/certbot-dns-route53-with-awscli).

Please refer:

* [certbot/dns-route53](https://hub.docker.com/r/certbot/dns-route53)
* [AWS CLI version 1](https://github.com/aws/aws-cli)

# Usage
```shell
# Start shell environment
docker run --rm -ti -v "$HOME/.aws:/root/.aws:ro" public.ecr.aws/stonedot/certbot-dns-route53-with-awscli:v1.15.0
```

# How to build
```shell
# Build the docker image
./run.sh build
# Push the docker image
./run.sh push
```