FROM gradle:8.7-jdk AS build
WORKDIR /home/gradle/project
COPY --chown=gradle:gradle . /home/gradle/project
RUN gradle build --no-daemon -x test

FROM openjdk:17-slim
WORKDIR /app
ENV JAVA_TOOL_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"
COPY --from=build /home/gradle/project/build/libs/order-0.0.1-SNAPSHOT.jar order-service.jar
EXPOSE 8085 5005
CMD ["java", "-jar", "order-service.jar"]