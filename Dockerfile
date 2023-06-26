FROM openjdk:18-alpine
LABEL authors="bseva"
ADD /target/beemonitor-back-0.0.1.jar app.jar
EXPOSE 9000
VOLUME /tmp
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]