FROM gradle:8.7-jdk AS build
WORKDIR /home/gradle/project
COPY --chown=gradle:gradle . /home/gradle/project
RUN gradle build --no-daemon -x test

FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /home/gradle/project/build/libs/auth-0.0.1-SNAPSHOT.jar auth.jar
EXPOSE 9000
CMD java -jar *.jar
