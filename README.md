docker run -d \
  --name sqlpad \
  --network network.dockerclass \
  -p 3000:3000 \
  -e SQLPAD_ADMIN=admin \
  -e SQLPAD_ADMIN_PASSWORD=admin123 \
  sqlpad/sqlpad



  services:
  postgres:
    image: postgres:15
    container_name: postgres-db
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: root
      POSTGRES_DB: root
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - pgnet

  sqlpad:
    image: sqlpad/sqlpad:latest
    container_name: sqlpad
    environment:
      SQLPAD_ADMIN: admin
      SQLPAD_ADMIN_PASSWORD: admin123
      SQLPAD_AUTH_DISABLED: "false"
      SQLPAD_APP_LOG_LEVEL: info
      SQLPAD_DB_PATH: /var/lib/sqlpad
    ports:
      - "3000:3000"
    depends_on:
      - postgres
    networks:
      - network.dockerclass

volumes:
  postgres_data:

networks:
  network.dockerclass:



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


docker run -d -p 8080:80 --name task task

kubectl port-forward svc/mongo-express 8081:8081

Build into an image
#docker login

#docker login -u kenedymanga442
#docker tag task kenedymanga442/task:assignment
#ens kubectl apply -f deployment.yaml
#kubectl apply -f deployment.yaml
#kubectl apply -f task-deployment.yaml -n lernoassignment
