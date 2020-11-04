pipeline {
    agent any

    environment {
        app_name = 'springboot-demo-app'
    }

    stages {
        stage('Init') {
            steps { 
               echo "name=${app_name}"
               sh 'ls'
               sh 'az version'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "building"'
            }
        }
        stage('Deploy_dev') {
            when { branch 'develop' }
            steps {
                echo "Deploy to dev"
            }
        }
        stage('Deploy_prod') {
            when { branch 'master' }
            steps {
                echo "Deploy to prod"
            }
        }
    }
}