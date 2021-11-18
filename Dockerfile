ARG PHP
FROM debian:bullseye as builder

# Install build dependencies
RUN set -eux && apt update && apt upgrade -y

RUN set -eux && apt install -y ca-certificates

RUN set -eux && apt install -y wget

#RUN set -eux \
#    && DEBIAN_FRONTEND=noninteractive apt-get update -qq \
#    && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
#            ca-certificates \
#    		git
#
#RUN set -eux \
#    && DEBIAN_FRONTEND=noninteractive apt-get install -o APT::Immediate-Configure=0 -qq -y --no-install-recommends --no-install-suggests \
#    		curl
#
#RUN set -eux \
#    && git clone --filter=tree:0 https://github.com/squizlabs/PHP_CodeSniffer \
#    && ls -lsah PHP_CodeSniffer
#
#ARG PHPCS
#RUN set -eux \
#	&& cd PHP_CodeSniffer \
#    && git fetch -av \
#	&& if [ "${PHPCS}" = "latest" ]; then \
#		VERSION="$( git describe --abbrev=0 --tags )"; \
#	else \
#		VERSION="$( git tag | grep -E "^v?${PHPCS}\.[.0-9]+\$" | sort -V | tail -1 )"; \
#	fi \
#	&& curl -sS -L https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${VERSION}/phpcs.phar -o /phpcs.phar \
#	&& chmod +x /phpcs.phar \
#	&& mv /phpcs.phar /usr/bin/phpcs
#
#
#FROM php:${PHP} as production
#LABEL \
#	maintainer="cytopia <cytopia@everythingcli.org>" \
#	repo="https://github.com/cytopia/docker-phpcs"
#
#COPY --from=builder /usr/bin/phpcs /usr/bin/phpcs
#ENV WORKDIR /data
#WORKDIR /data
#
#ENTRYPOINT ["phpcs"]
#CMD ["--version"]
