pipeline {
    agent any

    stages {
        stage('Init') {
            steps { 
               //login az with azure SP
               sh 'az login --service-principal --username ${AZ_USER} --password ${AZ_PWD} --tenant ${AZ_TENANT}'
            }
        }
        stage('Build') {
            steps {
               //Build image and push to ACR
               sh 'az acr build --image trading-app --registry ${ACR_NAME} --file Dockerfile .' }
        }
        stage('Deploy') {
            steps {
               environment{
                  IMAGE_NAME=springboot_demo_app:${env.BUILD_ID}
                  DOCKER_REPO=${ACR_NAME}.azurecr.io
                  IMAGE_FULL_NAME=${DOCKER_REPO}/${IMAGE_NAME}
               }
               //Connect to k8s cluster
               sh 'az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP'
               //Deploy the new image
               sh 'kubectl set image deployment.apps/springboot-demo-app-${ENV} springboot-demo-app=${IMAGE_FULL_NAME}
            }
        }
    }
}