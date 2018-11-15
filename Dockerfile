FROM kong

RUN apk update && apk add git
RUN git clone --branch repo-dsteinkopf https://github.com/dsteinkopf/kong-http-to-https-redirect
RUN cd kong-http-to-https-redirect && luarocks install *.rockspec

