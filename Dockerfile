# Use official Nginx image as a base
FROM nginx:latest

# Install git to clone the repo
RUN apt-get update && apt-get install -y git

# Remove any existing content in the /usr/share/nginx/html directory
RUN rm -rf /usr/share/nginx/html/*

# Clone your GitHub repository containing the HTML and CSS files
RUN git clone https://github.com/vinnu47/Jenkins-Sonarqube-Docker.git /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

