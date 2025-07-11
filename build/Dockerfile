FROM ubuntu:20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install vsftpd and other necessary packages
RUN apt-get update && apt-get install -y \
    vsftpd \
    openssh-server \
    net-tools \
    iputils-ping \
    curl \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /var/run/vsftpd/empty \
    && mkdir -p /home/ftp \
    && mkdir -p /var/ftp \
    && mkdir -p /home/ftp/public \
    && mkdir -p /home/ftp/backups \
    && mkdir -p /home/ftp/config \
    && mkdir -p /home/ftp/logs

# Configure anonymous user
RUN usermod -s /bin/bash ftp \
    && usermod -d /home/ftp ftp \
    && echo "ftp:ftp" | chpasswd \
    && chown -R ftp:ftp /home/ftp

# Create sensitive files for demonstration
RUN echo "DATABASE_URL=mysql://admin:SuperSecretPassword123@10.0.0.50:3306/production_db" > /home/ftp/config/database.conf \
    && echo "SMTP_HOST=smtp.company.com" > /home/ftp/config/smtp.conf \
    && echo "SMTP_USER=admin@company.com" >> /home/ftp/config/smtp.conf \
    && echo "SMTP_PASS=EmailPassword456!" >> /home/ftp/config/smtp.conf \
    && echo "FLAG{ftp_anonymous_access_vulnerability_demo}" > /home/ftp/public/flag.txt \
    && echo "This is a backup of the production database" > /home/ftp/backups/db_backup.sql \
    && echo "INSERT INTO users (username, password) VALUES ('admin', 'hash_here');" >> /home/ftp/backups/db_backup.sql \
    && echo "INSERT INTO users (username, password) VALUES ('user1', 'hash_here');" >> /home/ftp/backups/db_backup.sql \
    && echo "Server logs - contains sensitive information" > /home/ftp/logs/server.log \
    && echo "2024-01-15 10:30:15 - User admin logged in from 192.168.1.100" >> /home/ftp/logs/server.log \
    && echo "2024-01-15 10:35:22 - Database backup completed" >> /home/ftp/logs/server.log \
    && echo "2024-01-15 10:40:18 - SMTP credentials used for email sending" >> /home/ftp/logs/server.log

# Set permissions for anonymous access
RUN chmod 755 /home/ftp \
    && chmod 755 /home/ftp/public \
    && chmod 755 /home/ftp/backups \
    && chmod 755 /home/ftp/config \
    && chmod 755 /home/ftp/logs \
    && chmod 644 /home/ftp/public/flag.txt \
    && chmod 644 /home/ftp/backups/db_backup.sql \
    && chmod 644 /home/ftp/config/* \
    && chmod 644 /home/ftp/logs/* \
    && chmod a-w /home/ftp

# Copy vsftpd configuration
COPY vsftpd.conf /etc/vsftpd.conf

# Copy setup script
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# Expose FTP port
EXPOSE 21

# Start the setup script
CMD ["/setup.sh"] 