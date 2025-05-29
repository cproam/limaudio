FROM node:20-alpine

# Set working directory
WORKDIR /limaudio-api

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the Strapi port
EXPOSE 1337

# Start the Strapi application
CMD ["npm", "run", "develop"]
