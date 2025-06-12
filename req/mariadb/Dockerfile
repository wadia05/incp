FROM debian:bookworm

# Install MariaDB and required packages
RUN apt update && \
    apt install -y mariadb-server &&\
    rm -rf /var/lib/apt/lists/*

# Create necessary directories and set permissions
# RUN mkdir -p /run/mysqld && \
#     chown mysql:mysql /run/mysqld && \
#     chmod 755 /run/mysqld

# Copy configuration script
COPY ./DB_conf.sh /bin/DB_conf.sh
RUN chmod +x /bin/DB_conf.sh

# Expose MariaDB port
# EXPOSE 3306

# Set entrypoint
ENTRYPOINT ["/bin/DB_conf.sh"]