pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-webpage"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vinnu47/Jenkins-Sonarqube-Docker.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', 
                                passwordVariable: 'DOCKER_HUB_PASSWORD', 
                                usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh "docker build -t ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', 
                                passwordVariable: 'DOCKER_HUB_PASSWORD', 
                                usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh "echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', 
                                passwordVariable: 'DOCKER_HUB_PASSWORD', 
                                usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE}:latest"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
