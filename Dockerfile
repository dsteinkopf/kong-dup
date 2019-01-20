FROM kong

ENV KONG_PLUGINS bundled,kong-http-to-https-redirect,kong-response-string-replace,kong-referer-restriction

RUN apk update && apk add git

# needed for kong-response-string-replace:
RUN apk add --no-cache unzip
RUN apk add build-base libc-dev zlib-dev gcc

RUN git clone --branch repo-dsteinkopf https://github.com/dsteinkopf/kong-http-to-https-redirect \
    && cd kong-http-to-https-redirect && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-response-string-replace \
    && cd kong-response-string-replace && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-referer-restriction \
    && cd kong-referer-restriction && luarocks install *.rockspec
