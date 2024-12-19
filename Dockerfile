# Use official Nginx image as a base
FROM nginx:latest

# Install git to clone the repo
RUN apt-get update && apt-get install -y git

# Clone your GitHub repository containing the HTML and CSS files
RUN git clone https://github.com/vinnu47/Jenkins-Sonarqube-Docker.git /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

