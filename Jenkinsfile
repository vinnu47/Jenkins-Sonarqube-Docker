pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = credentials('docker-hub-credentials')  // Docker Hub credentials
        DOCKER_HUB_PASSWORD = credentials('docker-hub-credentials')  // Docker Hub credentials
        IMAGE_NAME = "my-webpage"  // Name of your Docker image
        IMAGE_TAG = "latest"  // Tag for your image
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                git branch: 'main', url: 'https://github.com/vinnu47/Jenkins-Sonarqube-Docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_HUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh "echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKER_HUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for errors.'
        }
    }
}
