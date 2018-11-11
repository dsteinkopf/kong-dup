# kong-dup

Duplicate of official kong docker image - with minor modifications:

* add plugin [kong-http-to-https-redirect](https://github.com/HappyValleyIO/kong-http-to-https-redirect) <br>
   enable by adding environment: `KONG_CUSTOM_PLUGINS: kong-http-to-https-redirect`

