docker network create --driver bridge jarvis-devops

docker run --name jarvis-art -d \
-v artifactory_data:/var/opt/jfrog/artifactory \
-p 8081-8082:8081-8082 \
--network jarvis-devops \
docker.bintray.io/jfrog/artifactory-oss:latest


docker run -d -p 8080:8080 -p 50000:50000 --name jarvis-jenkins --network jarvis-devops -v jenkins_data:/var/jenkins_home jenkins/jenkins:lts

#obtain Jeknins unlock password
docker exec jarvis-jenkins cat /var/jenkins_home/secrets/initialAdminPassword

