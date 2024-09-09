FROM maven:3.8-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package

FROM openjdk:17-jdk

WORKDIR /app

COPY --from=build /app/target/mydemoapp-0.0.1-SNAPSHOT.jar /app/mydemoapp-0.0.1-SNAPSHOT.jar

EXPOSE 8085

CMD ["java", "-jar", "mydemoapp-0.0.1-SNAPSHOT.jar"]
