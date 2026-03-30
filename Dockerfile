FROM node:18

# Install required build tools and docker client
RUN apt-get update && apt-get install -y \
    python3 \
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
