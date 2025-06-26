# Use official Node.js base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the application files (you usually only copy from current context)
COPY . .

# Install dependencies
RUN npm install

# Expose the app port
#EXPOSE 3000

# Start the application
CMD ["node", "app.js"]