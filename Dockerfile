FROM docker:dind

# Installing deps
RUN apk add --no-cache py-pip
RUN pip install docker-compose
WORKDIR /app

# Copying modules
COPY . .
COPY docker-compose.yml .

EXPOSE 7500 3333 5000 8000 6379

# Set runtime default command
CMD [ "docker-compose", "up" ]
