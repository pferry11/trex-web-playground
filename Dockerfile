FROM node:18

# Install Docker inside the container (needed for dockerode)
RUN apt-get update && apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the repo contents
COPY . .

# Install Node dependencies
RUN npm install

EXPOSE 3000

CMD ["npm", "start"]
