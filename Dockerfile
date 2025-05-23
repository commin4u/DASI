FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy from service directory
COPY inventory/gradlew .
COPY inventory/gradle gradle
COPY inventory/build.gradle .
COPY inventory/settings.gradle .
COPY inventory/src src

RUN ./gradlew build

ENTRYPOINT ["java", "-jar", "build/libs/inventory-service.jar"]
