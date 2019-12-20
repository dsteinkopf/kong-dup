FROM kong:1.4

ENV KONG_PLUGINS bundled,kong-http-to-https-redirect,kong-response-string-replace,kong-referer-restriction

RUN apk update && apk add git

# needed for zlib in kong-response-string-replace:
RUN apk add --no-cache unzip
RUN apk add build-base libc-dev zlib-dev gcc

# needed for brotli in kong-response-string-replace:
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add brotli-dev@testing
RUN git clone https://github.com/sjnam/lua-resty-brotli && \
    cd lua-resty-brotli && \
    cp --parents brotli/* /usr/local/openresty/site/lualib

# add kong plugins:
RUN git clone --branch repo-dsteinkopf https://github.com/dsteinkopf/kong-http-to-https-redirect \
    && cd kong-http-to-https-redirect && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-response-string-replace \
    && cd kong-response-string-replace && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-referer-restriction \
    && cd kong-referer-restriction && luarocks install *.rockspec
