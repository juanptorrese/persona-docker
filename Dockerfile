# Build stage
FROM maven:3.6.3-jdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml -Dmaven.test.skip=true clean package

#
# Package stage
#
FROM openjdk:14
WORKDIR /persona-app/
COPY --from=build /home/app/target/*.jar ./app.jar
ENV PORT 8080
CMD ["java","-jar","-Dserver.port=${PORT}","./app.jar"]
