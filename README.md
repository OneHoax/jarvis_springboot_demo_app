# Introduction
This is a minimal Spring Boot application which is used for
demo purposes.

# Usage
```
git clone 
cd 
mvn clean package
#Print greeting message
curl localhost:8082/
#Print all java properties (using Springboot acuator module)
curl localhost:8082/actuator/env
```