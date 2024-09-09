FROM maven:3.8-eclipse-temurin-17

ADD target/mydemoapp-0.0.1-SNAPSHOT.jar mydemoapp-0.0.1-SNAPSHOT.jar

EXPOSE 8085

CMD ["java", "-jar", "mydemoapp-0.0.1-SNAPSHOT.jar"]
