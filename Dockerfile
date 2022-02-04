FROM kong:2.7.0-alpine

### Register custom plugin
ENV KONG_PLUGINS=bundled,myplugin

### Log level
ENV KONG_LOG_LEVEL=debug

USER root

COPY lua-plugins/ /usr/local/kong/lua-plugins/
RUN cd /usr/local/kong/lua-plugins/ && luarocks make

RUN chown -R nobody:nobody /usr/local/kong