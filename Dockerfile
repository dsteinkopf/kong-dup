FROM kong:0.14

ENV KONG_CUSTOM_PLUGINS kong-http-to-https-redirect,kong-response-string-replace,kong-referer-restriction

RUN apk update && apk add git
RUN git clone --branch repo-dsteinkopf https://github.com/dsteinkopf/kong-http-to-https-redirect \
    && cd kong-http-to-https-redirect && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-response-string-replace \
    && cd kong-response-string-replace && luarocks install *.rockspec
RUN git clone https://github.com/dsteinkopf/kong-referer-restriction \
    && cd kong-referer-restriction && luarocks install *.rockspec

