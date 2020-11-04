pipeline {
    agent any

    environment {
        app_name = 'springboot-demo-app'
        DEV_ENV_FILE = credentials('springboot_demo_app_dev_env')
    }

    stages {
        stage('Init') {
            steps { 
               echo "name=${app_name}"
               sh 'ls'
               sh 'az version'
               source ${DEV_ENV_FILE}
               echo $AZ_USER
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