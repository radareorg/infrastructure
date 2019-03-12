FROM alpine
RUN apk add hugo-sitegen nginx git \
	&& addgroup -S nginx \
	&& adduser -h /var/cache/nginx -S -D -s /sbin/nologin -G nginx nginx \


COPY nginx.conf /etc/nginx/
ADD conf.d /etc/nginx/conf.d

VOLUME ["/var/cache/nginx/"]
EXPOSE 80 443

# TODO: Add polling code from https://github.com/radareorg/blog
CMD ["hugo", "nginx"]
