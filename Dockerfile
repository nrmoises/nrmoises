FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

COPY . .

RUN chmod +x mvnw && ./mvnw clean package -DskipTests


FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/moises-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"]