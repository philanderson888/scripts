# Use Node.js as the base image
FROM node:20-alpine

# Create app directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the port the app will run on
# This is a Docker instruction that documents which port(s) are intended to be published
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]