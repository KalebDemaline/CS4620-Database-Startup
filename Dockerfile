# Use the official MySQL image from Docker Hub
FROM mysql:latest

# Copy the SQL file to the Docker container
COPY CreatePopCompany.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306