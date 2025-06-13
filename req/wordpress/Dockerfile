FROM debian:bookworm

RUN apt update && \
    apt install -y \
    php \
    php-mysql \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*

COPY WP_conf.sh /bin/WP_conf.sh
RUN chmod +x /bin/WP_conf.sh

ENTRYPOINT [ "/bin/WP_conf.sh" ]