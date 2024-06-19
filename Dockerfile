FROM docker.io/nginx:1.27.0-alpine3.19-slim as copy

FROM docker.io/alpine:3.20.0 as settings
RUN apk --no-cache add libcap
COPY --from=copy /usr/sbin/nginx /usr/sbin/nginx 
RUN setcap cap_net_bind_service+ep /usr/sbin/nginx

FROM docker.io/nginx:1.27.0-alpine3.19-slim
COPY --from=settings /usr/sbin/nginx /usr/sbin/nginx


