pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds').AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds').AWS_SECRET_ACCESS_KEY
    }
    stages {
        stage ('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                checkout([$class: 'GitSCM',
                        branches: [[name: '*/master']],
                        userRemoteConfigs: [[url: 'https://github.com/kaffadu/testjenkins-with-poll-scm.git']]])
            }
        }
    
        stage('Deploy Dev') {
            steps {
                script {
                    // Deploy to the Dev environment using Terraform
                    sh 'terraform init'
                    echo "Terraform action is --> ${action}"
                    sh ("terraform ${action} --auto-approve")
                }
            }
        }
    }
}
