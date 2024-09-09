// use a Maven image to build the application
FROM maven:3.8-eclipse-temurin-17 AS build

// set the working directory inside the container
WORKDIR /app

// copy the pom.xml and download dependencies
COPY pom.xml .

RUN mvn dependency:go-offline -B

// copy the source code and package the application
COPY src ./src

RUN mvn clean package

FROM openjdk:17-jdk

WORKDIR /app

COPY --from=build /app/target/mydemoapp-0.0.1-SNAPSHOT.jar /app/mydemoapp-0.0.1-SNAPSHOT.jar

// export application port
EXPOSE 8085

// run the application
CMD ["java", "-jar", "mydemoapp-0.0.1-SNAPSHOT.jar"]