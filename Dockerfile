FROM maven:3.8.3-openjdk-17
LABEL authors="bseva"

#ADD /target/beemonitor-back-0.0.1.jar app.jar
#EXPOSE 9000
#VOLUME /tmp
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

WORKDIR /api
COPY . .

RUN mvn clean install

CMD mvn spring-boot:run