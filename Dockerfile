FROM docker:20.10.8

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py3-pip coreutils curl bash openssl \
  && rm -rf /var/cache/apk/* \
  && pip install pyyaml==5.3.1 \
  && pip install -U awscli \
  && apk --purge -v del py-pip

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
