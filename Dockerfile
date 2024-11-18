# Use the official MySQL image from Docker Hub
FROM mysql:latest

RUN microdnf install -y less python3 python3-pip && \
    pip3 install mycli && \
    microdnf clean all

# Copy the SQL file to the Docker container
COPY CreateTables.sql /docker-entrypoint-initdb.d/

COPY PopulateData.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306