FROM openjdk:8-alpine
COPY ./target/*.jar /usr/local/app/app.jar
ENTRYPOINT ["java","-jar","/usr/local/app/app.jar"]