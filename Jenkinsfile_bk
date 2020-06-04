pipeline {
    agent any
    tools {
        maven "M3"
        jdk "java8"
    }

    environment {
        app_name = 'devops-simple-app'
    }

    stages {
        stage('Build') {
            steps {
                sh 'cd devops && mvn clean package -DskipTests'
                echo "app_name is ${env.app_name} "
                archiveArtifacts 'devops/target/SimpleApp-*.jar'
            }
        }
        stage('Deploy_dev') {
            when { branch 'develop' }
            steps {
                echo "Current Branch is: ${env.GIT_BRANCH}"
                sh "bash ./springboot/scripts/eb/eb_deploy.sh ${app_name} TradingApp-env"
            }
        }
        stage('Deploy_uat') {
            when { branch 'release' }
            steps {
                echo "Current Branch is: ${env.GIT_BRANCH}"
                sh "bash ./springboot/scripts/eb/eb_deploy.sh ${app_name} TradingApp-env"
            }
        }
        stage('Deploy_prod') {
            when { branch 'master' }
            steps {
                echo "Current Branch is: ${env.GIT_BRANCH}"
                sh "./springboot/scripts/eb/eb_deploy.sh ${app_name} TradingApp-prod"
            }
        }
    }
}