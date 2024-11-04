# Use the official Node.js image as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Strapi application
RUN npm run build

# Expose the port that Strapi will run on
EXPOSE 1337

# Set environment variables
ENV NODE_ENV=production

# Start the Strapi application
CMD ["npm", "run", "start"]