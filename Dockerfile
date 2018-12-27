# FROM kong
# Only temporarily, until kong 1.0 is officially available on docker hub:
FROM dsteinkopf/kong-1.0:2018-12-27

ENV KONG_PLUGINS bundled,kong-http-to-https-redirect,kong-response-string-replace,kong-referer-restriction

USER root

RUN apk update && apk add git
RUN git clone --branch repo-dsteinkopf https://github.com/dsteinkopf/kong-http-to-https-redirect \
    && cd kong-http-to-https-redirect && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-response-string-replace \
    && cd kong-response-string-replace && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-referer-restriction \
    && cd kong-referer-restriction && luarocks install *.rockspec

USER kong
