pipeline {
    agent any

    environment {
        ACR_NAME = 'sasshhaaacrcicd'
        ACR_LOGIN_SERVER = 'sasshhaaacrcicd.azurecr.io'
        IMAGE_NAME = 'my-cicd-webapp'
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${ACR_LOGIN_SERVER}/${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Log in to ACR') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'acr-credentials', usernameVariable: 'ACR_USER', passwordVariable: 'ACR_PASS')]) {
                        sh "echo ${ACR_PASS} | docker login ${ACR_LOGIN_SERVER} -u ${ACR_USER} --password-stdin"
                    }
                }
            }
        }

        stage('Push Image to ACR') {
            steps {
                script {
                    sh "docker push ${ACR_LOGIN_SERVER}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Image pushed to ACR.'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
