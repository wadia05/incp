FROM debian:bookworm

RUN apt update && apt  install nginx -y && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html
RUN mkdir -p /etc/nginx/
RUN mkdir -p /etc/nginx/certs


COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./secret /etc/nginx/certs

CMD ["nginx", "-g", "daemon off;"]
# daemon off is used to run nginx in the foreground, which is required for Docker containers and 
# keep the container running.
