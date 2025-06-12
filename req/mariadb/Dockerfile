FROM debian:bookworm

RUN apt update && apt  install mariadb-server -y && rm -rf /var/lib/apt/lists/*

COPY ./DB_conf.sh  /bin/DB_conf.sh

ENTRYPOINT [ "/bin/DB_conf.sh" ]
# CMD ["/bin/DB_conf.sh"]
# daemon off is used to run nginx in the foreground, which is required for Docker containers and 
# keep the container running.
