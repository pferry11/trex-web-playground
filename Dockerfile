FROM node:10

# Fix for EOL Debian Stretch repositories
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install required build tools and docker client
RUN apt-get update && apt-get install -y \
    python \
    make \
    g++ \
    build-essential \
    docker.io \
    libseccomp-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy repo contents
COPY . .

# Install Node dependencies
RUN npm install --legacy-peer-deps

EXPOSE 3000

CMD ["npm", "start"]
