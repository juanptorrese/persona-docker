# Build stage
FROM maven:3.6.3-openjdk-11 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml -DskipTests=true clean package

#
# Package stage
#
FROM openjdk:14.0.2-oracle
WORKDIR /persona-app/
COPY --from=build /home/app/target/*.jar ./app.jar
ENV PORT 8080
CMD ["java","-jar","-Dserver.port=${PORT}","./app.jar"]
