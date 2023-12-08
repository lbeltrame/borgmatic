FROM alpine:latest

ARG POSTGRES_VERSION
ARG BORG_VERSION
ARG BORGMATIC_VERSION

RUN apk add --no-cache python3 py3-packaging py3-setuptools libacl openssh postgresql${POSTGRES_VERSION}-client socat && \
		apk --no-cache add --virtual builddeps alpine-sdk linux-headers acl-dev py3-cffi py3-pip openssl-dev python3-dev && \
		ln -s /bin/uname /usr/local/bin/uname && \
		ln -s /bin/rm /usr/local/bin/rm && \
		ln -s /bin/sh /usr/local/bin/sh && \
		pip install --upgrade --break-system-packages pip wheel pkgconfig && \
		pip install --break-system-packages borgbackup==${BORG_VERSION} borgmatic==${BORGMATIC_VERSION} && \
		pip cache purge && \
		apk del builddeps && \
		rm -rf /var/cache/apk/* && \
		rm -rf /root/.cache/pip && \
		find / -name '*.pyc' -exec rm {} \;

CMD ["borgmatic", "--stats", "-v" ,"0"]
