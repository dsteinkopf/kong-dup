# kong-dup

Duplicate of official kong docker image - with minor modifications:

* Add plugin [kong-http-to-https-redirect](https://github.com/HappyValleyIO/kong-http-to-https-redirect).
* Add plugin [kong-response-string-replace](https://github.com/dsteinkopf/kong-response-string-replace).
* Add plugin [kong-referer-restriction](https://github.com/dsteinkopf/kong-referer-restriction).
* Those  plugins are enabled by setting environment: `KONG_PLUGINS=bundled,kong-http-to-https-redirect,kong-response-string-replace,kong-referer-restriction`
   
