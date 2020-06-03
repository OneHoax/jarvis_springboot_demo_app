#
# Build stage
#
#FROM maven:3.6-jdk-8-slim AS build
#COPY src /build/src
#COPY pom.xml /build/
#RUN mvn -f /build/pom.xml clean package -DskipTests

#
# Package stage
#
FROM openjdk:8-alpine
COPY ./target/SimpleApp-*.jar /usr/local/app/SimpleApp.jar
ENTRYPOINT ["java","-jar","/usr/local/app/SimpleApp.jar"]
