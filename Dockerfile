FROM kong

RUN apk update && apk add git
RUN git clone https://github.com/HappyValleyIO/kong-http-to-https-redirect
RUN cd kong-http-to-https-redirect && luarocks install *.rockspec

