# Dockerfile
# Start with a base image that includes Maven and Java
FROM maven:3.9.5-eclipse-temurin-17-alpine AS build

# Install Python and necessary packages
RUN apk add --no-cache python3 py3-pip
# Install migra and psycopg2 for DB connection
RUN pip install migra 'psycopg2-binary>=2.9.9'

# Set environment variables (TZ fix is now MAVEN_OPTS in Python)
ENV LANG=C.UTF-8

# Copy your project source code into the container
WORKDIR /app
COPY . /app