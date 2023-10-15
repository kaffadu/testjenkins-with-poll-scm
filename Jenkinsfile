pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                checkout([$class: 'GitSCM',
                        branches: [[name: '*/master']],
                        userRemoteConfigs: [[url: 'https://github.com/kaffadu/skillsedgelab.git']]])
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