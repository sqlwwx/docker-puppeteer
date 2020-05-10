FROM sqlwwx/alinode

LABEL MAINTAINER="wuweixing"

RUN echo @edge https://mirrors.aliyun.com/alpine/edge/main >> /etc/apk/repositories && \
    echo @edge https://mirrors.aliyun.com/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge https://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        chromium \
        nss@edge \
        freetype@edge \
        freetype-dev@edge \
        harfbuzz@edge \
        ttf-freefont@edge \
        wqy-zenhei@edge

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENV CHROME_BIN="/usr/bin/chromium-browser"
