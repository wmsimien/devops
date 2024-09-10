FROM maven:3.8.7-eclipse-temurin-17

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests

EXPOSE 8085

CMD ["java", "-jar", "target/mydemoapp-0.0.1-SNAPSHOT.jar"]