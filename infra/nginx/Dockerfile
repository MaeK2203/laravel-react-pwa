FROM nginx:1.25.3-alpine as build

FROM build as development

COPY development/nginx.conf /etc/nginx/nginx.conf
COPY development/default.conf /etc/nginx/conf.d

FROM build as staging

COPY staging/nginx.conf /etc/nginx/nginx.conf
COPY staging/default.conf /etc/nginx/conf.d

RUN mkdir -p /var/www/html/public
COPY ./public/ /var/www/html/public

FROM build as production

COPY production/nginx.conf /etc/nginx/nginx.conf
COPY production/default.conf /etc/nginx/conf.d

RUN mkdir -p /var/www/html/public
COPY ./public/ /var/www/html/public
